# Example of multi-client echo server

import socket
import _thread

from RequestTLV import *
from datetime import datetime
from uttlv import TLV

HOST = '1.1.8.1' # The IP address of the computer this script runs on
PORT = 22 # The port used by this TCP server 

firstDose = vaxDose(datetime(2021, 5, 5), 5)
secondDose = vaxDose(datetime(2021, 8, 5), 5)
dummy_user = DBUser("Eduardo", "Stecca", datetime(1999, 2, 20), 3, 1, [firstDose, secondDose])

def open_new_client(connection, addr):
    print("Connected to client ", addr[0], " port ", addr[1])

    # Loop until connection closed
    while True:
        # Read data
        data = connection.recv(1024)

        # Check if read unsuccessful 
        if not data: break

        print("Received Raw Bytes")
        print([hex(z)[2:] for z in data])
        
        decoded_request = DBRequest().TlvDecode(data)
        print("\nDecoded Response:")
        decoded_request.print()
        
        dummy_user.UID = decoded_request.userData.UID
        response = DBRequest(requestType.Response, 0, dummy_user)
        
        print("\nSending Response:")
        response.print();
        encoded_response = response.TlvEncode().to_byte_array()
        print("Sending Raw Bytes")
        print([hex(z)[2:] for z in encoded_response])
        
        # Send response
        connection.send(encoded_response)

    # Close the connection if break from loop
    connection.shutdown(1)
    connection.close()
    print("Connection to client ", addr[0], " port ", addr[1], " closed")

def listen():
    # Setup the socket
    connection = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    connection.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

    # Bind to an address and port to listen on
    connection.bind((HOST, PORT))
    connection.listen(10)
    print("Server opened on ",HOST," port ", PORT)

    # Loop forever, accepting all connections in new thread
    while True:
        new_conn, new_addr = connection.accept()
        _thread.start_new_thread(open_new_client,(new_conn, new_addr))

if __name__ == "__main__":
    try:
        listen()
    except KeyboardInterrupt:
       pass
