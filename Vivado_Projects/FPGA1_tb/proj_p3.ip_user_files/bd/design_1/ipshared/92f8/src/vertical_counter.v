`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: ECE 532 Group 3
// 
// Create Date: 01/30/2022 01:51:02 PM
// Design Name: 
// Module Name: vertical_counter
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


module vertical_counter(
    input clk,
    input enable_V_counter,
    output reg [15:0] V_counter_val
    );
    
    always@ (posedge clk)
    begin
        if (enable_V_counter == 1'b1)
        begin
            if (V_counter_val < 524)
            begin
                V_counter_val <= V_counter_val + 1;
            end
            else
            begin
                V_counter_val <= 0; // reset the vertical counter
            end 
        end
    end
endmodule
