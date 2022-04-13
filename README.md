# ECE532
Vaccine passport control  with on-cloud database storage using network connected Nexys 4 DDR FPGAs

## Background

It is 2022 and COVID is already 2 years old! Even though this is not the case anymore, your vaccine passport used to be your key to entering a restaurant, school, office building, airports and almost everywhere else you wanted to go. Our project implements an exciting solution where a user can scan a user’s vaccine passport at a remote client terminal near an entry point. Once scanned their information is verified by a server in the cloud using a database, and they are approved to enter if they are vaccinated.

The key advantage to our approach is that no more human interaction is going to be needed throughout the entire process of vaccine checks. Although speedup in the vaccine passport scanning process is not guaranteed for our current implementation on the Nexys 4 DDR FPGA, this project can be further improved with more powerful CPU cores that guarantees a speedup in the entire process. This is because, unlike the current vaccine passport, our project will be implementing custom cores/IP in hardware for both the Data Matrix decoding and the server database implementation.

Finally, it is worth mentioning that Data Matrices and QR codes are widely used for a variety of different purposes. Our project can be easily modified to be used in different application such as warehouse managing, ticket scanning, and product manufacturing. We chose a Vaccine passport solution as it is very relevant to our current scenario.

## Goals
The goal of our project is to successfully implement a digital, FPGA cloud-based database system that combines a Data Matrix decoder with a remote FPGA server located in a data center, to mimic and try to improve upon the current vaccination passport system that is being widely used throughout Canada and the world by removing the need for a person to be present to scan the vaccine passport and allow or deny entry. 

![image](https://user-images.githubusercontent.com/58315188/163098299-e4b78289-71ea-4891-9b2c-8cc0f113a743.png)

## Overview of the system

## How to use

### Requirements
```
pip install PyStrich
pip install uttlv
pip install numpy
pip install pillow
```

Enter `ipconfig` to get the IP address, especially the station number in the command prompt.

Suppose that you are at machine X for the FPGA client and machine Y for the FPGA server.

### FPGA 1 (Client)
(1)	Download the file named [FPGA_1](/Vivado_Projects/FPGA_1), make sure that the ip_repo folder is in the same folder as the dm_server folder, also add the sdk file in [FPGA1](/XilinxSDK/FPGA1) to the dm_server folder.

(2)	Go to the dm_server folder and find demo_group.xpr, double-click to open it.

(3)	Once Vivado is opened, choose File -> Launch SDK

(4)	Choose Xilinx -> Program FPGA -> Program

(5)	Open the dm_server folder and go to main.c

(6)	In main.c, change the following information:

&nbsp;&nbsp;&nbsp;&nbsp;a)	`SRC_MAC_ADDR {0x00, 0x0a, 0x35, 0x00, 0x00, 0xX}`

&nbsp;&nbsp;&nbsp;&nbsp;b)	`SRC_IP4_ADDR "1.1.X.2"`

(7)	Also in main.c, change `DEST_IP4_ADDR`  to "1.1.Y.2", where Y is the station number of the FPGA server

(8)	Go to SDK terminal -> the green “+” -> connect to COM6 at Baud Rate 9600

(9)	Choose Run -> Run Configurations -> Run

(10)	If you are physically at the lab, switch the monitor to VGA mode, otherwise use a webcam test website to view what is displayed on VGA.

### FPGA 2 (Server)

(1)	Download all the files in the [FPGA2](/XilinxSDK/FPGA2) directory

(2)	Open all the three projects in that directory Xilinx SDK 2018.3

(3)	Open the file [setup.h](/XilinxSDK/FPGA2/DB_Test_15_SW/src/)

&nbsp;&nbsp;&nbsp;&nbsp; a)	Modify the definition `MACHINE_NUM` to reflect the number of your station in the FPGA-Net

&nbsp;&nbsp;&nbsp;&nbsp; b)	Modify the definition `MACHINE_NUM_HEX` to reflect the number of your station in hex format. Number should just match the decimal version. E.g., if your machine number is 11, set `MACHINE_NUM_HEX` to 0x11.

(4)	Choose Xilinx -> Program FPGA -> Program

&nbsp;&nbsp;&nbsp;&nbsp; a)	Program the FPGA with the bitstream [T5_wrapper.hdf](/XilinxSDK/FPGA2/DB_Test15_HW/)

(5)	To enable logs, go to SDK terminal -> the green “+” -> connect to COM6 at Baud Rate 9600

(6)	Choose Run -> Run Configurations -> Run

### PC
(1)	Go to the Scripts folder and make sure there is a folder called dm_images inside

(2)	Right click on the file [definitions.py](/Scripts/definitions.py) -> Edit with IDLE -> Edit with IDLE 3.7 (64-bit)

(3)	Change the first line to `fpga2_ip_addr = "1.1.Y.2"`

(4)	Close IDLE and double click on the [main_script.py](/Scripts/main_script.py) file

(5)	Follow the instructions shown on the terminal
