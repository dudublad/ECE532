/*
 * Copyright (C) 2009 - 2018 Xilinx, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
 * SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
 * OF SUCH DAMAGE.
 *
 */

#include <stdio.h>
#include <string.h>
#include <math.h>
#include "xparameters.h"
#include "lwip/err.h"
#include "lwip/tcp.h"
#if defined (__arm__) || defined (__aarch64__)
#include "xil_printf.h"
#endif

#define MEMSIZE 8
volatile unsigned int* membase = (unsigned int*) XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR;
int counter = 0;

volatile unsigned int* dm_decode_en = (unsigned int*) 0x44a00000;
volatile unsigned int* doses = (unsigned int*) (0x44a00000 + 0x4);
volatile unsigned int* permission = (unsigned int*) (0x44a00000 + 0x8);
volatile unsigned int* fetch_enable = (unsigned int*) (0x44a00000 + 0xC);
volatile unsigned int* database_addr = (unsigned int*) (0x44a00000 + 0x10);


int transfer_data() {
	return 0;
}

void print_app_header()
{
#if (LWIP_IPV6==0)
	xil_printf("\n\r\n\r-----lwIP TCP echo server ------\n\r");
#else
	xil_printf("\n\r\n\r-----lwIPv6 TCP echo server ------\n\r");
#endif
	xil_printf("TCP packets sent to port 6001 will be echoed back\n\r");
}

err_t recv_callback(void *arg, struct tcp_pcb *tpcb,
                               struct pbuf *p, err_t err)
{
	/* do not read the packet if we are not in ESTABLISHED state */
	if (!p) {
		tcp_close(tpcb);
		tcp_recv(tpcb, NULL);
		return ERR_OK;
	}

	/* indicate that the packet has been received */
	tcp_recved(tpcb, p->len);

	/* echo back the payload */
	/* in this case, we assume that the payload is < TCP_SND_BUF */
	if (tcp_sndbuf(tpcb) > p->len) {

		// for testing: the last saved number is correct
		xil_printf("In the last sending, stored %d at %p\n", *(membase+counter-1), membase + counter-1);

		// copy the sent information into a buffer
		char* recv_buf = malloc(sizeof(char) * (p->len+1));
		memset(recv_buf, 0, (p->len+1));
		memcpy(recv_buf, p->payload, p->len);

		// print the information sent
		xil_printf("Received <%s>, length: %d,", recv_buf, p->len);

		if (strcmp(recv_buf, "Initialization") == 0)
		{
			// reset the BRAM pointer
			counter = 0;

			xil_printf(", restart storage\n");

			*dm_decode_en = 0x00;
//			*doses = 0x00;
//			*permission = 0x00;

			*fetch_enable = 0x00;
			*database_addr = 0x00;
			xil_printf("initializing enable signal\n");

			// send ACK once everything has been done
			err = tcp_write(tpcb, "ACK", 3, 1);
		}
		else if (strcmp(recv_buf, "end") == 0)
		{
			// reset the BRAM pointer
			counter = 0;

			xil_printf(", end sending\n");

			//decode enable
			*dm_decode_en = 0x01;
			//clear decode enable
			xil_printf("Decode enabled\n");

			xil_printf("Decode result: %d\n", (* database_addr) );

			// send ACK once everything has been done
			err = tcp_write(tpcb, "ACK", 3, 1);
		}
		else
		{
			// transform the sent string into integer
			int sum = 0;
			int count = 0;

			for (int i=p->len-1; i >= 0; i--)
			{
				if (recv_buf[i] == '0')
				{
					sum += 0;
				}
				else if (recv_buf[i] == '1')
				{
					sum += pow(2, count);
				}
				count++;
			}

			// print the transformation result
			xil_printf(" result is %d\n", sum);

			// store the result in memory
			*(membase + counter) = sum;
			counter++;

			// send ACK once everything has been done
			err = tcp_write(tpcb, "ACK", 3, 1);
		}


	} else
		xil_printf("no space in tcp_sndbuf\n\r");

	/* free the received pbuf */
	pbuf_free(p);

	return ERR_OK;
}

err_t accept_callback(void *arg, struct tcp_pcb *newpcb, err_t err)
{
	static int connection = 1;

	/* set the receive callback for this connection */
	tcp_recv(newpcb, recv_callback);

	/* just use an integer number indicating the connection id as the
	   callback argument */
	tcp_arg(newpcb, (void*)(UINTPTR)connection);

	/* increment for subsequent accepted connections */
	connection++;

	return ERR_OK;
}


int start_application()
{
	struct tcp_pcb *pcb;
	err_t err;
	unsigned port = 7;

	/* create new TCP PCB structure */
	pcb = tcp_new_ip_type(IPADDR_TYPE_ANY);
	if (!pcb) {
		xil_printf("Error creating PCB. Out of Memory\n\r");
		return -1;
	}

	/* bind to specified @port */
	err = tcp_bind(pcb, IP_ANY_TYPE, port);
	if (err != ERR_OK) {
		xil_printf("Unable to bind to port %d: err = %d\n\r", port, err);
		return -2;
	}

	/* we do not need any arguments to callback functions */
	tcp_arg(pcb, NULL);

	/* listen for connections */
	pcb = tcp_listen(pcb);
	if (!pcb) {
		xil_printf("Out of memory while tcp_listen\n\r");
		return -3;
	}

	/* specify callback to use for incoming connections */
	tcp_accept(pcb, accept_callback);

	xil_printf("TCP echo server started @ port %d\n\r", port);

	return 0;
}
