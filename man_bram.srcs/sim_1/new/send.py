import struct
import serial 

PORT = "COM4"
BAUD = 115200

def send_64bit_values(port, num_values=256):
    """Send 256 64-bit values to the FPGA"""
    with serial.Serial(port, BAUD, bytesize=8, parity='N', stopbits=1, timeout=1) as ser:
        for i in range(num_values):
            # Create a pattern: i repeated in each byte (0x0101..., 0x0202..., etc.)
            value = (i << 56) | (i << 48) | (i << 40) | (i << 32) | (i << 24) | (i << 16) | (i << 8) | i
            data = struct.pack('<Q', value)  # Pack as 64-bit unsigned little-endian
            print(f"Sending value {i}: 0x{value:016x}")
            ser.write(data)
            ser.flush()

def receive_128bit_values(port, num_values=256):
    """Receive 256 128-bit values (16 bytes each) from the FPGA"""
    with serial.Serial(port, BAUD, bytesize=8, parity='N', stopbits=1, timeout=10) as ser:
        for i in range(num_values):
            # Read 16 bytes for each 128-bit value
            data = ser.read(16)
            if len(data) == 16:
                # Display as hex
                hex_str = data.hex()
                print(f"Received value {i}: {hex_str}")
            else:
                print(f"ERROR: Expected 16 bytes for value {i}, got {len(data)}")
                break

if __name__ == "__main__":
    print("=" * 50)
    print("Sending 256 x 64-bit values to FPGA...")
    print("=" * 50)
    send_64bit_values(PORT, 256)
    
    print("\n" + "=" * 50)
    print("Waiting for 256 x 128-bit values from FPGA...")
    print("=" * 50)
    receive_128bit_values(PORT, 256)

