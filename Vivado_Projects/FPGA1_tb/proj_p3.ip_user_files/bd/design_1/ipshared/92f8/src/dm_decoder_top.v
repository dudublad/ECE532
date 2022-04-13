`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/20 22:00:17
// Design Name: 
// Module Name: dm_decoder_top
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


module dm_decoder_top(
    input               clk,
    input               reset,
    // from PC1 
    input      [255:0]  data_matrix,
    input               dm_decode_enable,
    // to VGA_controller
    output reg [7:0]    char_1,
    output reg [7:0]    char_2,
    output reg [7:0]    char_3,
    output reg [7:0]    char_4,
    output reg [7:0]    char_5,
    output reg [7:0]    char_6,
    output reg [7:0]    char_7,
    output reg [7:0]    char_8,
    output reg [7:0]    char_9,
    output reg [7:0]    char_10,
    // from fsm_controller
    input               ld_wait,
    input               ld_decode,
    input               ld_name,
    input               ld_db,
    // to fsm_controller
    output reg [15:0]   database_addr,
    output              decode_done
    );

    wire          out_enable;
    reg  [7:0]    char_cnt;
    wire [7:0]    out_char;
    reg  [255:0]  data_matrix_reg;

    wire  [15:0]  bit7;  //[15:8] for x, [7:0] for y
    wire  [15:0]  bit6;  //[15:8] for x, [7:0] for y
    wire  [15:0]  bit5;  //[15:8] for x, [7:0] for y
    wire  [15:0]  bit4;  //[15:8] for x, [7:0] for y
    wire  [15:0]  bit3;  //[15:8] for x, [7:0] for y
    wire  [15:0]  bit2;  //[15:8] for x, [7:0] for y
    wire  [15:0]  bit1;  //[15:8] for x, [7:0] for y
    wire  [15:0]  bit0;  //[15:8] for x, [7:0] for y

	wire  [7:0] idx0;
	wire  [7:0] idx1;
	wire  [7:0] idx2;
	wire  [7:0] idx3;
	wire  [7:0] idx4;
	wire  [7:0] idx5;
	wire  [7:0] idx6;
	wire  [7:0] idx7;


    //counter of decoded characters 
    always @(posedge clk or posedge reset) begin
        if(reset)
	    char_cnt <= 4'd0;
        else if(decode_done) 
	    char_cnt <= 4'h0;
	else if(out_enable)
            char_cnt <= char_cnt + 4'd1;
    end

    //register of datamatrix
    always @(posedge clk or posedge reset) begin
	if(reset) 
	    data_matrix_reg <= 256'h0;
	else if (dm_decode_enable)
	    data_matrix_reg <= data_matrix;
	else if (decode_done)
	    data_matrix_reg <= 256'h0;
    end

    //update output characters
    always @(posedge clk or posedge reset) begin
	if(reset) begin 
	    char_1 <= 8'd0;
	    char_2 <= 8'd0;
	    char_3 <= 8'd0;
	    char_4 <= 8'd0;
	    char_5 <= 8'd0;
	    char_6 <= 8'd0;
	    char_7 <= 8'd0;
	    char_8 <= 8'd0;
	    char_9 <= 8'd0;
	    char_10 <= 8'd0;
	    database_addr <= 16'd0;
	end
	else if(out_enable) begin
	    case (char_cnt) 
		4'd0: char_1 <= out_char;
		4'd1: char_2 <= out_char;
		4'd2: char_3 <= out_char;
		4'd3: char_4 <= out_char;
		4'd4: char_5 <= out_char;
		4'd5: char_6 <= out_char;
		4'd6: char_7 <= out_char;
		4'd7: char_8 <= out_char;
		4'd8: char_9 <= out_char;
		4'd9: char_10 <= out_char;
		4'd10: database_addr[15:8] <= out_char;
		4'd11: database_addr[7:0]  <= out_char;
	    endcase
	end
	//else if(decode_done) begin
	//    char_1 <= 4'd0;
	//    char_2 <= 4'd0;
	//    char_3 <= 4'd0;
	//    char_4 <= 4'd0;
	//    char_5 <= 4'd0;
	//    char_6 <= 4'd0;
	//    char_7 <= 4'd0;
	//    char_8 <= 4'd0;
	//    char_9 <= 4'd0;
	//    char_10 <= 4'd0;
	//end
    end
    
    //get datamatrix index
    assign out_char[0] = data_matrix_reg[idx0];
    assign out_char[1] = data_matrix_reg[idx1];
    assign out_char[2] = data_matrix_reg[idx2];
    assign out_char[3] = data_matrix_reg[idx3];
    assign out_char[4] = data_matrix_reg[idx4];
    assign out_char[5] = data_matrix_reg[idx5];
    assign out_char[6] = data_matrix_reg[idx6];
    assign out_char[7] = data_matrix_reg[idx7];

	assign idx0 = 8'd225-(bit0[11:8]<<4)+bit0[7:0];
	assign idx1 = 8'd225-(bit1[11:8]<<4)+bit1[7:0];
	assign idx2 = 8'd225-(bit2[11:8]<<4)+bit2[7:0];
	assign idx3 = 8'd225-(bit3[11:8]<<4)+bit3[7:0];
	assign idx4 = 8'd225-(bit4[11:8]<<4)+bit4[7:0];
	assign idx5 = 8'd225-(bit5[11:8]<<4)+bit5[7:0];
	assign idx6 = 8'd225-(bit6[11:8]<<4)+bit6[7:0];
	assign idx7 = 8'd225-(bit7[11:8]<<4)+bit7[7:0];

    data_matrix_get_index get_index_1(
        .clk(clk),
        .rst(reset),
        .in_enable_pulse(dm_decode_enable),
        
        .total_rows(8'd14),
        .total_cols(8'd14),
        
        .out_enable(out_enable),
        .out_finish(decode_done),
        
        .bit7(bit7),
        .bit6(bit6),
        .bit5(bit5),
        .bit4(bit4),
        .bit3(bit3),
        .bit2(bit2),
        .bit1(bit1),
        .bit0(bit0)
    	);
endmodule
