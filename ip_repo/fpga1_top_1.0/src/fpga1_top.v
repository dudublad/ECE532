`timescale 1ns / 1ps
//`define USE_VIO
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/20 21:44:55
// Design Name: 
// Module Name: fpga1_top
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


module fpga1_top(
    input             clk,
	
	`ifndef USE_VIO
	input             reset,  // active low
	input             dm_decode_enable,
	//input             fetch_done,
	input [1:0]       doses,
	input             permission,
	input             fetch_enable,

	input [255:0]     data_matrix_in,
	output            decode_done,
    output [15:0]     database_addr,
	`endif
	//connected to VGA display

        output            Hsynq,
        output            Vsynq,
        output            [3:0] Red,
        output            [3:0] Green,
        output            [3:0] Blue

    );
    
    wire [255:0]     data_matrix;
    // dm_decoder -> fsm
    wire             dm_decode_done;
    
    // fsm signal
    wire             o_ld_wait;
    wire             o_ld_decode;
    wire             o_ld_name;
    wire             o_ld_db;

    wire  [7:0]      char_1;
    wire  [7:0]      char_2;
    wire  [7:0]      char_3;
    wire  [7:0]      char_4;
    wire  [7:0]      char_5;
    wire  [7:0]      char_6;
    wire  [7:0]      char_7;
    wire  [7:0]      char_8;
    wire  [7:0]      char_9;
    wire  [7:0]      char_10;

    //for testing only
    `ifdef USE_VIO
    wire [6:0] swt, out;
    vio_0 vio(.clk(clk), .probe_in0(out), .probe_out0(swt));
    wire             reset;
    wire             dm_decode_enable;
    wire             fetch_done;
    wire [1:0]       doses;
    wire             permission;
    wire             fetch_enable;
    wire             decode_done;
    
    assign  reset = swt[0];
    assign  dm_decode_enable = swt[1];
    assign  doses = swt[6:5];
    assign  permission = swt[4];
    assign  fetch_enable = swt[3];

    //assign  data_matrix    = 256'h5555944D_6163971D_3EB9DAC5_30BFC435_14A9D1F5_15EB8A55_304581D7_0227FFFF;

//0101010101010101
//1001010001001101
//0110000101100011
//1001011100011101
//0011111010111001
//1101101011000101
//0011000010111111
//1100010000110101
//0001010010101001
//1101000111110101
//0001010111101011
//1000101001010101
//0011000001000101
//1000000111010111
//0000001000100111
//1111111111111111

    `else
    assign  data_matrix = data_matrix_in; 
    `endif

    fsm_control  fsm_1(
        .clk(clk),
        .reset(~reset),
        .dm_decode_enable(dm_decode_enable),
        .decode_done(decode_done),
        .fetch_done(fetch_enable),
        .o_ld_wait(o_ld_wait),
        .o_ld_decode(o_ld_decode),
        .o_ld_name(o_ld_name),
        .o_ld_db(o_ld_db)
    );
    
    
	vga_control  vga_1(
        .clk(clk),
        .reset(~reset),
        .char_1(char_1),
        .char_2(char_2),
        .char_3(char_3),
        .char_4(char_4),
        .char_5(char_5),
        .char_6(char_6),
        .char_7(char_7),
        .char_8(char_8),
        .char_9(char_9),
        .char_10(char_10),

        .Hsynq(Hsynq ),
        .Vsynq(Vsynq ),
        .Red  (Red   ),
        .Green(Green ),
        .Blue (Blue  ),
    
        .ld_wait   (o_ld_wait),
        .ld_decode (o_ld_decode),
        .ld_name   (o_ld_name),
        .ld_db     (o_ld_db),

	.permission (permission),
	.doses      (doses),
	.in_data_matrix (data_matrix)
    );
	
    dm_decoder_top  dm_decoder_1(
        .clk(clk),
        .reset(~reset),

        .data_matrix(data_matrix),
        .dm_decode_enable(dm_decode_enable),

        .char_1(char_1),
        .char_2(char_2),
        .char_3(char_3),
        .char_4(char_4),
        .char_5(char_5),
        .char_6(char_6),
        .char_7(char_7),
        .char_8(char_8),
        .char_9(char_9),
        .char_10(char_10),

        .ld_wait   (o_ld_wait),
        .ld_decode (o_ld_decode),
        .ld_name   (o_ld_name),
        .ld_db     (o_ld_db),
        
        .database_addr(database_addr),

    
        .decode_done (decode_done)
    );
endmodule
