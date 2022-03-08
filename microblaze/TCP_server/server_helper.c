/*
 * server_helper.c
 *
 *  Created on: Mar 7, 2022
 *      Author: steccaor
 */
#include "server_helper.h"
#include "requestTLV.h"

void print_hex_buf(uint8_t* buf, size_t len) {
	for(int i = 0; i < len; i++){
		printf("%h2x ", buf[i]);
	}
	printf("\n");
}

int recv_bytes(char* recv_buf, size_t recv_len, char* resp_buf, size_t* resp_len)
{
	DBRequest recv_request, resp_request;
	resp_request.method = R_RESPONSE;
	DBUser_clear(&recv_request.userData);
	DBUser_clear(&resp_request.userData);

	int err = DBRequest_TlvDecode((uint8_t*) recv_buf, recv_len, &recv_request);
	if(err < 0) {
		//ERROR
		printf("Failed to parse Request");
		resp_request.sc = R_SC_INVALID;
		DBUser_clear(&resp_request.userData);
	}
	else
	{
		printf("Server Received The following TLV Request\n");
		DBRequest_print(recv_request);

		resp_request.sc = R_SC_SUCCESS;
		resp_request.userData = recv_request.userData;
	}

	int len = DBRequest_TlvEncode(resp_request, (uint8_t*) resp_buf, *resp_len);
	if(len < 0) {
		printf("Failed to Encode TLV Response\n");
		err = -1;
	} else {
		*resp_len = len;
	}

	return err;
}
