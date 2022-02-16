# Example of simple tcp client (expects echo server)

import socket

HOST = "1.1.4.2"  # The remote server's hostname or IP address
PORT = 7  # The port used by the remote server

datas = ['1011100110','1001001010','1011011101']

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect((HOST, PORT))

    for d in datas:
        s.sendall(str.encode(d))
        data = s.recv(1024)
        print("Received", repr(data))
        wait = input('wait...')
    
    #s.sendall(b"Second line to send")
    #data = s.recv(1024)
    #print("Received", repr(data))

    wait = input('wait...')
    
    s.shutdown(1)
    s.close()
