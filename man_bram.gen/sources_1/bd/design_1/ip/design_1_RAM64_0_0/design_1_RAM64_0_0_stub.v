// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Mon Feb 16 15:28:38 2026
// Host        : dylan_pc running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/dlnmt/man_bram/man_bram.gen/sources_1/bd/design_1/ip/design_1_RAM64_0_0/design_1_RAM64_0_0_stub.v
// Design      : design_1_RAM64_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s25csga324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "design_1_RAM64_0_0,RAM64,{}" *) (* CORE_GENERATION_INFO = "design_1_RAM64_0_0,RAM64,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=RAM64,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,WIDTH=64,DEPTH=256}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "RAM64,Vivado 2025.1" *) 
module design_1_RAM64_0_0(i_Wr_Clk, i_Wr_Addr, i_Wr_DV, i_Wr_Data, 
  i_Rd_Clk, i_Rd_Addr, i_Rd_En, o_Rd_DV, o_Rd_Data)
/* synthesis syn_black_box black_box_pad_pin="i_Wr_Addr[7:0],i_Wr_DV,i_Wr_Data[63:0],i_Rd_Addr[7:0],i_Rd_En,o_Rd_DV,o_Rd_Data[63:0]" */
/* synthesis syn_force_seq_prim="i_Wr_Clk" */
/* synthesis syn_force_seq_prim="i_Rd_Clk" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 i_Wr_Clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_Wr_Clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_in1_0, INSERT_VIP 0" *) input i_Wr_Clk /* synthesis syn_isclock = 1 */;
  input [7:0]i_Wr_Addr;
  input i_Wr_DV;
  input [63:0]i_Wr_Data;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 i_Rd_Clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_Rd_Clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_in1_0, INSERT_VIP 0" *) input i_Rd_Clk /* synthesis syn_isclock = 1 */;
  input [7:0]i_Rd_Addr;
  input i_Rd_En;
  output o_Rd_DV;
  output [63:0]o_Rd_Data;
endmodule
