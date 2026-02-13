//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
//Date        : Thu Feb 12 23:47:39 2026
//Host        : dylan_pc running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,da_board_cnt=1,da_clkrst_cnt=5,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (UART_RXD_0,
    UART_TXD_0,
    clk_in1_0,
    ext_reset_in_0);
  input UART_RXD_0;
  output UART_TXD_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_IN1_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_IN1_0, ASSOCIATED_RESET ext_reset_in_0, CLK_DOMAIN design_1_clk_in1_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk_in1_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.EXT_RESET_IN_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.EXT_RESET_IN_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input ext_reset_in_0;

  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [7:0]UART_0_DOUT;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire UART_0_DOUT_VLD;
  wire UART_RXD_0;
  wire UART_TXD_0;
  wire clk_wiz_1_clk_out1;
  wire ext_reset_in_0;
  wire [0:0]proc_sys_reset_0_peripheral_reset;

  assign clk_wiz_1_clk_out1 = clk_in1_0;
  design_1_UART_0_2 UART_0
       (.CLK(clk_wiz_1_clk_out1),
        .DIN(UART_0_DOUT),
        .DIN_VLD(UART_0_DOUT_VLD),
        .DOUT(UART_0_DOUT),
        .DOUT_VLD(UART_0_DOUT_VLD),
        .RST(proc_sys_reset_0_peripheral_reset),
        .UART_RXD(UART_RXD_0),
        .UART_TXD(UART_TXD_0));
  design_1_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(ext_reset_in_0),
        .mb_debug_sys_rst(1'b0),
        .peripheral_reset(proc_sys_reset_0_peripheral_reset),
        .slowest_sync_clk(clk_wiz_1_clk_out1));
  design_1_system_ila_0_2 system_ila_0
       (.clk(clk_wiz_1_clk_out1),
        .probe0(UART_0_DOUT),
        .probe1(UART_0_DOUT_VLD));
endmodule
