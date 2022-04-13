
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.3
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a100tcsg324-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set Blue_0 [ create_bd_port -dir O -from 3 -to 0 Blue_0 ]
  set Green_0 [ create_bd_port -dir O -from 3 -to 0 Green_0 ]
  set Hsynq_0 [ create_bd_port -dir O Hsynq_0 ]
  set Red_0 [ create_bd_port -dir O -from 3 -to 0 Red_0 ]
  set Vsynq_0 [ create_bd_port -dir O Vsynq_0 ]
  set clk [ create_bd_port -dir I -type clk clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
 ] $clk
  set resetn [ create_bd_port -dir I -type rst resetn ]

  # Create instance: axi_bram_ctrl_0, and set properties
  set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_0 ]
  set_property -dict [ list \
   CONFIG.ECC_TYPE {0} \
   CONFIG.PROTOCOL {AXI4LITE} \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_0

  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon ]
  set_property -dict [ list \
   CONFIG.NUM_MI {2} \
   CONFIG.NUM_SI {3} \
 ] $axi_mem_intercon

  # Create instance: axi_vip_1, and set properties
  set axi_vip_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vip:1.1 axi_vip_1 ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.ARUSER_WIDTH {0} \
   CONFIG.AWUSER_WIDTH {0} \
   CONFIG.BUSER_WIDTH {0} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {0} \
   CONFIG.HAS_CACHE {0} \
   CONFIG.HAS_LOCK {0} \
   CONFIG.HAS_PROT {1} \
   CONFIG.HAS_QOS {0} \
   CONFIG.HAS_REGION {0} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.ID_WIDTH {0} \
   CONFIG.INTERFACE_MODE {MASTER} \
   CONFIG.PROTOCOL {AXI4LITE} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW {0} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
 ] $axi_vip_1

  # Create instance: blk_mem_gen_0, and set properties
  set blk_mem_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_0 ]

  # Create instance: fpga1_top_0, and set properties
  set fpga1_top_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:fpga1_top:1.0 fpga1_top_0 ]

  # Create instance: fpga1_top_master_0, and set properties
  set fpga1_top_master_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:fpga1_top_master:1.0 fpga1_top_master_0 ]
  set_property -dict [ list \
   CONFIG.C_M00_AXI_TARGET_SLAVE_BASE_ADDR {0x44A00000} \
   CONFIG.C_M00_AXI_TRANSACTIONS_NUM {1} \
 ] $fpga1_top_master_0

  # Create instance: fpga1_top_master_bram_0, and set properties
  set fpga1_top_master_bram_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:fpga1_top_master_bram:1.0 fpga1_top_master_bram_0 ]
  set_property -dict [ list \
   CONFIG.C_M00_AXI_TRANSACTIONS_NUM {16} \
 ] $fpga1_top_master_bram_0

  # Create instance: fpga1_top_slv_0, and set properties
  set fpga1_top_slv_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:fpga1_top_slv:1.0 fpga1_top_slv_0 ]

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_0/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins axi_bram_ctrl_0/S_AXI] [get_bd_intf_pins axi_mem_intercon/M00_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_M01_AXI [get_bd_intf_pins axi_mem_intercon/M01_AXI] [get_bd_intf_pins fpga1_top_slv_0/S00_AXI]
  connect_bd_intf_net -intf_net axi_vip_1_M_AXI [get_bd_intf_pins axi_mem_intercon/S00_AXI] [get_bd_intf_pins axi_vip_1/M_AXI]
  connect_bd_intf_net -intf_net fpga1_top_master_0_M00_AXI [get_bd_intf_pins axi_mem_intercon/S02_AXI] [get_bd_intf_pins fpga1_top_master_0/M00_AXI]
  connect_bd_intf_net -intf_net fpga1_top_master_bram_0_M00_AXI [get_bd_intf_pins axi_mem_intercon/S01_AXI] [get_bd_intf_pins fpga1_top_master_bram_0/M00_AXI]

  # Create port connections
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins axi_bram_ctrl_0/s_axi_aclk] [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins axi_mem_intercon/M01_ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins axi_mem_intercon/S01_ACLK] [get_bd_pins axi_mem_intercon/S02_ACLK] [get_bd_pins axi_vip_1/aclk] [get_bd_pins fpga1_top_0/clk] [get_bd_pins fpga1_top_master_0/m00_axi_aclk] [get_bd_pins fpga1_top_master_bram_0/m00_axi_aclk] [get_bd_pins fpga1_top_slv_0/s00_axi_aclk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
  connect_bd_net -net fpga1_top_0_Blue [get_bd_ports Blue_0] [get_bd_pins fpga1_top_0/Blue]
  connect_bd_net -net fpga1_top_0_Green [get_bd_ports Green_0] [get_bd_pins fpga1_top_0/Green]
  connect_bd_net -net fpga1_top_0_Hsynq [get_bd_ports Hsynq_0] [get_bd_pins fpga1_top_0/Hsynq]
  connect_bd_net -net fpga1_top_0_Red [get_bd_ports Red_0] [get_bd_pins fpga1_top_0/Red]
  connect_bd_net -net fpga1_top_0_Vsynq [get_bd_ports Vsynq_0] [get_bd_pins fpga1_top_0/Vsynq]
  connect_bd_net -net fpga1_top_0_database_addr [get_bd_pins fpga1_top_0/database_addr] [get_bd_pins fpga1_top_master_0/database_addr]
  connect_bd_net -net fpga1_top_0_decode_done [get_bd_pins fpga1_top_0/decode_done] [get_bd_pins fpga1_top_master_0/m00_axi_init_axi_txn]
  connect_bd_net -net fpga1_top_master_bram_0_data_matrix [get_bd_pins fpga1_top_0/data_matrix_in] [get_bd_pins fpga1_top_master_bram_0/data_matrix]
  connect_bd_net -net fpga1_top_master_bram_0_decode_start [get_bd_pins fpga1_top_0/dm_decode_enable] [get_bd_pins fpga1_top_master_bram_0/decode_start]
  connect_bd_net -net fpga1_top_slv_0_dm_decode_enable [get_bd_pins fpga1_top_master_bram_0/m00_axi_init_axi_txn] [get_bd_pins fpga1_top_slv_0/dm_decode_enable]
  connect_bd_net -net fpga1_top_slv_0_doses [get_bd_pins fpga1_top_0/doses] [get_bd_pins fpga1_top_slv_0/doses]
  connect_bd_net -net fpga1_top_slv_0_fetch_enable [get_bd_pins fpga1_top_0/fetch_enable] [get_bd_pins fpga1_top_slv_0/fetch_enable]
  connect_bd_net -net fpga1_top_slv_0_permission [get_bd_pins fpga1_top_0/permission] [get_bd_pins fpga1_top_slv_0/permission]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn] [get_bd_pins axi_mem_intercon/ARESETN] [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_mem_intercon/M01_ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins axi_mem_intercon/S01_ARESETN] [get_bd_pins axi_mem_intercon/S02_ARESETN] [get_bd_pins axi_vip_1/aresetn] [get_bd_pins fpga1_top_0/reset] [get_bd_pins fpga1_top_master_0/m00_axi_aresetn] [get_bd_pins fpga1_top_master_bram_0/m00_axi_aresetn] [get_bd_pins fpga1_top_slv_0/s00_axi_aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
  connect_bd_net -net resetn_1 [get_bd_ports resetn] [get_bd_pins proc_sys_reset_0/ext_reset_in]

  # Create address segments
  create_bd_addr_seg -range 0x00001000 -offset 0x40000000 [get_bd_addr_spaces axi_vip_1/Master_AXI] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] SEG_axi_bram_ctrl_0_Mem0
  create_bd_addr_seg -range 0x00010000 -offset 0x44A00000 [get_bd_addr_spaces axi_vip_1/Master_AXI] [get_bd_addr_segs fpga1_top_slv_0/S00_AXI/S00_AXI_reg] SEG_fpga1_top_slv_0_S00_AXI_reg
  create_bd_addr_seg -range 0x00001000 -offset 0x40000000 [get_bd_addr_spaces fpga1_top_master_0/M00_AXI] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] SEG_axi_bram_ctrl_0_Mem0
  create_bd_addr_seg -range 0x00010000 -offset 0x44A00000 [get_bd_addr_spaces fpga1_top_master_0/M00_AXI] [get_bd_addr_segs fpga1_top_slv_0/S00_AXI/S00_AXI_reg] SEG_fpga1_top_slv_0_S00_AXI_reg
  create_bd_addr_seg -range 0x00001000 -offset 0x40000000 [get_bd_addr_spaces fpga1_top_master_bram_0/M00_AXI] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] SEG_axi_bram_ctrl_0_Mem0
  create_bd_addr_seg -range 0x00010000 -offset 0x44A00000 [get_bd_addr_spaces fpga1_top_master_bram_0/M00_AXI] [get_bd_addr_segs fpga1_top_slv_0/S00_AXI/S00_AXI_reg] SEG_fpga1_top_slv_0_S00_AXI_reg


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


