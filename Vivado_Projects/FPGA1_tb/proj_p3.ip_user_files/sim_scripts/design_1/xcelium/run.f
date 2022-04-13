-makelib xcelium_lib/xilinx_vip -sv \
  "D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/design_1/ip/design_1_axi_vip_1_0/sim/design_1_axi_vip_1_0_pkg.sv" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_4 -sv \
  "../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/98af/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/design_1/ip/design_1_axi_vip_1_0/sim/design_1_axi_vip_1_0.sv" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_2 \
  "../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/37c2/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_blk_mem_gen_0_0/sim/design_1_blk_mem_gen_0_0.v" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_3_6 \
  "../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/2751/simulation/blk_mem_gen_v8_3.v" \
-endlib
-makelib xcelium_lib/axi_bram_ctrl_v4_1_0 \
  "../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/27fe/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_axi_bram_ctrl_0_0/sim/design_1_axi_bram_ctrl_0_0.vhd" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_proc_sys_reset_0_0/sim/design_1_proc_sys_reset_0_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
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
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_18 \
  "../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/cc23/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_3 \
  "../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/64f4/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_3 \
  "../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_3 \
  "../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_17 \
  "../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/c4fd/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_crossbar_v2_1_19 \
  "../../../../proj_p3.srcs/sources_1/bd/design_1/ipshared/6c9d/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_xbar_2/sim/design_1_xbar_2.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

