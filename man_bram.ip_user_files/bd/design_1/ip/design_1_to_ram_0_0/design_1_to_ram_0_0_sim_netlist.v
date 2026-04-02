// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Tue Mar 17 21:26:34 2026
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
    i_rst_n,
    o_Data_Rd,
    o_wr_addr,
    o_wr_dv,
    o_wr_data);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 i_clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_clk, ASSOCIATED_RESET i_rst_n, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_in1_0, INSERT_VIP 0" *) input i_clk;
  input [7:0]i_data;
  input i_d_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 i_rst_n RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input i_rst_n;
  output o_Data_Rd;
  output [7:0]o_wr_addr;
  output o_wr_dv;
  output [127:0]o_wr_data;

  wire i_clk;
  wire i_d_valid;
  wire [7:0]i_data;
  wire i_rst_n;
  wire o_Data_Rd;
  wire [7:0]o_wr_addr;
  wire [127:0]o_wr_data;
  wire o_wr_dv;

  design_1_to_ram_0_0_to_ram inst
       (.i_clk(i_clk),
        .i_d_valid(i_d_valid),
        .i_data(i_data),
        .i_rst_n(i_rst_n),
        .o_Data_Rd(o_Data_Rd),
        .o_wr_addr(o_wr_addr),
        .o_wr_data(o_wr_data),
        .o_wr_dv(o_wr_dv));
endmodule

(* ORIG_REF_NAME = "to_ram" *) 
module design_1_to_ram_0_0_to_ram
   (o_wr_addr,
    o_wr_data,
    o_Data_Rd,
    o_wr_dv,
    i_clk,
    i_data,
    i_d_valid,
    i_rst_n);
  output [7:0]o_wr_addr;
  output [127:0]o_wr_data;
  output o_Data_Rd;
  output o_wr_dv;
  input i_clk;
  input [7:0]i_data;
  input i_d_valid;
  input i_rst_n;

  wire FSM_sequential_state_i_1_n_0;
  wire FSM_sequential_state_i_2_n_0;
  wire FSM_sequential_state_reg_n_0;
  wire [3:0]byte_cnt;
  wire \byte_cnt[0]_i_1_n_0 ;
  wire \byte_cnt[1]_i_1_n_0 ;
  wire \byte_cnt[2]_i_1_n_0 ;
  wire \byte_cnt[3]_i_2_n_0 ;
  wire i_clk;
  wire i_d_valid;
  wire [7:0]i_data;
  wire i_rst_n;
  wire o_Data_Rd;
  wire o_Data_Rd_i_1_n_0;
  wire o_Data_Rd_i_2_n_0;
  wire o_Data_Rd_i_3_n_0;
  wire [7:0]o_wr_addr;
  wire \o_wr_addr[7]_i_1_n_0 ;
  wire [7:0]o_wr_addr_0;
  wire [127:0]o_wr_data;
  wire \o_wr_data[127]_i_1_n_0 ;
  wire o_wr_dv;
  wire o_wr_dv_i_1_n_0;
  wire [119:0]p_1_in;
  wire shift_reg;

  LUT4 #(
    .INIT(16'h1000)) 
    FSM_sequential_state_i_1
       (.I0(FSM_sequential_state_reg_n_0),
        .I1(FSM_sequential_state_i_2_n_0),
        .I2(i_d_valid),
        .I3(i_rst_n),
        .O(FSM_sequential_state_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    FSM_sequential_state_i_2
       (.I0(byte_cnt[3]),
        .I1(byte_cnt[0]),
        .I2(byte_cnt[1]),
        .I3(byte_cnt[2]),
        .O(FSM_sequential_state_i_2_n_0));
  (* FSM_ENCODED_STATES = "STATE_NOT_FULL:0,STATE_WRITE:1," *) 
  FDRE FSM_sequential_state_reg
       (.C(i_clk),
        .CE(1'b1),
        .D(FSM_sequential_state_i_1_n_0),
        .Q(FSM_sequential_state_reg_n_0),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \byte_cnt[0]_i_1 
       (.I0(byte_cnt[0]),
        .O(\byte_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \byte_cnt[1]_i_1 
       (.I0(byte_cnt[0]),
        .I1(byte_cnt[1]),
        .O(\byte_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \byte_cnt[2]_i_1 
       (.I0(byte_cnt[2]),
        .I1(byte_cnt[1]),
        .I2(byte_cnt[0]),
        .O(\byte_cnt[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \byte_cnt[3]_i_1 
       (.I0(i_d_valid),
        .I1(FSM_sequential_state_reg_n_0),
        .O(shift_reg));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \byte_cnt[3]_i_2 
       (.I0(byte_cnt[3]),
        .I1(byte_cnt[0]),
        .I2(byte_cnt[1]),
        .I3(byte_cnt[2]),
        .O(\byte_cnt[3]_i_2_n_0 ));
  FDRE \byte_cnt_reg[0] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(\byte_cnt[0]_i_1_n_0 ),
        .Q(byte_cnt[0]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \byte_cnt_reg[1] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(\byte_cnt[1]_i_1_n_0 ),
        .Q(byte_cnt[1]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \byte_cnt_reg[2] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(\byte_cnt[2]_i_1_n_0 ),
        .Q(byte_cnt[2]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \byte_cnt_reg[3] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(\byte_cnt[3]_i_2_n_0 ),
        .Q(byte_cnt[3]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    o_Data_Rd_i_1
       (.I0(o_Data_Rd_i_2_n_0),
        .I1(o_Data_Rd_i_3_n_0),
        .I2(FSM_sequential_state_reg_n_0),
        .I3(i_rst_n),
        .O(o_Data_Rd_i_1_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    o_Data_Rd_i_2
       (.I0(o_wr_addr[5]),
        .I1(o_wr_addr[4]),
        .I2(o_wr_addr[6]),
        .I3(o_wr_addr[7]),
        .O(o_Data_Rd_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    o_Data_Rd_i_3
       (.I0(o_wr_addr[1]),
        .I1(o_wr_addr[0]),
        .I2(o_wr_addr[3]),
        .I3(o_wr_addr[2]),
        .O(o_Data_Rd_i_3_n_0));
  FDRE o_Data_Rd_reg
       (.C(i_clk),
        .CE(1'b1),
        .D(o_Data_Rd_i_1_n_0),
        .Q(o_Data_Rd),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \o_wr_addr[0]_i_1 
       (.I0(o_wr_addr[0]),
        .O(o_wr_addr_0[0]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
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
        .I1(o_wr_addr[1]),
        .I2(o_wr_addr[0]),
        .O(o_wr_addr_0[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \o_wr_addr[3]_i_1 
       (.I0(o_wr_addr[3]),
        .I1(o_wr_addr[0]),
        .I2(o_wr_addr[1]),
        .I3(o_wr_addr[2]),
        .O(o_wr_addr_0[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \o_wr_addr[4]_i_1 
       (.I0(o_wr_addr[4]),
        .I1(o_wr_addr[2]),
        .I2(o_wr_addr[3]),
        .I3(o_wr_addr[0]),
        .I4(o_wr_addr[1]),
        .O(o_wr_addr_0[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \o_wr_addr[5]_i_1 
       (.I0(o_wr_addr[5]),
        .I1(o_wr_addr[1]),
        .I2(o_wr_addr[0]),
        .I3(o_wr_addr[3]),
        .I4(o_wr_addr[2]),
        .I5(o_wr_addr[4]),
        .O(o_wr_addr_0[5]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \o_wr_addr[6]_i_1 
       (.I0(o_wr_addr[6]),
        .I1(o_wr_addr[4]),
        .I2(o_Data_Rd_i_3_n_0),
        .I3(o_wr_addr[5]),
        .O(o_wr_addr_0[6]));
  LUT1 #(
    .INIT(2'h1)) 
    \o_wr_addr[7]_i_1 
       (.I0(i_rst_n),
        .O(\o_wr_addr[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \o_wr_addr[7]_i_2 
       (.I0(o_wr_addr[7]),
        .I1(o_wr_addr[5]),
        .I2(o_Data_Rd_i_3_n_0),
        .I3(o_wr_addr[4]),
        .I4(o_wr_addr[6]),
        .O(o_wr_addr_0[7]));
  FDRE \o_wr_addr_reg[0] 
       (.C(i_clk),
        .CE(FSM_sequential_state_reg_n_0),
        .D(o_wr_addr_0[0]),
        .Q(o_wr_addr[0]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_addr_reg[1] 
       (.C(i_clk),
        .CE(FSM_sequential_state_reg_n_0),
        .D(o_wr_addr_0[1]),
        .Q(o_wr_addr[1]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_addr_reg[2] 
       (.C(i_clk),
        .CE(FSM_sequential_state_reg_n_0),
        .D(o_wr_addr_0[2]),
        .Q(o_wr_addr[2]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_addr_reg[3] 
       (.C(i_clk),
        .CE(FSM_sequential_state_reg_n_0),
        .D(o_wr_addr_0[3]),
        .Q(o_wr_addr[3]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_addr_reg[4] 
       (.C(i_clk),
        .CE(FSM_sequential_state_reg_n_0),
        .D(o_wr_addr_0[4]),
        .Q(o_wr_addr[4]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_addr_reg[5] 
       (.C(i_clk),
        .CE(FSM_sequential_state_reg_n_0),
        .D(o_wr_addr_0[5]),
        .Q(o_wr_addr[5]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_addr_reg[6] 
       (.C(i_clk),
        .CE(FSM_sequential_state_reg_n_0),
        .D(o_wr_addr_0[6]),
        .Q(o_wr_addr[6]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_addr_reg[7] 
       (.C(i_clk),
        .CE(FSM_sequential_state_reg_n_0),
        .D(o_wr_addr_0[7]),
        .Q(o_wr_addr[7]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4000000000000000)) 
    \o_wr_data[127]_i_1 
       (.I0(FSM_sequential_state_reg_n_0),
        .I1(i_d_valid),
        .I2(byte_cnt[2]),
        .I3(byte_cnt[1]),
        .I4(byte_cnt[0]),
        .I5(byte_cnt[3]),
        .O(\o_wr_data[127]_i_1_n_0 ));
  FDRE \o_wr_data_reg[0] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[0]),
        .Q(o_wr_data[0]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[100] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[100]),
        .Q(o_wr_data[100]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[101] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[101]),
        .Q(o_wr_data[101]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[102] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[102]),
        .Q(o_wr_data[102]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[103] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[103]),
        .Q(o_wr_data[103]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[104] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[104]),
        .Q(o_wr_data[104]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[105] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[105]),
        .Q(o_wr_data[105]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[106] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[106]),
        .Q(o_wr_data[106]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[107] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[107]),
        .Q(o_wr_data[107]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[108] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[108]),
        .Q(o_wr_data[108]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[109] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[109]),
        .Q(o_wr_data[109]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[10] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[10]),
        .Q(o_wr_data[10]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[110] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[110]),
        .Q(o_wr_data[110]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[111] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[111]),
        .Q(o_wr_data[111]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[112] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[112]),
        .Q(o_wr_data[112]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[113] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[113]),
        .Q(o_wr_data[113]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[114] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[114]),
        .Q(o_wr_data[114]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[115] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[115]),
        .Q(o_wr_data[115]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[116] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[116]),
        .Q(o_wr_data[116]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[117] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[117]),
        .Q(o_wr_data[117]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[118] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[118]),
        .Q(o_wr_data[118]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[119] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[119]),
        .Q(o_wr_data[119]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[11] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[11]),
        .Q(o_wr_data[11]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[120] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(i_data[0]),
        .Q(o_wr_data[120]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[121] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(i_data[1]),
        .Q(o_wr_data[121]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[122] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(i_data[2]),
        .Q(o_wr_data[122]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[123] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(i_data[3]),
        .Q(o_wr_data[123]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[124] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(i_data[4]),
        .Q(o_wr_data[124]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[125] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(i_data[5]),
        .Q(o_wr_data[125]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[126] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(i_data[6]),
        .Q(o_wr_data[126]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[127] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(i_data[7]),
        .Q(o_wr_data[127]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[12] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[12]),
        .Q(o_wr_data[12]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[13] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[13]),
        .Q(o_wr_data[13]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[14] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[14]),
        .Q(o_wr_data[14]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[15] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[15]),
        .Q(o_wr_data[15]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[16] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[16]),
        .Q(o_wr_data[16]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[17] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[17]),
        .Q(o_wr_data[17]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[18] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[18]),
        .Q(o_wr_data[18]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[19] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[19]),
        .Q(o_wr_data[19]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[1] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[1]),
        .Q(o_wr_data[1]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[20] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[20]),
        .Q(o_wr_data[20]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[21] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[21]),
        .Q(o_wr_data[21]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[22] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[22]),
        .Q(o_wr_data[22]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[23] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[23]),
        .Q(o_wr_data[23]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[24] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[24]),
        .Q(o_wr_data[24]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[25] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[25]),
        .Q(o_wr_data[25]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[26] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[26]),
        .Q(o_wr_data[26]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[27] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[27]),
        .Q(o_wr_data[27]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[28] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[28]),
        .Q(o_wr_data[28]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[29] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[29]),
        .Q(o_wr_data[29]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[2] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[2]),
        .Q(o_wr_data[2]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[30] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[30]),
        .Q(o_wr_data[30]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[31] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[31]),
        .Q(o_wr_data[31]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[32] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[32]),
        .Q(o_wr_data[32]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[33] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[33]),
        .Q(o_wr_data[33]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[34] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[34]),
        .Q(o_wr_data[34]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[35] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[35]),
        .Q(o_wr_data[35]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[36] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[36]),
        .Q(o_wr_data[36]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[37] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[37]),
        .Q(o_wr_data[37]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[38] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[38]),
        .Q(o_wr_data[38]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[39] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[39]),
        .Q(o_wr_data[39]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[3] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[3]),
        .Q(o_wr_data[3]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[40] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[40]),
        .Q(o_wr_data[40]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[41] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[41]),
        .Q(o_wr_data[41]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[42] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[42]),
        .Q(o_wr_data[42]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[43] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[43]),
        .Q(o_wr_data[43]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[44] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[44]),
        .Q(o_wr_data[44]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[45] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[45]),
        .Q(o_wr_data[45]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[46] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[46]),
        .Q(o_wr_data[46]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[47] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[47]),
        .Q(o_wr_data[47]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[48] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[48]),
        .Q(o_wr_data[48]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[49] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[49]),
        .Q(o_wr_data[49]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[4] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[4]),
        .Q(o_wr_data[4]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[50] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[50]),
        .Q(o_wr_data[50]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[51] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[51]),
        .Q(o_wr_data[51]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[52] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[52]),
        .Q(o_wr_data[52]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[53] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[53]),
        .Q(o_wr_data[53]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[54] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[54]),
        .Q(o_wr_data[54]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[55] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[55]),
        .Q(o_wr_data[55]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[56] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[56]),
        .Q(o_wr_data[56]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[57] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[57]),
        .Q(o_wr_data[57]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[58] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[58]),
        .Q(o_wr_data[58]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[59] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[59]),
        .Q(o_wr_data[59]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[5] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[5]),
        .Q(o_wr_data[5]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[60] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[60]),
        .Q(o_wr_data[60]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[61] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[61]),
        .Q(o_wr_data[61]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[62] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[62]),
        .Q(o_wr_data[62]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[63] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[63]),
        .Q(o_wr_data[63]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[64] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[64]),
        .Q(o_wr_data[64]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[65] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[65]),
        .Q(o_wr_data[65]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[66] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[66]),
        .Q(o_wr_data[66]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[67] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[67]),
        .Q(o_wr_data[67]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[68] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[68]),
        .Q(o_wr_data[68]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[69] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[69]),
        .Q(o_wr_data[69]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[6] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[6]),
        .Q(o_wr_data[6]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[70] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[70]),
        .Q(o_wr_data[70]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[71] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[71]),
        .Q(o_wr_data[71]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[72] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[72]),
        .Q(o_wr_data[72]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[73] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[73]),
        .Q(o_wr_data[73]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[74] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[74]),
        .Q(o_wr_data[74]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[75] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[75]),
        .Q(o_wr_data[75]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[76] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[76]),
        .Q(o_wr_data[76]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[77] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[77]),
        .Q(o_wr_data[77]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[78] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[78]),
        .Q(o_wr_data[78]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[79] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[79]),
        .Q(o_wr_data[79]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[7] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[7]),
        .Q(o_wr_data[7]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[80] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[80]),
        .Q(o_wr_data[80]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[81] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[81]),
        .Q(o_wr_data[81]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[82] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[82]),
        .Q(o_wr_data[82]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[83] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[83]),
        .Q(o_wr_data[83]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[84] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[84]),
        .Q(o_wr_data[84]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[85] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[85]),
        .Q(o_wr_data[85]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[86] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[86]),
        .Q(o_wr_data[86]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[87] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[87]),
        .Q(o_wr_data[87]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[88] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[88]),
        .Q(o_wr_data[88]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[89] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[89]),
        .Q(o_wr_data[89]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[8] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[8]),
        .Q(o_wr_data[8]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[90] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[90]),
        .Q(o_wr_data[90]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[91] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[91]),
        .Q(o_wr_data[91]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[92] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[92]),
        .Q(o_wr_data[92]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[93] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[93]),
        .Q(o_wr_data[93]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[94] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[94]),
        .Q(o_wr_data[94]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[95] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[95]),
        .Q(o_wr_data[95]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[96] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[96]),
        .Q(o_wr_data[96]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[97] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[97]),
        .Q(o_wr_data[97]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[98] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[98]),
        .Q(o_wr_data[98]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[99] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[99]),
        .Q(o_wr_data[99]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \o_wr_data_reg[9] 
       (.C(i_clk),
        .CE(\o_wr_data[127]_i_1_n_0 ),
        .D(p_1_in[9]),
        .Q(o_wr_data[9]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    o_wr_dv_i_1
       (.I0(\o_wr_data[127]_i_1_n_0 ),
        .I1(i_rst_n),
        .O(o_wr_dv_i_1_n_0));
  FDRE o_wr_dv_reg
       (.C(i_clk),
        .CE(1'b1),
        .D(o_wr_dv_i_1_n_0),
        .Q(o_wr_dv),
        .R(1'b0));
  FDRE \shift_reg_reg[100] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[100]),
        .Q(p_1_in[92]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[101] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[101]),
        .Q(p_1_in[93]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[102] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[102]),
        .Q(p_1_in[94]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[103] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[103]),
        .Q(p_1_in[95]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[104] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[104]),
        .Q(p_1_in[96]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[105] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[105]),
        .Q(p_1_in[97]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[106] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[106]),
        .Q(p_1_in[98]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[107] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[107]),
        .Q(p_1_in[99]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[108] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[108]),
        .Q(p_1_in[100]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[109] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[109]),
        .Q(p_1_in[101]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[10] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[10]),
        .Q(p_1_in[2]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[110] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[110]),
        .Q(p_1_in[102]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[111] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[111]),
        .Q(p_1_in[103]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[112] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[112]),
        .Q(p_1_in[104]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[113] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[113]),
        .Q(p_1_in[105]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[114] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[114]),
        .Q(p_1_in[106]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[115] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[115]),
        .Q(p_1_in[107]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[116] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[116]),
        .Q(p_1_in[108]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[117] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[117]),
        .Q(p_1_in[109]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[118] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[118]),
        .Q(p_1_in[110]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[119] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[119]),
        .Q(p_1_in[111]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[11] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[11]),
        .Q(p_1_in[3]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[120] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(i_data[0]),
        .Q(p_1_in[112]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[121] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(i_data[1]),
        .Q(p_1_in[113]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[122] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(i_data[2]),
        .Q(p_1_in[114]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[123] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(i_data[3]),
        .Q(p_1_in[115]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[124] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(i_data[4]),
        .Q(p_1_in[116]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[125] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(i_data[5]),
        .Q(p_1_in[117]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[126] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(i_data[6]),
        .Q(p_1_in[118]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[127] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(i_data[7]),
        .Q(p_1_in[119]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[12] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[12]),
        .Q(p_1_in[4]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[13] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[13]),
        .Q(p_1_in[5]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[14] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[14]),
        .Q(p_1_in[6]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[15] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[15]),
        .Q(p_1_in[7]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[16] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[16]),
        .Q(p_1_in[8]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[17] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[17]),
        .Q(p_1_in[9]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[18] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[18]),
        .Q(p_1_in[10]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[19] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[19]),
        .Q(p_1_in[11]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[20] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[20]),
        .Q(p_1_in[12]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[21] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[21]),
        .Q(p_1_in[13]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[22] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[22]),
        .Q(p_1_in[14]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[23] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[23]),
        .Q(p_1_in[15]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[24] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[24]),
        .Q(p_1_in[16]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[25] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[25]),
        .Q(p_1_in[17]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[26] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[26]),
        .Q(p_1_in[18]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[27] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[27]),
        .Q(p_1_in[19]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[28] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[28]),
        .Q(p_1_in[20]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[29] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[29]),
        .Q(p_1_in[21]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[30] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[30]),
        .Q(p_1_in[22]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[31] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[31]),
        .Q(p_1_in[23]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[32] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[32]),
        .Q(p_1_in[24]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[33] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[33]),
        .Q(p_1_in[25]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[34] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[34]),
        .Q(p_1_in[26]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[35] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[35]),
        .Q(p_1_in[27]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[36] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[36]),
        .Q(p_1_in[28]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[37] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[37]),
        .Q(p_1_in[29]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[38] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[38]),
        .Q(p_1_in[30]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[39] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[39]),
        .Q(p_1_in[31]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[40] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[40]),
        .Q(p_1_in[32]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[41] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[41]),
        .Q(p_1_in[33]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[42] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[42]),
        .Q(p_1_in[34]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[43] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[43]),
        .Q(p_1_in[35]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[44] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[44]),
        .Q(p_1_in[36]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[45] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[45]),
        .Q(p_1_in[37]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[46] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[46]),
        .Q(p_1_in[38]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[47] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[47]),
        .Q(p_1_in[39]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[48] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[48]),
        .Q(p_1_in[40]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[49] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[49]),
        .Q(p_1_in[41]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[50] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[50]),
        .Q(p_1_in[42]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[51] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[51]),
        .Q(p_1_in[43]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[52] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[52]),
        .Q(p_1_in[44]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[53] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[53]),
        .Q(p_1_in[45]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[54] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[54]),
        .Q(p_1_in[46]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[55] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[55]),
        .Q(p_1_in[47]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[56] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[56]),
        .Q(p_1_in[48]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[57] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[57]),
        .Q(p_1_in[49]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[58] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[58]),
        .Q(p_1_in[50]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[59] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[59]),
        .Q(p_1_in[51]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[60] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[60]),
        .Q(p_1_in[52]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[61] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[61]),
        .Q(p_1_in[53]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[62] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[62]),
        .Q(p_1_in[54]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[63] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[63]),
        .Q(p_1_in[55]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[64] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[64]),
        .Q(p_1_in[56]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[65] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[65]),
        .Q(p_1_in[57]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[66] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[66]),
        .Q(p_1_in[58]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[67] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[67]),
        .Q(p_1_in[59]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[68] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[68]),
        .Q(p_1_in[60]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[69] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[69]),
        .Q(p_1_in[61]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[70] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[70]),
        .Q(p_1_in[62]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[71] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[71]),
        .Q(p_1_in[63]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[72] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[72]),
        .Q(p_1_in[64]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[73] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[73]),
        .Q(p_1_in[65]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[74] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[74]),
        .Q(p_1_in[66]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[75] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[75]),
        .Q(p_1_in[67]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[76] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[76]),
        .Q(p_1_in[68]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[77] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[77]),
        .Q(p_1_in[69]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[78] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[78]),
        .Q(p_1_in[70]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[79] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[79]),
        .Q(p_1_in[71]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[80] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[80]),
        .Q(p_1_in[72]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[81] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[81]),
        .Q(p_1_in[73]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[82] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[82]),
        .Q(p_1_in[74]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[83] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[83]),
        .Q(p_1_in[75]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[84] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[84]),
        .Q(p_1_in[76]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[85] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[85]),
        .Q(p_1_in[77]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[86] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[86]),
        .Q(p_1_in[78]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[87] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[87]),
        .Q(p_1_in[79]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[88] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[88]),
        .Q(p_1_in[80]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[89] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[89]),
        .Q(p_1_in[81]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[8] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[8]),
        .Q(p_1_in[0]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[90] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[90]),
        .Q(p_1_in[82]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[91] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[91]),
        .Q(p_1_in[83]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[92] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[92]),
        .Q(p_1_in[84]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[93] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[93]),
        .Q(p_1_in[85]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[94] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[94]),
        .Q(p_1_in[86]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[95] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[95]),
        .Q(p_1_in[87]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[96] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[96]),
        .Q(p_1_in[88]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[97] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[97]),
        .Q(p_1_in[89]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[98] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[98]),
        .Q(p_1_in[90]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[99] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[99]),
        .Q(p_1_in[91]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
  FDRE \shift_reg_reg[9] 
       (.C(i_clk),
        .CE(shift_reg),
        .D(p_1_in[9]),
        .Q(p_1_in[1]),
        .R(\o_wr_addr[7]_i_1_n_0 ));
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
