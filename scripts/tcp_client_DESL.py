# Example of simple tcp client (expects echo server)
from RequestTLV import *
from datetime import datetime
from uttlv import TLV
import socket

HOST = "1.1.10.2"  # The remote server's hostname or IP address
PORT = 7  # The port used by the remote server

firstDose = vaxDose(datetime(2021, 5, 5), 5)
secondDose = vaxDose(datetime(2021, 8, 5), 5)
user = DBUser("Eduardo", "Ortenblad", datetime(1999, 2, 20), 3, 1, [firstDose, secondDose])
request = DBRequest(requestType.POST, 0, user)

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    
    s.connect((HOST, PORT))
    
    print("Sending Request")
    requestTLV = request.TlvEncode()
    request.print()

    s.sendall(requestTLV.to_byte_array())
    data = s.recv(1024)
    print("Received Raw Bytes")
    print([hex(z)[2:] for z in data])
    
    decoded_response = DBRequest().TlvDecode(data)
    print("\nDecoded Response:")
    decoded_response.print()
    
    #s.sendall(b"Second line to send")
    #data = s.recv(1024)
    #print("Received", repr(data))
    
    s.shutdown(1)
    s.close()
    input("Press Enter to continue...")