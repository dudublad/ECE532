module data_matrix_decoder();

logic        clk;
logic        rst;

logic        in_enable_pulse;
logic		 out_enable;
logic        out_finish;

logic  [13:0]  data_matrix_reg[13:0];
logic  [15:0]  bit7;  //[15:8] for x, [7:0] for y
logic  [15:0]  bit6;  //[15:8] for x, [7:0] for y
logic  [15:0]  bit5;  //[15:8] for x, [7:0] for y
logic  [15:0]  bit4;  //[15:8] for x, [7:0] for y
logic  [15:0]  bit3;  //[15:8] for x, [7:0] for y
logic  [15:0]  bit2;  //[15:8] for x, [7:0] for y
logic  [15:0]  bit1;  //[15:8] for x, [7:0] for y
logic  [15:0]  bit0;  //[15:8] for x, [7:0] for y

logic [7:0] out_char;

initial begin
	clk = 1'b0;
	forever begin
	    # 100 clk = ~clk;
	end
end

initial begin
	rst = 1'b1;
	in_enable_pulse = 1'b0;
    #1000
	rst = 1'b0;
    #1600
	in_enable_pulse = 1'b1;
	#200
	in_enable_pulse = 1'b0;
	#20000
	in_enable_pulse = 1'b1;
	#200
	in_enable_pulse = 1'b0;
end



initial begin
/*	data_matrix_reg [13:0] = 14'b10000101100010;
	data_matrix_reg [27:14] = 14'b00001001110011;
	data_matrix_reg [41:28] = 14'b11011000011011;
	data_matrix_reg [55:42] = 14'b01101011000101;
	data_matrix_reg [69:56] = 14'b10001001101110;
	data_matrix_reg [83:70] = 14'b11001100011001;
	data_matrix_reg [97:84] = 14'b00010000100010;
	data_matrix_reg [111:98] = 14'b00001010101101;
	data_matrix_reg [125:112] = 14'b10111010001010;
	data_matrix_reg [139:126] = 14'b00001101101101;
	data_matrix_reg [153:140] = 14'b01011011111111;
	data_matrix_reg [167:154] = 14'b01011011110010;
	data_matrix_reg [181:168] = 14'b00101000101011;
	data_matrix_reg [195:182] = 14'b00110101011111;*/
	data_matrix_reg [0] = 14'b10000101100010;
	data_matrix_reg [1] = 14'b00001001110011;
	data_matrix_reg [2] = 14'b11011000011011;
	data_matrix_reg [3] = 14'b01101011000101;
	data_matrix_reg [4] = 14'b10001001101110;
	data_matrix_reg [5] = 14'b11001100011001;
	data_matrix_reg [6] = 14'b00010000100010;
	data_matrix_reg [7] = 14'b00001010101101;
	data_matrix_reg [8] = 14'b10111010001010;
	data_matrix_reg [9] = 14'b00001101101101;
	data_matrix_reg [10] = 14'b01011011111111;
	data_matrix_reg [11] = 14'b01011011110010;
	data_matrix_reg [12] = 14'b00101000101011;
	data_matrix_reg [13] = 14'b00110101011111;
end

data_matrix_get_index dut(
    .clk        (clk),
	.rst        (rst),
	.in_enable_pulse  (in_enable_pulse),

	.total_rows (8'd14),
	.total_cols (8'd14),

	.out_enable (out_enable),
	.out_finish (out_finish),
    
    .bit7(bit7),  
    .bit6(bit6),  
    .bit5(bit5),  
    .bit4(bit4),  
    .bit3(bit3),  
    .bit2(bit2),  
    .bit1(bit1),  
    .bit0(bit0)   
	);

//assign out_char[7] = data_matrix_reg[bit7[15:8]*14+bit7[7:0]]; 
//assign out_char[6] = data_matrix_reg[bit6[15:8]*14+bit6[7:0]]; 
//assign out_char[5] = data_matrix_reg[bit5[15:8]*14+bit5[7:0]]; 
//assign out_char[4] = data_matrix_reg[bit4[15:8]*14+bit4[7:0]]; 
//assign out_char[3] = data_matrix_reg[bit3[15:8]*14+bit3[7:0]]; 
//assign out_char[2] = data_matrix_reg[bit2[15:8]*14+bit2[7:0]]; 
//assign out_char[1] = data_matrix_reg[bit1[15:8]*14+bit1[7:0]]; 
//assign out_char[0] = data_matrix_reg[bit0[15:8]*14+bit0[7:0]]; 
assign out_char[7] = data_matrix_reg[bit7[15:8]][bit7[7:0]]; 
assign out_char[6] = data_matrix_reg[bit6[15:8]][bit6[7:0]]; 
assign out_char[5] = data_matrix_reg[bit5[15:8]][bit5[7:0]]; 
assign out_char[4] = data_matrix_reg[bit4[15:8]][bit4[7:0]]; 
assign out_char[3] = data_matrix_reg[bit3[15:8]][bit3[7:0]]; 
assign out_char[2] = data_matrix_reg[bit2[15:8]][bit2[7:0]]; 
assign out_char[1] = data_matrix_reg[bit1[15:8]][bit1[7:0]]; 
assign out_char[0] = data_matrix_reg[bit0[15:8]][bit0[7:0]]; 
initial begin
   $fsdbDumpfile("data_matrix.fsdb");
   $fsdbDumpvars;
end		
initial begin
	#30000;
	$finish();
end

always @(posedge clk) begin
	if(out_enable)
		$display("%c ,%d",out_char-1,out_char);
end

endmodule
