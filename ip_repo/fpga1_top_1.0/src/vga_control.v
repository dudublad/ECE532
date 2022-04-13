`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2022 03:31:43 PM
// Design Name: 
// Module Name: vga_control
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


module vga_control(
    input clk,
    input reset,
    input [7:0] char_1,
    input [7:0] char_2,
    input [7:0] char_3,
    input [7:0] char_4,
    input [7:0] char_5,
    input [7:0] char_6,
    input [7:0] char_7,
    input [7:0] char_8,
    input [7:0] char_9,
    input [7:0] char_10,

    output Hsynq,

    output Vsynq,

    output [3:0] Red,
    output [3:0] Green,
    output [3:0] Blue,
    
    input ld_wait,
    input ld_decode,
    input ld_name,
    input ld_db,
    
    input permission,
    input [1:0] doses,
    input [255:0] in_data_matrix
    
    );

    
    // for the VGA control
    wire divided_clk;
    wire en_V;
    wire [15:0] H_counter;
    wire [15:0] V_counter;
    reg [11:0] color_fr;
    
    // for each of the frame
    wire [15:0] x;
    wire [15:0] y;
    wire [18:0] addr_wait, addr_title, addr_number, addr_access;
    wire [11:0] color_wait, color_title, color_number, color_access;
    wire [11:0] scr_color;
    
    // for numbers
    wire [7:0] number_x, number_y;
    
    // for names
    wire [18:0] addr_name, addr_name1, addr_name2;
    wire [18:0] addr_name3, addr_name4, addr_name5;
    wire [18:0] addr_name6, addr_name7, addr_name8, addr_name9;
    wire [18:0] offset, offset1, offset2, offset3, offset4, offset5, offset6, offset7, offset8, offset9;
    
    wire [7:0] char_x, char_y, char_x1, char_y1, char_x2, char_y2;
    wire [7:0] char_x3, char_y3, char_x4, char_y4, char_x5, char_y5;
    wire [7:0] char_x6, char_y6, char_x7, char_y7, char_x8, char_y8, char_x9, char_y9;
    
    wire [11:0] color_name, color_name1, color_name2, color_name3, color_name4, color_name5;
    wire [11:0] color_name6, color_name7, color_name8, color_name9;
    wire [5:0] char_size, char_size1, char_size2;
    wire [5:0] char_size3, char_size4, char_size5;
    wire [5:0] char_size6, char_size7, char_size8, char_size9;
    
    // for FSM
    //    fsm_control FSM_control(.clk(divided_clk), .reset(swt[0]), .dm_decode_enable(swt[1]),.decode_done(swt[2]),.fetch_done(swt[3]),
    //.o_ld_wait(ld_wait),.o_ld_decode(ld_decode),.o_ld_name(ld_name),.o_ld_db(ld_db));
    
    // for data matrix
    // for storing the datamatrix
	reg [255:0] data_matrix;
    
    // for testing only
    //wire [6:0] swt, out;
    //vio_0 vio(.clk(divided_clk), .probe_in0(out), .probe_out0(swt));
    
    // VGA constants
    /*Some constants*/
    parameter FRAME_WIDTH = 640;
	parameter FRAME_HEIGHT = 480;
	parameter H_FP = 16; //H front porch
	parameter H_PW = 96; //H sync pulse width
	parameter H_BP = 48; //H back porch
	parameter H_MAX = 800; //H total period
	parameter V_FP = 10; //V front porch
	parameter V_PW = 2; //V sync pulse width
	parameter V_MAX = 525; //V total period
	parameter V_BP = 33; //V back porch
	
	parameter X_WAIT = 250;
	parameter Y_WAIT = 230;
	parameter X_TITLE = 90;
	parameter Y_TITLE = 240;
	parameter X_DM = 320;
	parameter Y_DM = 100;
	
	parameter X_OFFSET_FONT = 99;
	parameter Y_OFFSET_FONT = 11;
	parameter X_OFFSET_NUM = 107;
	parameter Y_OFFSET_NUM = 47;
	parameter X_OFFSET_PERMISSION = 200;
	parameter Y_OFFSET_PERMISSION = 82;
	
	parameter X_SIZE_CHAR = 20;
	parameter Y_SIZE_CHAR = 23;
	parameter X_SIZE_NUM = 14;
	parameter Y_SIZE_NUM = 23;
	parameter X_SIZE_PERMISSION = 143;
	parameter Y_SIZE_PERMISSION = 23;
	
	parameter X_SPAN_WAIT = 300;
	parameter X_SPAN_TITLE = 200;
	parameter X_SPAN_NUM = 110;
	parameter X_SPAN_FONT = 260;
	parameter X_SPAN_PERMISSION = 145;
    
    // VGA control modules
    // clock division
    clock_div VGA_clk(.clk(clk), .divided_clk(divided_clk));
    
     // horiziontal and vertical locations
    horizontal_counter VGA_H(.clk(divided_clk), .enable_V_counter(en_V), .H_counter_val(H_counter));
    vertical_counter VGA_V(.clk(divided_clk), .enable_V_counter(en_V), .V_counter_val(V_counter));
    
    
    // get the character and number location information
    character_loc loc_1(.divided_clk(divided_clk), .char(char_1), .char_x(char_x), .char_y(char_y),.char_size(char_size));
    character_loc loc_2(.divided_clk(divided_clk), .char(char_2), .char_x(char_x1), .char_y(char_y1),.char_size(char_size1));
    character_loc loc_3(.divided_clk(divided_clk), .char(char_3), .char_x(char_x2), .char_y(char_y2),.char_size(char_size2));
    character_loc loc_4(.divided_clk(divided_clk), .char(char_4), .char_x(char_x3), .char_y(char_y3),.char_size(char_size3));
    character_loc loc_5(.divided_clk(divided_clk), .char(char_5), .char_x(char_x4), .char_y(char_y4),.char_size(char_size4));
    character_loc loc_6(.divided_clk(divided_clk), .char(char_6), .char_x(char_x5), .char_y(char_y5),.char_size(char_size5));
    character_loc loc_7(.divided_clk(divided_clk), .char(char_7), .char_x(char_x6), .char_y(char_y6),.char_size(char_size6));
    character_loc loc_8(.divided_clk(divided_clk), .char(char_8), .char_x(char_x7), .char_y(char_y7),.char_size(char_size7));
    character_loc loc_9(.divided_clk(divided_clk), .char(char_9), .char_x(char_x8), .char_y(char_y8),.char_size(char_size8));
    character_loc loc_10(.divided_clk(divided_clk), .char(char_10), .char_x(char_x9), .char_y(char_y9),.char_size(char_size9));
//    character_loc loc_1(.divided_clk(divided_clk), .char('h58), .char_x(char_x), .char_y(char_y),.char_size(char_size));
//    character_loc loc_2(.divided_clk(divided_clk), .char('h49), .char_x(char_x1), .char_y(char_y1),.char_size(char_size1));
//    character_loc loc_3(.divided_clk(divided_clk), .char('h4c), .char_x(char_x2), .char_y(char_y2),.char_size(char_size2));
//    character_loc loc_4(.divided_clk(divided_clk), .char('h49), .char_x(char_x3), .char_y(char_y3),.char_size(char_size3));
//    character_loc loc_5(.divided_clk(divided_clk), .char('h6E), .char_x(char_x4), .char_y(char_y4),.char_size(char_size4));
//    character_loc loc_6(.divided_clk(divided_clk), .char('h58), .char_x(char_x5), .char_y(char_y5),.char_size(char_size5));
//    character_loc loc_7(.divided_clk(divided_clk), .char('h66), .char_x(char_x6), .char_y(char_y6),.char_size(char_size6));
//    character_loc loc_8(.divided_clk(divided_clk), .char('h70), .char_x(char_x7), .char_y(char_y7),.char_size(char_size7));
//    character_loc loc_9(.divided_clk(divided_clk), .char('h47), .char_x(char_x8), .char_y(char_y8),.char_size(char_size8));
//    character_loc loc_10(.divided_clk(divided_clk), .char('h41), .char_x(char_x9), .char_y(char_y9),.char_size(char_size9));
    
    number_offset off_1(.divided_clk(divided_clk),.dose(doses),.number_x(number_x),.number_y(number_y));
    
    assign x = H_counter;
	assign y = V_counter;
	
	// Addresses
	// wait frame address
	assign addr_wait = (x >= X_WAIT && y >= Y_WAIT)?((x - X_WAIT) + (y - Y_WAIT) * X_SPAN_WAIT):0;
	
	// title frame address
	assign addr_title = (x >= X_TITLE && y >= Y_TITLE)?((x - X_TITLE) + (y - Y_TITLE) * X_SPAN_TITLE):0;
	
	// number address
	assign addr_number = (x >= X_TITLE + X_OFFSET_NUM && x < X_TITLE + X_OFFSET_NUM + X_SIZE_NUM && y >= Y_TITLE + Y_OFFSET_NUM && y < Y_TITLE + Y_OFFSET_NUM + Y_SIZE_NUM)?
	((x - X_TITLE - X_OFFSET_NUM + number_x)+(y - Y_TITLE - Y_OFFSET_NUM + number_y) * X_SPAN_NUM):(0);
	
	// permission address
	assign addr_access = (x >= X_TITLE + X_OFFSET_PERMISSION && x < X_TITLE + X_OFFSET_PERMISSION + X_SIZE_PERMISSION && y >= Y_TITLE + Y_OFFSET_PERMISSION && y < Y_TITLE + Y_OFFSET_PERMISSION + Y_SIZE_PERMISSION)?
	((permission)?((x - X_TITLE - X_OFFSET_PERMISSION + 3)+(y - Y_TITLE - Y_OFFSET_PERMISSION + 4)*X_SPAN_PERMISSION):((x - X_TITLE - X_OFFSET_PERMISSION + 3)+(y - Y_TITLE - Y_OFFSET_PERMISSION + 31)*X_SPAN_PERMISSION)):(0);
	
	// character offsets
	assign offset = 2 + char_size;
	assign offset1 = 4 + char_size + char_size1;
	assign offset2 = 6 + char_size + char_size1 + char_size2;
	assign offset3 = 8 + char_size + char_size1 + char_size2 + char_size3;
	assign offset4 = 10 + char_size + char_size1 + char_size2 + char_size3 + char_size4;
	assign offset5 = 12 + char_size + char_size1 + char_size2 + char_size3 + char_size4 + char_size5;
	assign offset6 = 14 + char_size + char_size1 + char_size2 + char_size3 + char_size4 + char_size5 + char_size6;
	assign offset7 = 16 + char_size + char_size1 + char_size2 + char_size3 + char_size4 + char_size5 + char_size6 + char_size7;
	assign offset8 = 18 + char_size + char_size1 + char_size2 + char_size3 + char_size4 + char_size5 + char_size6 + char_size7 + char_size8;
	assign offset9 = 20 + char_size + char_size1 + char_size2 + char_size3 + char_size4 + char_size5 + char_size6 + char_size7 + char_size8 + char_size9;
	
	// name characters
	assign addr_name = (x >= X_TITLE + X_OFFSET_FONT + 0 && x < X_TITLE + X_OFFSET_FONT + offset && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1
     && x - (X_TITLE + X_OFFSET_FONT + X_SIZE_CHAR * 0) < char_size + 1)?((x + char_x - (X_TITLE + X_OFFSET_FONT + X_SIZE_CHAR * 0)) + (y + char_y - (Y_TITLE + Y_OFFSET_FONT)) * X_SPAN_FONT):(0);
    assign addr_name1 = (x >= X_TITLE + X_OFFSET_FONT + offset && x < X_TITLE + X_OFFSET_FONT + offset1 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1
     && x - (X_TITLE + X_OFFSET_FONT + offset) < char_size1 + 1)?((x + char_x1 - (X_TITLE + X_OFFSET_FONT + offset)) + (y + char_y1 - (Y_TITLE + Y_OFFSET_FONT)) * X_SPAN_FONT):(0);
    assign addr_name2 = (x >= X_TITLE + X_OFFSET_FONT + offset1 && x < X_TITLE + X_OFFSET_FONT + offset2 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1
     && x - (X_TITLE + X_OFFSET_FONT + offset1) < char_size2 + 1)?((x + char_x2 - (X_TITLE + X_OFFSET_FONT + offset1)) + (y + char_y2 - (Y_TITLE + Y_OFFSET_FONT)) * X_SPAN_FONT):(0);
     
    assign addr_name3 = (x >= X_TITLE + X_OFFSET_FONT + offset2 && x < X_TITLE + X_OFFSET_FONT + offset3 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1
     && x - (X_TITLE + X_OFFSET_FONT + offset2) < char_size3 + 1)?((x + char_x3 - (X_TITLE + X_OFFSET_FONT + offset2)) + (y + char_y3 - (Y_TITLE + Y_OFFSET_FONT)) * X_SPAN_FONT):(0);
    assign addr_name4 = (x >= X_TITLE + X_OFFSET_FONT + offset3 && x < X_TITLE + X_OFFSET_FONT + offset4 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1
     && x - (X_TITLE + X_OFFSET_FONT + offset3) < char_size4 + 1)?((x + char_x4 - (X_TITLE + X_OFFSET_FONT + offset3)) + (y + char_y4 - (Y_TITLE + Y_OFFSET_FONT)) * X_SPAN_FONT):(0);
    assign addr_name5 = (x >= X_TITLE + X_OFFSET_FONT + offset4 && x < X_TITLE + X_OFFSET_FONT + offset5 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1
     && x - (X_TITLE + X_OFFSET_FONT + offset4) < char_size5 + 1)?((x + char_x5 - (X_TITLE + X_OFFSET_FONT + offset4)) + (y + char_y5 - (Y_TITLE + Y_OFFSET_FONT)) * X_SPAN_FONT):(0);
    
    assign addr_name6 = (x >= X_TITLE + X_OFFSET_FONT + offset5 && x < X_TITLE + X_OFFSET_FONT + offset6 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1
     && x - (X_TITLE + X_OFFSET_FONT + offset5) < char_size6 + 1)?((x + char_x6 - (X_TITLE + X_OFFSET_FONT + offset5)) + (y + char_y6 - (Y_TITLE + Y_OFFSET_FONT)) * X_SPAN_FONT):(0);
    assign addr_name7 = (x >= X_TITLE + X_OFFSET_FONT + offset6 && x < X_TITLE + X_OFFSET_FONT + offset7 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1
     && x - (X_TITLE + X_OFFSET_FONT + offset6) < char_size7 + 1)?((x + char_x7 - (X_TITLE + X_OFFSET_FONT + offset6)) + (y + char_y7 - (Y_TITLE + Y_OFFSET_FONT)) * X_SPAN_FONT):(0);
    assign addr_name8 = (x >= X_TITLE + X_OFFSET_FONT + offset7 && x < X_TITLE + X_OFFSET_FONT + offset8 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1
     && x - (X_TITLE + X_OFFSET_FONT + offset7) < char_size8 + 1)?((x + char_x8 - (X_TITLE + X_OFFSET_FONT + offset7)) + (y + char_y8 - (Y_TITLE + Y_OFFSET_FONT)) * X_SPAN_FONT):(0);
     
    assign addr_name9 = (x >= X_TITLE + X_OFFSET_FONT + offset8 && x < X_TITLE + X_OFFSET_FONT + offset9 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1
     && x - (X_TITLE + X_OFFSET_FONT + offset8) < char_size9 + 1)?((x + char_x9 - (X_TITLE + X_OFFSET_FONT + offset8)) + (y + char_y9 - (Y_TITLE + Y_OFFSET_FONT)) * X_SPAN_FONT):(0);
     

	// fetch the colour from ROM
    blk_mem_gen_0 FR_1(.clka(divided_clk), .addra(addr_wait), .douta(color_wait)); // colour for WAIT
    blk_mem_gen_1 FR_2(.clka(divided_clk), .addra(addr_title), .douta(color_title)); // colour for TITLE
    blk_mem_gen_2 num(.clka(divided_clk), .addra(addr_number), .douta(color_number));
    blk_mem_gen_3 access(.clka(divided_clk), .addra(addr_access), .douta(color_access));
    
    blk_mem_gen_4 name_by_char(.clka(divided_clk), .addra(addr_name), .douta(color_name));
    blk_mem_gen_4 name_by_char1(.clka(divided_clk), .addra(addr_name1), .douta(color_name1));
    blk_mem_gen_4 name_by_char2(.clka(divided_clk), .addra(addr_name2), .douta(color_name2));
    
    blk_mem_gen_4 name_by_char3(.clka(divided_clk), .addra(addr_name3), .douta(color_name3));
    blk_mem_gen_4 name_by_char4(.clka(divided_clk), .addra(addr_name4), .douta(color_name4));
    blk_mem_gen_4 name_by_char5(.clka(divided_clk), .addra(addr_name5), .douta(color_name5));
    
    blk_mem_gen_4 name_by_char6(.clka(divided_clk), .addra(addr_name6), .douta(color_name6));
    blk_mem_gen_4 name_by_char7(.clka(divided_clk), .addra(addr_name7), .douta(color_name7));
    blk_mem_gen_4 name_by_char8(.clka(divided_clk), .addra(addr_name8), .douta(color_name8));
    
    blk_mem_gen_4 name_by_char9(.clka(divided_clk), .addra(addr_name9), .douta(color_name9));
    
    // decide on which colour to paint on VGA
    always@(posedge clk)
    begin
        // the FETCH state in the FSM
        // in case the database information has arrived from FPGA 2
        if (ld_db)
        begin
            // range of the number of doses
            if (x >= X_TITLE + X_OFFSET_NUM && x < X_TITLE + X_OFFSET_NUM + X_SIZE_NUM && 
            y >= Y_TITLE + Y_OFFSET_NUM && y < Y_TITLE + Y_OFFSET_NUM + Y_SIZE_NUM)
                color_fr <= color_number;
            // range of the access indicator
            else if (x >= X_TITLE + X_OFFSET_PERMISSION && x < X_TITLE + X_OFFSET_PERMISSION + X_SIZE_PERMISSION && 
            y >= Y_TITLE + Y_OFFSET_PERMISSION && y < Y_TITLE + Y_OFFSET_PERMISSION + Y_SIZE_PERMISSION)
            begin
                if (permission && color_access != 12'hfff)
                    color_fr <= 12'h0f0; //BGR here 
                else if (!permission && color_access != 12'hfff)
                    color_fr <= 12'h00f;
                else
                    color_fr <= color_access;
            end
            // range of the data matrix
            else if (x >= X_DM && x < X_DM + 16 * 4 && y >= Y_DM && y < Y_DM + 16 * 4)
            begin
                if (data_matrix[((x-X_DM)>>2) + (15 - ((y-Y_DM)>>2)) * 16] == 1'b1)
                    color_fr <= 'h0;
                else
                    color_fr <= 'hfff; // white when cell = 0
            end
            // range of the name
            else if (x >= X_TITLE + X_OFFSET_FONT + X_SIZE_CHAR * 0 && x < X_TITLE + X_OFFSET_FONT + offset && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1)
            begin
                // print out the nth character for the name
                color_fr <= color_name;
            end
            else if (x >= X_TITLE + X_OFFSET_FONT + offset && x < X_TITLE + X_OFFSET_FONT + offset1 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1)
            begin
                // print out the nth character for the name
                color_fr <= color_name1;
            end
            else if (x >= X_TITLE + X_OFFSET_FONT + offset1 && x < X_TITLE + X_OFFSET_FONT + offset2 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1)
            begin
                // print out the nth character for the name
                color_fr <= color_name2;
            end
            else if (x >= X_TITLE + X_OFFSET_FONT + offset2 && x < X_TITLE + X_OFFSET_FONT + offset3 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1)
            begin
                // print out the nth character for the name
                color_fr <= color_name3;
            end
            else if (x >= X_TITLE + X_OFFSET_FONT + offset3 && x < X_TITLE + X_OFFSET_FONT + offset4 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1)
            begin
                // print out the nth character for the name
                color_fr <= color_name4;
            end
            else if (x >= X_TITLE + X_OFFSET_FONT + offset4 && x < X_TITLE + X_OFFSET_FONT + offset5 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1)
            begin
                // print out the nth character for the name
                color_fr <= color_name5;
            end
            else if (x >= X_TITLE + X_OFFSET_FONT + offset5 && x < X_TITLE + X_OFFSET_FONT + offset6 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1)
            begin
                // print out the nth character for the name
                color_fr <= color_name6;
            end
            else if (x >= X_TITLE + X_OFFSET_FONT + offset6 && x < X_TITLE + X_OFFSET_FONT + offset7 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1)
            begin
                // print out the nth character for the name
                color_fr <= color_name7;
            end
            else if (x >= X_TITLE + X_OFFSET_FONT + offset7 && x < X_TITLE + X_OFFSET_FONT + offset8 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1)
            begin
                // print out the nth character for the name
                color_fr <= color_name8;
            end
            else if (x >= X_TITLE + X_OFFSET_FONT + offset8 && x < X_TITLE + X_OFFSET_FONT + offset9 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1)
            begin
                // print out the nth character for the name
                color_fr <= color_name9;
            end
            else if (x >= X_TITLE && y >= Y_TITLE && x < X_TITLE + 200 && y < Y_TITLE + 120)
                color_fr <= color_title;
            else
                color_fr <= 'hfff;
        end
        // the SEND state in the FSM
        else if (ld_name)
        begin
            if (x >= X_TITLE + X_OFFSET_FONT + X_SIZE_CHAR * 0 && x < X_TITLE + X_OFFSET_FONT + offset && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1)
            begin
                // print out the nth character for the name
                color_fr <= color_name;
            end
            else if (x >= X_TITLE + X_OFFSET_FONT + offset && x < X_TITLE + X_OFFSET_FONT + offset1 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1)
            begin
                // print out the nth character for the name
                color_fr <= color_name1;
            end
            else if (x >= X_TITLE + X_OFFSET_FONT + offset1 && x < X_TITLE + X_OFFSET_FONT + offset2 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1)
            begin
                // print out the nth character for the name
                color_fr <= color_name2;
            end
            else if (x >= X_TITLE + X_OFFSET_FONT + offset2 && x < X_TITLE + X_OFFSET_FONT + offset3 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1)
            begin
                // print out the nth character for the name
                color_fr <= color_name3;
            end
            else if (x >= X_TITLE + X_OFFSET_FONT + offset3 && x < X_TITLE + X_OFFSET_FONT + offset4 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1)
            begin
                // print out the nth character for the name
                color_fr <= color_name4;
            end
            else if (x >= X_TITLE + X_OFFSET_FONT + offset4 && x < X_TITLE + X_OFFSET_FONT + offset5 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1)
            begin
                // print out the nth character for the name
                color_fr <= color_name5;
            end
            else if (x >= X_TITLE + X_OFFSET_FONT + offset5 && x < X_TITLE + X_OFFSET_FONT + offset6 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1)
            begin
                // print out the nth character for the name
                color_fr <= color_name6;
            end
            else if (x >= X_TITLE + X_OFFSET_FONT + offset6 && x < X_TITLE + X_OFFSET_FONT + offset7 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1)
            begin
                // print out the nth character for the name
                color_fr <= color_name7;
            end
            else if (x >= X_TITLE + X_OFFSET_FONT + offset7 && x < X_TITLE + X_OFFSET_FONT + offset8 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1)
            begin
                // print out the nth character for the name
                color_fr <= color_name8;
            end
            else if (x >= X_TITLE + X_OFFSET_FONT + offset8 && x < X_TITLE + X_OFFSET_FONT + offset9 && y >= Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 0 && y < Y_TITLE + Y_OFFSET_FONT + Y_SIZE_CHAR * 1)
            begin
                // print out the nth character for the name
                color_fr <= color_name9;
            end
            // range of the data matrix
            else if (x >= X_DM && x < X_DM + 16 * 4 && y >= Y_DM && y < Y_DM + 16 * 4)
            begin
                if (data_matrix[((x-X_DM)>>2) + (15 - ((y-Y_DM)>>2)) * 16] == 1'b1) // black when cell = 1
                    color_fr <= 'h0;
                else
                    color_fr <= 'hfff; // white when cell = 0
            end
            else if (x >= X_TITLE && y >= Y_TITLE && x < X_TITLE + 200 && y < Y_TITLE + 40) //disply up to name
                color_fr <= color_title;
            else
                color_fr <= 'hfff;
        end
        // the DECODE state in the FSM
        // but the decoded information is sent
        else if (ld_decode)
        begin
            data_matrix <= in_data_matrix;
            color_fr <= 'hfff;
        end
        // the WAIT state in the FSM
        // in case the system is waiting for an image input
        else if (ld_wait)
        begin
            data_matrix <= 'b0;
            if (x >= X_WAIT && y >= Y_WAIT && x < X_WAIT + 300 && y < Y_WAIT + 120)
            begin
                if (color_wait == 'h0)
                    color_fr <= 'hac3;
                else
                    color_fr <= color_wait;
            end
            else
                color_fr <= 'hfff;
        end
        // just background
        else
            color_fr <= 'hfff;
    end
    
    // outputs
    assign scr_color = color_fr;

    assign Hsynq = ((H_counter >= (H_FP + FRAME_WIDTH - 1)) && (H_counter < (H_FP + FRAME_WIDTH + H_PW - 1)))?1'b1:1'b0;
    assign Vsynq = ((V_counter >= (V_FP + FRAME_HEIGHT - 1)) && (V_counter < (V_FP + FRAME_HEIGHT + V_PW - 1)))?1'b1:1'b0;
    
    assign Red = ((H_counter < FRAME_WIDTH) && (V_counter < FRAME_HEIGHT))?scr_color[3:0]:4'h0;
    assign Green = ((H_counter < FRAME_WIDTH) && (V_counter < FRAME_HEIGHT))?scr_color[7:4]:4'h0;
    assign Blue = ((H_counter < FRAME_WIDTH) && (V_counter < FRAME_HEIGHT))?scr_color[11:8]:4'h0;
    
    
endmodule

module number_offset(
    input divided_clk,
    input [1:0] dose,
    output reg [7:0] number_x,
    output reg [7:0] number_y
    );
    
    always@(*)
    begin
        // find the corresponding pattern offset in the database
        // according to the number of doses given
        case(dose)
            2'b00: 
            begin
                number_x <= 8'd6;
                number_y <= 8'd6;
            end
            2'b01:
            begin
                number_x <= 8'd23;
                number_y <= 8'd6;
            end
            2'b10:
            begin
                number_x <= 8'd39;
                number_y <= 8'd6;
            end
            2'b11:
            begin
                number_x <= 8'd57;
                number_y <= 8'd6;
            end
            default:
            begin
                number_x <= 8'd75;
                number_y <= 8'd6;
            end
        endcase

    end
endmodule

module character_loc(
    input divided_clk, 
    input [7:0] char,
    output reg [7:0] char_x,
    output reg [7:0] char_y,
    output reg [5:0] char_size
);

    always@(*)
    begin
        // get the x and y offset for the characters
         case(char)
            8'h41: //A
            begin
                char_x <= 8'd2;
                char_y <= 8'd2;
                char_size <= 6'd14;
            end
            8'h42: //B
            begin
                char_x <= 8'd20;
                char_y <= 8'd2;
                char_size <= 6'd14;
            end
            8'h43: //C
            begin
                char_x <= 8'd38;
                char_y <= 8'd2;
                char_size <= 6'd14;
            end
            8'h44: //D
            begin
                char_x <= 8'd56;
                char_y <= 8'd2;
                char_size <= 6'd14;
            end
            8'h45: //E
            begin
                char_x <= 8'd74;
                char_y <= 8'd2;
                char_size <= 6'd14;
            end
            8'h46: //F
            begin
                char_x <= 8'd92;
                char_y <= 8'd2;
                char_size <= 6'd14;
            end
            8'h47: //G
            begin
                char_x <= 8'd110;
                char_y <= 8'd2;
                char_size <= 6'd14;
            end
            8'h48: //H
            begin
                char_x <= 8'd128;
                char_y <= 8'd2;
                char_size <= 6'd14;
            end
            8'h49: //I
            begin
                char_x <= 8'd146;
                char_y <= 8'd2;
                char_size <= 6'd11;
            end
            8'h4A: //J
            begin
                char_x <= 8'd161;
                char_y <= 8'd2;
                char_size <= 6'd14;
            end
            8'h4B: //K
            begin
                char_x <= 8'd179;
                char_y <= 8'd2;
                char_size <= 6'd14;
            end
            8'h4C: //L
            begin
                char_x <= 8'd197;
                char_y <= 8'd2;
                char_size <= 6'd14;
            end
            8'h4D: //M
            begin
                char_x <= 8'd215;
                char_y <= 8'd2;
                char_size <= 6'd17;
            end
            8'h4E: //N
            begin
                char_x <= 8'd239;
                char_y <= 8'd2;
                char_size <= 6'd17;
            end
            8'h4F: //O
            begin
                char_x <= 8'd2;
                char_y <= 8'd29;
                char_size <= 6'd14;
            end
            8'h50: //P
            begin
                char_x <= 8'd20;
                char_y <= 8'd29;
                char_size <= 6'd14;
            end
            8'h51: //Q
            begin
                char_x <= 8'd38;
                char_y <= 8'd29;
                char_size <= 6'd17;
            end
            8'h52: //R
            begin
                char_x <= 8'd59;
                char_y <= 8'd29;
                char_size <= 6'd14;
            end
            8'h53: //S
            begin
                char_x <= 8'd77;
                char_y <= 8'd29;
                char_size <= 6'd14;
            end
            8'h54: //T
            begin
                char_x <= 8'd95;
                char_y <= 8'd29;
                char_size <= 6'd11;
            end
            8'h55: //U
            begin
                char_x <= 8'd110;
                char_y <= 8'd29;
                char_size <= 6'd14;
            end
            8'h56: //V
            begin
                char_x <= 8'd128;
                char_y <= 8'd29;
                char_size <= 6'd14;
            end
            8'h57: //W
            begin
                char_x <= 8'd146;
                char_y <= 8'd29;
                char_size <= 6'd20;
            end
            8'h58: //X
            begin
                char_x <= 8'd170;
                char_y <= 8'd29;
                char_size <= 6'd14;
            end
            8'h59: //Y
            begin
                char_x <= 8'd188;
                char_y <= 8'd29;
                char_size <= 6'd14;
            end
            8'h5A: //Z
            begin
                char_x <= 8'd206;
                char_y <= 8'd29;
                char_size <= 6'd14;
            end
            8'h61: //a
            begin
                char_x <= 8'd2;
                char_y <= 8'd2;
                char_size <= 6'd14;
            end
            8'h62: //b
            begin
                char_x <= 8'd20;
                char_y <= 8'd2;
                char_size <= 6'd14;
            end
            8'h63: //c
            begin
                char_x <= 8'd38;
                char_y <= 8'd2;
                char_size <= 6'd14;
            end
            8'h64: //d
            begin
                char_x <= 8'd56;
                char_y <= 8'd2;
                char_size <= 6'd14;
            end
            8'h65: //e
            begin
                char_x <= 8'd74;
                char_y <= 8'd2;
                char_size <= 6'd14;
            end
            8'h66: //f
            begin
                char_x <= 8'd92;
                char_y <= 8'd2;
                char_size <= 6'd14;
            end
            8'h67: //g
            begin
                char_x <= 8'd110;
                char_y <= 8'd2;
                char_size <= 6'd14;
            end
            8'h68: //h
            begin
                char_x <= 8'd128;
                char_y <= 8'd2;
                char_size <= 6'd14;
            end
            8'h69: //i
            begin
                char_x <= 8'd146;
                char_y <= 8'd2;
                char_size <= 6'd11;
            end
            8'h6A: //j
            begin
                char_x <= 8'd161;
                char_y <= 8'd2;
                char_size <= 6'd14;
            end
            8'h6B: //k
            begin
                char_x <= 8'd179;
                char_y <= 8'd2;
                char_size <= 6'd14;
            end
            8'h6C: //l
            begin
                char_x <= 8'd197;
                char_y <= 8'd2;
                char_size <= 6'd14;
            end
            8'h6D: //m
            begin
                char_x <= 8'd215;
                char_y <= 8'd2;
                char_size <= 6'd17;
            end
            8'h6E: //n
            begin
                char_x <= 8'd239;
                char_y <= 8'd2;
                char_size <= 6'd17;
            end
            8'h6F: //o
            begin
                char_x <= 8'd2;
                char_y <= 8'd29;
                char_size <= 6'd14;
            end
            8'h70: //p
            begin
                char_x <= 8'd20;
                char_y <= 8'd29;
                char_size <= 6'd14;
            end
            8'h71: //q
            begin
                char_x <= 8'd38;
                char_y <= 8'd29;
                char_size <= 6'd17;
            end
            8'h72: //r
            begin
                char_x <= 8'd59;
                char_y <= 8'd29;
                char_size <= 6'd14;
            end
            8'h73: //s
            begin
                char_x <= 8'd77;
                char_y <= 8'd29;
                char_size <= 6'd14;
            end
            8'h74: //t
            begin
                char_x <= 8'd95;
                char_y <= 8'd29;
                char_size <= 6'd11;
            end
            8'h75: //u
            begin
                char_x <= 8'd110;
                char_y <= 8'd29;
                char_size <= 6'd14;
            end
            8'h76: //v
            begin
                char_x <= 8'd128;
                char_y <= 8'd29;
                char_size <= 6'd14;
            end
            8'h77: //w
            begin
                char_x <= 8'd146;
                char_y <= 8'd29;
                char_size <= 6'd20;
            end
            8'h78: //x
            begin
                char_x <= 8'd170;
                char_y <= 8'd29;
                char_size <= 6'd14;
            end
            8'h79: //y
            begin
                char_x <= 8'd188;
                char_y <= 8'd29;
                char_size <= 6'd14;
            end
            8'h7A: //z
            begin
                char_x <= 8'd206;
                char_y <= 8'd29;
                char_size <= 6'd14;
            end
            8'h2D: //-
            begin
                char_x <= 8'd236;
                char_y <= 8'd29;
                char_size <= 6'd17;
            end
            8'h2E: //.
            begin
                char_x <= 8'd227;
                char_y <= 8'd29;
                char_size <= 6'd5;
            end
            default:
            begin
                char_x <= 8'd254;
                char_y <= 8'd29;
                char_size <= 6'd5;
            end
        endcase
    end

endmodule
