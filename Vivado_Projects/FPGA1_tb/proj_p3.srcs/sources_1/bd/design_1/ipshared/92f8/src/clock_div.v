`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: ECE 532 Group 3
// 
// Create Date: 01/30/2022 01:52:36 PM
// Design Name: 
// Module Name: clock_div
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


module clock_div #(parameter div = 1)(
    input wire clk, //100MHz
    output reg divided_clk = 0 //25MHz
    );
    
    reg[27:0] counter = 0;
    
    always@(posedge clk)
    begin
        if (counter == div)
        begin
            counter <= 0;
        end
        else
        begin
            counter <= counter + 1;
        end
    end
    
    always@(posedge clk)
    begin
        if (counter == div)
            divided_clk <= ~divided_clk;
    end
    
endmodule
