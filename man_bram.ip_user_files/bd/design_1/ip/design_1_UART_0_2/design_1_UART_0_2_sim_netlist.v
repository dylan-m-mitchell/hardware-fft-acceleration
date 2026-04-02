// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Feb 12 23:48:28 2026
// Host        : dylan_pc running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/dlnmt/man_bram/man_bram.gen/sources_1/bd/design_1/ip/design_1_UART_0_2/design_1_UART_0_2_sim_netlist.v
// Design      : design_1_UART_0_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s25csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_UART_0_2,UART,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "UART,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module design_1_UART_0_2
   (CLK,
    RST,
    UART_TXD,
    UART_RXD,
    DIN,
    DIN_VLD,
    DIN_RDY,
    DOUT,
    DOUT_VLD,
    FRAME_ERROR,
    PARITY_ERROR);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK, ASSOCIATED_RESET RST, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_in1_0, INSERT_VIP 0" *) input CLK;
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

  wire \<const0> ;
  wire CLK;
  wire [7:0]DIN;
  wire DIN_RDY;
  wire DIN_VLD;
  wire [7:0]DOUT;
  wire DOUT_VLD;
  wire FRAME_ERROR;
  wire RST;
  wire UART_RXD;
  wire UART_TXD;

  assign PARITY_ERROR = \<const0> ;
  GND GND
       (.G(\<const0> ));
  design_1_UART_0_2_UART inst
       (.CLK(CLK),
        .DIN(DIN),
        .DIN_RDY(DIN_RDY),
        .DIN_VLD(DIN_VLD),
        .DOUT(DOUT),
        .DOUT_VLD(DOUT_VLD),
        .FRAME_ERROR(FRAME_ERROR),
        .RST(RST),
        .UART_RXD(UART_RXD),
        .UART_TXD(UART_TXD));
endmodule

(* ORIG_REF_NAME = "UART" *) 
module design_1_UART_0_2_UART
   (DOUT,
    DOUT_VLD,
    FRAME_ERROR,
    UART_TXD,
    DIN_RDY,
    RST,
    CLK,
    DIN,
    DIN_VLD,
    UART_RXD);
  output [7:0]DOUT;
  output DOUT_VLD;
  output FRAME_ERROR;
  output UART_TXD;
  output DIN_RDY;
  input RST;
  input CLK;
  input [7:0]DIN;
  input DIN_VLD;
  input UART_RXD;

  wire CLK;
  wire DEB_OUT;
  wire [7:0]DIN;
  wire DIN_RDY;
  wire DIN_VLD;
  wire [7:0]DOUT;
  wire DOUT_VLD;
  wire FRAME_ERROR;
  wire RST;
  wire UART_RXD;
  wire UART_TXD;
  wire os_clk_en;
  wire uart_rxd_debounced;
  wire uart_rxd_meta_n;
  wire uart_rxd_meta_n_i_1_n_0;
  wire uart_rxd_synced_n;

  design_1_UART_0_2_UART_CLK_DIV os_clk_divider_i
       (.CLK(CLK),
        .E(os_clk_en),
        .RST(RST));
  design_1_UART_0_2_UART_RX uart_rx_i
       (.CLK(CLK),
        .D(uart_rxd_debounced),
        .DEB_OUT(DEB_OUT),
        .DOUT(DOUT),
        .DOUT_VLD(DOUT_VLD),
        .E(os_clk_en),
        .FRAME_ERROR(FRAME_ERROR),
        .RST(RST));
  LUT1 #(
    .INIT(2'h1)) 
    uart_rxd_meta_n_i_1
       (.I0(UART_RXD),
        .O(uart_rxd_meta_n_i_1_n_0));
  FDRE uart_rxd_meta_n_reg
       (.C(CLK),
        .CE(1'b1),
        .D(uart_rxd_meta_n_i_1_n_0),
        .Q(uart_rxd_meta_n),
        .R(1'b0));
  FDRE uart_rxd_synced_n_reg
       (.C(CLK),
        .CE(1'b1),
        .D(uart_rxd_meta_n),
        .Q(uart_rxd_synced_n),
        .R(1'b0));
  design_1_UART_0_2_UART_TX uart_tx_i
       (.CLK(CLK),
        .DIN(DIN),
        .DIN_RDY(DIN_RDY),
        .DIN_VLD(DIN_VLD),
        .E(os_clk_en),
        .RST(RST),
        .UART_TXD(UART_TXD));
  design_1_UART_0_2_UART_DEBOUNCER \use_debouncer_g.debouncer_i 
       (.CLK(CLK),
        .D(uart_rxd_synced_n),
        .DEB_OUT(DEB_OUT),
        .DEB_OUT_reg_0(uart_rxd_debounced));
endmodule

(* ORIG_REF_NAME = "UART_CLK_DIV" *) 
module design_1_UART_0_2_UART_CLK_DIV
   (E,
    CLK,
    RST);
  output [0:0]E;
  input CLK;
  input RST;

  wire CLK;
  wire [0:0]E;
  wire RST;
  wire \clk_div_cnt[5]_i_1_n_0 ;
  wire \clk_div_cnt[5]_i_3_n_0 ;
  wire clk_div_cnt_mark;
  wire [5:0]clk_div_cnt_reg;
  wire [5:0]data0;

  LUT6 #(
    .INIT(64'h0400000000000000)) 
    DIV_MARK_i_1__1
       (.I0(clk_div_cnt_reg[3]),
        .I1(clk_div_cnt_reg[4]),
        .I2(clk_div_cnt_reg[1]),
        .I3(clk_div_cnt_reg[5]),
        .I4(clk_div_cnt_reg[0]),
        .I5(clk_div_cnt_reg[2]),
        .O(clk_div_cnt_mark));
  FDRE DIV_MARK_reg
       (.C(CLK),
        .CE(1'b1),
        .D(clk_div_cnt_mark),
        .Q(E),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \clk_div_cnt[0]_i_1 
       (.I0(clk_div_cnt_reg[0]),
        .O(data0[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \clk_div_cnt[1]_i_1 
       (.I0(clk_div_cnt_reg[0]),
        .I1(clk_div_cnt_reg[1]),
        .O(data0[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \clk_div_cnt[2]_i_1 
       (.I0(clk_div_cnt_reg[0]),
        .I1(clk_div_cnt_reg[1]),
        .I2(clk_div_cnt_reg[2]),
        .O(data0[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \clk_div_cnt[3]_i_1 
       (.I0(clk_div_cnt_reg[1]),
        .I1(clk_div_cnt_reg[0]),
        .I2(clk_div_cnt_reg[2]),
        .I3(clk_div_cnt_reg[3]),
        .O(data0[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \clk_div_cnt[4]_i_1 
       (.I0(clk_div_cnt_reg[2]),
        .I1(clk_div_cnt_reg[0]),
        .I2(clk_div_cnt_reg[1]),
        .I3(clk_div_cnt_reg[3]),
        .I4(clk_div_cnt_reg[4]),
        .O(data0[4]));
  LUT2 #(
    .INIT(4'hE)) 
    \clk_div_cnt[5]_i_1 
       (.I0(RST),
        .I1(\clk_div_cnt[5]_i_3_n_0 ),
        .O(\clk_div_cnt[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \clk_div_cnt[5]_i_2 
       (.I0(clk_div_cnt_reg[3]),
        .I1(clk_div_cnt_reg[1]),
        .I2(clk_div_cnt_reg[0]),
        .I3(clk_div_cnt_reg[2]),
        .I4(clk_div_cnt_reg[4]),
        .I5(clk_div_cnt_reg[5]),
        .O(data0[5]));
  LUT6 #(
    .INIT(64'h0008000000000000)) 
    \clk_div_cnt[5]_i_3 
       (.I0(clk_div_cnt_reg[0]),
        .I1(clk_div_cnt_reg[5]),
        .I2(clk_div_cnt_reg[3]),
        .I3(clk_div_cnt_reg[1]),
        .I4(clk_div_cnt_reg[4]),
        .I5(clk_div_cnt_reg[2]),
        .O(\clk_div_cnt[5]_i_3_n_0 ));
  FDRE \clk_div_cnt_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[0]),
        .Q(clk_div_cnt_reg[0]),
        .R(\clk_div_cnt[5]_i_1_n_0 ));
  FDRE \clk_div_cnt_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[1]),
        .Q(clk_div_cnt_reg[1]),
        .R(\clk_div_cnt[5]_i_1_n_0 ));
  FDRE \clk_div_cnt_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[2]),
        .Q(clk_div_cnt_reg[2]),
        .R(\clk_div_cnt[5]_i_1_n_0 ));
  FDRE \clk_div_cnt_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[3]),
        .Q(clk_div_cnt_reg[3]),
        .R(\clk_div_cnt[5]_i_1_n_0 ));
  FDRE \clk_div_cnt_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[4]),
        .Q(clk_div_cnt_reg[4]),
        .R(\clk_div_cnt[5]_i_1_n_0 ));
  FDRE \clk_div_cnt_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[5]),
        .Q(clk_div_cnt_reg[5]),
        .R(\clk_div_cnt[5]_i_1_n_0 ));
endmodule

(* ORIG_REF_NAME = "UART_CLK_DIV" *) 
module design_1_UART_0_2_UART_CLK_DIV__parameterized0
   (rx_clk_en,
    \FSM_onehot_fsm_pstate_reg[3] ,
    DIV_MARK_reg_0,
    FRAME_ERROR0,
    CLK,
    Q,
    DEB_OUT,
    E);
  output rx_clk_en;
  output \FSM_onehot_fsm_pstate_reg[3] ;
  output [0:0]DIV_MARK_reg_0;
  output FRAME_ERROR0;
  input CLK;
  input [2:0]Q;
  input DEB_OUT;
  input [0:0]E;

  wire CLK;
  wire DEB_OUT;
  wire DIV_MARK_i_1_n_0;
  wire [0:0]DIV_MARK_reg_0;
  wire [0:0]E;
  wire FRAME_ERROR0;
  wire \FSM_onehot_fsm_pstate_reg[3] ;
  wire [2:0]Q;
  wire \clk_div_cnt[0]_i_1__1_n_0 ;
  wire \clk_div_cnt[1]_i_1_n_0 ;
  wire \clk_div_cnt[2]_i_1_n_0 ;
  wire \clk_div_cnt[3]_i_1_n_0 ;
  wire \clk_div_cnt_reg_n_0_[0] ;
  wire \clk_div_cnt_reg_n_0_[1] ;
  wire \clk_div_cnt_reg_n_0_[2] ;
  wire \clk_div_cnt_reg_n_0_[3] ;
  wire rx_clk_en;

  LUT5 #(
    .INIT(32'h00000080)) 
    DIV_MARK_i_1
       (.I0(E),
        .I1(\clk_div_cnt_reg_n_0_[0] ),
        .I2(\clk_div_cnt_reg_n_0_[1] ),
        .I3(\clk_div_cnt_reg_n_0_[3] ),
        .I4(\clk_div_cnt_reg_n_0_[2] ),
        .O(DIV_MARK_i_1_n_0));
  FDRE DIV_MARK_reg
       (.C(CLK),
        .CE(1'b1),
        .D(DIV_MARK_i_1_n_0),
        .Q(rx_clk_en),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h08)) 
    DOUT_VLD_i_1
       (.I0(Q[2]),
        .I1(rx_clk_en),
        .I2(DEB_OUT),
        .O(\FSM_onehot_fsm_pstate_reg[3] ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h80)) 
    FRAME_ERROR_i_1
       (.I0(Q[2]),
        .I1(rx_clk_en),
        .I2(DEB_OUT),
        .O(FRAME_ERROR0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \clk_div_cnt[0]_i_1__1 
       (.I0(\clk_div_cnt_reg_n_0_[0] ),
        .O(\clk_div_cnt[0]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \clk_div_cnt[1]_i_1 
       (.I0(\clk_div_cnt_reg_n_0_[1] ),
        .I1(\clk_div_cnt_reg_n_0_[0] ),
        .O(\clk_div_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \clk_div_cnt[2]_i_1 
       (.I0(\clk_div_cnt_reg_n_0_[1] ),
        .I1(\clk_div_cnt_reg_n_0_[0] ),
        .I2(\clk_div_cnt_reg_n_0_[2] ),
        .O(\clk_div_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \clk_div_cnt[3]_i_1 
       (.I0(\clk_div_cnt_reg_n_0_[1] ),
        .I1(\clk_div_cnt_reg_n_0_[0] ),
        .I2(\clk_div_cnt_reg_n_0_[2] ),
        .I3(\clk_div_cnt_reg_n_0_[3] ),
        .O(\clk_div_cnt[3]_i_1_n_0 ));
  FDRE \clk_div_cnt_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(\clk_div_cnt[0]_i_1__1_n_0 ),
        .Q(\clk_div_cnt_reg_n_0_[0] ),
        .R(Q[0]));
  FDRE \clk_div_cnt_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(\clk_div_cnt[1]_i_1_n_0 ),
        .Q(\clk_div_cnt_reg_n_0_[1] ),
        .R(Q[0]));
  FDRE \clk_div_cnt_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(\clk_div_cnt[2]_i_1_n_0 ),
        .Q(\clk_div_cnt_reg_n_0_[2] ),
        .R(Q[0]));
  FDRE \clk_div_cnt_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(\clk_div_cnt[3]_i_1_n_0 ),
        .Q(\clk_div_cnt_reg_n_0_[3] ),
        .R(Q[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \rx_data[7]_i_1 
       (.I0(rx_clk_en),
        .I1(Q[1]),
        .O(DIV_MARK_reg_0));
endmodule

(* ORIG_REF_NAME = "UART_CLK_DIV" *) 
module design_1_UART_0_2_UART_CLK_DIV__parameterized1
   (tx_clk_en,
    D,
    CLK,
    E,
    tx_nstate2,
    Q,
    DIN_VLD,
    tx_bit_count);
  output tx_clk_en;
  output [4:0]D;
  input CLK;
  input [0:0]E;
  input tx_nstate2;
  input [4:0]Q;
  input DIN_VLD;
  input [2:0]tx_bit_count;

  wire CLK;
  wire [4:0]D;
  wire DIN_VLD;
  wire DIV_MARK_i_1__0_n_0;
  wire [0:0]E;
  wire [4:0]Q;
  wire \clk_div_cnt[0]_i_1__0_n_0 ;
  wire \clk_div_cnt[1]_i_1_n_0 ;
  wire \clk_div_cnt[2]_i_1_n_0 ;
  wire \clk_div_cnt[3]_i_1_n_0 ;
  wire \clk_div_cnt_reg_n_0_[0] ;
  wire \clk_div_cnt_reg_n_0_[1] ;
  wire \clk_div_cnt_reg_n_0_[2] ;
  wire \clk_div_cnt_reg_n_0_[3] ;
  wire [2:0]tx_bit_count;
  wire tx_clk_en;
  wire tx_nstate2;

  LUT5 #(
    .INIT(32'h00000020)) 
    DIV_MARK_i_1__0
       (.I0(E),
        .I1(\clk_div_cnt_reg_n_0_[1] ),
        .I2(\clk_div_cnt_reg_n_0_[0] ),
        .I3(\clk_div_cnt_reg_n_0_[3] ),
        .I4(\clk_div_cnt_reg_n_0_[2] ),
        .O(DIV_MARK_i_1__0_n_0));
  FDRE DIV_MARK_reg
       (.C(CLK),
        .CE(1'b1),
        .D(DIV_MARK_i_1__0_n_0),
        .Q(tx_clk_en),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0E0A)) 
    \FSM_onehot_tx_pstate[0]_i_1 
       (.I0(Q[0]),
        .I1(tx_clk_en),
        .I2(DIN_VLD),
        .I3(Q[4]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hFF44F444)) 
    \FSM_onehot_tx_pstate[1]_i_1 
       (.I0(tx_clk_en),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(DIN_VLD),
        .I4(Q[4]),
        .O(D[1]));
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_onehot_tx_pstate[2]_i_1 
       (.I0(Q[1]),
        .I1(tx_clk_en),
        .I2(Q[2]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hBFFFFFFF88888888)) 
    \FSM_onehot_tx_pstate[3]_i_1 
       (.I0(Q[2]),
        .I1(tx_clk_en),
        .I2(tx_bit_count[2]),
        .I3(tx_bit_count[0]),
        .I4(tx_bit_count[1]),
        .I5(Q[3]),
        .O(D[3]));
  LUT5 #(
    .INIT(32'h880F8800)) 
    \FSM_onehot_tx_pstate[4]_i_1 
       (.I0(tx_nstate2),
        .I1(Q[3]),
        .I2(DIN_VLD),
        .I3(tx_clk_en),
        .I4(Q[4]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \clk_div_cnt[0]_i_1__0 
       (.I0(\clk_div_cnt_reg_n_0_[0] ),
        .O(\clk_div_cnt[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \clk_div_cnt[1]_i_1 
       (.I0(\clk_div_cnt_reg_n_0_[1] ),
        .I1(\clk_div_cnt_reg_n_0_[0] ),
        .O(\clk_div_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \clk_div_cnt[2]_i_1 
       (.I0(\clk_div_cnt_reg_n_0_[1] ),
        .I1(\clk_div_cnt_reg_n_0_[0] ),
        .I2(\clk_div_cnt_reg_n_0_[2] ),
        .O(\clk_div_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \clk_div_cnt[3]_i_1 
       (.I0(\clk_div_cnt_reg_n_0_[1] ),
        .I1(\clk_div_cnt_reg_n_0_[0] ),
        .I2(\clk_div_cnt_reg_n_0_[2] ),
        .I3(\clk_div_cnt_reg_n_0_[3] ),
        .O(\clk_div_cnt[3]_i_1_n_0 ));
  FDRE \clk_div_cnt_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(\clk_div_cnt[0]_i_1__0_n_0 ),
        .Q(\clk_div_cnt_reg_n_0_[0] ),
        .R(Q[0]));
  FDRE \clk_div_cnt_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(\clk_div_cnt[1]_i_1_n_0 ),
        .Q(\clk_div_cnt_reg_n_0_[1] ),
        .R(Q[0]));
  FDRE \clk_div_cnt_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(\clk_div_cnt[2]_i_1_n_0 ),
        .Q(\clk_div_cnt_reg_n_0_[2] ),
        .R(Q[0]));
  FDRE \clk_div_cnt_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(\clk_div_cnt[3]_i_1_n_0 ),
        .Q(\clk_div_cnt_reg_n_0_[3] ),
        .R(Q[0]));
endmodule

(* ORIG_REF_NAME = "UART_DEBOUNCER" *) 
module design_1_UART_0_2_UART_DEBOUNCER
   (DEB_OUT,
    DEB_OUT_reg_0,
    CLK,
    D);
  output DEB_OUT;
  output [0:0]DEB_OUT_reg_0;
  input CLK;
  input [0:0]D;

  wire CLK;
  wire [0:0]D;
  wire DEB_OUT;
  wire DEB_OUT_i_1_n_0;
  wire [0:0]DEB_OUT_reg_0;
  wire \input_shreg_reg_n_0_[0] ;
  wire p_1_in;
  wire p_2_in;

  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'hEAAAAAA8)) 
    DEB_OUT_i_1
       (.I0(DEB_OUT),
        .I1(p_1_in),
        .I2(\input_shreg_reg_n_0_[0] ),
        .I3(D),
        .I4(p_2_in),
        .O(DEB_OUT_i_1_n_0));
  FDRE DEB_OUT_reg
       (.C(CLK),
        .CE(1'b1),
        .D(DEB_OUT_i_1_n_0),
        .Q(DEB_OUT),
        .R(1'b0));
  FDRE \input_shreg_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(D),
        .Q(\input_shreg_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \input_shreg_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\input_shreg_reg_n_0_[0] ),
        .Q(p_1_in),
        .R(1'b0));
  FDRE \input_shreg_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(p_1_in),
        .Q(p_2_in),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \rx_data[7]_i_2 
       (.I0(DEB_OUT),
        .O(DEB_OUT_reg_0));
endmodule

(* ORIG_REF_NAME = "UART_RX" *) 
module design_1_UART_0_2_UART_RX
   (DOUT_VLD,
    FRAME_ERROR,
    DOUT,
    CLK,
    RST,
    DEB_OUT,
    E,
    D);
  output DOUT_VLD;
  output FRAME_ERROR;
  output [7:0]DOUT;
  input CLK;
  input RST;
  input DEB_OUT;
  input [0:0]E;
  input [0:0]D;

  wire CLK;
  wire [0:0]D;
  wire DEB_OUT;
  wire [7:0]DOUT;
  wire DOUT_VLD;
  wire [0:0]E;
  wire FRAME_ERROR;
  wire FRAME_ERROR0;
  wire \FSM_onehot_fsm_pstate[0]_i_1_n_0 ;
  wire \FSM_onehot_fsm_pstate[1]_i_1_n_0 ;
  wire \FSM_onehot_fsm_pstate[2]_i_1_n_0 ;
  wire \FSM_onehot_fsm_pstate[3]_i_1_n_0 ;
  wire \FSM_onehot_fsm_pstate_reg_n_0_[1] ;
  wire RST;
  wire fsm_databits;
  wire fsm_idle;
  wire fsm_stopbit;
  wire [2:0]rx_bit_count;
  wire rx_bit_count0;
  wire \rx_bit_count[0]_i_1_n_0 ;
  wire \rx_bit_count[1]_i_1_n_0 ;
  wire \rx_bit_count[2]_i_1_n_0 ;
  wire rx_clk_divider_i_n_1;
  wire rx_clk_en;

  FDRE DOUT_VLD_reg
       (.C(CLK),
        .CE(1'b1),
        .D(rx_clk_divider_i_n_1),
        .Q(DOUT_VLD),
        .R(RST));
  FDRE FRAME_ERROR_reg
       (.C(CLK),
        .CE(1'b1),
        .D(FRAME_ERROR0),
        .Q(FRAME_ERROR),
        .R(RST));
  LUT4 #(
    .INIT(16'hF444)) 
    \FSM_onehot_fsm_pstate[0]_i_1 
       (.I0(DEB_OUT),
        .I1(fsm_idle),
        .I2(rx_clk_en),
        .I3(fsm_stopbit),
        .O(\FSM_onehot_fsm_pstate[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_fsm_pstate[1]_i_1 
       (.I0(DEB_OUT),
        .I1(fsm_idle),
        .I2(rx_clk_en),
        .I3(\FSM_onehot_fsm_pstate_reg_n_0_[1] ),
        .O(\FSM_onehot_fsm_pstate[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFFFFF88888888)) 
    \FSM_onehot_fsm_pstate[2]_i_1 
       (.I0(\FSM_onehot_fsm_pstate_reg_n_0_[1] ),
        .I1(rx_clk_en),
        .I2(rx_bit_count[2]),
        .I3(rx_bit_count[0]),
        .I4(rx_bit_count[1]),
        .I5(fsm_databits),
        .O(\FSM_onehot_fsm_pstate[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000FFFF80000000)) 
    \FSM_onehot_fsm_pstate[3]_i_1 
       (.I0(rx_bit_count[2]),
        .I1(rx_bit_count[0]),
        .I2(rx_bit_count[1]),
        .I3(fsm_databits),
        .I4(rx_clk_en),
        .I5(fsm_stopbit),
        .O(\FSM_onehot_fsm_pstate[3]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "startbit:0010,databits:0100,paritybit:011,stopbit:1000,idle:0001" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_fsm_pstate_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\FSM_onehot_fsm_pstate[0]_i_1_n_0 ),
        .Q(fsm_idle),
        .S(RST));
  (* FSM_ENCODED_STATES = "startbit:0010,databits:0100,paritybit:011,stopbit:1000,idle:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_pstate_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\FSM_onehot_fsm_pstate[1]_i_1_n_0 ),
        .Q(\FSM_onehot_fsm_pstate_reg_n_0_[1] ),
        .R(RST));
  (* FSM_ENCODED_STATES = "startbit:0010,databits:0100,paritybit:011,stopbit:1000,idle:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_pstate_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\FSM_onehot_fsm_pstate[2]_i_1_n_0 ),
        .Q(fsm_databits),
        .R(RST));
  (* FSM_ENCODED_STATES = "startbit:0010,databits:0100,paritybit:011,stopbit:1000,idle:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_pstate_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(\FSM_onehot_fsm_pstate[3]_i_1_n_0 ),
        .Q(fsm_stopbit),
        .R(RST));
  LUT3 #(
    .INIT(8'h78)) 
    \rx_bit_count[0]_i_1 
       (.I0(rx_clk_en),
        .I1(fsm_databits),
        .I2(rx_bit_count[0]),
        .O(\rx_bit_count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \rx_bit_count[1]_i_1 
       (.I0(rx_bit_count[0]),
        .I1(rx_clk_en),
        .I2(fsm_databits),
        .I3(rx_bit_count[1]),
        .O(\rx_bit_count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \rx_bit_count[2]_i_1 
       (.I0(rx_bit_count[0]),
        .I1(rx_bit_count[1]),
        .I2(rx_clk_en),
        .I3(fsm_databits),
        .I4(rx_bit_count[2]),
        .O(\rx_bit_count[2]_i_1_n_0 ));
  FDRE \rx_bit_count_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\rx_bit_count[0]_i_1_n_0 ),
        .Q(rx_bit_count[0]),
        .R(RST));
  FDRE \rx_bit_count_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\rx_bit_count[1]_i_1_n_0 ),
        .Q(rx_bit_count[1]),
        .R(RST));
  FDRE \rx_bit_count_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\rx_bit_count[2]_i_1_n_0 ),
        .Q(rx_bit_count[2]),
        .R(RST));
  design_1_UART_0_2_UART_CLK_DIV__parameterized0 rx_clk_divider_i
       (.CLK(CLK),
        .DEB_OUT(DEB_OUT),
        .DIV_MARK_reg_0(rx_bit_count0),
        .E(E),
        .FRAME_ERROR0(FRAME_ERROR0),
        .\FSM_onehot_fsm_pstate_reg[3] (rx_clk_divider_i_n_1),
        .Q({fsm_stopbit,fsm_databits,fsm_idle}),
        .rx_clk_en(rx_clk_en));
  FDRE \rx_data_reg[0] 
       (.C(CLK),
        .CE(rx_bit_count0),
        .D(DOUT[1]),
        .Q(DOUT[0]),
        .R(1'b0));
  FDRE \rx_data_reg[1] 
       (.C(CLK),
        .CE(rx_bit_count0),
        .D(DOUT[2]),
        .Q(DOUT[1]),
        .R(1'b0));
  FDRE \rx_data_reg[2] 
       (.C(CLK),
        .CE(rx_bit_count0),
        .D(DOUT[3]),
        .Q(DOUT[2]),
        .R(1'b0));
  FDRE \rx_data_reg[3] 
       (.C(CLK),
        .CE(rx_bit_count0),
        .D(DOUT[4]),
        .Q(DOUT[3]),
        .R(1'b0));
  FDRE \rx_data_reg[4] 
       (.C(CLK),
        .CE(rx_bit_count0),
        .D(DOUT[5]),
        .Q(DOUT[4]),
        .R(1'b0));
  FDRE \rx_data_reg[5] 
       (.C(CLK),
        .CE(rx_bit_count0),
        .D(DOUT[6]),
        .Q(DOUT[5]),
        .R(1'b0));
  FDRE \rx_data_reg[6] 
       (.C(CLK),
        .CE(rx_bit_count0),
        .D(DOUT[7]),
        .Q(DOUT[6]),
        .R(1'b0));
  FDRE \rx_data_reg[7] 
       (.C(CLK),
        .CE(rx_bit_count0),
        .D(D),
        .Q(DOUT[7]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "UART_TX" *) 
module design_1_UART_0_2_UART_TX
   (UART_TXD,
    DIN_RDY,
    CLK,
    RST,
    E,
    DIN,
    DIN_VLD);
  output UART_TXD;
  output DIN_RDY;
  input CLK;
  input RST;
  input [0:0]E;
  input [7:0]DIN;
  input DIN_VLD;

  wire CLK;
  wire [7:0]DIN;
  wire DIN_RDY;
  wire DIN_VLD;
  wire [0:0]E;
  wire \FSM_onehot_tx_pstate_reg_n_0_[1] ;
  wire \FSM_onehot_tx_pstate_reg_n_0_[4] ;
  wire RST;
  wire UART_TXD;
  wire UART_TXD_i_1_n_0;
  wire UART_TXD_i_2_n_0;
  wire UART_TXD_i_3_n_0;
  wire [2:0]tx_bit_count;
  wire \tx_bit_count[0]_i_1_n_0 ;
  wire \tx_bit_count[1]_i_1_n_0 ;
  wire \tx_bit_count[2]_i_1_n_0 ;
  wire tx_clk_div_clr;
  wire tx_clk_divider_i_n_1;
  wire tx_clk_divider_i_n_2;
  wire tx_clk_divider_i_n_3;
  wire tx_clk_divider_i_n_4;
  wire tx_clk_divider_i_n_5;
  wire tx_clk_en;
  wire [7:0]tx_data;
  wire tx_data0;
  wire [1:0]tx_data_out_sel;
  wire tx_nstate2;

  LUT2 #(
    .INIT(4'hE)) 
    DIN_RDY_INST_0
       (.I0(tx_clk_div_clr),
        .I1(\FSM_onehot_tx_pstate_reg_n_0_[4] ),
        .O(DIN_RDY));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \FSM_onehot_tx_pstate[4]_i_2 
       (.I0(tx_bit_count[1]),
        .I1(tx_bit_count[0]),
        .I2(tx_bit_count[2]),
        .O(tx_nstate2));
  (* FSM_ENCODED_STATES = "startbit:00100,databits:01000,paritybit:100,txsync:00010,stopbit:10000,idle:00001" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_tx_pstate_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(tx_clk_divider_i_n_5),
        .Q(tx_clk_div_clr),
        .S(RST));
  (* FSM_ENCODED_STATES = "startbit:00100,databits:01000,paritybit:100,txsync:00010,stopbit:10000,idle:00001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_tx_pstate_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(tx_clk_divider_i_n_4),
        .Q(\FSM_onehot_tx_pstate_reg_n_0_[1] ),
        .R(RST));
  (* FSM_ENCODED_STATES = "startbit:00100,databits:01000,paritybit:100,txsync:00010,stopbit:10000,idle:00001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_tx_pstate_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(tx_clk_divider_i_n_3),
        .Q(tx_data_out_sel[0]),
        .R(RST));
  (* FSM_ENCODED_STATES = "startbit:00100,databits:01000,paritybit:100,txsync:00010,stopbit:10000,idle:00001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_tx_pstate_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(tx_clk_divider_i_n_2),
        .Q(tx_data_out_sel[1]),
        .R(RST));
  (* FSM_ENCODED_STATES = "startbit:00100,databits:01000,paritybit:100,txsync:00010,stopbit:10000,idle:00001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_tx_pstate_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(tx_clk_divider_i_n_1),
        .Q(\FSM_onehot_tx_pstate_reg_n_0_[4] ),
        .R(RST));
  LUT5 #(
    .INIT(32'h45405555)) 
    UART_TXD_i_1
       (.I0(tx_data_out_sel[0]),
        .I1(UART_TXD_i_2_n_0),
        .I2(tx_bit_count[2]),
        .I3(UART_TXD_i_3_n_0),
        .I4(tx_data_out_sel[1]),
        .O(UART_TXD_i_1_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    UART_TXD_i_2
       (.I0(tx_data[7]),
        .I1(tx_data[6]),
        .I2(tx_bit_count[1]),
        .I3(tx_data[5]),
        .I4(tx_bit_count[0]),
        .I5(tx_data[4]),
        .O(UART_TXD_i_2_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    UART_TXD_i_3
       (.I0(tx_data[3]),
        .I1(tx_data[2]),
        .I2(tx_bit_count[1]),
        .I3(tx_data[1]),
        .I4(tx_bit_count[0]),
        .I5(tx_data[0]),
        .O(UART_TXD_i_3_n_0));
  FDSE UART_TXD_reg
       (.C(CLK),
        .CE(1'b1),
        .D(UART_TXD_i_1_n_0),
        .Q(UART_TXD),
        .S(RST));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \tx_bit_count[0]_i_1 
       (.I0(tx_data_out_sel[1]),
        .I1(tx_clk_en),
        .I2(tx_bit_count[0]),
        .O(\tx_bit_count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \tx_bit_count[1]_i_1 
       (.I0(tx_bit_count[0]),
        .I1(tx_data_out_sel[1]),
        .I2(tx_clk_en),
        .I3(tx_bit_count[1]),
        .O(\tx_bit_count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \tx_bit_count[2]_i_1 
       (.I0(tx_bit_count[0]),
        .I1(tx_bit_count[1]),
        .I2(tx_data_out_sel[1]),
        .I3(tx_clk_en),
        .I4(tx_bit_count[2]),
        .O(\tx_bit_count[2]_i_1_n_0 ));
  FDRE \tx_bit_count_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\tx_bit_count[0]_i_1_n_0 ),
        .Q(tx_bit_count[0]),
        .R(RST));
  FDRE \tx_bit_count_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\tx_bit_count[1]_i_1_n_0 ),
        .Q(tx_bit_count[1]),
        .R(RST));
  FDRE \tx_bit_count_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\tx_bit_count[2]_i_1_n_0 ),
        .Q(tx_bit_count[2]),
        .R(RST));
  design_1_UART_0_2_UART_CLK_DIV__parameterized1 tx_clk_divider_i
       (.CLK(CLK),
        .D({tx_clk_divider_i_n_1,tx_clk_divider_i_n_2,tx_clk_divider_i_n_3,tx_clk_divider_i_n_4,tx_clk_divider_i_n_5}),
        .DIN_VLD(DIN_VLD),
        .E(E),
        .Q({\FSM_onehot_tx_pstate_reg_n_0_[4] ,tx_data_out_sel,\FSM_onehot_tx_pstate_reg_n_0_[1] ,tx_clk_div_clr}),
        .tx_bit_count(tx_bit_count),
        .tx_clk_en(tx_clk_en),
        .tx_nstate2(tx_nstate2));
  LUT3 #(
    .INIT(8'hA8)) 
    \tx_data[7]_i_1 
       (.I0(DIN_VLD),
        .I1(\FSM_onehot_tx_pstate_reg_n_0_[4] ),
        .I2(tx_clk_div_clr),
        .O(tx_data0));
  FDRE \tx_data_reg[0] 
       (.C(CLK),
        .CE(tx_data0),
        .D(DIN[0]),
        .Q(tx_data[0]),
        .R(1'b0));
  FDRE \tx_data_reg[1] 
       (.C(CLK),
        .CE(tx_data0),
        .D(DIN[1]),
        .Q(tx_data[1]),
        .R(1'b0));
  FDRE \tx_data_reg[2] 
       (.C(CLK),
        .CE(tx_data0),
        .D(DIN[2]),
        .Q(tx_data[2]),
        .R(1'b0));
  FDRE \tx_data_reg[3] 
       (.C(CLK),
        .CE(tx_data0),
        .D(DIN[3]),
        .Q(tx_data[3]),
        .R(1'b0));
  FDRE \tx_data_reg[4] 
       (.C(CLK),
        .CE(tx_data0),
        .D(DIN[4]),
        .Q(tx_data[4]),
        .R(1'b0));
  FDRE \tx_data_reg[5] 
       (.C(CLK),
        .CE(tx_data0),
        .D(DIN[5]),
        .Q(tx_data[5]),
        .R(1'b0));
  FDRE \tx_data_reg[6] 
       (.C(CLK),
        .CE(tx_data0),
        .D(DIN[6]),
        .Q(tx_data[6]),
        .R(1'b0));
  FDRE \tx_data_reg[7] 
       (.C(CLK),
        .CE(tx_data0),
        .D(DIN[7]),
        .Q(tx_data[7]),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
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
    reg GRESTORE_int;

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
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

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

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
