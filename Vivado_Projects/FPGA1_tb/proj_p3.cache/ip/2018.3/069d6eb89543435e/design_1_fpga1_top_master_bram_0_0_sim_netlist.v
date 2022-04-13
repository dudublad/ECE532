// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Fri Mar  4 20:29:20 2022
// Host        : DESKTOP-EU22PUG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_fpga1_top_master_bram_0_0_sim_netlist.v
// Design      : design_1_fpga1_top_master_bram_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_fpga1_top_master_bram_0_0,fpga1_top_master_bram_v1_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "fpga1_top_master_bram_v1_0,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (decode_start,
    data_matrix,
    m00_axi_awaddr,
    m00_axi_awprot,
    m00_axi_awvalid,
    m00_axi_awready,
    m00_axi_wdata,
    m00_axi_wstrb,
    m00_axi_wvalid,
    m00_axi_wready,
    m00_axi_bresp,
    m00_axi_bvalid,
    m00_axi_bready,
    m00_axi_araddr,
    m00_axi_arprot,
    m00_axi_arvalid,
    m00_axi_arready,
    m00_axi_rdata,
    m00_axi_rresp,
    m00_axi_rvalid,
    m00_axi_rready,
    m00_axi_aclk,
    m00_axi_aresetn,
    m00_axi_init_axi_txn,
    m00_axi_error,
    m00_axi_txn_done);
  output decode_start;
  output [255:0]data_matrix;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWADDR" *) output [31:0]m00_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWPROT" *) output [2:0]m00_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWVALID" *) output m00_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWREADY" *) input m00_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WDATA" *) output [31:0]m00_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WSTRB" *) output [3:0]m00_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WVALID" *) output m00_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WREADY" *) input m00_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI BRESP" *) input [1:0]m00_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI BVALID" *) input m00_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI BREADY" *) output m00_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARADDR" *) output [31:0]m00_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARPROT" *) output [2:0]m00_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARVALID" *) output m00_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARREADY" *) input m00_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RDATA" *) input [31:0]m00_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RRESP" *) input [1:0]m00_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RVALID" *) input m00_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXI, WIZ_DATA_WIDTH 32, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN design_1_clk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output m00_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 M00_AXI_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXI_CLK, ASSOCIATED_BUSIF M00_AXI, ASSOCIATED_RESET m00_axi_aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_clk, INSERT_VIP 0" *) input m00_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 M00_AXI_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input m00_axi_aresetn;
  input m00_axi_init_axi_txn;
  output m00_axi_error;
  output m00_axi_txn_done;

  wire \<const0> ;
  wire \<const1> ;
  wire [255:128]\^data_matrix ;
  wire decode_start;
  wire m00_axi_aclk;
  wire [31:2]\^m00_axi_araddr ;
  wire m00_axi_aresetn;
  wire m00_axi_arready;
  wire m00_axi_arvalid;
  wire m00_axi_bready;
  wire m00_axi_bvalid;
  wire m00_axi_init_axi_txn;
  wire [31:0]m00_axi_rdata;
  wire m00_axi_rready;
  wire m00_axi_rvalid;

  assign data_matrix[255:128] = \^data_matrix [255:128];
  assign data_matrix[127] = \<const0> ;
  assign data_matrix[126] = \<const0> ;
  assign data_matrix[125] = \<const0> ;
  assign data_matrix[124] = \<const0> ;
  assign data_matrix[123] = \<const0> ;
  assign data_matrix[122] = \<const0> ;
  assign data_matrix[121] = \<const0> ;
  assign data_matrix[120] = \<const0> ;
  assign data_matrix[119] = \<const0> ;
  assign data_matrix[118] = \<const0> ;
  assign data_matrix[117] = \<const0> ;
  assign data_matrix[116] = \<const0> ;
  assign data_matrix[115] = \<const0> ;
  assign data_matrix[114] = \<const0> ;
  assign data_matrix[113] = \<const0> ;
  assign data_matrix[112] = \<const0> ;
  assign data_matrix[111] = \<const0> ;
  assign data_matrix[110] = \<const0> ;
  assign data_matrix[109] = \<const0> ;
  assign data_matrix[108] = \<const0> ;
  assign data_matrix[107] = \<const0> ;
  assign data_matrix[106] = \<const0> ;
  assign data_matrix[105] = \<const0> ;
  assign data_matrix[104] = \<const0> ;
  assign data_matrix[103] = \<const0> ;
  assign data_matrix[102] = \<const0> ;
  assign data_matrix[101] = \<const0> ;
  assign data_matrix[100] = \<const0> ;
  assign data_matrix[99] = \<const0> ;
  assign data_matrix[98] = \<const0> ;
  assign data_matrix[97] = \<const0> ;
  assign data_matrix[96] = \<const0> ;
  assign data_matrix[95] = \<const0> ;
  assign data_matrix[94] = \<const0> ;
  assign data_matrix[93] = \<const0> ;
  assign data_matrix[92] = \<const0> ;
  assign data_matrix[91] = \<const0> ;
  assign data_matrix[90] = \<const0> ;
  assign data_matrix[89] = \<const0> ;
  assign data_matrix[88] = \<const0> ;
  assign data_matrix[87] = \<const0> ;
  assign data_matrix[86] = \<const0> ;
  assign data_matrix[85] = \<const0> ;
  assign data_matrix[84] = \<const0> ;
  assign data_matrix[83] = \<const0> ;
  assign data_matrix[82] = \<const0> ;
  assign data_matrix[81] = \<const0> ;
  assign data_matrix[80] = \<const0> ;
  assign data_matrix[79] = \<const0> ;
  assign data_matrix[78] = \<const0> ;
  assign data_matrix[77] = \<const0> ;
  assign data_matrix[76] = \<const0> ;
  assign data_matrix[75] = \<const0> ;
  assign data_matrix[74] = \<const0> ;
  assign data_matrix[73] = \<const0> ;
  assign data_matrix[72] = \<const0> ;
  assign data_matrix[71] = \<const0> ;
  assign data_matrix[70] = \<const0> ;
  assign data_matrix[69] = \<const0> ;
  assign data_matrix[68] = \<const0> ;
  assign data_matrix[67] = \<const0> ;
  assign data_matrix[66] = \<const0> ;
  assign data_matrix[65] = \<const0> ;
  assign data_matrix[64] = \<const0> ;
  assign data_matrix[63] = \<const0> ;
  assign data_matrix[62] = \<const0> ;
  assign data_matrix[61] = \<const0> ;
  assign data_matrix[60] = \<const0> ;
  assign data_matrix[59] = \<const0> ;
  assign data_matrix[58] = \<const0> ;
  assign data_matrix[57] = \<const0> ;
  assign data_matrix[56] = \<const0> ;
  assign data_matrix[55] = \<const0> ;
  assign data_matrix[54] = \<const0> ;
  assign data_matrix[53] = \<const0> ;
  assign data_matrix[52] = \<const0> ;
  assign data_matrix[51] = \<const0> ;
  assign data_matrix[50] = \<const0> ;
  assign data_matrix[49] = \<const0> ;
  assign data_matrix[48] = \<const0> ;
  assign data_matrix[47] = \<const0> ;
  assign data_matrix[46] = \<const0> ;
  assign data_matrix[45] = \<const0> ;
  assign data_matrix[44] = \<const0> ;
  assign data_matrix[43] = \<const0> ;
  assign data_matrix[42] = \<const0> ;
  assign data_matrix[41] = \<const0> ;
  assign data_matrix[40] = \<const0> ;
  assign data_matrix[39] = \<const0> ;
  assign data_matrix[38] = \<const0> ;
  assign data_matrix[37] = \<const0> ;
  assign data_matrix[36] = \<const0> ;
  assign data_matrix[35] = \<const0> ;
  assign data_matrix[34] = \<const0> ;
  assign data_matrix[33] = \<const0> ;
  assign data_matrix[32] = \<const0> ;
  assign data_matrix[31] = \<const0> ;
  assign data_matrix[30] = \<const0> ;
  assign data_matrix[29] = \<const0> ;
  assign data_matrix[28] = \<const0> ;
  assign data_matrix[27] = \<const0> ;
  assign data_matrix[26] = \<const0> ;
  assign data_matrix[25] = \<const0> ;
  assign data_matrix[24] = \<const0> ;
  assign data_matrix[23] = \<const0> ;
  assign data_matrix[22] = \<const0> ;
  assign data_matrix[21] = \<const0> ;
  assign data_matrix[20] = \<const0> ;
  assign data_matrix[19] = \<const0> ;
  assign data_matrix[18] = \<const0> ;
  assign data_matrix[17] = \<const0> ;
  assign data_matrix[16] = \<const0> ;
  assign data_matrix[15] = \<const0> ;
  assign data_matrix[14] = \<const0> ;
  assign data_matrix[13] = \<const0> ;
  assign data_matrix[12] = \<const0> ;
  assign data_matrix[11] = \<const0> ;
  assign data_matrix[10] = \<const0> ;
  assign data_matrix[9] = \<const0> ;
  assign data_matrix[8] = \<const0> ;
  assign data_matrix[7] = \<const0> ;
  assign data_matrix[6] = \<const0> ;
  assign data_matrix[5] = \<const0> ;
  assign data_matrix[4] = \<const0> ;
  assign data_matrix[3] = \<const0> ;
  assign data_matrix[2] = \<const0> ;
  assign data_matrix[1] = \<const0> ;
  assign data_matrix[0] = \<const0> ;
  assign m00_axi_araddr[31:2] = \^m00_axi_araddr [31:2];
  assign m00_axi_araddr[1] = \<const0> ;
  assign m00_axi_araddr[0] = \<const0> ;
  assign m00_axi_arprot[2] = \<const0> ;
  assign m00_axi_arprot[1] = \<const0> ;
  assign m00_axi_arprot[0] = \<const1> ;
  assign m00_axi_awaddr[31] = \<const0> ;
  assign m00_axi_awaddr[30] = \<const1> ;
  assign m00_axi_awaddr[29] = \<const0> ;
  assign m00_axi_awaddr[28] = \<const0> ;
  assign m00_axi_awaddr[27] = \<const0> ;
  assign m00_axi_awaddr[26] = \<const0> ;
  assign m00_axi_awaddr[25] = \<const0> ;
  assign m00_axi_awaddr[24] = \<const0> ;
  assign m00_axi_awaddr[23] = \<const0> ;
  assign m00_axi_awaddr[22] = \<const0> ;
  assign m00_axi_awaddr[21] = \<const0> ;
  assign m00_axi_awaddr[20] = \<const0> ;
  assign m00_axi_awaddr[19] = \<const0> ;
  assign m00_axi_awaddr[18] = \<const0> ;
  assign m00_axi_awaddr[17] = \<const0> ;
  assign m00_axi_awaddr[16] = \<const0> ;
  assign m00_axi_awaddr[15] = \<const0> ;
  assign m00_axi_awaddr[14] = \<const0> ;
  assign m00_axi_awaddr[13] = \<const0> ;
  assign m00_axi_awaddr[12] = \<const0> ;
  assign m00_axi_awaddr[11] = \<const0> ;
  assign m00_axi_awaddr[10] = \<const0> ;
  assign m00_axi_awaddr[9] = \<const0> ;
  assign m00_axi_awaddr[8] = \<const0> ;
  assign m00_axi_awaddr[7] = \<const0> ;
  assign m00_axi_awaddr[6] = \<const0> ;
  assign m00_axi_awaddr[5] = \<const0> ;
  assign m00_axi_awaddr[4] = \<const0> ;
  assign m00_axi_awaddr[3] = \<const0> ;
  assign m00_axi_awaddr[2] = \<const0> ;
  assign m00_axi_awaddr[1] = \<const0> ;
  assign m00_axi_awaddr[0] = \<const0> ;
  assign m00_axi_awprot[2] = \<const0> ;
  assign m00_axi_awprot[1] = \<const0> ;
  assign m00_axi_awprot[0] = \<const0> ;
  assign m00_axi_awvalid = \<const0> ;
  assign m00_axi_error = \<const0> ;
  assign m00_axi_txn_done = \<const0> ;
  assign m00_axi_wdata[31] = \<const1> ;
  assign m00_axi_wdata[30] = \<const0> ;
  assign m00_axi_wdata[29] = \<const1> ;
  assign m00_axi_wdata[28] = \<const0> ;
  assign m00_axi_wdata[27] = \<const1> ;
  assign m00_axi_wdata[26] = \<const0> ;
  assign m00_axi_wdata[25] = \<const1> ;
  assign m00_axi_wdata[24] = \<const0> ;
  assign m00_axi_wdata[23] = \<const0> ;
  assign m00_axi_wdata[22] = \<const0> ;
  assign m00_axi_wdata[21] = \<const0> ;
  assign m00_axi_wdata[20] = \<const0> ;
  assign m00_axi_wdata[19] = \<const0> ;
  assign m00_axi_wdata[18] = \<const0> ;
  assign m00_axi_wdata[17] = \<const0> ;
  assign m00_axi_wdata[16] = \<const0> ;
  assign m00_axi_wdata[15] = \<const0> ;
  assign m00_axi_wdata[14] = \<const0> ;
  assign m00_axi_wdata[13] = \<const0> ;
  assign m00_axi_wdata[12] = \<const0> ;
  assign m00_axi_wdata[11] = \<const0> ;
  assign m00_axi_wdata[10] = \<const0> ;
  assign m00_axi_wdata[9] = \<const0> ;
  assign m00_axi_wdata[8] = \<const0> ;
  assign m00_axi_wdata[7] = \<const0> ;
  assign m00_axi_wdata[6] = \<const0> ;
  assign m00_axi_wdata[5] = \<const0> ;
  assign m00_axi_wdata[4] = \<const0> ;
  assign m00_axi_wdata[3] = \<const0> ;
  assign m00_axi_wdata[2] = \<const0> ;
  assign m00_axi_wdata[1] = \<const0> ;
  assign m00_axi_wdata[0] = \<const0> ;
  assign m00_axi_wstrb[3] = \<const1> ;
  assign m00_axi_wstrb[2] = \<const1> ;
  assign m00_axi_wstrb[1] = \<const1> ;
  assign m00_axi_wstrb[0] = \<const1> ;
  assign m00_axi_wvalid = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpga1_top_master_bram_v1_0 inst
       (.axi_arvalid_reg(m00_axi_arvalid),
        .axi_rready_reg(m00_axi_rready),
        .data_matrix(\^data_matrix ),
        .decode_start(decode_start),
        .m00_axi_aclk(m00_axi_aclk),
        .m00_axi_araddr(\^m00_axi_araddr ),
        .m00_axi_aresetn(m00_axi_aresetn),
        .m00_axi_arready(m00_axi_arready),
        .m00_axi_bready(m00_axi_bready),
        .m00_axi_bvalid(m00_axi_bvalid),
        .m00_axi_init_axi_txn(m00_axi_init_axi_txn),
        .m00_axi_rdata(m00_axi_rdata[15:0]),
        .m00_axi_rvalid(m00_axi_rvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpga1_top_master_bram_v1_0
   (axi_rready_reg,
    data_matrix,
    m00_axi_bready,
    m00_axi_araddr,
    axi_arvalid_reg,
    decode_start,
    m00_axi_aresetn,
    m00_axi_rvalid,
    m00_axi_aclk,
    m00_axi_init_axi_txn,
    m00_axi_rdata,
    m00_axi_arready,
    m00_axi_bvalid);
  output axi_rready_reg;
  output [127:0]data_matrix;
  output m00_axi_bready;
  output [29:0]m00_axi_araddr;
  output axi_arvalid_reg;
  output decode_start;
  input m00_axi_aresetn;
  input m00_axi_rvalid;
  input m00_axi_aclk;
  input m00_axi_init_axi_txn;
  input [15:0]m00_axi_rdata;
  input m00_axi_arready;
  input m00_axi_bvalid;

  wire axi_arvalid_reg;
  wire axi_rready_reg;
  wire [127:0]data_matrix;
  wire decode_start;
  wire m00_axi_aclk;
  wire [29:0]m00_axi_araddr;
  wire m00_axi_aresetn;
  wire m00_axi_arready;
  wire m00_axi_bready;
  wire m00_axi_bvalid;
  wire m00_axi_init_axi_txn;
  wire [15:0]m00_axi_rdata;
  wire m00_axi_rvalid;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpga1_top_master_bram_v1_0_M00_AXI fpga1_top_master_bram_v1_0_M00_AXI_inst
       (.axi_arvalid_reg_0(axi_arvalid_reg),
        .axi_rready_reg_0(axi_rready_reg),
        .data_matrix(data_matrix),
        .decode_start(decode_start),
        .m00_axi_aclk(m00_axi_aclk),
        .m00_axi_araddr(m00_axi_araddr),
        .m00_axi_aresetn(m00_axi_aresetn),
        .m00_axi_arready(m00_axi_arready),
        .m00_axi_bready(m00_axi_bready),
        .m00_axi_bvalid(m00_axi_bvalid),
        .m00_axi_init_axi_txn(m00_axi_init_axi_txn),
        .m00_axi_rdata(m00_axi_rdata),
        .m00_axi_rvalid(m00_axi_rvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpga1_top_master_bram_v1_0_M00_AXI
   (axi_rready_reg_0,
    data_matrix,
    m00_axi_bready,
    m00_axi_araddr,
    axi_arvalid_reg_0,
    decode_start,
    m00_axi_aresetn,
    m00_axi_rvalid,
    m00_axi_aclk,
    m00_axi_init_axi_txn,
    m00_axi_rdata,
    m00_axi_arready,
    m00_axi_bvalid);
  output axi_rready_reg_0;
  output [127:0]data_matrix;
  output m00_axi_bready;
  output [29:0]m00_axi_araddr;
  output axi_arvalid_reg_0;
  output decode_start;
  input m00_axi_aresetn;
  input m00_axi_rvalid;
  input m00_axi_aclk;
  input m00_axi_init_axi_txn;
  input [15:0]m00_axi_rdata;
  input m00_axi_arready;
  input m00_axi_bvalid;

  wire FSM_sequential_mst_exec_state_i_1_n_0;
  wire FSM_sequential_mst_exec_state_i_2_n_0;
  wire M_AXI_ARADDR_carry_i_1_n_0;
  wire M_AXI_ARADDR_carry_n_2;
  wire M_AXI_ARADDR_carry_n_3;
  wire \axi_araddr[5]_i_2_n_0 ;
  wire [31:29]axi_araddr_reg;
  wire \axi_araddr_reg[13]_i_1_n_0 ;
  wire \axi_araddr_reg[13]_i_1_n_1 ;
  wire \axi_araddr_reg[13]_i_1_n_2 ;
  wire \axi_araddr_reg[13]_i_1_n_3 ;
  wire \axi_araddr_reg[13]_i_1_n_4 ;
  wire \axi_araddr_reg[13]_i_1_n_5 ;
  wire \axi_araddr_reg[13]_i_1_n_6 ;
  wire \axi_araddr_reg[13]_i_1_n_7 ;
  wire \axi_araddr_reg[17]_i_1_n_0 ;
  wire \axi_araddr_reg[17]_i_1_n_1 ;
  wire \axi_araddr_reg[17]_i_1_n_2 ;
  wire \axi_araddr_reg[17]_i_1_n_3 ;
  wire \axi_araddr_reg[17]_i_1_n_4 ;
  wire \axi_araddr_reg[17]_i_1_n_5 ;
  wire \axi_araddr_reg[17]_i_1_n_6 ;
  wire \axi_araddr_reg[17]_i_1_n_7 ;
  wire \axi_araddr_reg[21]_i_1_n_0 ;
  wire \axi_araddr_reg[21]_i_1_n_1 ;
  wire \axi_araddr_reg[21]_i_1_n_2 ;
  wire \axi_araddr_reg[21]_i_1_n_3 ;
  wire \axi_araddr_reg[21]_i_1_n_4 ;
  wire \axi_araddr_reg[21]_i_1_n_5 ;
  wire \axi_araddr_reg[21]_i_1_n_6 ;
  wire \axi_araddr_reg[21]_i_1_n_7 ;
  wire \axi_araddr_reg[25]_i_1_n_0 ;
  wire \axi_araddr_reg[25]_i_1_n_1 ;
  wire \axi_araddr_reg[25]_i_1_n_2 ;
  wire \axi_araddr_reg[25]_i_1_n_3 ;
  wire \axi_araddr_reg[25]_i_1_n_4 ;
  wire \axi_araddr_reg[25]_i_1_n_5 ;
  wire \axi_araddr_reg[25]_i_1_n_6 ;
  wire \axi_araddr_reg[25]_i_1_n_7 ;
  wire \axi_araddr_reg[28]_i_2_n_0 ;
  wire \axi_araddr_reg[28]_i_2_n_1 ;
  wire \axi_araddr_reg[28]_i_2_n_2 ;
  wire \axi_araddr_reg[28]_i_2_n_3 ;
  wire \axi_araddr_reg[28]_i_2_n_4 ;
  wire \axi_araddr_reg[28]_i_2_n_5 ;
  wire \axi_araddr_reg[28]_i_2_n_6 ;
  wire \axi_araddr_reg[28]_i_2_n_7 ;
  wire \axi_araddr_reg[30]_i_1_n_3 ;
  wire \axi_araddr_reg[30]_i_1_n_6 ;
  wire \axi_araddr_reg[30]_i_1_n_7 ;
  wire \axi_araddr_reg[5]_i_1_n_0 ;
  wire \axi_araddr_reg[5]_i_1_n_1 ;
  wire \axi_araddr_reg[5]_i_1_n_2 ;
  wire \axi_araddr_reg[5]_i_1_n_3 ;
  wire \axi_araddr_reg[5]_i_1_n_4 ;
  wire \axi_araddr_reg[5]_i_1_n_5 ;
  wire \axi_araddr_reg[5]_i_1_n_6 ;
  wire \axi_araddr_reg[5]_i_1_n_7 ;
  wire \axi_araddr_reg[9]_i_1_n_0 ;
  wire \axi_araddr_reg[9]_i_1_n_1 ;
  wire \axi_araddr_reg[9]_i_1_n_2 ;
  wire \axi_araddr_reg[9]_i_1_n_3 ;
  wire \axi_araddr_reg[9]_i_1_n_4 ;
  wire \axi_araddr_reg[9]_i_1_n_5 ;
  wire \axi_araddr_reg[9]_i_1_n_6 ;
  wire \axi_araddr_reg[9]_i_1_n_7 ;
  wire axi_arvalid0;
  wire axi_arvalid_i_1_n_0;
  wire axi_arvalid_reg_0;
  wire axi_bready0;
  wire axi_rready_i_1_n_0;
  wire axi_rready_reg_0;
  wire [127:0]data_matrix;
  wire \data_matrix[143]_i_1_n_0 ;
  wire \data_matrix[159]_i_1_n_0 ;
  wire \data_matrix[175]_i_1_n_0 ;
  wire \data_matrix[191]_i_1_n_0 ;
  wire \data_matrix[207]_i_1_n_0 ;
  wire \data_matrix[223]_i_1_n_0 ;
  wire \data_matrix[239]_i_1_n_0 ;
  wire \data_matrix[255]_i_1_n_0 ;
  wire \data_matrix[255]_i_2_n_0 ;
  wire decode_start;
  wire init_txn_ff;
  wire init_txn_ff2;
  wire last_read;
  wire last_read_dly;
  wire last_read_i_1_n_0;
  wire m00_axi_aclk;
  wire [29:0]m00_axi_araddr;
  wire m00_axi_aresetn;
  wire m00_axi_arready;
  wire m00_axi_bready;
  wire m00_axi_bvalid;
  wire m00_axi_init_axi_txn;
  wire [15:0]m00_axi_rdata;
  wire m00_axi_rvalid;
  wire mst_exec_state;
  wire [2:0]read_index;
  wire \read_index[0]_i_1_n_0 ;
  wire \read_index[1]_i_1_n_0 ;
  wire \read_index[2]_i_1_n_0 ;
  wire read_issued_i_1_n_0;
  wire read_issued_reg_n_0;
  wire reads_done;
  wire reads_done_i_1_n_0;
  wire start_single_read0;
  wire start_single_read_i_1_n_0;
  wire start_single_read_reg_n_0;
  wire [3:2]NLW_M_AXI_ARADDR_carry_CO_UNCONNECTED;
  wire [3:3]NLW_M_AXI_ARADDR_carry_O_UNCONNECTED;
  wire [3:1]\NLW_axi_araddr_reg[30]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_axi_araddr_reg[30]_i_1_O_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    FSM_sequential_mst_exec_state_i_1
       (.I0(m00_axi_aresetn),
        .O(FSM_sequential_mst_exec_state_i_1_n_0));
  LUT4 #(
    .INIT(16'h4474)) 
    FSM_sequential_mst_exec_state_i_2
       (.I0(reads_done),
        .I1(mst_exec_state),
        .I2(init_txn_ff),
        .I3(init_txn_ff2),
        .O(FSM_sequential_mst_exec_state_i_2_n_0));
  (* FSM_ENCODED_STATES = "INIT_READ:1,IDLE:0" *) 
  FDRE FSM_sequential_mst_exec_state_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(FSM_sequential_mst_exec_state_i_2_n_0),
        .Q(mst_exec_state),
        .R(FSM_sequential_mst_exec_state_i_1_n_0));
  CARRY4 M_AXI_ARADDR_carry
       (.CI(1'b0),
        .CO({NLW_M_AXI_ARADDR_carry_CO_UNCONNECTED[3:2],M_AXI_ARADDR_carry_n_2,M_AXI_ARADDR_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,axi_araddr_reg[30],1'b0}),
        .O({NLW_M_AXI_ARADDR_carry_O_UNCONNECTED[3],m00_axi_araddr[29:27]}),
        .S({1'b0,axi_araddr_reg[31],M_AXI_ARADDR_carry_i_1_n_0,axi_araddr_reg[29]}));
  LUT1 #(
    .INIT(2'h1)) 
    M_AXI_ARADDR_carry_i_1
       (.I0(axi_araddr_reg[30]),
        .O(M_AXI_ARADDR_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    \axi_araddr[28]_i_1 
       (.I0(m00_axi_arready),
        .I1(axi_arvalid_reg_0),
        .O(axi_arvalid0));
  LUT1 #(
    .INIT(2'h1)) 
    \axi_araddr[5]_i_2 
       (.I0(m00_axi_araddr[0]),
        .O(\axi_araddr[5]_i_2_n_0 ));
  FDRE \axi_araddr_reg[10] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[13]_i_1_n_7 ),
        .Q(m00_axi_araddr[8]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \axi_araddr_reg[11] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[13]_i_1_n_6 ),
        .Q(m00_axi_araddr[9]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \axi_araddr_reg[12] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[13]_i_1_n_5 ),
        .Q(m00_axi_araddr[10]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \axi_araddr_reg[13] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[13]_i_1_n_4 ),
        .Q(m00_axi_araddr[11]),
        .R(\data_matrix[255]_i_1_n_0 ));
  CARRY4 \axi_araddr_reg[13]_i_1 
       (.CI(\axi_araddr_reg[9]_i_1_n_0 ),
        .CO({\axi_araddr_reg[13]_i_1_n_0 ,\axi_araddr_reg[13]_i_1_n_1 ,\axi_araddr_reg[13]_i_1_n_2 ,\axi_araddr_reg[13]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_araddr_reg[13]_i_1_n_4 ,\axi_araddr_reg[13]_i_1_n_5 ,\axi_araddr_reg[13]_i_1_n_6 ,\axi_araddr_reg[13]_i_1_n_7 }),
        .S(m00_axi_araddr[11:8]));
  FDRE \axi_araddr_reg[14] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[17]_i_1_n_7 ),
        .Q(m00_axi_araddr[12]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \axi_araddr_reg[15] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[17]_i_1_n_6 ),
        .Q(m00_axi_araddr[13]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \axi_araddr_reg[16] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[17]_i_1_n_5 ),
        .Q(m00_axi_araddr[14]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \axi_araddr_reg[17] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[17]_i_1_n_4 ),
        .Q(m00_axi_araddr[15]),
        .R(\data_matrix[255]_i_1_n_0 ));
  CARRY4 \axi_araddr_reg[17]_i_1 
       (.CI(\axi_araddr_reg[13]_i_1_n_0 ),
        .CO({\axi_araddr_reg[17]_i_1_n_0 ,\axi_araddr_reg[17]_i_1_n_1 ,\axi_araddr_reg[17]_i_1_n_2 ,\axi_araddr_reg[17]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_araddr_reg[17]_i_1_n_4 ,\axi_araddr_reg[17]_i_1_n_5 ,\axi_araddr_reg[17]_i_1_n_6 ,\axi_araddr_reg[17]_i_1_n_7 }),
        .S(m00_axi_araddr[15:12]));
  FDRE \axi_araddr_reg[18] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[21]_i_1_n_7 ),
        .Q(m00_axi_araddr[16]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \axi_araddr_reg[19] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[21]_i_1_n_6 ),
        .Q(m00_axi_araddr[17]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \axi_araddr_reg[20] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[21]_i_1_n_5 ),
        .Q(m00_axi_araddr[18]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \axi_araddr_reg[21] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[21]_i_1_n_4 ),
        .Q(m00_axi_araddr[19]),
        .R(\data_matrix[255]_i_1_n_0 ));
  CARRY4 \axi_araddr_reg[21]_i_1 
       (.CI(\axi_araddr_reg[17]_i_1_n_0 ),
        .CO({\axi_araddr_reg[21]_i_1_n_0 ,\axi_araddr_reg[21]_i_1_n_1 ,\axi_araddr_reg[21]_i_1_n_2 ,\axi_araddr_reg[21]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_araddr_reg[21]_i_1_n_4 ,\axi_araddr_reg[21]_i_1_n_5 ,\axi_araddr_reg[21]_i_1_n_6 ,\axi_araddr_reg[21]_i_1_n_7 }),
        .S(m00_axi_araddr[19:16]));
  FDRE \axi_araddr_reg[22] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[25]_i_1_n_7 ),
        .Q(m00_axi_araddr[20]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \axi_araddr_reg[23] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[25]_i_1_n_6 ),
        .Q(m00_axi_araddr[21]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \axi_araddr_reg[24] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[25]_i_1_n_5 ),
        .Q(m00_axi_araddr[22]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \axi_araddr_reg[25] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[25]_i_1_n_4 ),
        .Q(m00_axi_araddr[23]),
        .R(\data_matrix[255]_i_1_n_0 ));
  CARRY4 \axi_araddr_reg[25]_i_1 
       (.CI(\axi_araddr_reg[21]_i_1_n_0 ),
        .CO({\axi_araddr_reg[25]_i_1_n_0 ,\axi_araddr_reg[25]_i_1_n_1 ,\axi_araddr_reg[25]_i_1_n_2 ,\axi_araddr_reg[25]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_araddr_reg[25]_i_1_n_4 ,\axi_araddr_reg[25]_i_1_n_5 ,\axi_araddr_reg[25]_i_1_n_6 ,\axi_araddr_reg[25]_i_1_n_7 }),
        .S(m00_axi_araddr[23:20]));
  FDRE \axi_araddr_reg[26] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[28]_i_2_n_7 ),
        .Q(m00_axi_araddr[24]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \axi_araddr_reg[27] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[28]_i_2_n_6 ),
        .Q(m00_axi_araddr[25]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \axi_araddr_reg[28] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[28]_i_2_n_5 ),
        .Q(m00_axi_araddr[26]),
        .R(\data_matrix[255]_i_1_n_0 ));
  CARRY4 \axi_araddr_reg[28]_i_2 
       (.CI(\axi_araddr_reg[25]_i_1_n_0 ),
        .CO({\axi_araddr_reg[28]_i_2_n_0 ,\axi_araddr_reg[28]_i_2_n_1 ,\axi_araddr_reg[28]_i_2_n_2 ,\axi_araddr_reg[28]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_araddr_reg[28]_i_2_n_4 ,\axi_araddr_reg[28]_i_2_n_5 ,\axi_araddr_reg[28]_i_2_n_6 ,\axi_araddr_reg[28]_i_2_n_7 }),
        .S({axi_araddr_reg[29],m00_axi_araddr[26:24]}));
  FDRE \axi_araddr_reg[29] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[28]_i_2_n_4 ),
        .Q(axi_araddr_reg[29]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \axi_araddr_reg[2] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[5]_i_1_n_7 ),
        .Q(m00_axi_araddr[0]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \axi_araddr_reg[30] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[30]_i_1_n_7 ),
        .Q(axi_araddr_reg[30]),
        .R(\data_matrix[255]_i_1_n_0 ));
  CARRY4 \axi_araddr_reg[30]_i_1 
       (.CI(\axi_araddr_reg[28]_i_2_n_0 ),
        .CO({\NLW_axi_araddr_reg[30]_i_1_CO_UNCONNECTED [3:1],\axi_araddr_reg[30]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_axi_araddr_reg[30]_i_1_O_UNCONNECTED [3:2],\axi_araddr_reg[30]_i_1_n_6 ,\axi_araddr_reg[30]_i_1_n_7 }),
        .S({1'b0,1'b0,axi_araddr_reg[31:30]}));
  FDRE \axi_araddr_reg[31] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[30]_i_1_n_6 ),
        .Q(axi_araddr_reg[31]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \axi_araddr_reg[3] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[5]_i_1_n_6 ),
        .Q(m00_axi_araddr[1]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \axi_araddr_reg[4] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[5]_i_1_n_5 ),
        .Q(m00_axi_araddr[2]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \axi_araddr_reg[5] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[5]_i_1_n_4 ),
        .Q(m00_axi_araddr[3]),
        .R(\data_matrix[255]_i_1_n_0 ));
  CARRY4 \axi_araddr_reg[5]_i_1 
       (.CI(1'b0),
        .CO({\axi_araddr_reg[5]_i_1_n_0 ,\axi_araddr_reg[5]_i_1_n_1 ,\axi_araddr_reg[5]_i_1_n_2 ,\axi_araddr_reg[5]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\axi_araddr_reg[5]_i_1_n_4 ,\axi_araddr_reg[5]_i_1_n_5 ,\axi_araddr_reg[5]_i_1_n_6 ,\axi_araddr_reg[5]_i_1_n_7 }),
        .S({m00_axi_araddr[3:1],\axi_araddr[5]_i_2_n_0 }));
  FDRE \axi_araddr_reg[6] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[9]_i_1_n_7 ),
        .Q(m00_axi_araddr[4]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \axi_araddr_reg[7] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[9]_i_1_n_6 ),
        .Q(m00_axi_araddr[5]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \axi_araddr_reg[8] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[9]_i_1_n_5 ),
        .Q(m00_axi_araddr[6]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \axi_araddr_reg[9] 
       (.C(m00_axi_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[9]_i_1_n_4 ),
        .Q(m00_axi_araddr[7]),
        .R(\data_matrix[255]_i_1_n_0 ));
  CARRY4 \axi_araddr_reg[9]_i_1 
       (.CI(\axi_araddr_reg[5]_i_1_n_0 ),
        .CO({\axi_araddr_reg[9]_i_1_n_0 ,\axi_araddr_reg[9]_i_1_n_1 ,\axi_araddr_reg[9]_i_1_n_2 ,\axi_araddr_reg[9]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_araddr_reg[9]_i_1_n_4 ,\axi_araddr_reg[9]_i_1_n_5 ,\axi_araddr_reg[9]_i_1_n_6 ,\axi_araddr_reg[9]_i_1_n_7 }),
        .S(m00_axi_araddr[7:4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hAE)) 
    axi_arvalid_i_1
       (.I0(start_single_read_reg_n_0),
        .I1(axi_arvalid_reg_0),
        .I2(m00_axi_arready),
        .O(axi_arvalid_i_1_n_0));
  FDRE axi_arvalid_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(axi_arvalid_i_1_n_0),
        .Q(axi_arvalid_reg_0),
        .R(\data_matrix[255]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    axi_bready_i_1
       (.I0(m00_axi_bvalid),
        .I1(m00_axi_bready),
        .O(axi_bready0));
  FDRE axi_bready_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(axi_bready0),
        .Q(m00_axi_bready),
        .R(\data_matrix[255]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h4)) 
    axi_rready_i_1
       (.I0(axi_rready_reg_0),
        .I1(m00_axi_rvalid),
        .O(axi_rready_i_1_n_0));
  FDRE axi_rready_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(axi_rready_i_1_n_0),
        .Q(axi_rready_reg_0),
        .R(\data_matrix[255]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \data_matrix[143]_i_1 
       (.I0(read_index[2]),
        .I1(axi_rready_reg_0),
        .I2(m00_axi_rvalid),
        .I3(read_index[0]),
        .I4(read_index[1]),
        .O(\data_matrix[143]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h08000000)) 
    \data_matrix[159]_i_1 
       (.I0(axi_rready_reg_0),
        .I1(m00_axi_rvalid),
        .I2(read_index[0]),
        .I3(read_index[1]),
        .I4(read_index[2]),
        .O(\data_matrix[159]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h08000000)) 
    \data_matrix[175]_i_1 
       (.I0(axi_rready_reg_0),
        .I1(m00_axi_rvalid),
        .I2(read_index[1]),
        .I3(read_index[0]),
        .I4(read_index[2]),
        .O(\data_matrix[175]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \data_matrix[191]_i_1 
       (.I0(axi_rready_reg_0),
        .I1(m00_axi_rvalid),
        .I2(read_index[0]),
        .I3(read_index[2]),
        .I4(read_index[1]),
        .O(\data_matrix[191]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h08000000)) 
    \data_matrix[207]_i_1 
       (.I0(axi_rready_reg_0),
        .I1(m00_axi_rvalid),
        .I2(read_index[2]),
        .I3(read_index[0]),
        .I4(read_index[1]),
        .O(\data_matrix[207]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \data_matrix[223]_i_1 
       (.I0(axi_rready_reg_0),
        .I1(m00_axi_rvalid),
        .I2(read_index[2]),
        .I3(read_index[1]),
        .I4(read_index[0]),
        .O(\data_matrix[223]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \data_matrix[239]_i_1 
       (.I0(axi_rready_reg_0),
        .I1(m00_axi_rvalid),
        .I2(read_index[2]),
        .I3(read_index[0]),
        .I4(read_index[1]),
        .O(\data_matrix[239]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h4F)) 
    \data_matrix[255]_i_1 
       (.I0(init_txn_ff2),
        .I1(init_txn_ff),
        .I2(m00_axi_aresetn),
        .O(\data_matrix[255]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00001000)) 
    \data_matrix[255]_i_2 
       (.I0(read_index[0]),
        .I1(read_index[1]),
        .I2(axi_rready_reg_0),
        .I3(m00_axi_rvalid),
        .I4(read_index[2]),
        .O(\data_matrix[255]_i_2_n_0 ));
  FDRE \data_matrix_reg[128] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[143]_i_1_n_0 ),
        .D(m00_axi_rdata[0]),
        .Q(data_matrix[0]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[129] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[143]_i_1_n_0 ),
        .D(m00_axi_rdata[1]),
        .Q(data_matrix[1]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[130] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[143]_i_1_n_0 ),
        .D(m00_axi_rdata[2]),
        .Q(data_matrix[2]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[131] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[143]_i_1_n_0 ),
        .D(m00_axi_rdata[3]),
        .Q(data_matrix[3]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[132] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[143]_i_1_n_0 ),
        .D(m00_axi_rdata[4]),
        .Q(data_matrix[4]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[133] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[143]_i_1_n_0 ),
        .D(m00_axi_rdata[5]),
        .Q(data_matrix[5]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[134] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[143]_i_1_n_0 ),
        .D(m00_axi_rdata[6]),
        .Q(data_matrix[6]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[135] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[143]_i_1_n_0 ),
        .D(m00_axi_rdata[7]),
        .Q(data_matrix[7]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[136] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[143]_i_1_n_0 ),
        .D(m00_axi_rdata[8]),
        .Q(data_matrix[8]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[137] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[143]_i_1_n_0 ),
        .D(m00_axi_rdata[9]),
        .Q(data_matrix[9]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[138] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[143]_i_1_n_0 ),
        .D(m00_axi_rdata[10]),
        .Q(data_matrix[10]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[139] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[143]_i_1_n_0 ),
        .D(m00_axi_rdata[11]),
        .Q(data_matrix[11]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[140] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[143]_i_1_n_0 ),
        .D(m00_axi_rdata[12]),
        .Q(data_matrix[12]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[141] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[143]_i_1_n_0 ),
        .D(m00_axi_rdata[13]),
        .Q(data_matrix[13]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[142] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[143]_i_1_n_0 ),
        .D(m00_axi_rdata[14]),
        .Q(data_matrix[14]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[143] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[143]_i_1_n_0 ),
        .D(m00_axi_rdata[15]),
        .Q(data_matrix[15]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[144] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[159]_i_1_n_0 ),
        .D(m00_axi_rdata[0]),
        .Q(data_matrix[16]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[145] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[159]_i_1_n_0 ),
        .D(m00_axi_rdata[1]),
        .Q(data_matrix[17]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[146] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[159]_i_1_n_0 ),
        .D(m00_axi_rdata[2]),
        .Q(data_matrix[18]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[147] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[159]_i_1_n_0 ),
        .D(m00_axi_rdata[3]),
        .Q(data_matrix[19]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[148] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[159]_i_1_n_0 ),
        .D(m00_axi_rdata[4]),
        .Q(data_matrix[20]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[149] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[159]_i_1_n_0 ),
        .D(m00_axi_rdata[5]),
        .Q(data_matrix[21]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[150] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[159]_i_1_n_0 ),
        .D(m00_axi_rdata[6]),
        .Q(data_matrix[22]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[151] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[159]_i_1_n_0 ),
        .D(m00_axi_rdata[7]),
        .Q(data_matrix[23]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[152] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[159]_i_1_n_0 ),
        .D(m00_axi_rdata[8]),
        .Q(data_matrix[24]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[153] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[159]_i_1_n_0 ),
        .D(m00_axi_rdata[9]),
        .Q(data_matrix[25]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[154] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[159]_i_1_n_0 ),
        .D(m00_axi_rdata[10]),
        .Q(data_matrix[26]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[155] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[159]_i_1_n_0 ),
        .D(m00_axi_rdata[11]),
        .Q(data_matrix[27]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[156] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[159]_i_1_n_0 ),
        .D(m00_axi_rdata[12]),
        .Q(data_matrix[28]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[157] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[159]_i_1_n_0 ),
        .D(m00_axi_rdata[13]),
        .Q(data_matrix[29]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[158] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[159]_i_1_n_0 ),
        .D(m00_axi_rdata[14]),
        .Q(data_matrix[30]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[159] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[159]_i_1_n_0 ),
        .D(m00_axi_rdata[15]),
        .Q(data_matrix[31]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[160] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[175]_i_1_n_0 ),
        .D(m00_axi_rdata[0]),
        .Q(data_matrix[32]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[161] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[175]_i_1_n_0 ),
        .D(m00_axi_rdata[1]),
        .Q(data_matrix[33]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[162] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[175]_i_1_n_0 ),
        .D(m00_axi_rdata[2]),
        .Q(data_matrix[34]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[163] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[175]_i_1_n_0 ),
        .D(m00_axi_rdata[3]),
        .Q(data_matrix[35]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[164] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[175]_i_1_n_0 ),
        .D(m00_axi_rdata[4]),
        .Q(data_matrix[36]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[165] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[175]_i_1_n_0 ),
        .D(m00_axi_rdata[5]),
        .Q(data_matrix[37]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[166] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[175]_i_1_n_0 ),
        .D(m00_axi_rdata[6]),
        .Q(data_matrix[38]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[167] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[175]_i_1_n_0 ),
        .D(m00_axi_rdata[7]),
        .Q(data_matrix[39]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[168] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[175]_i_1_n_0 ),
        .D(m00_axi_rdata[8]),
        .Q(data_matrix[40]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[169] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[175]_i_1_n_0 ),
        .D(m00_axi_rdata[9]),
        .Q(data_matrix[41]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[170] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[175]_i_1_n_0 ),
        .D(m00_axi_rdata[10]),
        .Q(data_matrix[42]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[171] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[175]_i_1_n_0 ),
        .D(m00_axi_rdata[11]),
        .Q(data_matrix[43]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[172] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[175]_i_1_n_0 ),
        .D(m00_axi_rdata[12]),
        .Q(data_matrix[44]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[173] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[175]_i_1_n_0 ),
        .D(m00_axi_rdata[13]),
        .Q(data_matrix[45]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[174] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[175]_i_1_n_0 ),
        .D(m00_axi_rdata[14]),
        .Q(data_matrix[46]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[175] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[175]_i_1_n_0 ),
        .D(m00_axi_rdata[15]),
        .Q(data_matrix[47]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[176] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[191]_i_1_n_0 ),
        .D(m00_axi_rdata[0]),
        .Q(data_matrix[48]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[177] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[191]_i_1_n_0 ),
        .D(m00_axi_rdata[1]),
        .Q(data_matrix[49]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[178] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[191]_i_1_n_0 ),
        .D(m00_axi_rdata[2]),
        .Q(data_matrix[50]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[179] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[191]_i_1_n_0 ),
        .D(m00_axi_rdata[3]),
        .Q(data_matrix[51]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[180] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[191]_i_1_n_0 ),
        .D(m00_axi_rdata[4]),
        .Q(data_matrix[52]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[181] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[191]_i_1_n_0 ),
        .D(m00_axi_rdata[5]),
        .Q(data_matrix[53]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[182] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[191]_i_1_n_0 ),
        .D(m00_axi_rdata[6]),
        .Q(data_matrix[54]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[183] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[191]_i_1_n_0 ),
        .D(m00_axi_rdata[7]),
        .Q(data_matrix[55]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[184] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[191]_i_1_n_0 ),
        .D(m00_axi_rdata[8]),
        .Q(data_matrix[56]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[185] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[191]_i_1_n_0 ),
        .D(m00_axi_rdata[9]),
        .Q(data_matrix[57]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[186] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[191]_i_1_n_0 ),
        .D(m00_axi_rdata[10]),
        .Q(data_matrix[58]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[187] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[191]_i_1_n_0 ),
        .D(m00_axi_rdata[11]),
        .Q(data_matrix[59]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[188] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[191]_i_1_n_0 ),
        .D(m00_axi_rdata[12]),
        .Q(data_matrix[60]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[189] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[191]_i_1_n_0 ),
        .D(m00_axi_rdata[13]),
        .Q(data_matrix[61]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[190] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[191]_i_1_n_0 ),
        .D(m00_axi_rdata[14]),
        .Q(data_matrix[62]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[191] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[191]_i_1_n_0 ),
        .D(m00_axi_rdata[15]),
        .Q(data_matrix[63]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[192] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[207]_i_1_n_0 ),
        .D(m00_axi_rdata[0]),
        .Q(data_matrix[64]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[193] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[207]_i_1_n_0 ),
        .D(m00_axi_rdata[1]),
        .Q(data_matrix[65]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[194] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[207]_i_1_n_0 ),
        .D(m00_axi_rdata[2]),
        .Q(data_matrix[66]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[195] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[207]_i_1_n_0 ),
        .D(m00_axi_rdata[3]),
        .Q(data_matrix[67]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[196] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[207]_i_1_n_0 ),
        .D(m00_axi_rdata[4]),
        .Q(data_matrix[68]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[197] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[207]_i_1_n_0 ),
        .D(m00_axi_rdata[5]),
        .Q(data_matrix[69]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[198] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[207]_i_1_n_0 ),
        .D(m00_axi_rdata[6]),
        .Q(data_matrix[70]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[199] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[207]_i_1_n_0 ),
        .D(m00_axi_rdata[7]),
        .Q(data_matrix[71]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[200] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[207]_i_1_n_0 ),
        .D(m00_axi_rdata[8]),
        .Q(data_matrix[72]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[201] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[207]_i_1_n_0 ),
        .D(m00_axi_rdata[9]),
        .Q(data_matrix[73]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[202] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[207]_i_1_n_0 ),
        .D(m00_axi_rdata[10]),
        .Q(data_matrix[74]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[203] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[207]_i_1_n_0 ),
        .D(m00_axi_rdata[11]),
        .Q(data_matrix[75]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[204] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[207]_i_1_n_0 ),
        .D(m00_axi_rdata[12]),
        .Q(data_matrix[76]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[205] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[207]_i_1_n_0 ),
        .D(m00_axi_rdata[13]),
        .Q(data_matrix[77]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[206] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[207]_i_1_n_0 ),
        .D(m00_axi_rdata[14]),
        .Q(data_matrix[78]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[207] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[207]_i_1_n_0 ),
        .D(m00_axi_rdata[15]),
        .Q(data_matrix[79]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[208] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[223]_i_1_n_0 ),
        .D(m00_axi_rdata[0]),
        .Q(data_matrix[80]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[209] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[223]_i_1_n_0 ),
        .D(m00_axi_rdata[1]),
        .Q(data_matrix[81]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[210] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[223]_i_1_n_0 ),
        .D(m00_axi_rdata[2]),
        .Q(data_matrix[82]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[211] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[223]_i_1_n_0 ),
        .D(m00_axi_rdata[3]),
        .Q(data_matrix[83]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[212] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[223]_i_1_n_0 ),
        .D(m00_axi_rdata[4]),
        .Q(data_matrix[84]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[213] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[223]_i_1_n_0 ),
        .D(m00_axi_rdata[5]),
        .Q(data_matrix[85]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[214] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[223]_i_1_n_0 ),
        .D(m00_axi_rdata[6]),
        .Q(data_matrix[86]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[215] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[223]_i_1_n_0 ),
        .D(m00_axi_rdata[7]),
        .Q(data_matrix[87]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[216] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[223]_i_1_n_0 ),
        .D(m00_axi_rdata[8]),
        .Q(data_matrix[88]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[217] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[223]_i_1_n_0 ),
        .D(m00_axi_rdata[9]),
        .Q(data_matrix[89]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[218] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[223]_i_1_n_0 ),
        .D(m00_axi_rdata[10]),
        .Q(data_matrix[90]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[219] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[223]_i_1_n_0 ),
        .D(m00_axi_rdata[11]),
        .Q(data_matrix[91]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[220] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[223]_i_1_n_0 ),
        .D(m00_axi_rdata[12]),
        .Q(data_matrix[92]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[221] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[223]_i_1_n_0 ),
        .D(m00_axi_rdata[13]),
        .Q(data_matrix[93]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[222] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[223]_i_1_n_0 ),
        .D(m00_axi_rdata[14]),
        .Q(data_matrix[94]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[223] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[223]_i_1_n_0 ),
        .D(m00_axi_rdata[15]),
        .Q(data_matrix[95]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[224] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[239]_i_1_n_0 ),
        .D(m00_axi_rdata[0]),
        .Q(data_matrix[96]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[225] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[239]_i_1_n_0 ),
        .D(m00_axi_rdata[1]),
        .Q(data_matrix[97]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[226] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[239]_i_1_n_0 ),
        .D(m00_axi_rdata[2]),
        .Q(data_matrix[98]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[227] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[239]_i_1_n_0 ),
        .D(m00_axi_rdata[3]),
        .Q(data_matrix[99]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[228] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[239]_i_1_n_0 ),
        .D(m00_axi_rdata[4]),
        .Q(data_matrix[100]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[229] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[239]_i_1_n_0 ),
        .D(m00_axi_rdata[5]),
        .Q(data_matrix[101]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[230] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[239]_i_1_n_0 ),
        .D(m00_axi_rdata[6]),
        .Q(data_matrix[102]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[231] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[239]_i_1_n_0 ),
        .D(m00_axi_rdata[7]),
        .Q(data_matrix[103]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[232] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[239]_i_1_n_0 ),
        .D(m00_axi_rdata[8]),
        .Q(data_matrix[104]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[233] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[239]_i_1_n_0 ),
        .D(m00_axi_rdata[9]),
        .Q(data_matrix[105]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[234] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[239]_i_1_n_0 ),
        .D(m00_axi_rdata[10]),
        .Q(data_matrix[106]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[235] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[239]_i_1_n_0 ),
        .D(m00_axi_rdata[11]),
        .Q(data_matrix[107]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[236] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[239]_i_1_n_0 ),
        .D(m00_axi_rdata[12]),
        .Q(data_matrix[108]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[237] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[239]_i_1_n_0 ),
        .D(m00_axi_rdata[13]),
        .Q(data_matrix[109]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[238] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[239]_i_1_n_0 ),
        .D(m00_axi_rdata[14]),
        .Q(data_matrix[110]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[239] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[239]_i_1_n_0 ),
        .D(m00_axi_rdata[15]),
        .Q(data_matrix[111]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[240] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[255]_i_2_n_0 ),
        .D(m00_axi_rdata[0]),
        .Q(data_matrix[112]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[241] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[255]_i_2_n_0 ),
        .D(m00_axi_rdata[1]),
        .Q(data_matrix[113]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[242] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[255]_i_2_n_0 ),
        .D(m00_axi_rdata[2]),
        .Q(data_matrix[114]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[243] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[255]_i_2_n_0 ),
        .D(m00_axi_rdata[3]),
        .Q(data_matrix[115]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[244] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[255]_i_2_n_0 ),
        .D(m00_axi_rdata[4]),
        .Q(data_matrix[116]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[245] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[255]_i_2_n_0 ),
        .D(m00_axi_rdata[5]),
        .Q(data_matrix[117]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[246] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[255]_i_2_n_0 ),
        .D(m00_axi_rdata[6]),
        .Q(data_matrix[118]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[247] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[255]_i_2_n_0 ),
        .D(m00_axi_rdata[7]),
        .Q(data_matrix[119]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[248] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[255]_i_2_n_0 ),
        .D(m00_axi_rdata[8]),
        .Q(data_matrix[120]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[249] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[255]_i_2_n_0 ),
        .D(m00_axi_rdata[9]),
        .Q(data_matrix[121]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[250] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[255]_i_2_n_0 ),
        .D(m00_axi_rdata[10]),
        .Q(data_matrix[122]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[251] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[255]_i_2_n_0 ),
        .D(m00_axi_rdata[11]),
        .Q(data_matrix[123]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[252] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[255]_i_2_n_0 ),
        .D(m00_axi_rdata[12]),
        .Q(data_matrix[124]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[253] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[255]_i_2_n_0 ),
        .D(m00_axi_rdata[13]),
        .Q(data_matrix[125]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[254] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[255]_i_2_n_0 ),
        .D(m00_axi_rdata[14]),
        .Q(data_matrix[126]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \data_matrix_reg[255] 
       (.C(m00_axi_aclk),
        .CE(\data_matrix[255]_i_2_n_0 ),
        .D(m00_axi_rdata[15]),
        .Q(data_matrix[127]),
        .R(\data_matrix[255]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    decode_start_INST_0
       (.I0(last_read),
        .I1(last_read_dly),
        .O(decode_start));
  FDRE init_txn_ff2_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(init_txn_ff),
        .Q(init_txn_ff2),
        .R(FSM_sequential_mst_exec_state_i_1_n_0));
  FDRE init_txn_ff_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(m00_axi_init_axi_txn),
        .Q(init_txn_ff),
        .R(FSM_sequential_mst_exec_state_i_1_n_0));
  FDRE last_read_dly_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(last_read),
        .Q(last_read_dly),
        .R(\data_matrix[255]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF0200)) 
    last_read_i_1
       (.I0(read_index[2]),
        .I1(read_index[0]),
        .I2(read_index[1]),
        .I3(m00_axi_arready),
        .I4(last_read),
        .O(last_read_i_1_n_0));
  FDRE last_read_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(last_read_i_1_n_0),
        .Q(last_read),
        .R(\data_matrix[255]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \read_index[0]_i_1 
       (.I0(start_single_read_reg_n_0),
        .I1(read_index[0]),
        .O(\read_index[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \read_index[1]_i_1 
       (.I0(read_index[0]),
        .I1(start_single_read_reg_n_0),
        .I2(read_index[1]),
        .O(\read_index[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \read_index[2]_i_1 
       (.I0(read_index[0]),
        .I1(read_index[1]),
        .I2(start_single_read_reg_n_0),
        .I3(read_index[2]),
        .O(\read_index[2]_i_1_n_0 ));
  FDRE \read_index_reg[0] 
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(\read_index[0]_i_1_n_0 ),
        .Q(read_index[0]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \read_index_reg[1] 
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(\read_index[1]_i_1_n_0 ),
        .Q(read_index[1]),
        .R(\data_matrix[255]_i_1_n_0 ));
  FDRE \read_index_reg[2] 
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(\read_index[2]_i_1_n_0 ),
        .Q(read_index[2]),
        .R(\data_matrix[255]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFDFF2020)) 
    read_issued_i_1
       (.I0(mst_exec_state),
        .I1(reads_done),
        .I2(start_single_read0),
        .I3(axi_rready_reg_0),
        .I4(read_issued_reg_n_0),
        .O(read_issued_i_1_n_0));
  FDRE read_issued_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(read_issued_i_1_n_0),
        .Q(read_issued_reg_n_0),
        .R(FSM_sequential_mst_exec_state_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFF80)) 
    reads_done_i_1
       (.I0(last_read),
        .I1(axi_rready_reg_0),
        .I2(m00_axi_rvalid),
        .I3(reads_done),
        .O(reads_done_i_1_n_0));
  FDRE reads_done_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(reads_done_i_1_n_0),
        .Q(reads_done),
        .R(\data_matrix[255]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFD2020)) 
    start_single_read_i_1
       (.I0(mst_exec_state),
        .I1(reads_done),
        .I2(start_single_read0),
        .I3(axi_rready_reg_0),
        .I4(start_single_read_reg_n_0),
        .O(start_single_read_i_1_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    start_single_read_i_2
       (.I0(m00_axi_rvalid),
        .I1(axi_arvalid_reg_0),
        .I2(start_single_read_reg_n_0),
        .I3(last_read),
        .I4(read_issued_reg_n_0),
        .O(start_single_read0));
  FDRE start_single_read_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(start_single_read_i_1_n_0),
        .Q(start_single_read_reg_n_0),
        .R(FSM_sequential_mst_exec_state_i_1_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
