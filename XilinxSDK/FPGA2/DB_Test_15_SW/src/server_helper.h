/*
 * server_helper.h
 *
 *  Created on: Mar 7, 2022
 *      Author: steccaor
 */

#ifndef SRC_SERVER_HELPER_H_
#define SRC_SERVER_HELPER_H_

#include <stdio.h>
#include <stdint.h>

void print_hex_buf(uint8_t* buf, size_t len);

//Parses and processes the data received by the server
//Returns <0 if failure
int recv_bytes(char* recv_buf, size_t recv_len, char* resp_buf, size_t* resp_len);

#endif /* SRC_SERVER_HELPER_H_ */
