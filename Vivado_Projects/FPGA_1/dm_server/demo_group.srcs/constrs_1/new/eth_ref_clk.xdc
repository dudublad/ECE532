set_property -dict {PACKAGE_PIN D5 IOSTANDARD LVCMOS33} [get_ports eth_ref_clk]

set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets design_1_i/clk_wiz_1/inst/clk_out1]
connect_debug_port u_ila_0/clk [get_nets design_1_i/clk_wiz_1/inst/clk_out1]
