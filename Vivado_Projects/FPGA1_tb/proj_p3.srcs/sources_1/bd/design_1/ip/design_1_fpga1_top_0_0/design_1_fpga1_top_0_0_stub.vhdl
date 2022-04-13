-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Tue Apr 12 21:55:58 2022
-- Host        : DESKTOP-EU22PUG running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               E:/UofTCourse/ECE532/project/milestones/fpga1_axi_mb_integration/fpga1_top_tb/proj3/proj_p3.srcs/sources_1/bd/design_1/ip/design_1_fpga1_top_0_0/design_1_fpga1_top_0_0_stub.vhdl
-- Design      : design_1_fpga1_top_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_fpga1_top_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    dm_decode_enable : in STD_LOGIC;
    doses : in STD_LOGIC_VECTOR ( 1 downto 0 );
    permission : in STD_LOGIC;
    fetch_enable : in STD_LOGIC;
    data_matrix_in : in STD_LOGIC_VECTOR ( 255 downto 0 );
    decode_done : out STD_LOGIC;
    database_addr : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Hsynq : out STD_LOGIC;
    Vsynq : out STD_LOGIC;
    Red : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Green : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Blue : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );

end design_1_fpga1_top_0_0;

architecture stub of design_1_fpga1_top_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,reset,dm_decode_enable,doses[1:0],permission,fetch_enable,data_matrix_in[255:0],decode_done,database_addr[15:0],Hsynq,Vsynq,Red[3:0],Green[3:0],Blue[3:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "fpga1_top,Vivado 2018.3";
begin
end;
