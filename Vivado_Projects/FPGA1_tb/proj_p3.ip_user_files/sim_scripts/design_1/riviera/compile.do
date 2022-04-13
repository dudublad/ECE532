vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_4
vlib riviera/blk_mem_gen_v8_4_2
vlib riviera/blk_mem_gen_v8_3_6
vlib riviera/axi_bram_ctrl_v4_1_0
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/axi_register_slice_v2_1_18
vlib riviera/fifo_generator_v13_2_3
vlib riviera/axi_data_fifo_v2_1_17
vlib riviera/axi_crossbar_v2_1_19

vmap xilinx_vip riviera/xilinx_vip
vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_4 riviera/axi_vip_v1_1_4
vmap blk_mem_gen_v8_4_2 riviera/blk_mem_gen_v8_4_2
vmap blk_mem_gen_v8_3_6 riviera/blk_mem_gen_v8_3_6
vmap axi_bram_ctrl_v4_1_0 riviera/axi_bram_ctrl_v4_1_0
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_18 riviera/axi_register_slice_v2_1_18
vmap fifo_generator_v13_2_3 riviera/fifo_generator_v13_2_3
vmap axi_data_fifo_v2_1_17 riviera/axi_data_fifo_v2_1_17
vmap axi_crossbar_v2_1_19 riviera/axi_crossbar_v2_1_19

vlog -work xilinx_vip  -sv2k12 "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_if.sv" \
"D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/clk_vip_if.sv" \
"D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl/verilog" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl/verilog" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl/verilog" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_vip_1_0/sim/design_1_axi_vip_1_0_pkg.sv" \

vlog -work axi_vip_v1_1_4  -sv2k12 "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl/verilog" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/98af/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl/verilog" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_vip_1_0/sim/design_1_axi_vip_1_0.sv" \

vlog -work blk_mem_gen_v8_4_2  -v2k5 "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl/verilog" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/37c2/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl/verilog" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_blk_mem_gen_0_0/sim/design_1_blk_mem_gen_0_0.v" \

vlog -work blk_mem_gen_v8_3_6  -v2k5 "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl/verilog" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/2751/simulation/blk_mem_gen_v8_3.v" \

vcom -work axi_bram_ctrl_v4_1_0 -93 \
"../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/27fe/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_axi_bram_ctrl_0_0/sim/design_1_axi_bram_ctrl_0_0.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_proc_sys_reset_0_0/sim/design_1_proc_sys_reset_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl/verilog" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/design_1/sim/design_1.v" \
"../../../bd/design_1/ipshared/0c76/hdl/fpga1_top_master_bram_v1_0_M00_AXI.v" \
"../../../bd/design_1/ipshared/0c76/hdl/fpga1_top_master_bram_v1_0.v" \
"../../../bd/design_1/ip/design_1_fpga1_top_master_bram_0_0/sim/design_1_fpga1_top_master_bram_0_0.v" \
"../../../bd/design_1/ipshared/bb15/hdl/fpga1_top_master_v1_0_M00_AXI.v" \
"../../../bd/design_1/ipshared/bb15/hdl/fpga1_top_master_v1_0.v" \
"../../../bd/design_1/ip/design_1_fpga1_top_master_0_0/sim/design_1_fpga1_top_master_0_0.v" \
"../../../bd/design_1/ipshared/d8a9/hdl/fpga1_top_slv_v1_0_S00_AXI.v" \
"../../../bd/design_1/ipshared/d8a9/hdl/fpga1_top_slv_v1_0.v" \
"../../../bd/design_1/ip/design_1_fpga1_top_slv_0_0/sim/design_1_fpga1_top_slv_0_0.v" \
"../../../bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/sim/vio_0.v" \
"../../../bd/design_1/ip/design_1_fpga1_top_0_0/src/blk_mem_gen_0/sim/blk_mem_gen_0.v" \
"../../../bd/design_1/ip/design_1_fpga1_top_0_0/src/blk_mem_gen_1/sim/blk_mem_gen_1.v" \
"../../../bd/design_1/ip/design_1_fpga1_top_0_0/src/blk_mem_gen_2/sim/blk_mem_gen_2.v" \
"../../../bd/design_1/ip/design_1_fpga1_top_0_0/src/blk_mem_gen_3/sim/blk_mem_gen_3.v" \
"../../../bd/design_1/ip/design_1_fpga1_top_0_0/src/blk_mem_gen_4/sim/blk_mem_gen_4.v" \
"../../../bd/design_1/ipshared/92f8/src/clock_div.v" \
"../../../bd/design_1/ipshared/92f8/src/horizontal_counter.v" \
"../../../bd/design_1/ipshared/92f8/src/vertical_counter.v" \
"../../../bd/design_1/ipshared/92f8/src/vga_control.v" \
"../../../bd/design_1/ipshared/92f8/src/counter.v" \
"../../../bd/design_1/ipshared/92f8/src/get_bit.v" \
"../../../bd/design_1/ipshared/92f8/src/fpga1_top.v" \
"../../../bd/design_1/ipshared/92f8/src/data_matrix_decoder.v" \
"../../../bd/design_1/ipshared/92f8/src/fsm_control.v" \
"../../../bd/design_1/ipshared/92f8/src/dm_decoder_top.v" \
"../../../bd/design_1/ip/design_1_fpga1_top_0_0/sim/design_1_fpga1_top_0_0.v" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl/verilog" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_18  -v2k5 "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl/verilog" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/cc23/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_3  -v2k5 "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl/verilog" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/64f4/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_3 -93 \
"../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_3  -v2k5 "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl/verilog" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_17  -v2k5 "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl/verilog" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/c4fd/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_19  -v2k5 "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl/verilog" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/6c9d/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl/verilog" "+incdir+../../../../proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/src/vio_0/hdl" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_xbar_2/sim/design_1_xbar_2.v" \

vlog -work xil_defaultlib \
"glbl.v"

