module get_bit(
	input signed [7:0] x,
	input signed [7:0] y,
	input        [1:0] minus_x,
	input        [1:0] minus_y,
	input        [7:0] total_rows,
	input        [7:0] total_cols,
	output      [15:0] xy_bound
	);

	wire  [7:0] total_rows_plus4;
	wire  [7:0] total_cols_plus4;

	wire  [7:0] x_m;
	wire  [7:0] y_m;
	wire  [7:0] x_bound;
	wire  [7:0] y_bound;

	assign  total_rows_plus4 = total_rows + 8'h4;
	assign  total_cols_plus4 = total_rows + 8'h4;

	assign	x_m = $unsigned(x) - minus_x;
	assign	y_m = $unsigned(y) - minus_y;
    //x_m[7] and y_m[7] is used as signed bit
	assign	x_bound        = x_m[7]  ? 
							(y_m[7]  ? 
								(x_m + total_rows + 9'h4 - total_cols_plus4[2:0]) :
								(x_m + total_rows)
							) : 
							(y_m[7]  ? 
								(x_m + 9'h4 - total_cols_plus4[2:0]):
								 x_m
							);
	
	assign	y_bound        = y_m[7] ? 
							(x_m[7] ? 
								(y_m + total_cols + 9'h4 - total_rows_plus4[2:0]) : 
								(y_m + total_cols)
							) : 
							(x_m[7] ? 
								(y_m + 9'h4 - total_rows_plus4[2:0]):
								 y_m
							);

	assign xy_bound = {x_bound[7:0],y_bound[7:0]};

endmodule
