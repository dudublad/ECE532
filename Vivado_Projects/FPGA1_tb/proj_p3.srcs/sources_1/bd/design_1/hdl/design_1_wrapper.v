//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Tue Apr 12 21:46:09 2022
//Host        : DESKTOP-EU22PUG running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (Blue_0,
    Green_0,
    Hsynq_0,
    Red_0,
    Vsynq_0,
    clk,
    resetn);
  output [3:0]Blue_0;
  output [3:0]Green_0;
  output Hsynq_0;
  output [3:0]Red_0;
  output Vsynq_0;
  input clk;
  input resetn;

  wire [3:0]Blue_0;
  wire [3:0]Green_0;
  wire Hsynq_0;
  wire [3:0]Red_0;
  wire Vsynq_0;
  wire clk;
  wire resetn;

  design_1 design_1_i
       (.Blue_0(Blue_0),
        .Green_0(Green_0),
        .Hsynq_0(Hsynq_0),
        .Red_0(Red_0),
        .Vsynq_0(Vsynq_0),
        .clk(clk),
        .resetn(resetn));
endmodule
