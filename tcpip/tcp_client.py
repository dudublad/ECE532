# Example of simple tcp client (expects echo server)
# All new data matrix should start with "Initialization" in the list
# 256 bits data matrix is divided into 16 16-bit patterns to be sent
# inside the server, each 16-bit pattern is stored per 4-byte in BRAM
# Base address of BRAM: 0xC0000000

# Sample output using the given data matrix below:
# stored 65535 at C0000000
# stored 551 at C0000004
# stored 33239 at C0000008

import socket

HOST = "1.1.10.2"  # The remote server's hostname or IP address
PORT = 7  # The port used by the remote server

# specify the data matrix
data_matrix = "1111111111111111000000100010011110000001110101110011000001000101100010100101010100010101111010111101000111110101000101001010100111000100001101010011000010111111110110101100010100111110101110011001011100011101011000010110001110010100010011010101010101010101"

datas = ["Initialization"]

# divide the data matrix into 16 pieces
datas += [data_matrix[16*i:16*(i+1)] for i in range(len(data_matrix)//16)]
print(datas)

# send the patterns
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect((HOST, PORT))

    for d in datas:
        if d != 'Initialization':
            print("Sending", int(d, 2))

        # send the message
        s.sendall(str.encode(d))
        data = s.recv(1024)
        print("Received", repr(data))

        # determine if the message has been sent
        if str(repr(data)) != "b'ACK'":
            print("Unsuccessful transmission")
            s.shutdown(1)
            s.close()
            
        wait = input('wait...')

    wait = input('wait...')
    
    s.shutdown(1)
    s.close()
