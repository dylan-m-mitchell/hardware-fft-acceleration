import struct
import serial 
import time

PORT = "COM4"
BAUD = 115200
NUM_VALUES = 256

def build_test_u128_values(num_values=NUM_VALUES):
    """Build a deterministic list of unique 128-bit values."""
    values = []
    for i in range(num_values):
        # Create a 128-bit value: high 64 bits = i, low 64 bits = i + 0.5 (as uint64)
        high = i
        low = i + 0x123456789ABCDEF0
        value = (high << 64) | low
        values.append(value)
    return values


def send_128bit_values(ser, values):
    """Send 128-bit values as little-endian byte streams."""
    j = 0
    for i, value in enumerate(values):
        # Convert 128-bit value to 16 bytes (little-endian)
        data = value.to_bytes(16, byteorder='little', signed=False)
        print(f"Sending value {i}: 0x{value:032x}")
        # if j < 10:
           
        #    j += 1
        ser.write(data)
        # ser.flush()

def receive_128bit_values(ser, num_values=NUM_VALUES):
    """Receive 128-bit values as unsigned integers (little-endian byte stream)."""
    received = []
    j = 0
    for i in range(num_values):
        data = ser.read(16)
        if len(data) == 16:
            value_u128 = int.from_bytes(data, byteorder='little', signed=False)
            received.append(value_u128)
            print(f"Received value {i}: 0x{value_u128:032x}")
            # if j < 10:
                
            #     j += 1
        else:
            print(f"ERROR: Expected 16 bytes for value {i}, got {len(data)}")
            break
    return received


def bit_reverse_u128(value):
    """Reverse all 128 bits of a value."""
    reversed_val = 0
    for i in range(128):
        if value & (1 << i):
            reversed_val |= (1 << (127 - i))
    return reversed_val


def expected_u128_reversed(values):
    """Expected FPGA output is each 128-bit word bit-reversed."""
    expected = []
    for value in values:
        expected.append(bit_reverse_u128(value))
    return expected


def verify_results(values, received_u128):
    expected_u128 = expected_u128_reversed(values)
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

    print("\nPASS: All returned 128-bit words match bit-reversed input 128-bit words.")
    return True

if __name__ == "__main__":
    test_values = build_test_u128_values(NUM_VALUES)

    with serial.Serial(PORT, BAUD, bytesize=8, parity='N', stopbits=1, timeout=10) as ser:
        ser.dtr = False
        ser.rts = False
        time.sleep(0.05)
        ser.reset_input_buffer()
        ser.reset_output_buffer()

        print("=" * 50)
        print(f"Sending {NUM_VALUES} unique 128-bit values to FPGA...")
        print("=" * 50)
        send_128bit_values(ser, test_values)

        print("\n" + "=" * 50)
        print(f"Waiting for {NUM_VALUES} x 128-bit values from FPGA...")
        print("=" * 50)
        received = receive_128bit_values(ser, NUM_VALUES)

    verify_results(test_values, received)

