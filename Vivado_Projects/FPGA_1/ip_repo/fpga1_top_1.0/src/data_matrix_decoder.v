module data_matrix_get_index(
    input              clk,
	input              rst,
	input              in_enable_pulse,

	input       [7:0]  total_rows,
	input       [7:0]  total_cols,

	output reg         out_enable,
	output             out_finish,
    
    output reg [15:0]  bit7,  //[15:8] for x, [7:0] for y
    output reg [15:0]  bit6,  //[15:8] for x, [7:0] for y
    output reg [15:0]  bit5,  //[15:8] for x, [7:0] for y
    output reg [15:0]  bit4,  //[15:8] for x, [7:0] for y
    output reg [15:0]  bit3,  //[15:8] for x, [7:0] for y
    output reg [15:0]  bit2,  //[15:8] for x, [7:0] for y
    output reg [15:0]  bit1,  //[15:8] for x, [7:0] for y
    output reg [15:0]  bit0   //[15:8] for x, [7:0] for y
	);

reg signed [7:0] x;
reg signed [7:0] y;

reg signed [7:0] x_dly;
reg signed [7:0] y_dly;

wire special_1;
wire special_2;
wire special_3;
wire special_4;
wire xy_legal;

reg in_enable;

reg direction;   //0--upwards, 1--downwards
reg direction_dly;
reg [7:0] char_cnt;

wire [15:0] get_bit0;
wire [15:0] get_bit1;
wire [15:0] get_bit2;
wire [15:0] get_bit3;
wire [15:0] get_bit4;
wire [15:0] get_bit5;
wire [15:0] get_bit6;
wire [15:0] get_bit7;

always @ (posedge clk or posedge rst) begin
	if(rst) begin
		direction_dly <= 1'b0;
		x_dly <= 8'h0;
		y_dly <= 8'h0;
	end
	else begin
	    direction_dly <= direction;
		x_dly <= x;
		y_dly <= y;
	end
end

always @ (posedge clk or posedge rst) begin
	if(rst) begin
		in_enable <= 1'b0;
	end
	else begin
		if(in_enable_pulse) 
			in_enable <= 1'b1;
		else if(out_finish) 
			in_enable <= 1'b0;
	end
end


assign xy_legal    =  (x < total_rows) && (y >= 0) && (x >= 0) && (y < total_cols) && !(x <= 0 && y >= total_cols - 8'h2) && !(x <= 1 && y>=total_cols - 8'h1);

always @ (posedge clk or posedge rst) begin
    if(rst) begin
	    x <= 8'h4;
	    y <= 8'h0;
		direction <= 1'b0;
	end
	else if((in_enable_pulse)||out_finish) begin
	    x <= 8'h4;
	    y <= 8'h0;
		direction <= 1'b0;
	end
	else if(in_enable) begin
	    if(!direction) begin
			if((x < 0 || y >= total_rows)&&!(direction^direction_dly))begin
				x <= x + 8'h1;
				y <= y + 8'h3;
				direction <= !direction;
			end
			else begin
				x <= x - 8'h2;
				y <= y + 8'h2;
			end
		end
		else begin
			if((x >= total_rows || y < 0) &&!(direction^direction_dly)) begin
				x <= x + 8'h3;
				y <= y + 8'h1;
				direction <= !direction;
			end
			else begin
				x <= x + 8'h2;
				y <= y - 8'h2;
			end
		end
	end
end

assign special_1 = (x == total_rows && y == 0);
assign special_2 = (x == total_rows-2 && y == 0 && (|total_cols[1:0]));
assign special_3 = (x == total_rows-8'h2 && y == 0 && (&total_cols[1:0]) && (total_cols[2])); 
assign special_4 = (x == total_rows+8'h4 && y == 2 && !(|total_cols[2:0]));

always @ (posedge clk or posedge rst) begin
	if(rst) 
		out_enable <= 1'b0;
	else if (!in_enable) 
		out_enable <= 1'b0;
	else if (special_1|special_2|special_3|special_4|xy_legal) 
		out_enable <= 1'b1;
	else 
		out_enable <= 1'b0;
end

		

always @ (posedge clk or posedge rst) begin
	if(rst) begin
		bit7 <= 8'h0;
		bit6 <= 8'h0;
		bit5 <= 8'h0;
		bit4 <= 8'h0;
		bit3 <= 8'h0;
		bit2 <= 8'h0;
		bit1 <= 8'h0;
		bit0 <= 8'h0;
	end
	else if (in_enable_pulse) begin
		bit7 <= 8'h0;
		bit6 <= 8'h0;
		bit5 <= 8'h0;
		bit4 <= 8'h0;
		bit3 <= 8'h0;
		bit2 <= 8'h0;
		bit1 <= 8'h0;
		bit0 <= 8'h0;
	end
	else if (special_1) begin     //special 1
		bit7 <= {total_rows - 8'h1, 8'h0};
		bit6 <= {total_rows - 8'h1, 8'h1};
		bit5 <= {total_rows - 8'h1, 8'h2};
		bit4 <= {8'h0, total_cols - 8'h2};
		bit3 <= {8'h0, total_cols - 8'h1};
		bit2 <= {8'h1, total_cols - 8'h1};
		bit1 <= {8'h2, total_cols - 8'h1};
		bit0 <= {8'h3, total_cols - 8'h1};

	end
	else if (special_2) begin  //special 2
		bit7 <= {total_rows - 8'h3, 8'h0};
		bit6 <= {total_rows - 8'h2, 8'h0};
		bit5 <= {total_rows - 8'h1, 8'h0};
		bit4 <= {8'h0, total_cols - 8'h4};
		bit3 <= {8'h0, total_cols - 8'h3};
		bit2 <= {8'h0, total_cols - 8'h2};
		bit1 <= {8'h0, total_cols - 8'h1};
		bit0 <= {8'h1, total_cols - 8'h1};

	end
	else if (special_3) begin //special 3
		bit7 <= {total_rows - 8'h3, 8'h0};
		bit6 <= {total_rows - 8'h2, 8'h0};
		bit5 <= {total_rows - 8'h1, 8'h0};
		bit4 <= {8'h0, total_cols - 8'h2};
		bit3 <= {8'h0, total_cols - 8'h1};
		bit2 <= {8'h1, total_cols - 8'h1};
		bit1 <= {8'h2, total_cols - 8'h1};
		bit0 <= {8'h3, total_cols - 8'h1};
	end	
	else if (special_3) begin //special 4
		bit7 <= {total_rows - 8'h1, 8'h0};
		bit6 <= {total_rows - 8'h1, total_cols - 8'h1};
		bit5 <= {8'h0, total_cols - 8'h3};
		bit4 <= {8'h0, total_cols - 8'h2};
		bit3 <= {8'h0, total_cols - 8'h1};
		bit2 <= {8'h1, total_cols - 8'h3};
		bit1 <= {8'h1, total_cols - 8'h2};
		bit0 <= {8'h1, total_cols - 8'h1};
	end
	//else if (x == total_rows+4 && y == 0 && total_cols[1:0] == 2'b0)  //special 4 (?)

	else begin
		bit7 <= get_bit7; 
		bit6 <= get_bit6; 
		bit5 <= get_bit5; 
		bit4 <= get_bit4; 
		bit3 <= get_bit3; 
		bit2 <= get_bit2; 
		bit1 <= get_bit1; 
		bit0 <= get_bit0; 

	end
end

assign out_finish = x>$signed(total_rows) && y>$signed(total_cols);

get_bit u7(
	.x            (x ),
	.y            (y ),
	.minus_x      (2'd2 ),
	.minus_y      (2'd2 ),
	.total_rows   (total_rows ),
	.total_cols   (total_cols ),
    .xy_bound 	  (get_bit7 )
);

get_bit u6(
	.x            (x ),
	.y            (y ),
	.minus_x      (2'd2 ),
	.minus_y      (2'd1 ),
	.total_rows   (total_rows ),
	.total_cols   (total_cols ),
    .xy_bound 	  (get_bit6 )
);

get_bit u5(
	.x            (x ),
	.y            (y ),
	.minus_x      (2'd1 ),
	.minus_y      (2'd2 ),
	.total_rows   (total_rows ),
	.total_cols   (total_cols ),
    .xy_bound 	  (get_bit5 )
);

get_bit u4(
	.x            (x ),
	.y            (y ),
	.minus_x      (2'd1 ),
	.minus_y      (2'd1 ),
	.total_rows   (total_rows ),
	.total_cols   (total_cols ),
    .xy_bound 	  (get_bit4 )
);

get_bit u3(
	.x            (x ),
	.y            (y ),
	.minus_x      (2'd1 ),
	.minus_y      (2'd0 ),
	.total_rows   (total_rows ),
	.total_cols   (total_cols ),
    .xy_bound 	  (get_bit3 )
);

get_bit u2(
	.x            (x ),
	.y            (y ),
	.minus_x      (2'd0 ),
	.minus_y      (2'd2 ),
	.total_rows   (total_rows ),
	.total_cols   (total_cols ),
    .xy_bound 	  (get_bit2 )
);

get_bit u1(
	.x            (x ),
	.y            (y ),
	.minus_x      (2'd0 ),
	.minus_y      (2'd1 ),
	.total_rows   (total_rows ),
	.total_cols   (total_cols ),
    .xy_bound 	  (get_bit1 )
);

get_bit u0(
	.x            (x ),
	.y            (y ),
	.minus_x      (2'd0 ),
	.minus_y      (2'd0 ),
	.total_rows   (total_rows ),
	.total_cols   (total_cols ),
    .xy_bound 	  (get_bit0 )
);


endmodule


