/*
 * request_handler.h
 *
 *  Created on: Mar 15, 2022
 *      Author: steccaor
 */

#ifndef SRC_REQUEST_HANDLER_H_
#define SRC_REQUEST_HANDLER_H_

#include "requestTLV.h"

int handle_request(DBRequest recv_request, DBRequest* resp_request);

#endif /* SRC_REQUEST_HANDLER_H_ */
