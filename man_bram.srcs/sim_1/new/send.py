import struct
import serial # type: ignore

PORT = "COM4"
BAUD = 115200

def send_double(port, value):
    # Open serial port
    with serial.Serial(port, BAUD, bytesize=8, parity='N', stopbits=1, timeout=1) as ser:
        # Pack Python float into 8 bytes, big-endian IEEE‑754
        data = struct.pack('>d', value)  # use '<d' for little-endian if your FPGA expects that
        print("Sending bytes:", data.hex())
        ser.write(data)
        ser.flush()

if __name__ == "__main__":
    send_double(PORT, 3.14159)
