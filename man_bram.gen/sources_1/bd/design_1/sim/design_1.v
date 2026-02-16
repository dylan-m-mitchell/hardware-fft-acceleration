//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
//Date        : Mon Feb 16 16:23:31 2026
//Host        : dylan_pc running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,da_board_cnt=1,da_clkrst_cnt=13,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (UART_RXD_0,
    UART_TXD_0,
    clk_in1_0,
    ext_reset_in_0);
  input UART_RXD_0;
  output UART_TXD_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_IN1_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_IN1_0, ASSOCIATED_RESET ext_reset_in_0, CLK_DOMAIN design_1_clk_in1_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk_in1_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.EXT_RESET_IN_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.EXT_RESET_IN_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input ext_reset_in_0;

  wire [7:0]UART_0_DOUT;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire UART_0_DOUT_VLD;
  wire UART_RXD_0;
  wire UART_TXD_0;
  wire clk_wiz_1_clk_out1;
  wire ext_reset_in_0;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [63:0]o_Rd_Data;
  wire [0:0]proc_sys_reset_0_peripheral_reset;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [7:0]to_ram_0_o_wr_addr;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [63:0]to_ram_0_o_wr_data;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire to_ram_0_o_wr_dv;

  assign clk_wiz_1_clk_out1 = clk_in1_0;
  design_1_RAM64_0_0 RAM64_0
       (.i_Rd_Addr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .i_Rd_Clk(clk_wiz_1_clk_out1),
        .i_Rd_En(1'b0),
        .i_Wr_Addr(to_ram_0_o_wr_addr),
        .i_Wr_Clk(clk_wiz_1_clk_out1),
        .i_Wr_DV(to_ram_0_o_wr_dv),
        .i_Wr_Data(to_ram_0_o_wr_data),
        .o_Rd_Data(o_Rd_Data));
  design_1_UART_0_2 UART_0
       (.CLK(clk_wiz_1_clk_out1),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIN_VLD(1'b0),
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
  design_1_system_ila_0_4 system_ila_0
       (.clk(clk_wiz_1_clk_out1),
        .probe0(o_Rd_Data),
        .probe1(UART_0_DOUT_VLD),
        .probe2(to_ram_0_o_wr_addr),
        .probe3(to_ram_0_o_wr_data),
        .probe4(to_ram_0_o_wr_dv));
  design_1_to_ram_0_0 to_ram_0
       (.i_clk(clk_wiz_1_clk_out1),
        .i_d_valid(UART_0_DOUT_VLD),
        .i_data(UART_0_DOUT),
        .i_rst_n(1'b0),
        .o_wr_addr(to_ram_0_o_wr_addr),
        .o_wr_data(to_ram_0_o_wr_data),
        .o_wr_dv(to_ram_0_o_wr_dv));
endmodule
