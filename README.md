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

![image](https://user-images.githubusercontent.com/58315188/163198957-eedee0fe-36e5-492a-a286-0b1e8c22ce02.png)

**There are two workflow modes for the system:**
1.	Administrator Mode - direct access from PC to the database
2.	Normal (Data Matrix Scanning) Mode - requires FPGA 1 to process the data and fetch corresponding information from the memory

**Minimum Hardware required**:
1. two FPGAs with one FPGA connected to DDR memory, and the other connected to VGA. Both FPGAs should be connected to the network.
2. one PC to run the user interface script.
The number of PCs and FPGAs with VGA can be increased without changing the structure of scripts (only adding the IP addresses).

## How to use

### Requirements
```
pip install PyStrich
pip install uttlv
pip install numpy
pip install pillow
```

Enter `ipconfig` to get the IP address, especially the station number in the command prompt.

**Suppose that you are at machine X for the FPGA client and machine Y for the FPGA server.**

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

## Repository Structure

```
.gitignore
README.md
Scripts
   |-- TLV_Decode.py
   |-- TLV_Encode.py
   |-- CSV_convert.py
   |-- database_cheatsheet.csv
   |-- definitions.py
   |-- main_script.py
   |-- dm_images
   |   |-- dm_0.png
Vivado_Projects
   |-- FPGA_1
   |   |-- dm_server
   |   |   |-- bitstream
   |   |   |   |-- design_1_wrapper.bit
   |   |   |   |-- design_1_wrapper.ltx
   |   |   |-- demo_group.cache
   |   |   |-- demo_group.hw
   |   |   |-- demo_group.runs
   |   |   |-- demo_group.srcs
   |   |   |-- demo_group.xpr
   |   |-- ip_repo
   |   |   |-- fpga1_top_1.0
   |   |   |-- fpga1_top_master_1.0
   |   |   |-- fpga1_top_master_bram_1.0
   |   |   |-- fpga1_top_slv_1.0
   |-- FPGA2
   |   |-- bitstreams
   |   |   |-- DB_Test7_DDR_4.bit
   |   |   |-- T5_wrapper.hdf
   |   |-- DB_Server_Final
   |   |   |-- DB_Test7_DDR_4.cache
   |   |   |-- DB_Test7_DDR_4.hw
   |   |   |-- DB_Test7_DDR_4.ip_user_files
   |   |   |-- DB_Test7_DDR_4.ipdefs
   |   |   |-- DB_Test7_DDR_4.srcs
   |   |   |-- DB_Test7_DDR_4.xpr
   |   |-- ip_repo
   |   |   |--DB_Parsing_IP_v1_0
   |-- FPGA1_tb
   |   |-- proj_p3.xpr
XilinxSDK
   |-- FPGA1
   |   |-- demo_group.sdk
   |   |   |-- design_1_wrapper_hw_platform_0
   |   |   |-- dm_server
   |   |   |-- dm_server_bsp
   |   |   |-- design_1_wrapper.hdf
   |-- FPGA2
   |   |-- DB_Test15_HW
   |   |-- DB_Test_15_SW
   |   |-- DB_Test_15_SW_bsp
docs
   |-- Final_Demo_Presentation.pdf
   |-- Final_Proposal_Presentation.pdf
   |-- Final_Proposal_Writeup.pdf
   |-- Mid_Project_Presentation.pdf
```

## Authors
[Mustafa Kanchwala](https://github.com/mustafakanchwala)

[Guoxian Wu](https://github.com/flystandard1)

[Eduardo Stecca Ortenblad](https://github.com/dudublad)

[Xuening Dong](https://github.com/XueningD65)
