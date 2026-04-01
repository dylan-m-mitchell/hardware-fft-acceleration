import math
import struct
import sys
import time

import serial

PORT = "COM4"
BAUD = 115200
NUM_VALUES = 32
TIMEOUT_SECONDS = 10
RTOL = 1e-9
ATOL = 1e-9


def float64_to_u64(value):
    """Convert python float to IEEE-754 float64 bit pattern."""
    return struct.unpack("<Q", struct.pack("<d", float(value)))[0]


def u64_to_float64(bits):
    """Convert IEEE-754 float64 bit pattern to python float."""
    return struct.unpack("<d", struct.pack("<Q", bits))[0]


def complex_to_u128(sample):
    """Pack complex sample into u128: [127:64]=imag lane, [63:0]=real lane."""
    real_bits = float64_to_u64(sample.real)
    imag_bits = float64_to_u64(sample.imag)
    return (imag_bits << 64) | real_bits


def u128_to_complex(word):
    """Unpack u128 into complex sample: [127:64]=imag lane, [63:0]=real lane."""
    real_bits = word & ((1 << 64) - 1)
    imag_bits = (word >> 64) & ((1 << 64) - 1)
    return complex(u64_to_float64(real_bits), u64_to_float64(imag_bits))


def build_test_values(num_values=NUM_VALUES):
    """Build deterministic 32-point complex stimulus with moderate amplitudes."""
    values = []
    for i in range(num_values):
        real = 0.25 * math.cos((2.0 * math.pi * i) / num_values) + 0.01 * (i - 15.5)
        imag = 0.20 * math.sin((4.0 * math.pi * i) / num_values) - 0.015 * ((i % 7) - 3)
        values.append(complex(real, imag))
    return values


def send_128bit_values(ser, values):
    """Send 128-bit values as little-endian byte streams."""
    for i, value in enumerate(values):
        data = value.to_bytes(16, byteorder="little", signed=False)
        print(f"Sending value {i}: 0x{value:032x}")
        ser.write(data)


def receive_128bit_values(ser, num_values=NUM_VALUES):
    """Receive 128-bit values as unsigned integers (little-endian byte stream)."""
    received = []
    for i in range(num_values):
        data = ser.read(16)
        if len(data) == 16:
            value_u128 = int.from_bytes(data, byteorder="little", signed=False)
            received.append(value_u128)
            print(f"Received value {i}: 0x{value_u128:032x}")
        else:
            print(f"ERROR: Expected 16 bytes for value {i}, got {len(data)}")
            break
    return received


def verify_results(stimulus_complex, received_u128, np_mod):
    expected_complex = np_mod.fft.fft(np_mod.array(stimulus_complex, dtype=np_mod.complex128), norm="backward")
    expected_u128 = [complex_to_u128(sample) for sample in expected_complex]

    compare_count = min(len(expected_u128), len(received_u128))
    mismatches = []

    for i in range(compare_count):
        got_sample = u128_to_complex(received_u128[i])
        exp_sample = complex(expected_complex[i].real, expected_complex[i].imag)

        real_ok = np_mod.isclose(got_sample.real, exp_sample.real, rtol=RTOL, atol=ATOL)
        imag_ok = np_mod.isclose(got_sample.imag, exp_sample.imag, rtol=RTOL, atol=ATOL)
        if not (real_ok and imag_ok):
            mismatches.append((i, exp_sample, got_sample, expected_u128[i], received_u128[i]))

    print("\n" + "=" * 50)
    print("Verification summary")
    print("=" * 50)
    print(f"Expected bins  : {len(expected_u128)}")
    print(f"Received bins  : {len(received_u128)}")
    print(f"Compared bins  : {compare_count}")
    print(f"Mismatches     : {len(mismatches)}")
    print(f"Tolerance      : rtol={RTOL}, atol={ATOL}")

    if mismatches:
        print("\nFirst 10 mismatches:")
        for i, exp_c, got_c, exp_u128, got_u128 in mismatches[:10]:
            print(
                f"bin {i:02d}: "
                f"exp=({exp_c.real:+.12e}, {exp_c.imag:+.12e}) "
                f"got=({got_c.real:+.12e}, {got_c.imag:+.12e})"
            )
            print(f"         exp_u128=0x{exp_u128:032x}")
            print(f"         got_u128=0x{got_u128:032x}")
        return False

    if len(received_u128) != len(expected_u128):
        print("\nFAIL: Did not receive all expected FFT bins.")
        return False

    print("\nPASS: All FFT bins match expected numpy.fft.fft outputs within tolerance.")
    return True


if __name__ == "__main__":
    try:
        import numpy as np
    except ImportError:
        print("ERROR: numpy is required for FFT verification.")
        print("Install it with: pip install numpy")
        sys.exit(1)

    stimulus_complex = build_test_values(NUM_VALUES)
    test_values_u128 = [complex_to_u128(sample) for sample in stimulus_complex]

    print("=" * 50)
    print(f"Building {NUM_VALUES}-point deterministic complex stimulus...")
    print("=" * 50)
    for i, word in enumerate(test_values_u128[:5]):
        sample = stimulus_complex[i]
        print(
            f"Stimulus {i}: ({sample.real:+.6f}, {sample.imag:+.6f}) "
            f"-> 0x{word:032x}"
        )
    if NUM_VALUES > 5:
        print("...")

    with serial.Serial(PORT, BAUD, bytesize=8, parity="N", stopbits=1, timeout=TIMEOUT_SECONDS) as ser:
        ser.dtr = False
        ser.rts = False
        time.sleep(0.05)
        ser.reset_input_buffer()
        ser.reset_output_buffer()

        print("\n" + "=" * 50)
        print(f"Sending {NUM_VALUES} x 128-bit words to FPGA...")
        print("=" * 50)
        send_128bit_values(ser, test_values_u128)

        print("\n" + "=" * 50)
        print(f"Waiting for {NUM_VALUES} x 128-bit FFT words from FPGA...")
        print("=" * 50)
        received = receive_128bit_values(ser, NUM_VALUES)

    verify_results(stimulus_complex, received, np)
