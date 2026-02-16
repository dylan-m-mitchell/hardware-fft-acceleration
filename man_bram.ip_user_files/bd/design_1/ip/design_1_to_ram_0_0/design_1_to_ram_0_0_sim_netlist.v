// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Mon Feb 16 13:08:06 2026
// Host        : dylan_pc running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/dlnmt/man_bram/man_bram.gen/sources_1/bd/design_1/ip/design_1_to_ram_0_0/design_1_to_ram_0_0_sim_netlist.v
// Design      : design_1_to_ram_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s25csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_to_ram_0_0,to_ram,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "to_ram,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module design_1_to_ram_0_0
   (i_clk,
    i_data,
    i_d_valid,
    i_rst,
    o_wr_addr,
    o_wr_dv,
    o_wr_data,
    o_rd_addr,
    o_rd_en,
    i_rd_dv,
    i_rd_data_128);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 i_clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_clk, ASSOCIATED_RESET i_rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_in1_0, INSERT_VIP 0" *) input i_clk;
  input [7:0]i_data;
  input i_d_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 i_rst RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input i_rst;
  output [7:0]o_wr_addr;
  output o_wr_dv;
  output [191:0]o_wr_data;
  output [7:0]o_rd_addr;
  output o_rd_en;
  input i_rd_dv;
  input [127:0]i_rd_data_128;

  wire i_clk;
  wire i_d_valid;
  wire [7:0]i_data;
  wire [127:0]i_rd_data_128;
  wire i_rd_dv;
  wire i_rst;
  wire [7:0]o_rd_addr;
  wire o_rd_en;
  wire [7:0]o_wr_addr;
  wire [191:0]o_wr_data;
  wire o_wr_dv;

  design_1_to_ram_0_0_to_ram inst
       (.i_clk(i_clk),
        .i_d_valid(i_d_valid),
        .i_data(i_data),
        .i_rd_data_128(i_rd_data_128),
        .i_rd_dv(i_rd_dv),
        .i_rst(i_rst),
        .o_rd_addr(o_rd_addr),
        .o_rd_en(o_rd_en),
        .o_wr_addr(o_wr_addr),
        .o_wr_data(o_wr_data),
        .o_wr_dv(o_wr_dv));
endmodule

(* ORIG_REF_NAME = "to_ram" *) 
module design_1_to_ram_0_0_to_ram
   (o_wr_addr,
    o_wr_data,
    o_rd_addr,
    o_wr_dv,
    o_rd_en,
    i_rd_dv,
    i_rst,
    i_clk,
    i_d_valid,
    i_data,
    i_rd_data_128);
  output [7:0]o_wr_addr;
  output [191:0]o_wr_data;
  output [7:0]o_rd_addr;
  output o_wr_dv;
  output o_rd_en;
  input i_rd_dv;
  input i_rst;
  input i_clk;
  input i_d_valid;
  input [7:0]i_data;
  input [127:0]i_rd_data_128;

  wire \FSM_onehot_state[0]_i_1_n_0 ;
  wire \FSM_onehot_state[1]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_onehot_state_reg_n_0_[1] ;
  wire \FSM_onehot_state_reg_n_0_[2] ;
  wire \byte_cnt[0]_i_1_n_0 ;
  wire \byte_cnt[1]_i_1_n_0 ;
  wire \byte_cnt[2]_i_1_n_0 ;
  wire \byte_cnt_reg_n_0_[0] ;
  wire \byte_cnt_reg_n_0_[1] ;
  wire \byte_cnt_reg_n_0_[2] ;
  wire i_clk;
  wire i_d_valid;
  wire [7:0]i_data;
  wire [127:0]i_rd_data_128;
  wire i_rd_dv;
  wire i_rst;
  wire [7:0]o_rd_addr;
  wire \o_rd_addr[7]_i_1_n_0 ;
  wire o_rd_en;
  wire o_rd_en_i_1_n_0;
  wire [7:0]o_wr_addr;
  wire \o_wr_addr[6]_i_2_n_0 ;
  wire \o_wr_addr[7]_i_2_n_0 ;
  wire \o_wr_addr[7]_i_3_n_0 ;
  wire [7:0]o_wr_addr_0;
  wire [191:0]o_wr_data;
  wire \o_wr_data[191]_i_1_n_0 ;
  wire o_wr_dv;
  wire o_wr_dv_i_1_n_0;
  wire [55:0]p_0_in;
  wire shift_reg;
  wire \shift_reg_reg_n_0_[0] ;
  wire \shift_reg_reg_n_0_[1] ;
  wire \shift_reg_reg_n_0_[2] ;
  wire \shift_reg_reg_n_0_[3] ;
  wire \shift_reg_reg_n_0_[4] ;
  wire \shift_reg_reg_n_0_[5] ;
  wire \shift_reg_reg_n_0_[6] ;
  wire \shift_reg_reg_n_0_[7] ;

  LUT5 #(
    .INIT(32'hF0F7F0F0)) 
    \FSM_onehot_state[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(i_rd_dv),
        .I2(\FSM_onehot_state_reg_n_0_[2] ),
        .I3(\o_rd_addr[7]_i_1_n_0 ),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .O(\FSM_onehot_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hF0F0F0A2)) 
    \FSM_onehot_state[1]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(i_rd_dv),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .I3(\FSM_onehot_state_reg_n_0_[2] ),
        .I4(\o_rd_addr[7]_i_1_n_0 ),
        .O(\FSM_onehot_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(i_rd_dv),
        .I2(\FSM_onehot_state_reg_n_0_[2] ),
        .I3(\o_rd_addr[7]_i_1_n_0 ),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "STATE_NOT_FULL:001,STATE_READ:010,STATE_WRITE:100," *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_state[0]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[0] ),
        .S(i_rst));
  (* FSM_ENCODED_STATES = "STATE_NOT_FULL:001,STATE_READ:010,STATE_WRITE:100," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[1] ),
        .R(i_rst));
  (* FSM_ENCODED_STATES = "STATE_NOT_FULL:001,STATE_READ:010,STATE_WRITE:100," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_state[2]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[2] ),
        .R(i_rst));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h15E0)) 
    \byte_cnt[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(i_d_valid),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .I3(\byte_cnt_reg_n_0_[0] ),
        .O(\byte_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h5733A800)) 
    \byte_cnt[1]_i_1 
       (.I0(\byte_cnt_reg_n_0_[0] ),
        .I1(\FSM_onehot_state_reg_n_0_[2] ),
        .I2(i_d_valid),
        .I3(\FSM_onehot_state_reg_n_0_[0] ),
        .I4(\byte_cnt_reg_n_0_[1] ),
        .O(\byte_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h777F0F0F88800000)) 
    \byte_cnt[2]_i_1 
       (.I0(\byte_cnt_reg_n_0_[1] ),
        .I1(\byte_cnt_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[2] ),
        .I3(i_d_valid),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .I5(\byte_cnt_reg_n_0_[2] ),
        .O(\byte_cnt[2]_i_1_n_0 ));
  FDRE \byte_cnt_reg[0] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\byte_cnt[0]_i_1_n_0 ),
        .Q(\byte_cnt_reg_n_0_[0] ),
        .R(i_rst));
  FDRE \byte_cnt_reg[1] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\byte_cnt[1]_i_1_n_0 ),
        .Q(\byte_cnt_reg_n_0_[1] ),
        .R(i_rst));
  FDRE \byte_cnt_reg[2] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\byte_cnt[2]_i_1_n_0 ),
        .Q(\byte_cnt_reg_n_0_[2] ),
        .R(i_rst));
  LUT5 #(
    .INIT(32'h80000000)) 
    \o_rd_addr[7]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(\byte_cnt_reg_n_0_[1] ),
        .I2(\byte_cnt_reg_n_0_[0] ),
        .I3(\byte_cnt_reg_n_0_[2] ),
        .I4(i_d_valid),
        .O(\o_rd_addr[7]_i_1_n_0 ));
  FDRE \o_rd_addr_reg[0] 
       (.C(i_clk),
        .CE(\o_rd_addr[7]_i_1_n_0 ),
        .D(o_wr_addr[0]),
        .Q(o_rd_addr[0]),
        .R(i_rst));
  FDRE \o_rd_addr_reg[1] 
       (.C(i_clk),
        .CE(\o_rd_addr[7]_i_1_n_0 ),
        .D(o_wr_addr[1]),
        .Q(o_rd_addr[1]),
        .R(i_rst));
  FDRE \o_rd_addr_reg[2] 
       (.C(i_clk),
        .CE(\o_rd_addr[7]_i_1_n_0 ),
        .D(o_wr_addr[2]),
        .Q(o_rd_addr[2]),
        .R(i_rst));
  FDRE \o_rd_addr_reg[3] 
       (.C(i_clk),
        .CE(\o_rd_addr[7]_i_1_n_0 ),
        .D(o_wr_addr[3]),
        .Q(o_rd_addr[3]),
        .R(i_rst));
  FDRE \o_rd_addr_reg[4] 
       (.C(i_clk),
        .CE(\o_rd_addr[7]_i_1_n_0 ),
        .D(o_wr_addr[4]),
        .Q(o_rd_addr[4]),
        .R(i_rst));
  FDRE \o_rd_addr_reg[5] 
       (.C(i_clk),
        .CE(\o_rd_addr[7]_i_1_n_0 ),
        .D(o_wr_addr[5]),
        .Q(o_rd_addr[5]),
        .R(i_rst));
  FDRE \o_rd_addr_reg[6] 
       (.C(i_clk),
        .CE(\o_rd_addr[7]_i_1_n_0 ),
        .D(o_wr_addr[6]),
        .Q(o_rd_addr[6]),
        .R(i_rst));
  FDRE \o_rd_addr_reg[7] 
       (.C(i_clk),
        .CE(\o_rd_addr[7]_i_1_n_0 ),
        .D(o_wr_addr[7]),
        .Q(o_rd_addr[7]),
        .R(i_rst));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    o_rd_en_i_1
       (.I0(i_d_valid),
        .I1(\byte_cnt_reg_n_0_[2] ),
        .I2(\byte_cnt_reg_n_0_[0] ),
        .I3(\byte_cnt_reg_n_0_[1] ),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .I5(i_rst),
        .O(o_rd_en_i_1_n_0));
  FDRE o_rd_en_reg
       (.C(i_clk),
        .CE(1'b1),
        .D(o_rd_en_i_1_n_0),
        .Q(o_rd_en),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \o_wr_addr[0]_i_1 
       (.I0(o_wr_addr[0]),
        .O(o_wr_addr_0[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \o_wr_addr[1]_i_1 
       (.I0(o_wr_addr[0]),
        .I1(o_wr_addr[1]),
        .O(o_wr_addr_0[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \o_wr_addr[2]_i_1 
       (.I0(o_wr_addr[2]),
        .I1(o_wr_addr[0]),
        .I2(o_wr_addr[1]),
        .O(o_wr_addr_0[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \o_wr_addr[3]_i_1 
       (.I0(o_wr_addr[3]),
        .I1(o_wr_addr[0]),
        .I2(o_wr_addr[1]),
        .I3(o_wr_addr[2]),
        .O(o_wr_addr_0[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \o_wr_addr[4]_i_1 
       (.I0(o_wr_addr[4]),
        .I1(o_wr_addr[2]),
        .I2(o_wr_addr[1]),
        .I3(o_wr_addr[0]),
        .I4(o_wr_addr[3]),
        .O(o_wr_addr_0[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \o_wr_addr[5]_i_1 
       (.I0(o_wr_addr[5]),
        .I1(o_wr_addr[3]),
        .I2(o_wr_addr[0]),
        .I3(o_wr_addr[1]),
        .I4(o_wr_addr[2]),
        .I5(o_wr_addr[4]),
        .O(o_wr_addr_0[5]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \o_wr_addr[6]_i_1 
       (.I0(o_wr_addr[6]),
        .I1(o_wr_addr[4]),
        .I2(o_wr_addr[2]),
        .I3(\o_wr_addr[6]_i_2_n_0 ),
        .I4(o_wr_addr[3]),
        .I5(o_wr_addr[5]),
        .O(o_wr_addr_0[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_wr_addr[6]_i_2 
       (.I0(o_wr_addr[1]),
        .I1(o_wr_addr[0]),
        .O(\o_wr_addr[6]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hB8CC)) 
    \o_wr_addr[7]_i_1 
       (.I0(\o_wr_addr[7]_i_2_n_0 ),
        .I1(o_wr_addr[7]),
        .I2(\o_wr_addr[7]_i_3_n_0 ),
        .I3(o_wr_addr[6]),
        .O(o_wr_addr_0[7]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \o_wr_addr[7]_i_2 
       (.I0(o_wr_addr[4]),
        .I1(o_wr_addr[2]),
        .I2(o_wr_addr[0]),
        .I3(o_wr_addr[1]),
        .I4(o_wr_addr[3]),
        .I5(o_wr_addr[5]),
        .O(\o_wr_addr[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \o_wr_addr[7]_i_3 
       (.I0(o_wr_addr[4]),
        .I1(o_wr_addr[2]),
        .I2(o_wr_addr[1]),
        .I3(o_wr_addr[0]),
        .I4(o_wr_addr[3]),
        .I5(o_wr_addr[5]),
        .O(\o_wr_addr[7]_i_3_n_0 ));
  FDRE \o_wr_addr_reg[0] 
       (.C(i_clk),
        .CE(\FSM_onehot_state_reg_n_0_[2] ),
        .D(o_wr_addr_0[0]),
        .Q(o_wr_addr[0]),
        .R(i_rst));
  FDRE \o_wr_addr_reg[1] 
       (.C(i_clk),
        .CE(\FSM_onehot_state_reg_n_0_[2] ),
        .D(o_wr_addr_0[1]),
        .Q(o_wr_addr[1]),
        .R(i_rst));
  FDRE \o_wr_addr_reg[2] 
       (.C(i_clk),
        .CE(\FSM_onehot_state_reg_n_0_[2] ),
        .D(o_wr_addr_0[2]),
        .Q(o_wr_addr[2]),
        .R(i_rst));
  FDRE \o_wr_addr_reg[3] 
       (.C(i_clk),
        .CE(\FSM_onehot_state_reg_n_0_[2] ),
        .D(o_wr_addr_0[3]),
        .Q(o_wr_addr[3]),
        .R(i_rst));
  FDRE \o_wr_addr_reg[4] 
       (.C(i_clk),
        .CE(\FSM_onehot_state_reg_n_0_[2] ),
        .D(o_wr_addr_0[4]),
        .Q(o_wr_addr[4]),
        .R(i_rst));
  FDRE \o_wr_addr_reg[5] 
       (.C(i_clk),
        .CE(\FSM_onehot_state_reg_n_0_[2] ),
        .D(o_wr_addr_0[5]),
        .Q(o_wr_addr[5]),
        .R(i_rst));
  FDRE \o_wr_addr_reg[6] 
       (.C(i_clk),
        .CE(\FSM_onehot_state_reg_n_0_[2] ),
        .D(o_wr_addr_0[6]),
        .Q(o_wr_addr[6]),
        .R(i_rst));
  FDRE \o_wr_addr_reg[7] 
       (.C(i_clk),
        .CE(\FSM_onehot_state_reg_n_0_[2] ),
        .D(o_wr_addr_0[7]),
        .Q(o_wr_addr[7]),
        .R(i_rst));
  LUT2 #(
    .INIT(4'h8)) 
    \o_wr_data[191]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(i_rd_dv),
        .O(\o_wr_data[191]_i_1_n_0 ));
  FDRE \o_wr_data_reg[0] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[0]),
        .Q(o_wr_data[0]),
        .R(i_rst));
  FDRE \o_wr_data_reg[100] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[100]),
        .Q(o_wr_data[100]),
        .R(i_rst));
  FDRE \o_wr_data_reg[101] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[101]),
        .Q(o_wr_data[101]),
        .R(i_rst));
  FDRE \o_wr_data_reg[102] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[102]),
        .Q(o_wr_data[102]),
        .R(i_rst));
  FDRE \o_wr_data_reg[103] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[103]),
        .Q(o_wr_data[103]),
        .R(i_rst));
  FDRE \o_wr_data_reg[104] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[104]),
        .Q(o_wr_data[104]),
        .R(i_rst));
  FDRE \o_wr_data_reg[105] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[105]),
        .Q(o_wr_data[105]),
        .R(i_rst));
  FDRE \o_wr_data_reg[106] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[106]),
        .Q(o_wr_data[106]),
        .R(i_rst));
  FDRE \o_wr_data_reg[107] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[107]),
        .Q(o_wr_data[107]),
        .R(i_rst));
  FDRE \o_wr_data_reg[108] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[108]),
        .Q(o_wr_data[108]),
        .R(i_rst));
  FDRE \o_wr_data_reg[109] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[109]),
        .Q(o_wr_data[109]),
        .R(i_rst));
  FDRE \o_wr_data_reg[10] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[10]),
        .Q(o_wr_data[10]),
        .R(i_rst));
  FDRE \o_wr_data_reg[110] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[110]),
        .Q(o_wr_data[110]),
        .R(i_rst));
  FDRE \o_wr_data_reg[111] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[111]),
        .Q(o_wr_data[111]),
        .R(i_rst));
  FDRE \o_wr_data_reg[112] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[112]),
        .Q(o_wr_data[112]),
        .R(i_rst));
  FDRE \o_wr_data_reg[113] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[113]),
        .Q(o_wr_data[113]),
        .R(i_rst));
  FDRE \o_wr_data_reg[114] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[114]),
        .Q(o_wr_data[114]),
        .R(i_rst));
  FDRE \o_wr_data_reg[115] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[115]),
        .Q(o_wr_data[115]),
        .R(i_rst));
  FDRE \o_wr_data_reg[116] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[116]),
        .Q(o_wr_data[116]),
        .R(i_rst));
  FDRE \o_wr_data_reg[117] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[117]),
        .Q(o_wr_data[117]),
        .R(i_rst));
  FDRE \o_wr_data_reg[118] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[118]),
        .Q(o_wr_data[118]),
        .R(i_rst));
  FDRE \o_wr_data_reg[119] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[119]),
        .Q(o_wr_data[119]),
        .R(i_rst));
  FDRE \o_wr_data_reg[11] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[11]),
        .Q(o_wr_data[11]),
        .R(i_rst));
  FDRE \o_wr_data_reg[120] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[120]),
        .Q(o_wr_data[120]),
        .R(i_rst));
  FDRE \o_wr_data_reg[121] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[121]),
        .Q(o_wr_data[121]),
        .R(i_rst));
  FDRE \o_wr_data_reg[122] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[122]),
        .Q(o_wr_data[122]),
        .R(i_rst));
  FDRE \o_wr_data_reg[123] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[123]),
        .Q(o_wr_data[123]),
        .R(i_rst));
  FDRE \o_wr_data_reg[124] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[124]),
        .Q(o_wr_data[124]),
        .R(i_rst));
  FDRE \o_wr_data_reg[125] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[125]),
        .Q(o_wr_data[125]),
        .R(i_rst));
  FDRE \o_wr_data_reg[126] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[126]),
        .Q(o_wr_data[126]),
        .R(i_rst));
  FDRE \o_wr_data_reg[127] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[127]),
        .Q(o_wr_data[127]),
        .R(i_rst));
  FDRE \o_wr_data_reg[128] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[0] ),
        .Q(o_wr_data[128]),
        .R(i_rst));
  FDRE \o_wr_data_reg[129] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[1] ),
        .Q(o_wr_data[129]),
        .R(i_rst));
  FDRE \o_wr_data_reg[12] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[12]),
        .Q(o_wr_data[12]),
        .R(i_rst));
  FDRE \o_wr_data_reg[130] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[2] ),
        .Q(o_wr_data[130]),
        .R(i_rst));
  FDRE \o_wr_data_reg[131] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[3] ),
        .Q(o_wr_data[131]),
        .R(i_rst));
  FDRE \o_wr_data_reg[132] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[4] ),
        .Q(o_wr_data[132]),
        .R(i_rst));
  FDRE \o_wr_data_reg[133] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[5] ),
        .Q(o_wr_data[133]),
        .R(i_rst));
  FDRE \o_wr_data_reg[134] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[6] ),
        .Q(o_wr_data[134]),
        .R(i_rst));
  FDRE \o_wr_data_reg[135] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(\shift_reg_reg_n_0_[7] ),
        .Q(o_wr_data[135]),
        .R(i_rst));
  FDRE \o_wr_data_reg[136] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[0]),
        .Q(o_wr_data[136]),
        .R(i_rst));
  FDRE \o_wr_data_reg[137] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[1]),
        .Q(o_wr_data[137]),
        .R(i_rst));
  FDRE \o_wr_data_reg[138] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[2]),
        .Q(o_wr_data[138]),
        .R(i_rst));
  FDRE \o_wr_data_reg[139] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[3]),
        .Q(o_wr_data[139]),
        .R(i_rst));
  FDRE \o_wr_data_reg[13] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[13]),
        .Q(o_wr_data[13]),
        .R(i_rst));
  FDRE \o_wr_data_reg[140] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[4]),
        .Q(o_wr_data[140]),
        .R(i_rst));
  FDRE \o_wr_data_reg[141] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[5]),
        .Q(o_wr_data[141]),
        .R(i_rst));
  FDRE \o_wr_data_reg[142] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[6]),
        .Q(o_wr_data[142]),
        .R(i_rst));
  FDRE \o_wr_data_reg[143] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[7]),
        .Q(o_wr_data[143]),
        .R(i_rst));
  FDRE \o_wr_data_reg[144] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[8]),
        .Q(o_wr_data[144]),
        .R(i_rst));
  FDRE \o_wr_data_reg[145] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[9]),
        .Q(o_wr_data[145]),
        .R(i_rst));
  FDRE \o_wr_data_reg[146] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[10]),
        .Q(o_wr_data[146]),
        .R(i_rst));
  FDRE \o_wr_data_reg[147] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[11]),
        .Q(o_wr_data[147]),
        .R(i_rst));
  FDRE \o_wr_data_reg[148] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[12]),
        .Q(o_wr_data[148]),
        .R(i_rst));
  FDRE \o_wr_data_reg[149] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[13]),
        .Q(o_wr_data[149]),
        .R(i_rst));
  FDRE \o_wr_data_reg[14] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[14]),
        .Q(o_wr_data[14]),
        .R(i_rst));
  FDRE \o_wr_data_reg[150] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[14]),
        .Q(o_wr_data[150]),
        .R(i_rst));
  FDRE \o_wr_data_reg[151] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[15]),
        .Q(o_wr_data[151]),
        .R(i_rst));
  FDRE \o_wr_data_reg[152] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[16]),
        .Q(o_wr_data[152]),
        .R(i_rst));
  FDRE \o_wr_data_reg[153] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[17]),
        .Q(o_wr_data[153]),
        .R(i_rst));
  FDRE \o_wr_data_reg[154] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[18]),
        .Q(o_wr_data[154]),
        .R(i_rst));
  FDRE \o_wr_data_reg[155] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[19]),
        .Q(o_wr_data[155]),
        .R(i_rst));
  FDRE \o_wr_data_reg[156] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[20]),
        .Q(o_wr_data[156]),
        .R(i_rst));
  FDRE \o_wr_data_reg[157] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[21]),
        .Q(o_wr_data[157]),
        .R(i_rst));
  FDRE \o_wr_data_reg[158] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[22]),
        .Q(o_wr_data[158]),
        .R(i_rst));
  FDRE \o_wr_data_reg[159] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[23]),
        .Q(o_wr_data[159]),
        .R(i_rst));
  FDRE \o_wr_data_reg[15] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[15]),
        .Q(o_wr_data[15]),
        .R(i_rst));
  FDRE \o_wr_data_reg[160] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[24]),
        .Q(o_wr_data[160]),
        .R(i_rst));
  FDRE \o_wr_data_reg[161] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[25]),
        .Q(o_wr_data[161]),
        .R(i_rst));
  FDRE \o_wr_data_reg[162] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[26]),
        .Q(o_wr_data[162]),
        .R(i_rst));
  FDRE \o_wr_data_reg[163] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[27]),
        .Q(o_wr_data[163]),
        .R(i_rst));
  FDRE \o_wr_data_reg[164] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[28]),
        .Q(o_wr_data[164]),
        .R(i_rst));
  FDRE \o_wr_data_reg[165] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[29]),
        .Q(o_wr_data[165]),
        .R(i_rst));
  FDRE \o_wr_data_reg[166] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[30]),
        .Q(o_wr_data[166]),
        .R(i_rst));
  FDRE \o_wr_data_reg[167] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[31]),
        .Q(o_wr_data[167]),
        .R(i_rst));
  FDRE \o_wr_data_reg[168] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[32]),
        .Q(o_wr_data[168]),
        .R(i_rst));
  FDRE \o_wr_data_reg[169] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[33]),
        .Q(o_wr_data[169]),
        .R(i_rst));
  FDRE \o_wr_data_reg[16] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[16]),
        .Q(o_wr_data[16]),
        .R(i_rst));
  FDRE \o_wr_data_reg[170] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[34]),
        .Q(o_wr_data[170]),
        .R(i_rst));
  FDRE \o_wr_data_reg[171] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[35]),
        .Q(o_wr_data[171]),
        .R(i_rst));
  FDRE \o_wr_data_reg[172] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[36]),
        .Q(o_wr_data[172]),
        .R(i_rst));
  FDRE \o_wr_data_reg[173] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[37]),
        .Q(o_wr_data[173]),
        .R(i_rst));
  FDRE \o_wr_data_reg[174] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[38]),
        .Q(o_wr_data[174]),
        .R(i_rst));
  FDRE \o_wr_data_reg[175] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[39]),
        .Q(o_wr_data[175]),
        .R(i_rst));
  FDRE \o_wr_data_reg[176] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[40]),
        .Q(o_wr_data[176]),
        .R(i_rst));
  FDRE \o_wr_data_reg[177] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[41]),
        .Q(o_wr_data[177]),
        .R(i_rst));
  FDRE \o_wr_data_reg[178] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[42]),
        .Q(o_wr_data[178]),
        .R(i_rst));
  FDRE \o_wr_data_reg[179] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[43]),
        .Q(o_wr_data[179]),
        .R(i_rst));
  FDRE \o_wr_data_reg[17] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[17]),
        .Q(o_wr_data[17]),
        .R(i_rst));
  FDRE \o_wr_data_reg[180] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[44]),
        .Q(o_wr_data[180]),
        .R(i_rst));
  FDRE \o_wr_data_reg[181] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[45]),
        .Q(o_wr_data[181]),
        .R(i_rst));
  FDRE \o_wr_data_reg[182] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[46]),
        .Q(o_wr_data[182]),
        .R(i_rst));
  FDRE \o_wr_data_reg[183] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[47]),
        .Q(o_wr_data[183]),
        .R(i_rst));
  FDRE \o_wr_data_reg[184] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[48]),
        .Q(o_wr_data[184]),
        .R(i_rst));
  FDRE \o_wr_data_reg[185] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[49]),
        .Q(o_wr_data[185]),
        .R(i_rst));
  FDRE \o_wr_data_reg[186] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[50]),
        .Q(o_wr_data[186]),
        .R(i_rst));
  FDRE \o_wr_data_reg[187] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[51]),
        .Q(o_wr_data[187]),
        .R(i_rst));
  FDRE \o_wr_data_reg[188] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[52]),
        .Q(o_wr_data[188]),
        .R(i_rst));
  FDRE \o_wr_data_reg[189] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[53]),
        .Q(o_wr_data[189]),
        .R(i_rst));
  FDRE \o_wr_data_reg[18] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[18]),
        .Q(o_wr_data[18]),
        .R(i_rst));
  FDRE \o_wr_data_reg[190] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[54]),
        .Q(o_wr_data[190]),
        .R(i_rst));
  FDRE \o_wr_data_reg[191] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(p_0_in[55]),
        .Q(o_wr_data[191]),
        .R(i_rst));
  FDRE \o_wr_data_reg[19] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[19]),
        .Q(o_wr_data[19]),
        .R(i_rst));
  FDRE \o_wr_data_reg[1] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[1]),
        .Q(o_wr_data[1]),
        .R(i_rst));
  FDRE \o_wr_data_reg[20] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[20]),
        .Q(o_wr_data[20]),
        .R(i_rst));
  FDRE \o_wr_data_reg[21] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[21]),
        .Q(o_wr_data[21]),
        .R(i_rst));
  FDRE \o_wr_data_reg[22] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[22]),
        .Q(o_wr_data[22]),
        .R(i_rst));
  FDRE \o_wr_data_reg[23] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[23]),
        .Q(o_wr_data[23]),
        .R(i_rst));
  FDRE \o_wr_data_reg[24] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[24]),
        .Q(o_wr_data[24]),
        .R(i_rst));
  FDRE \o_wr_data_reg[25] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[25]),
        .Q(o_wr_data[25]),
        .R(i_rst));
  FDRE \o_wr_data_reg[26] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[26]),
        .Q(o_wr_data[26]),
        .R(i_rst));
  FDRE \o_wr_data_reg[27] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[27]),
        .Q(o_wr_data[27]),
        .R(i_rst));
  FDRE \o_wr_data_reg[28] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[28]),
        .Q(o_wr_data[28]),
        .R(i_rst));
  FDRE \o_wr_data_reg[29] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[29]),
        .Q(o_wr_data[29]),
        .R(i_rst));
  FDRE \o_wr_data_reg[2] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[2]),
        .Q(o_wr_data[2]),
        .R(i_rst));
  FDRE \o_wr_data_reg[30] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[30]),
        .Q(o_wr_data[30]),
        .R(i_rst));
  FDRE \o_wr_data_reg[31] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[31]),
        .Q(o_wr_data[31]),
        .R(i_rst));
  FDRE \o_wr_data_reg[32] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[32]),
        .Q(o_wr_data[32]),
        .R(i_rst));
  FDRE \o_wr_data_reg[33] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[33]),
        .Q(o_wr_data[33]),
        .R(i_rst));
  FDRE \o_wr_data_reg[34] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[34]),
        .Q(o_wr_data[34]),
        .R(i_rst));
  FDRE \o_wr_data_reg[35] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[35]),
        .Q(o_wr_data[35]),
        .R(i_rst));
  FDRE \o_wr_data_reg[36] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[36]),
        .Q(o_wr_data[36]),
        .R(i_rst));
  FDRE \o_wr_data_reg[37] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[37]),
        .Q(o_wr_data[37]),
        .R(i_rst));
  FDRE \o_wr_data_reg[38] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[38]),
        .Q(o_wr_data[38]),
        .R(i_rst));
  FDRE \o_wr_data_reg[39] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[39]),
        .Q(o_wr_data[39]),
        .R(i_rst));
  FDRE \o_wr_data_reg[3] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[3]),
        .Q(o_wr_data[3]),
        .R(i_rst));
  FDRE \o_wr_data_reg[40] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[40]),
        .Q(o_wr_data[40]),
        .R(i_rst));
  FDRE \o_wr_data_reg[41] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[41]),
        .Q(o_wr_data[41]),
        .R(i_rst));
  FDRE \o_wr_data_reg[42] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[42]),
        .Q(o_wr_data[42]),
        .R(i_rst));
  FDRE \o_wr_data_reg[43] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[43]),
        .Q(o_wr_data[43]),
        .R(i_rst));
  FDRE \o_wr_data_reg[44] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[44]),
        .Q(o_wr_data[44]),
        .R(i_rst));
  FDRE \o_wr_data_reg[45] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[45]),
        .Q(o_wr_data[45]),
        .R(i_rst));
  FDRE \o_wr_data_reg[46] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[46]),
        .Q(o_wr_data[46]),
        .R(i_rst));
  FDRE \o_wr_data_reg[47] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[47]),
        .Q(o_wr_data[47]),
        .R(i_rst));
  FDRE \o_wr_data_reg[48] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[48]),
        .Q(o_wr_data[48]),
        .R(i_rst));
  FDRE \o_wr_data_reg[49] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[49]),
        .Q(o_wr_data[49]),
        .R(i_rst));
  FDRE \o_wr_data_reg[4] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[4]),
        .Q(o_wr_data[4]),
        .R(i_rst));
  FDRE \o_wr_data_reg[50] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[50]),
        .Q(o_wr_data[50]),
        .R(i_rst));
  FDRE \o_wr_data_reg[51] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[51]),
        .Q(o_wr_data[51]),
        .R(i_rst));
  FDRE \o_wr_data_reg[52] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[52]),
        .Q(o_wr_data[52]),
        .R(i_rst));
  FDRE \o_wr_data_reg[53] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[53]),
        .Q(o_wr_data[53]),
        .R(i_rst));
  FDRE \o_wr_data_reg[54] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[54]),
        .Q(o_wr_data[54]),
        .R(i_rst));
  FDRE \o_wr_data_reg[55] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[55]),
        .Q(o_wr_data[55]),
        .R(i_rst));
  FDRE \o_wr_data_reg[56] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[56]),
        .Q(o_wr_data[56]),
        .R(i_rst));
  FDRE \o_wr_data_reg[57] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[57]),
        .Q(o_wr_data[57]),
        .R(i_rst));
  FDRE \o_wr_data_reg[58] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[58]),
        .Q(o_wr_data[58]),
        .R(i_rst));
  FDRE \o_wr_data_reg[59] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[59]),
        .Q(o_wr_data[59]),
        .R(i_rst));
  FDRE \o_wr_data_reg[5] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[5]),
        .Q(o_wr_data[5]),
        .R(i_rst));
  FDRE \o_wr_data_reg[60] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[60]),
        .Q(o_wr_data[60]),
        .R(i_rst));
  FDRE \o_wr_data_reg[61] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[61]),
        .Q(o_wr_data[61]),
        .R(i_rst));
  FDRE \o_wr_data_reg[62] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[62]),
        .Q(o_wr_data[62]),
        .R(i_rst));
  FDRE \o_wr_data_reg[63] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[63]),
        .Q(o_wr_data[63]),
        .R(i_rst));
  FDRE \o_wr_data_reg[64] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[64]),
        .Q(o_wr_data[64]),
        .R(i_rst));
  FDRE \o_wr_data_reg[65] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[65]),
        .Q(o_wr_data[65]),
        .R(i_rst));
  FDRE \o_wr_data_reg[66] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[66]),
        .Q(o_wr_data[66]),
        .R(i_rst));
  FDRE \o_wr_data_reg[67] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[67]),
        .Q(o_wr_data[67]),
        .R(i_rst));
  FDRE \o_wr_data_reg[68] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[68]),
        .Q(o_wr_data[68]),
        .R(i_rst));
  FDRE \o_wr_data_reg[69] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[69]),
        .Q(o_wr_data[69]),
        .R(i_rst));
  FDRE \o_wr_data_reg[6] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[6]),
        .Q(o_wr_data[6]),
        .R(i_rst));
  FDRE \o_wr_data_reg[70] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[70]),
        .Q(o_wr_data[70]),
        .R(i_rst));
  FDRE \o_wr_data_reg[71] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[71]),
        .Q(o_wr_data[71]),
        .R(i_rst));
  FDRE \o_wr_data_reg[72] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[72]),
        .Q(o_wr_data[72]),
        .R(i_rst));
  FDRE \o_wr_data_reg[73] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[73]),
        .Q(o_wr_data[73]),
        .R(i_rst));
  FDRE \o_wr_data_reg[74] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[74]),
        .Q(o_wr_data[74]),
        .R(i_rst));
  FDRE \o_wr_data_reg[75] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[75]),
        .Q(o_wr_data[75]),
        .R(i_rst));
  FDRE \o_wr_data_reg[76] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[76]),
        .Q(o_wr_data[76]),
        .R(i_rst));
  FDRE \o_wr_data_reg[77] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[77]),
        .Q(o_wr_data[77]),
        .R(i_rst));
  FDRE \o_wr_data_reg[78] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[78]),
        .Q(o_wr_data[78]),
        .R(i_rst));
  FDRE \o_wr_data_reg[79] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[79]),
        .Q(o_wr_data[79]),
        .R(i_rst));
  FDRE \o_wr_data_reg[7] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[7]),
        .Q(o_wr_data[7]),
        .R(i_rst));
  FDRE \o_wr_data_reg[80] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[80]),
        .Q(o_wr_data[80]),
        .R(i_rst));
  FDRE \o_wr_data_reg[81] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[81]),
        .Q(o_wr_data[81]),
        .R(i_rst));
  FDRE \o_wr_data_reg[82] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[82]),
        .Q(o_wr_data[82]),
        .R(i_rst));
  FDRE \o_wr_data_reg[83] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[83]),
        .Q(o_wr_data[83]),
        .R(i_rst));
  FDRE \o_wr_data_reg[84] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[84]),
        .Q(o_wr_data[84]),
        .R(i_rst));
  FDRE \o_wr_data_reg[85] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[85]),
        .Q(o_wr_data[85]),
        .R(i_rst));
  FDRE \o_wr_data_reg[86] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[86]),
        .Q(o_wr_data[86]),
        .R(i_rst));
  FDRE \o_wr_data_reg[87] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[87]),
        .Q(o_wr_data[87]),
        .R(i_rst));
  FDRE \o_wr_data_reg[88] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[88]),
        .Q(o_wr_data[88]),
        .R(i_rst));
  FDRE \o_wr_data_reg[89] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[89]),
        .Q(o_wr_data[89]),
        .R(i_rst));
  FDRE \o_wr_data_reg[8] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[8]),
        .Q(o_wr_data[8]),
        .R(i_rst));
  FDRE \o_wr_data_reg[90] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[90]),
        .Q(o_wr_data[90]),
        .R(i_rst));
  FDRE \o_wr_data_reg[91] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[91]),
        .Q(o_wr_data[91]),
        .R(i_rst));
  FDRE \o_wr_data_reg[92] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[92]),
        .Q(o_wr_data[92]),
        .R(i_rst));
  FDRE \o_wr_data_reg[93] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[93]),
        .Q(o_wr_data[93]),
        .R(i_rst));
  FDRE \o_wr_data_reg[94] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[94]),
        .Q(o_wr_data[94]),
        .R(i_rst));
  FDRE \o_wr_data_reg[95] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[95]),
        .Q(o_wr_data[95]),
        .R(i_rst));
  FDRE \o_wr_data_reg[96] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[96]),
        .Q(o_wr_data[96]),
        .R(i_rst));
  FDRE \o_wr_data_reg[97] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[97]),
        .Q(o_wr_data[97]),
        .R(i_rst));
  FDRE \o_wr_data_reg[98] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[98]),
        .Q(o_wr_data[98]),
        .R(i_rst));
  FDRE \o_wr_data_reg[99] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[99]),
        .Q(o_wr_data[99]),
        .R(i_rst));
  FDRE \o_wr_data_reg[9] 
       (.C(i_clk),
        .CE(\o_wr_data[191]_i_1_n_0 ),
        .D(i_rd_data_128[9]),
        .Q(o_wr_data[9]),
        .R(i_rst));
  LUT3 #(
    .INIT(8'h08)) 
    o_wr_dv_i_1
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(i_rd_dv),
        .I2(i_rst),
        .O(o_wr_dv_i_1_n_0));
  FDRE o_wr_dv_reg
       (.C(i_clk),
        .CE(1'b1),
        .D(o_wr_dv_i_1_n_0),
        .Q(o_wr_dv),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    \shift_reg[63]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(i_d_valid),
        .O(shift_reg));
  FDRE \shift_reg_reg[0] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[0]),
        .Q(\shift_reg_reg_n_0_[0] ),
        .R(i_rst));
  FDRE \shift_reg_reg[10] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[10]),
        .Q(p_0_in[2]),
        .R(i_rst));
  FDRE \shift_reg_reg[11] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[11]),
        .Q(p_0_in[3]),
        .R(i_rst));
  FDRE \shift_reg_reg[12] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[12]),
        .Q(p_0_in[4]),
        .R(i_rst));
  FDRE \shift_reg_reg[13] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[13]),
        .Q(p_0_in[5]),
        .R(i_rst));
  FDRE \shift_reg_reg[14] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[14]),
        .Q(p_0_in[6]),
        .R(i_rst));
  FDRE \shift_reg_reg[15] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[15]),
        .Q(p_0_in[7]),
        .R(i_rst));
  FDRE \shift_reg_reg[16] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[16]),
        .Q(p_0_in[8]),
        .R(i_rst));
  FDRE \shift_reg_reg[17] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[17]),
        .Q(p_0_in[9]),
        .R(i_rst));
  FDRE \shift_reg_reg[18] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[18]),
        .Q(p_0_in[10]),
        .R(i_rst));
  FDRE \shift_reg_reg[19] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[19]),
        .Q(p_0_in[11]),
        .R(i_rst));
  FDRE \shift_reg_reg[1] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[1]),
        .Q(\shift_reg_reg_n_0_[1] ),
        .R(i_rst));
  FDRE \shift_reg_reg[20] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[20]),
        .Q(p_0_in[12]),
        .R(i_rst));
  FDRE \shift_reg_reg[21] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[21]),
        .Q(p_0_in[13]),
        .R(i_rst));
  FDRE \shift_reg_reg[22] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[22]),
        .Q(p_0_in[14]),
        .R(i_rst));
  FDRE \shift_reg_reg[23] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[23]),
        .Q(p_0_in[15]),
        .R(i_rst));
  FDRE \shift_reg_reg[24] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[24]),
        .Q(p_0_in[16]),
        .R(i_rst));
  FDRE \shift_reg_reg[25] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[25]),
        .Q(p_0_in[17]),
        .R(i_rst));
  FDRE \shift_reg_reg[26] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[26]),
        .Q(p_0_in[18]),
        .R(i_rst));
  FDRE \shift_reg_reg[27] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[27]),
        .Q(p_0_in[19]),
        .R(i_rst));
  FDRE \shift_reg_reg[28] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[28]),
        .Q(p_0_in[20]),
        .R(i_rst));
  FDRE \shift_reg_reg[29] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[29]),
        .Q(p_0_in[21]),
        .R(i_rst));
  FDRE \shift_reg_reg[2] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[2]),
        .Q(\shift_reg_reg_n_0_[2] ),
        .R(i_rst));
  FDRE \shift_reg_reg[30] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[30]),
        .Q(p_0_in[22]),
        .R(i_rst));
  FDRE \shift_reg_reg[31] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[31]),
        .Q(p_0_in[23]),
        .R(i_rst));
  FDRE \shift_reg_reg[32] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[32]),
        .Q(p_0_in[24]),
        .R(i_rst));
  FDRE \shift_reg_reg[33] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[33]),
        .Q(p_0_in[25]),
        .R(i_rst));
  FDRE \shift_reg_reg[34] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[34]),
        .Q(p_0_in[26]),
        .R(i_rst));
  FDRE \shift_reg_reg[35] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[35]),
        .Q(p_0_in[27]),
        .R(i_rst));
  FDRE \shift_reg_reg[36] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[36]),
        .Q(p_0_in[28]),
        .R(i_rst));
  FDRE \shift_reg_reg[37] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[37]),
        .Q(p_0_in[29]),
        .R(i_rst));
  FDRE \shift_reg_reg[38] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[38]),
        .Q(p_0_in[30]),
        .R(i_rst));
  FDRE \shift_reg_reg[39] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[39]),
        .Q(p_0_in[31]),
        .R(i_rst));
  FDRE \shift_reg_reg[3] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[3]),
        .Q(\shift_reg_reg_n_0_[3] ),
        .R(i_rst));
  FDRE \shift_reg_reg[40] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[40]),
        .Q(p_0_in[32]),
        .R(i_rst));
  FDRE \shift_reg_reg[41] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[41]),
        .Q(p_0_in[33]),
        .R(i_rst));
  FDRE \shift_reg_reg[42] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[42]),
        .Q(p_0_in[34]),
        .R(i_rst));
  FDRE \shift_reg_reg[43] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[43]),
        .Q(p_0_in[35]),
        .R(i_rst));
  FDRE \shift_reg_reg[44] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[44]),
        .Q(p_0_in[36]),
        .R(i_rst));
  FDRE \shift_reg_reg[45] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[45]),
        .Q(p_0_in[37]),
        .R(i_rst));
  FDRE \shift_reg_reg[46] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[46]),
        .Q(p_0_in[38]),
        .R(i_rst));
  FDRE \shift_reg_reg[47] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[47]),
        .Q(p_0_in[39]),
        .R(i_rst));
  FDRE \shift_reg_reg[48] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[48]),
        .Q(p_0_in[40]),
        .R(i_rst));
  FDRE \shift_reg_reg[49] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[49]),
        .Q(p_0_in[41]),
        .R(i_rst));
  FDRE \shift_reg_reg[4] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[4]),
        .Q(\shift_reg_reg_n_0_[4] ),
        .R(i_rst));
  FDRE \shift_reg_reg[50] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[50]),
        .Q(p_0_in[42]),
        .R(i_rst));
  FDRE \shift_reg_reg[51] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[51]),
        .Q(p_0_in[43]),
        .R(i_rst));
  FDRE \shift_reg_reg[52] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[52]),
        .Q(p_0_in[44]),
        .R(i_rst));
  FDRE \shift_reg_reg[53] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[53]),
        .Q(p_0_in[45]),
        .R(i_rst));
  FDRE \shift_reg_reg[54] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[54]),
        .Q(p_0_in[46]),
        .R(i_rst));
  FDRE \shift_reg_reg[55] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[55]),
        .Q(p_0_in[47]),
        .R(i_rst));
  FDRE \shift_reg_reg[56] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(i_data[0]),
        .Q(p_0_in[48]),
        .R(i_rst));
  FDRE \shift_reg_reg[57] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(i_data[1]),
        .Q(p_0_in[49]),
        .R(i_rst));
  FDRE \shift_reg_reg[58] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(i_data[2]),
        .Q(p_0_in[50]),
        .R(i_rst));
  FDRE \shift_reg_reg[59] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(i_data[3]),
        .Q(p_0_in[51]),
        .R(i_rst));
  FDRE \shift_reg_reg[5] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[5]),
        .Q(\shift_reg_reg_n_0_[5] ),
        .R(i_rst));
  FDRE \shift_reg_reg[60] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(i_data[4]),
        .Q(p_0_in[52]),
        .R(i_rst));
  FDRE \shift_reg_reg[61] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(i_data[5]),
        .Q(p_0_in[53]),
        .R(i_rst));
  FDRE \shift_reg_reg[62] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(i_data[6]),
        .Q(p_0_in[54]),
        .R(i_rst));
  FDRE \shift_reg_reg[63] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(i_data[7]),
        .Q(p_0_in[55]),
        .R(i_rst));
  FDRE \shift_reg_reg[6] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[6]),
        .Q(\shift_reg_reg_n_0_[6] ),
        .R(i_rst));
  FDRE \shift_reg_reg[7] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[7]),
        .Q(\shift_reg_reg_n_0_[7] ),
        .R(i_rst));
  FDRE \shift_reg_reg[8] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[8]),
        .Q(p_0_in[0]),
        .R(i_rst));
  FDRE \shift_reg_reg[9] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_0_in[9]),
        .Q(p_0_in[1]),
        .R(i_rst));
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
