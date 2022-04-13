/*
 * request_handler.c
 *
 *  Created on: Mar 15, 2022
 *      Author: steccaor
 */

#include "request_handler.h"
#include "server_helper.h"
#include <string.h>

#define MEMSIZE 32
#define DB_ENTRY_LEN 128
#define DB_ENTRY_SZ_INT_32 DB_ENTRY_LEN/4

typedef enum {
	DB_COMMAND_FETCH = 4,
	DB_COMMAND_ADD = 5
} DB_COMMAND;

volatile unsigned int* ddr_membase = (unsigned int*) 0x80000000;
volatile unsigned int* ddr_test_membase = (unsigned int*) 0x80002000;
volatile unsigned int* bram_membase = (unsigned int*) 0x80000000; //XPAR_BRAM_0_BASEADDR;
volatile unsigned int* CMD = (unsigned int*) 0x44A00000; //XPAR_DB_FULL1_0_S00_AXI_BASEADDR;
volatile unsigned int* UID = (unsigned int*) 0x44A00004; //XPAR_DB_FULL1_0_S00_AXI_BASEADDR + 1;
volatile unsigned int* NOM = (unsigned int*) 0x44A00008; //XPAR_DB_FULL1_0_S00_AXI_BASEADDR + 2;
volatile unsigned int* EXEC_CMD = (unsigned int*) 0x44A0000C; //XPAR_DB_FULL1_0_S00_AXI_BASEADDR + 3;
volatile unsigned int* DONE = (unsigned int*) 0x44A00010; //XPAR_DB_FULL1_0_S00_AXI_BASEADDR + 4;
volatile unsigned int* BUSY = (unsigned int*) 0x44A00014; //XPAR_DB_FULL1_0_S00_AXI_BASEADDR + 5;

#define SPIN_WAIT 10000

//Marks the next UID to be assigned
//Also the maximum UID that could be stored in the db
//static uint32_t next_uid = 0;

static void DB_execute(uint32_t DB_command, uint32_t uid) {
//	xil_printf("Entered the While BUSY loop\n\r");
	while(*(BUSY)) {
		//Wait for opperation to complete
		for(int i = 0; i < SPIN_WAIT; i++){
			//spin
		}
	}
//	xil_printf("Exited the While BUSY loop\n\r");

	*(CMD) = DB_command;
	*(UID) = uid;
	*(EXEC_CMD) = 0x00000001;

	//if(DB_command == DB_COMMAND_FETCH) {
//		xil_printf("Entered the While Not Done loop\n\r");
		while(!*(DONE)){
			//Wait for opperation to complete
			for(int i = 0; i < SPIN_WAIT; i++){
				//spin
			}
		}
//		xil_printf("Exited the While Not Done loop\n\r");
	//}
}

//Sends an add command to the database
//Data array must be of size MEMSIZE
static int DB_write(uint32_t uid, uint32_t* data)
{
	int err = 0;

	xil_printf("Writing RAW Data to DB:\n");
	print_hex_buf((uint8_t*) data, DB_ENTRY_LEN);

//	xil_printf("Writing to BRAM Memory\n\r");
	for(int i = 0; i < MEMSIZE; i++)
	{
		*(bram_membase+i) = data[i];
	}

	DB_execute(DB_COMMAND_ADD, uid);

	return err;
}

//Sends a fetch command to the database
//Data array must be of size MEMSIZE
static int DB_read(uint32_t uid, uint32_t* data)
{
//	xil_printf("Reading from DB\n");

	DB_execute(DB_COMMAND_FETCH, uid);

//	xil_printf("Reading from BRAM Memory\n\r");
	for(int i = 0; i < MEMSIZE; i++)
	{
		data[i] = *(bram_membase+i);
	}

	xil_printf("Read RAW Data from DB:\n");
	print_hex_buf((uint8_t*) data, DB_ENTRY_LEN);

	return 0;
}

static int handle_POST_request(DBRequest recv_request, DBRequest* resp_request)
{
	xil_printf("Handling POST REQUEST\n");

	//Encode write data
	//TODO: Optimize this out, use Send buffer instead
	uint32_t data[DB_ENTRY_SZ_INT_32];
	memset(data, 0, DB_ENTRY_LEN);

	// commented this out to enable manual UID entries
	/*recv_request.userData.UID = next_uid;
	next_uid++;
	*/
	int len = DBUser_TlvEncode(recv_request.userData, (uint8_t*) data, DB_ENTRY_LEN);
	if(len < 0) {
		xil_printf("Failed to Encode Store Data\n");
		return -1;
	}

	//TODO: Metadata in the begginning??
	data[DB_ENTRY_SZ_INT_32 - 1] = len;

	resp_request->userData = recv_request.userData;

	return DB_write(recv_request.userData.UID, data);
}

static int handle_GET_request(DBRequest recv_request, DBRequest* resp_request) {
	xil_printf("Handling GET Request\n");

	/*
	if(recv_request.userData.UID >= next_uid) {
		xil_printf("UID out of bounds\n");
		resp_request->sc = R_SC_NOT_FOUND;
		resp_request->userData = recv_request.userData;
		return -1;
	}
	*/

	uint32_t data[DB_ENTRY_SZ_INT_32];
	memset(data, 0, DB_ENTRY_LEN);

	DB_read(recv_request.userData.UID, data);

	//TODO: metadata stuff
	size_t tlv_len = data[DB_ENTRY_SZ_INT_32 - 1];
	if(tlv_len == 0 || tlv_len > DB_ENTRY_LEN)
		{
			resp_request->sc = R_SC_NOT_FOUND;
			return -1;
		}
	//TODO: Get rid of this and just use the buffers for response
	int err = DBUser_TlvDecode((uint8_t*) data, tlv_len, &(resp_request->userData));
	if(err < 0) {
		printf("Failed to decode GET Request TLV\n");
		resp_request->sc = R_SC_NOT_FOUND;
		return -1;
	}

	return err;
}

int handle_request(DBRequest recv_request, DBRequest* resp_request)
{
    resp_request->sc = R_SC_SUCCESS;

    if(recv_request.method == R_POST) {
    	return handle_POST_request(recv_request, resp_request);
    } else if(recv_request.method == R_GET) {
    	return handle_GET_request(recv_request, resp_request);
    } else {
    	xil_printf("Invalid Method\n");
    	resp_request->sc = R_SC_INVALID;
    }

    return -1;
}
