`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2022 03:09:27 PM
// Design Name: 
// Module Name: fsm_control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fsm_control(
    input clk,
    input reset,
    input dm_decode_enable,
    input decode_done,
    input fetch_done,
    output o_ld_wait,
    output o_ld_decode,
    output o_ld_name,
    output o_ld_db
    );
    
    reg [2:0] state, next_state;
    reg [34:0] counter;
    reg time_out;
    
    // Declare two objects, 'state' and 'nextstate'
	parameter S_WAIT = 2'b00;
	parameter S_DECODE = 2'b01;
	parameter S_SEND = 2'b10;
	parameter S_FETCH = 2'b11;
	
	// other parameters defined for the program
	parameter TARGET = 'd10000000000; // target for the timer, 10 seconds of wait time
	
	// Get the current state from the next state
	// Clocked always block for making state registers
	always@(posedge clk or posedge reset)
	begin
	   if (reset)
	       state <= S_WAIT;
	   else
	       state <= next_state;
	       
	end
	
	// counter for timing
	always@ (posedge clk or posedge reset)
    begin
        time_out <= 0;
        
        if (reset == 1'b1)
        begin
            counter <= 'b0;
        end
        else
        begin
            counter <= counter + 1;
            if (counter == TARGET)
            begin
                time_out <= 1'b1;
                counter <= 'b0;
            end
        end
    end
	
	always@(*)
	begin: state_table
	   case (state)
	       /* S_WAIT */
	       S_WAIT:
	       begin
	           if (dm_decode_enable)
	               next_state <= S_DECODE;
	           else
	               next_state <= S_WAIT;
	       end
	       /* S_DECODE */
	       S_DECODE:
	       begin
	           if (decode_done)
	               next_state <= S_SEND;
	           else
	               next_state <= S_DECODE;
	       end
	       /* S_SEND */
	       S_SEND:
	       begin
	           if (fetch_done)
	               next_state <= S_FETCH;
	           else
	               next_state <= S_SEND;
	       end
	       /* S_FETCH */
	       S_FETCH:
	       begin
	           if (time_out)
	               next_state <= S_WAIT;
	           else if (dm_decode_enable)
	               next_state <= S_DECODE;
	           else
	               next_state <= S_FETCH;
	       end
	       default:
	           next_state <= S_WAIT;
	   endcase
	end
	
	assign o_ld_wait   = (state == S_WAIT);
	assign o_ld_decode = (state == S_DECODE);
	assign o_ld_name   = (state == S_SEND);
	assign o_ld_db     = (state == S_FETCH);


endmodule
