# Example of simple tcp client (expects echo server)
# All new data matrix should start with "Initialization" in the list
# 256 bits data matrix is divided into 16 16-bit patterns to be sent
# inside the server, each 16-bit pattern is stored per 4-byte in BRAM
# Base address of BRAM: 0xC0000000

# Sample output using the given data matrix below:
# stored 65535 at C0000000
# stored 551 at C0000004
# stored 33239 at C0000008

# pip install PyStrich
# $ \dm_venv\Scripts\activate
# $ python tcp_client_test.py

import socket
from pystrich.datamatrix import DataMatrixEncoder
from pystrich.datamatrix.placement import DataMatrixPlacer
import PIL
from PIL import Image
import numpy as np
import copy
import sys

import _thread

from definitions import *
from CsvConvert import *
from RequestTLV import *
from datetime import datetime
from uttlv import TLV

# read image and cut the effective region
def cut_image(img_path = ""):

    image = Image.open(img_path)

    data = np.asarray(image)
    temp = copy.deepcopy(data)
    temp = temp[10:-10]

    dm_bits = []

    for i, row in enumerate(temp):
        dm_bits.append(row[10:-10])

    return dm_bits

# turn image RGB into black/white as 0/1
def black_and_white_tiles(dm_bits):
    color_bits = np.zeros((len(dm_bits)//5, len(dm_bits[0])//5))

    for i in range(0, len(dm_bits), 5):
        for j in range(0, len(dm_bits[0]), 5):
            if dm_bits[i][j] == 255:
                color_bits[i//5][j//5] = 0
            else:
                color_bits[i//5][j//5] = 1
    return color_bits

def collect_bitstream(matrix, mode = 'image'):
    data_m = ["Initialization"] #"Initialization"
    # in case there is no need for adding the fringe tiles
    if mode == 'image':
        for row in matrix:
            row_element = ""
            for ele in row:
                row_element = str(int(ele)) + row_element
            data_m.append(row_element)
        data_m.append("end")
    elif mode == 'input':
        data_m.append("0101010101010101")
        count = 0
        for row in matrix:
            row_element = ""
            for ele in row:
                row_element = str(ele) + row_element
            if count % 2 == 0:
                row_element = '1' + row_element + '1'
            else:
                row_element = '0' + row_element + '1'
            data_m.append(row_element)
            count += 1
        data_m += ["1111111111111111", "end"] #, "end"
    else:
        print("invalid command mode")

    return data_m
        
        
def send_data_matrix(datas, shutdown = True):
    # send the patterns
    host_ip = input("Input client number: ")
    HOST = "1.1."+host_ip+'.2'
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.connect((HOST, PORT))

        for idx, d in enumerate(datas):

            # send the message
            s.sendall(str.encode(d))
            data = s.recv(1024)

            # determine if the message has been sent
            if str(repr(data)) != "b'ACK'":
                print("Unsuccessful transmission")
                s.shutdown(1)
                s.close()

            # the exact output you're looking for:
            print("[%-18s] %d%% \r" % ('='*idx, 100*idx/len(datas)), end = '\r')


        if shutdown:
            s.shutdown(1)
            s.close()
    print("[%-18s] %d%% Done" % ('='*len(datas), 100*len(datas)/len(datas)))
    print()

def input_correction(msg, uid):
    if len(msg) < 10:
        for i in range(len(msg), 10):
            msg = msg + " "
    if len(msg) > 10:
        msg = msg[:10]
    
    new_msg = ""

    for i in range(len(msg)):
        curr_ascii = ord(msg[i])
        new_msg += chr(curr_ascii-1)

    new_msg += (chr(uid//64) + chr(ord(':')+uid%64))
    return new_msg

if __name__ == "__main__":
    global HOST, PORT
    HOST = "1.1.8.2"  # The remote server's hostname or IP address (FPGA1)
    PORT = 7  # The port used by the remote server
            
    print("**************************************")
    print("*        Data Matrix Client          *")

    while (True):
        
        print("**************************************")
        print("*  Mode 1 image: input image         *")
        print("*  Mode 2 input: input string        *")
        print("*  Mode 3 encode: new datamatrix     *")
        print("*  Mode 4 encode: Preload users      *")
        print("*  Mode 5 encode: Read data from DB  *")
        print("*  Mode 6 encode: Update entry in DB *")
        print("**************************************")
        
        mode = input("Select Your Mode: ")

        if mode == "1":
            img_name = input("Enter file name: ")
            dm_bits = cut_image(img_path = "dm_images/"+img_name+".png")
            color_bits = black_and_white_tiles(dm_bits)
            data_m = collect_bitstream(color_bits)
            send_data_matrix(data_m)
        elif mode == "2":
            msg = input("Input your name here: ")
            uid_in = input("Input your id here: ")
            uid = int(uid_in)
            
            new_msg = input_correction(msg, uid)
            print("Generated: ", new_msg)
            encoder = DataMatrixEncoder(new_msg)
            
            data_m = collect_bitstream(encoder.matrix, mode = 'input')
            send_data_matrix(data_m)
        elif mode == "3":
            first_name = input("Input your first name: ")
            last_name = input("Input your last name: ")
            birth_date = input("Input your birth date: (YYYY-MM-DD)")

            portions = birth_date.split('-')
            birth = datetime(int(portions[0]), int(portions[1]), int(portions[-1]))

            uid_in = input("Input your id here: ") # uid
            uid = int(uid_in)

            #Request: UID = 2
            #firstDose = vaxDose(datetime(2021, 5, 5), 5)
            #secondDose = vaxDose(datetime(2021, 8, 5), 5)
            
            dose_count = input("Input number of doses you have received: ")
            
            dose_count = int(dose_count)
            counter = 0
            dose = []
            
            vac_permit = 0
            
            if dose_count >= 2:
                vac_permit = 3
            elif dose_count == 1:
                vac_permit = 2
            else:
                vac_permit = 1
            
            while counter < dose_count:
                vac_date = input("Input your vaccinated date: (YYYY-MM-DD) ")

                portions = vac_date.split('-')
                vac = datetime(int(portions[0]), int(portions[1]), int(portions[-1]))
                
                print("****** Vaccine Types *******")
                print("*     0: Unknown           *")
                print("*     1: AstraZenca        *")
                print("*     2: Bharat Biotech    *")
                print("*     3: Janssen           *")
                print("*     4: Moderna           *")
                print("*     5: Pfizer-BioNTech   *")
                print("*     6: Sinopharm BIBP    *")
                print("*     7: Sinovac           *")
                print("*     8: Other             *")
                print("****************************")
                vac_type = input("Input your vaccine type: ")
                curr_dose = vaxDose(vac, int(vac_type))
                
                if int(vac_type) == 0 and counter == 2: # only the last dose invalid
                    pass
                elif int(vac_type) == 0 and counter < 2: # some doses before invalid
                    vac_permit = max(0, vac_permit-1)
                elif counter == 2 and vac_permit != 3:
                    vac_permit += 1
                elif int(vac_type) == 3 and dose_count == 1: # Janssen
                    vac_permit = 3
                    
                
                    
                dose.append(curr_dose)
                counter += 1

            #print(first_name, last_name, birth, vac_permit, 'uid placement', dose)
            user = DBUser(first_name, last_name, birth, vac_permit, uid, dose)
            
            request = DBRequest(requestType.POST, 0, user)
            request.print()
            
            if len(first_name) >= 10:
                msg = first_name[:10]
            else:
                length_need = 10 - len(first_name)
                msg = first_name + " " + last_name[:length_need-1]

            #print("Encoding:", msg)

            new_msg = input_correction(msg, uid)
            encoder = DataMatrixEncoder(new_msg)
            
            with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    
                s.connect((fpga2_ip_addr, fpga2_server_port))
                
                print("Sending Request")
                requestTLV = request.TlvEncode()
                request.print()

                s.sendall(requestTLV.to_byte_array())
                data = s.recv(1024)
                #print("Received Raw Bytes")
                #print([hex(z)[2:] for z in data])
                
                decoded_response = DBRequest().TlvDecode(data)
                print("\nDecoded Response:")
                decoded_response.print()
                
                #uid = decoded_response.userData.UID
                #print("new_uid:", uid)
                
                img_name = "dm_"+str(uid)
                encoder.save("dm_images/"+img_name+".png")
                
                s.shutdown(1)
                s.close()
                
        elif mode == '4':
            # for preloading the database
            csv_file = input("Enter csv filename (Empty for default): ")
            if len(csv_file) == 0:
                csv_file = 'database_cheatsheet.csv'
            dbUsers = csvToDBUsers(csv_file)

            # To be tested
            for user in dbUsers:
                first_name, last_name = user.firstName, user.lastName
                if len(first_name) >= 10:
                    msg = first_name[:10]
                else:
                    length_need = 10 - len(first_name)
                    msg = first_name + " " + last_name[:length_need-1]
                uid = user.UID
                new_msg = input_correction(msg, uid)
                encoder = DataMatrixEncoder(new_msg)

                img_name = "dm_"+str(uid)
                encoder.save("dm_images/"+img_name+".png")

            with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    
                s.connect((fpga2_ip_addr, fpga2_server_port))

                for user in dbUsers:
                    request = DBRequest(requestType.POST, 0, user)


                    print("Sending Request")
                    requestTLV = request.TlvEncode()
                    request.print()

                    s.sendall(requestTLV.to_byte_array())
                    data = s.recv(1024)
                    #print("Received Raw Bytes")
                    #print([hex(z)[2:] for z in data])
                    
                    decoded_response = DBRequest().TlvDecode(data)
                    print("\nDecoded Response: ")
                    decoded_response.print()
                
                s.shutdown(1)
                s.close()
                
        elif mode == "5":
            UID = input("Enter user's UID: ")
            with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
                
                s.connect((fpga2_ip_addr, fpga2_server_port))
                user = DBUser(UID = int(UID))
                request = DBRequest(requestType.GET, 0, user)
                
                print("Sending Request")
                requestTLV = request.TlvEncode()
                request.print()

                s.sendall(requestTLV.to_byte_array())
                data = s.recv(1024)
                #print("Received Raw Bytes")
                #print([hex(z)[2:] for z in data])
                
                decoded_response = DBRequest().TlvDecode(data)
                print("\nDecoded Response: ")
                decoded_response.print()
            
                s.shutdown(1)
                s.close()
                
        elif mode == "6":
            print("Update Entry Mode")
            UID = input("Enter user's UID: ")
            with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
                
                s.connect((fpga2_ip_addr, fpga2_server_port))
                user = DBUser(UID = int(UID))
                request = DBRequest(requestType.GET, 0, user)
                
                print("Sending Request")
                requestTLV = request.TlvEncode()
                request.print()

                s.sendall(requestTLV.to_byte_array())
                data = s.recv(1024)
                #print("Received Raw Bytes")
                #print([hex(z)[2:] for z in data])
                
                decoded_response = DBRequest().TlvDecode(data)
                print("\nDecoded Response: ")
                print("\nCurrently available information for this UID")
                decoded_response.print()
            
                s.shutdown(1)
                s.close()
            dose = []
            Read_Data = decoded_response.userData
            new_birth_date = Read_Data.DoB
            new_vax_status = Read_Data.vaxStatus
            if len(Read_Data.vaxDoses) <= 0 :
                dose.clear()
            elif len(Read_Data.vaxDoses) == 1 :
                dose1 = Read_Data.vaxDoses[0]
                dose.clear()
                dose.append(dose1)
            elif len(Read_Data.vaxDoses) == 2 :
                dose1 = Read_Data.vaxDoses[0]
                dose2 = Read_Data.vaxDoses[1]
                dose.clear()
                dose.append(dose1)
                dose.append(dose2)
            elif len(Read_Data.vaxDoses) == 3 :
                dose1 = Read_Data.vaxDoses[0]
                dose2 = Read_Data.vaxDoses[1]
                dose3 = Read_Data.vaxDoses[2]
                dose.clear()
                dose.append(dose1)
                dose.append(dose2)
                dose.append(dose3)
            while(True) :
                print("\n\n**********************************")
                print("* What would you like to update? *")
                print("*     0: Date of Birth           *")
                print("*     1: Dose 1 Details          *")
                print("*     2: Dose 2 Details          *")
                print("*     3: Dose 3 Details          *")
                print("*     4: Exit Update Menu        *")
                print("**********************************")
                option = input("Select your choice: ")
                
                
                #option  = int(option)
                if option == "0":
                    print("Existing DoB is: = %s" % Read_Data.DoB)
                    ans = input("Do you want to update? (y/n)")
                    if ans == "y" :
                        birth_date = input("Input new date of birth: (YYYY-MM-DD)")
                        portions = birth_date.split('-')
                        new_birth_date = datetime(int(portions[0]), int(portions[1]), int(portions[-1]))
                        cnt = input("\nContinue with more updates? (y/n) ")
                        if cnt == 'n':
                            break 
                    else: 
                        print("Keeping existing DoB details")
                        new_birth_date = Read_Data.DoB
                        cnt = input("\nContinue with more updates? (y/n) ")
                        if cnt == 'n':
                            break 
                elif option == "1":
                    
                    print("Existing Dose 1 details are:\n")
                    if len(Read_Data.vaxDoses) == 0 :
                        print("No Dose 1 details found")
                    else :
                        print("Vaccine date is %s \n" % str(Read_Data.vaxDoses[0].date.date()))
                        print("Vaccine type is %s \n" % vax_type_dict[Read_Data.vaxDoses[0].type])
                    ans = input("Do you want to update? (y/n) ")
                    if ans == "y" :
                        vac_date = input("Input your vaccinated date: (YYYY-MM-DD) ")
                        portions = vac_date.split('-')
                        vac = datetime(int(portions[0]), int(portions[1]), int(portions[-1]))
                
                        print("****** Vaccine Types *******")
                        print("*     0: Unknown           *")
                        print("*     1: AstraZenca        *")
                        print("*     2: Bharat Biotech    *")
                        print("*     3: Janssen           *")
                        print("*     4: Moderna           *")
                        print("*     5: Pfizer-BioNTech   *")
                        print("*     6: Sinopharm BIBP    *")
                        print("*     7: Sinovac           *")
                        print("*     8: Other             *")
                        print("****************************")
                        vac_type = input("Input your vaccine type: ")
                        dose1 = vaxDose(vac, int(vac_type))
                        dose.clear()
                        dose.append(dose1)
                        
                        # Add the first dose
                        if new_vax_status == 1 and int(vac_type) != 0:
                            if int(vac_type) == 3:
                                new_vax_status = 3
                            else:
                                new_vax_status = new_vax_status + 1
                        elif new_vax_status == 1 and int(vac_type) == 0:
                            new_vax_status = new_vax_status
                        else:
                            new_vax_status = new_vax_status
                            
                        cnt = input("\nContinue with more updates? (y/n) ")
                        if cnt == 'n':
                            break 
            
                    else: 
                        print("Keeping existing Dose 1 details")
                        cnt = input("\nContinue with more updates? (y/n) ")
                        if cnt == 'n':
                            break     

                elif option == "2":     
                    print("Existing Dose 2 details are:\n")
                    if len(Read_Data.vaxDoses) <= 1 :
                        print("No Dose 2 details found")
                    else :
                        print("Vaccine date is %s \n" % str(Read_Data.vaxDoses[1].date.date()))
                        print("Vaccine type is %s \n" % vax_type_dict[Read_Data.vaxDoses[1].type])

                    ans = input("Do you want to update? (y/n) ")
                    if ans == "y" :
                        vac_date = input("Input your vaccinated date: (YYYY-MM-DD) ")
                        portions = vac_date.split('-')
                        vac = datetime(int(portions[0]), int(portions[1]), int(portions[-1]))
                
                        print("****** Vaccine Types *******")
                        print("*     0: Unknown           *")
                        print("*     1: AstraZenca        *")
                        print("*     2: Bharat Biotech    *")
                        print("*     3: Janssen           *")
                        print("*     4: Moderna           *")
                        print("*     5: Pfizer-BioNTech   *")
                        print("*     6: Sinopharm BIBP    *")
                        print("*     7: Sinovac           *")
                        print("*     8: Other             *")
                        print("****************************")
                        vac_type = input("Input your vaccine type: ")
                        dose2 = vaxDose(vac, int(vac_type))
                        dose.clear()
                        dose.append(dose1)
                        dose.append(dose2)
                        
                        # add the second dose
                        if new_vax_status < 3 and int(vac_type) != 0:
                            if int(vac_type) == 3:
                                new_vax_status = 3
                            else:
                                new_vax_status = new_vax_status + 1
                        elif new_vax_status < 3 and int(vac_type) == 0:
                            new_vax_status = new_vax_status
                        else:
                            new_vax_status = new_vax_status
                        cnt = input("\nContinue with more updates? (y/n) ")
                        if cnt == 'n':
                            break 
        
                    else: 
                        print("Keeping existing Dose 2 details")
                        cnt = input("\nContinue with more updates? (y/n) ")
                        if cnt == 'n':
                            break     

                elif option == "3":     
                    print("Existing Dose 3 details are:\n")
                    if len(Read_Data.vaxDoses) <= 2 :
                        print("No Dose 3 details found")
                    else :
                        print("Vaccine date is %s \n" % str(Read_Data.vaxDoses[2].date.date()))
                        print("Vaccine type is %s \n" % vax_type_dict[Read_Data.vaxDoses[2].type])

                    ans = input("Do you want to update? (y/n) ")
                    if ans == "y" :
                        vac_date = input("Input your vaccinated date: (YYYY-MM-DD)")
                        portions = vac_date.split('-')
                        vac = datetime(int(portions[0]), int(portions[1]), int(portions[-1]))
                
                        print("****** Vaccine Types *******")
                        print("*     0: Unknown           *")
                        print("*     1: AstraZenca        *")
                        print("*     2: Bharat Biotech    *")
                        print("*     3: Janssen           *")
                        print("*     4: Moderna           *")
                        print("*     5: Pfizer-BioNTech   *")
                        print("*     6: Sinopharm BIBP    *")
                        print("*     7: Sinovac           *")
                        print("*     8: Other             *")
                        print("****************************")
                        vac_type = input("Input your vaccine type: ")
                        dose3 = vaxDose(vac, int(vac_type))
                        dose.clear()
                        dose.append(dose1)
                        dose.append(dose2)
                        dose.append(dose3)
                        if new_vax_status < 3 and int(vac_type) != 0:
                            if int(vac_type) == 3:
                                new_vax_status = 3
                            else:
                                new_vax_status = new_vax_status + 1
                        elif new_vax_status < 3 and int(vac_type) == 0:
                            new_vax_status = new_vax_status
                        else:
                            new_vax_status = new_vax_status
                        cnt = input("\nContinue with more updates? (y/n)")
                        if cnt == 'n':
                            break 
       
                    else: 
                        print("Keeping existing Dose 3 details")
                        cnt = input("\nContinue with more updates? (y/n)")
                        if cnt == 'n':
                            break                        
                else:
                    print("Here is the updated information so far")
                    print(Read_Data.firstName, Read_Data.lastName, new_birth_date, new_vax_status, Read_Data.UID, dose)
                    cnt = input("\nAre you sure you want to exit the Update Menu? (y/n)")
                    if cnt == 'y':
                        break    



            #print(Read_Data.firstName, Read_Data.lastName, new_birth_date, new_vax_status, Read_Data.UID, dose)
            user = DBUser(Read_Data.firstName, Read_Data.lastName, new_birth_date, new_vax_status, Read_Data.UID, dose)
            print("\nOld Data was this:\n")
            decoded_response.print()
            request = DBRequest(requestType.POST, 0, user)
            print("\nNew Data is this:\n")
            request.print()
            cnt = input("\nAre you sure you want to Update? (y/n)")
            if cnt == 'y':
                with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        
                    s.connect((fpga2_ip_addr, fpga2_server_port))
                    
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
                    
                    s.shutdown(1)
                    s.close()
                
        cnt = input(" Continue? (y/n)")
        if cnt == 'n':
            print("\nThank you for using the Vaccine Passport Application!")
            print("You may close the window now")
            break

        
