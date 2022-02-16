import socket
from pystrich.datamatrix import DataMatrixEncoder
import cv2
import numpy as np


class Connection():
    def __init__(self, host, port):
        self.host = host
        self.port = port
        self.message = ""
        self.encoder = None
        self.bin_matrix = None
        self.image_path = "datamatrix.png"

    def get_img_path(self):
        return self.image_path

    # create a new datamatrix for the specific user
    def add_message(self, msg, save_img=False, img_filepath=None):
        if len(msg) != 12:
            raise ValueError("Illegal information length.")
        self.message = msg
        self.encoder = DataMatrixEncoder(msg)
        self.bin_matrix = self.encoder.matrix

        if save_img:
            if not img_filepath:
                print("No specified path for image. Use the default path.")
                self.encoder.save(self.image_path)
            else:
                self.image_path = img_filepath
                self.encoder.save(img_filepath)

    # send datamatrix in the format of binary matrix
    def send_bin_matrix(self, selection = 1):
        if self.encoder is None:
            raise ValueError("Encoder not created")

        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            sel = input("Continue to send packet [y/n]")
            while sel == 'y':
                s.connect((self.host, self.port))

                if selection == 1:
                    # choice 1:
                    # format: b'[[0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0],..., [1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0]]
                    s.sendall(str.encode(str(self.bin_matrix)))
                elif selection == 2:
                    # choice 2:
                    # format: send multiple times, each time: b'01100100010100'
                    for row in self.bin_matrix:
                        line = ""
                        for val in row:
                            line += str(val)
                        s.sendall(str.encode(line))

                data = s.recv(1024)
                print("received:", repr(data))
                sel = input("Continue to send packet [y/n]")

            s.shutdown(1)
            s.close()

    # read out binary matrix from an image
    # all the parameters subject to the input length of 12
    def image_to_bin_matrix(self, img_path=None):
        if img_path is None:
            print("Use existing path")
            img = cv2.imread(img_path)
        else:
            img = cv2.imread(self.image_path)

        bin_matrix = []

        row_count = 0
        for row in img:
            line = []
            count = 0
            if row_count == 0:
                for ele in row:
                    if count == 0:
                        if (ele == np.array([255, 255, 255]))[0]:
                            line.append(0)
                        else:
                            line.append(1)

                    count = (count + 1) % 5
                bin_matrix.append(line[3:-3])

            row_count = (row_count + 1) % 5

        bin_matrix = bin_matrix[3:-3]
        self.bin_matrix = bin_matrix

    # send an image to the server
    def send_image(self, img_path, selection = 1):
        if img_path is None:
            print("Use existing path")
            img = cv2.imread(img_path)
        else:
            img = cv2.imread(self.image_path)

        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            sel = input("Continue to send packet [y/n]")
            while sel == 'y':
                s.connect((self.host, self.port))

                if selection == 1:
                    # choice 1:
                    # format: b'[[[255 255 255]
                    #   [255 255 255]
                    #   [255 255 255]
                    #   ...
                    #   [255 255 255]
                    #   [255 255 255]
                    #   [255 255 255]]
                    #   ...
                    #   ...
                    #   ...
                    #   [[255 255 255]
                    #   [255 255 255]
                    #   [255 255 255]
                    #   ...
                    #   [255 255 255]
                    #   [255 255 255]
                    #   [255 255 255]]]
                    s.sendall(str.encode(str(img)))
                elif selection == 2:
                    # choice 2:
                    # format: send multiple times, each time: b'01100100010100'
                    pass

                data = s.recv(1024)
                print("received:", repr(data))
                sel = input("Continue to send packet [y/n]")

            s.shutdown(1)
            s.close()