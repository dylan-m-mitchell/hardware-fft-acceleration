import struct
import serial 

PORT = "COM4"
BAUD = 115200

def send_double(port, value):
    # Open serial port
    with serial.Serial(port, BAUD, bytesize=8, parity='N', stopbits=1, timeout=1) as ser:
        # Pack Python float into 8 bytes, little-endian IEEE-754
        data = struct.pack('<d', value)
        print("Sending value:", value)
        print("Sending bytes (little-endian):", data.hex())
        ser.write(data)
        ser.flush()
        
        # # Sample for response
        # print("Waiting for response...")
        # response = ser.read(8)
        # if response:
        #     print("Received bytes:", response.hex())
        #     # Unpack as little-endian double
        #     received_value = struct.unpack('<d', response)[0]
        #     print("Received value:", received_value)
        # else:
        #     print("No response received")

if __name__ == "__main__":
    # Send easy to spot pattern: 0x0102030405060708 (8 bytes little-endian)
    # This will appear as: 08 07 06 05 04 03 02 01 in little-endian
    # dummy_value = struct.unpack('<d', bytes([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08]))[0]
    send_double(PORT, 3.14159)
