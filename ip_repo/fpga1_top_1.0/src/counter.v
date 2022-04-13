`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2022 03:12:12 PM
// Design Name: 
// Module Name: counter
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


module counter#
	(
		//target parameters
		parameter integer TARGET = 'd250000000
	)
	(
    input clk,
    input reset,
    output reg time_out
    );
    
    reg [32:0] counter;
    
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
endmodule
