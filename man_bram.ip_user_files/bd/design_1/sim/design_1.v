//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
//Date        : Wed Mar 25 19:57:43 2026
//Host        : dylan_pc running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=7,numReposBlks=7,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=6,numPkgbdBlks=0,bdsource=USER,da_board_cnt=1,da_clkrst_cnt=23,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (UART_RXD_0,
    UART_TXD_0,
    clk_in1_0,
    ext_reset_in_0);
  input UART_RXD_0;
  output UART_TXD_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_IN1_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_IN1_0, ASSOCIATED_RESET ext_reset_in_0, CLK_DOMAIN design_1_clk_in1_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk_in1_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.EXT_RESET_IN_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.EXT_RESET_IN_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input ext_reset_in_0;

  wire DummyFFT_0_o_DV;
  wire [7:0]DummyFFT_0_o_Wr_Addr;
  wire RAM128_0_o_RAM_Full;
  wire RAM128_0_o_Rd_DV;
  wire [127:0]RAM128_0_o_Rd_Data;
  wire RAM64_0_o_Rd_DV;
  wire [127:0]RAM64_0_o_Rd_Data;
  wire [7:0]ToUART_0_o_Rd_Addr;
  wire ToUART_0_o_Rd_En;
  wire [7:0]ToUART_0_o_UART_Data;
  wire ToUART_0_o_UART_Valid;
  wire UART_0_DIN_RDY;
  wire [7:0]UART_0_DOUT;
  wire UART_0_DOUT_VLD;
  wire UART_RXD_0;
  wire UART_TXD_0;
  wire clk_in1_0;
  wire ext_reset_in_0;
  wire [0:0]proc_sys_reset_0_peripheral_reset;
  wire [127:0]ram_to_fft256_bridge_0_o_fft_wr_data;
  wire [7:0]ram_to_fft256_bridge_0_o_ram_rd_addr;
  wire ram_to_fft256_bridge_0_o_ram_rd_en;
  wire to_ram_0_o_Data_Rd;
  wire [7:0]to_ram_0_o_wr_addr;
  wire [127:0]to_ram_0_o_wr_data;
  wire to_ram_0_o_wr_dv;

  design_1_RAM128_0_0 RAM128_0
       (.i_Rd_Addr(ToUART_0_o_Rd_Addr),
        .i_Rd_Clk(clk_in1_0),
        .i_Rd_En(ToUART_0_o_Rd_En),
        .i_Wr_Addr(DummyFFT_0_o_Wr_Addr),
        .i_Wr_Clk(clk_in1_0),
        .i_Wr_DV(DummyFFT_0_o_DV),
        .i_Wr_Data(ram_to_fft256_bridge_0_o_fft_wr_data),
        .o_RAM_Full(RAM128_0_o_RAM_Full),
        .o_Rd_DV(RAM128_0_o_Rd_DV),
        .o_Rd_Data(RAM128_0_o_Rd_Data));
  design_1_RAM64_0_0 RAM64_0
       (.i_Rd_Addr(ram_to_fft256_bridge_0_o_ram_rd_addr),
        .i_Rd_Clk(clk_in1_0),
        .i_Rd_En(ram_to_fft256_bridge_0_o_ram_rd_en),
        .i_Wr_Addr(to_ram_0_o_wr_addr),
        .i_Wr_Clk(clk_in1_0),
        .i_Wr_DV(to_ram_0_o_wr_dv),
        .i_Wr_Data(to_ram_0_o_wr_data),
        .o_Rd_DV(RAM64_0_o_Rd_DV),
        .o_Rd_Data(RAM64_0_o_Rd_Data));
  design_1_ToUART_0_1 ToUART_0
       (.i_128(RAM128_0_o_Rd_Data),
        .i_Ram_Full(RAM128_0_o_RAM_Full),
        .i_UART_Ready(UART_0_DIN_RDY),
        .i_Valid(RAM128_0_o_Rd_DV),
        .i_clk(clk_in1_0),
        .o_Rd_Addr(ToUART_0_o_Rd_Addr),
        .o_Rd_En(ToUART_0_o_Rd_En),
        .o_UART_Data(ToUART_0_o_UART_Data),
        .o_UART_Valid(ToUART_0_o_UART_Valid));
  design_1_UART_0_2 UART_0
       (.CLK(clk_in1_0),
        .DIN(ToUART_0_o_UART_Data),
        .DIN_RDY(UART_0_DIN_RDY),
        .DIN_VLD(ToUART_0_o_UART_Valid),
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
        .slowest_sync_clk(clk_in1_0));
  design_1_ram_to_fft256_bridge_0_0 ram_to_fft256_bridge_0
       (.i_clk(clk_in1_0),
        .i_ram_rd_data(RAM64_0_o_Rd_Data),
        .i_ram_rd_dv(RAM64_0_o_Rd_DV),
        .i_rst_n(ext_reset_in_0),
        .i_start(to_ram_0_o_Data_Rd),
        .o_ram_rd_addr(ram_to_fft256_bridge_0_o_ram_rd_addr),
        .o_ram_rd_en(ram_to_fft256_bridge_0_o_ram_rd_en),
        .o_ram_wr_addr(DummyFFT_0_o_Wr_Addr),
        .o_ram_wr_data(ram_to_fft256_bridge_0_o_fft_wr_data),
        .o_ram_wr_en(DummyFFT_0_o_DV));
  design_1_to_ram_0_0 to_ram_0
       (.i_clk(clk_in1_0),
        .i_d_valid(UART_0_DOUT_VLD),
        .i_data(UART_0_DOUT),
        .i_rst_n(ext_reset_in_0),
        .o_Data_Rd(to_ram_0_o_Data_Rd),
        .o_wr_addr(to_ram_0_o_wr_addr),
        .o_wr_data(to_ram_0_o_wr_data),
        .o_wr_dv(to_ram_0_o_wr_dv));
endmodule
