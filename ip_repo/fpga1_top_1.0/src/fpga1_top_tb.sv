`ifdef USE_VIO
    `undef USE_VIO
`endif

module fpga1_top_tb();

logic        clk;
logic        rst;
logic [255:0]  data_matrix_reg;
logic [255:0]  data_matrix_1;

logic        dm_decode_en;
logic [1:0]  doses       ;
logic        permission  ;
logic        fetch_enable;
logic        decode_done ;

initial begin
	clk = 1'b0;
	forever begin
	    # 100 clk = ~clk;
	end
end

initial begin
	rst = 1'b1;
    #1000
	rst = 1'b0;
end


assign data_matrix_1 = 256'h5555944D_6163971D_3EB9DAC5_30BFC435_14A9D1F5_15EB8A55_304581D7_0227FFFF;
                  
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

initial begin
    dm_decode_en    = 1'b0;
    fetch_enable    = 1'b0;

    #3000
    data_matrix_reg = data_matrix_1;
    dm_decode_en    = 1'b1;
    #200
    dm_decode_en    = 1'b0;
    #20000
    fetch_enable    = 1'b1;
    doses           = 2'b01;
    permission      = 1'b0;
    #200
    fetch_enable    = 1'b0;

    #20000
    data_matrix_reg = data_matrix_1;
    dm_decode_en    = 1'b1;
    #200
    dm_decode_en    = 1'b0;
    #20000
    fetch_enable    = 1'b1;
    doses           = 2'b10;
    permission      = 1'b1;
    #200
    fetch_enable    = 1'b0;
end

      
fpga1_top dut(
    .clk            (clk),
	.data_matrix_in (data_matrix_reg),
	.reset          (reset),
	.dm_decode_en   (dm_decode_en),
	.doses          (doses),
	.permission     (permission),
	.fetch_enable   (fetch_enable),
	.decode_done    (decode_done),
        .Hsynq          (),
        .Vsynq          (),
        .Red            (),
        .Green          (),
        .Blue           ()
);



endmodule
