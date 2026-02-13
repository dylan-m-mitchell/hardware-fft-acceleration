// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Feb 12 23:48:28 2026
// Host        : dylan_pc running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/dlnmt/man_bram/man_bram.gen/sources_1/bd/design_1/ip/design_1_UART_0_2/design_1_UART_0_2_stub.v
// Design      : design_1_UART_0_2
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s25csga324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "design_1_UART_0_2,UART,{}" *) (* CORE_GENERATION_INFO = "design_1_UART_0_2,UART,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=UART,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,CLK_FREQ=100000000,BAUD_RATE=115200,PARITY_BIT=none,USE_DEBOUNCER=True}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "UART,Vivado 2025.1" *) 
module design_1_UART_0_2(CLK, RST, UART_TXD, UART_RXD, DIN, DIN_VLD, DIN_RDY, 
  DOUT, DOUT_VLD, FRAME_ERROR, PARITY_ERROR)
/* synthesis syn_black_box black_box_pad_pin="RST,UART_TXD,UART_RXD,DIN[7:0],DIN_VLD,DIN_RDY,DOUT[7:0],DOUT_VLD,FRAME_ERROR,PARITY_ERROR" */
/* synthesis syn_force_seq_prim="CLK" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK, ASSOCIATED_RESET RST, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_in1_0, INSERT_VIP 0" *) input CLK /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input RST;
  output UART_TXD;
  input UART_RXD;
  input [7:0]DIN;
  input DIN_VLD;
  output DIN_RDY;
  output [7:0]DOUT;
  output DOUT_VLD;
  output FRAME_ERROR;
  output PARITY_ERROR;
endmodule
