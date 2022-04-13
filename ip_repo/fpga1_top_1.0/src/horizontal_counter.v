`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: ECE 532 Group 3
// 
// Create Date: 01/30/2022 01:51:02 PM
// Design Name: 
// Module Name: horizontal_counter
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
// screen resolution 480x640
//////////////////////////////////////////////////////////////////////////////////


module horizontal_counter(
    input clk,
    output reg enable_V_counter = 0,
    output reg [15:0] H_counter_val
    );
    
    always@ (posedge clk)
    begin
        if (H_counter_val < 799)
        begin
            H_counter_val <= H_counter_val + 1;
            enable_V_counter <= 0;
        end
        else
        begin
            H_counter_val <= 0; // reset the horizontal counter
            enable_V_counter <= 1; // trigger the vertical counter
        end 
    end
endmodule
