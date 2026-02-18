import struct
import serial 
import time

PORT = "COM4"
BAUD = 115200
NUM_VALUES = 256

def build_test_doubles(num_values=NUM_VALUES):
    """Build a deterministic list of unique double values."""
    return [float(i) + 0.125 for i in range(num_values)]


def send_64bit_values(ser, values):
    """Send double values as 64-bit IEEE-754 words."""
    for i, value in enumerate(values):
        data = struct.pack('<d', value)
        bits_u64 = struct.unpack('<Q', data)[0]
        print(f"Sending value {i}: {value:.6f} (0x{bits_u64:016x})")
        ser.write(data)
        # ser.flush()

def receive_128bit_values(ser, num_values=NUM_VALUES):
    """Receive 128-bit values as unsigned integers (MSB-first byte stream)."""
    received = []
    for i in range(num_values):
        data = ser.read(16)
        if len(data) == 16:
            value_u128 = int.from_bytes(data, byteorder='little', signed=False)
            received.append(value_u128)
            print(f"Received value {i}: 0x{value_u128:032x}")
        else:
            print(f"ERROR: Expected 16 bytes for value {i}, got {len(data)}")
            break
    return received


def expected_u128_from_doubles(values):
    """Expected FPGA output is each 64-bit word duplicated into 128 bits."""
    expected = []
    for value in values:
        bits_u64 = struct.unpack('<Q', struct.pack('<d', value))[0]
        expected.append((bits_u64 << 64) | bits_u64)
    return expected


def verify_results(values, received_u128):
    expected_u128 = expected_u128_from_doubles(values)
    compare_count = min(len(expected_u128), len(received_u128))
    mismatches = []

    for i in range(compare_count):
        if received_u128[i] != expected_u128[i]:
            mismatches.append((i, expected_u128[i], received_u128[i]))

    print("\n" + "=" * 50)
    print("Verification summary")
    print("=" * 50)
    print(f"Expected words : {len(expected_u128)}")
    print(f"Received words : {len(received_u128)}")
    print(f"Compared words : {compare_count}")
    print(f"Mismatches     : {len(mismatches)}")

    if mismatches:
        print("\nFirst 10 mismatches:")
        for i, exp, got in mismatches[:10]:
            print(f"idx {i:03d}: expected 0x{exp:032x}, got 0x{got:032x}")
        return False

    if len(received_u128) != len(expected_u128):
        print("\nFAIL: Did not receive all expected values.")
        return False

    print("\nPASS: All returned 128-bit words match duplicated input 64-bit words.")
    return True

if __name__ == "__main__":
    test_values = build_test_doubles(NUM_VALUES)

    with serial.Serial(PORT, BAUD, bytesize=8, parity='N', stopbits=1, timeout=10) as ser:
        ser.dtr = False
        ser.rts = False
        time.sleep(0.05)
        ser.reset_input_buffer()
        ser.reset_output_buffer()

        print("=" * 50)
        print(f"Sending {NUM_VALUES} unique double values to FPGA...")
        print("=" * 50)
        send_64bit_values(ser, test_values)

        print("\n" + "=" * 50)
        print(f"Waiting for {NUM_VALUES} x 128-bit values from FPGA...")
        print("=" * 50)
        received = receive_128bit_values(ser, NUM_VALUES)

    verify_results(test_values, received)

