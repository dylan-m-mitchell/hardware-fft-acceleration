// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Mon Feb 16 16:24:16 2026
// Host        : dylan_pc running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/dlnmt/man_bram/man_bram.gen/sources_1/bd/design_1/ip/design_1_to_ram_0_0/design_1_to_ram_0_0_stub.v
// Design      : design_1_to_ram_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s25csga324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "design_1_to_ram_0_0,to_ram,{}" *) (* CORE_GENERATION_INFO = "design_1_to_ram_0_0,to_ram,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=to_ram,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,DEPTH=256}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "to_ram,Vivado 2025.1" *) 
module design_1_to_ram_0_0(i_clk, i_data, i_d_valid, i_rst_n, o_wr_addr, 
  o_wr_dv, o_wr_data)
/* synthesis syn_black_box black_box_pad_pin="i_data[7:0],i_d_valid,i_rst_n,o_wr_addr[7:0],o_wr_dv,o_wr_data[63:0]" */
/* synthesis syn_force_seq_prim="i_clk" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 i_clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_clk, ASSOCIATED_RESET i_rst_n, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_in1_0, INSERT_VIP 0" *) input i_clk /* synthesis syn_isclock = 1 */;
  input [7:0]i_data;
  input i_d_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 i_rst_n RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input i_rst_n;
  output [7:0]o_wr_addr;
  output o_wr_dv;
  output [63:0]o_wr_data;
endmodule
