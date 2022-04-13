// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Fri Mar  4 20:42:24 2022
// Host        : DESKTOP-EU22PUG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_fpga1_top_0_0_stub.v
// Design      : design_1_fpga1_top_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "fpga1_top,Vivado 2018.3" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, reset, dm_decode_enable, doses, permission, 
  fetch_enable, data_matrix_in, decode_done, database_addr, Hsynq, Vsynq, Red, Green, Blue)
/* synthesis syn_black_box black_box_pad_pin="clk,reset,dm_decode_enable,doses[1:0],permission,fetch_enable,data_matrix_in[255:0],decode_done,database_addr[15:0],Hsynq,Vsynq,Red[3:0],Green[3:0],Blue[3:0]" */;
  input clk;
  input reset;
  input dm_decode_enable;
  input [1:0]doses;
  input permission;
  input fetch_enable;
  input [255:0]data_matrix_in;
  output decode_done;
  output [15:0]database_addr;
  output Hsynq;
  output Vsynq;
  output [3:0]Red;
  output [3:0]Green;
  output [3:0]Blue;
endmodule
