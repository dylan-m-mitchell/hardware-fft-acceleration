// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Mon Feb 16 16:24:16 2026
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
    o_wr_addr,
    o_wr_dv,
    o_wr_data);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 i_clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_clk, ASSOCIATED_RESET i_rst_n, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_in1_0, INSERT_VIP 0" *) input i_clk;
  input [7:0]i_data;
  input i_d_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 i_rst_n RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input i_rst_n;
  output [7:0]o_wr_addr;
  output o_wr_dv;
  output [63:0]o_wr_data;

  wire i_clk;
  wire i_d_valid;
  wire [7:0]i_data;
  wire [7:0]o_wr_addr;
  wire [63:0]o_wr_data;
  wire o_wr_dv;

  design_1_to_ram_0_0_to_ram inst
       (.i_clk(i_clk),
        .i_d_valid(i_d_valid),
        .i_data(i_data),
        .o_wr_addr(o_wr_addr),
        .o_wr_data(o_wr_data),
        .o_wr_dv(o_wr_dv));
endmodule

(* ORIG_REF_NAME = "to_ram" *) 
module design_1_to_ram_0_0_to_ram
   (o_wr_addr,
    o_wr_dv,
    o_wr_data,
    i_d_valid,
    i_clk,
    i_data);
  output [7:0]o_wr_addr;
  output o_wr_dv;
  output [63:0]o_wr_data;
  input i_d_valid;
  input i_clk;
  input [7:0]i_data;

  wire FSM_sequential_state_i_1_n_0;
  wire FSM_sequential_state_reg_n_0;
  wire [2:0]byte_cnt;
  wire \byte_cnt[0]_i_1_n_0 ;
  wire \byte_cnt[1]_i_1_n_0 ;
  wire \byte_cnt[2]_i_1_n_0 ;
  wire \byte_cnt[2]_i_2_n_0 ;
  wire i_clk;
  wire i_d_valid;
  wire [7:0]i_data;
  wire [7:0]o_wr_addr;
  wire \o_wr_addr[6]_i_2_n_0 ;
  wire \o_wr_addr[7]_i_2_n_0 ;
  wire \o_wr_addr[7]_i_3_n_0 ;
  wire [7:0]o_wr_addr_0;
  wire [63:0]o_wr_data;
  wire o_wr_dv;
  wire o_wr_dv_i_1_n_0;
  wire [55:0]p_0_in;

  LUT5 #(
    .INIT(32'h00008000)) 
    FSM_sequential_state_i_1
       (.I0(i_d_valid),
        .I1(byte_cnt[0]),
        .I2(byte_cnt[2]),
        .I3(byte_cnt[1]),
        .I4(FSM_sequential_state_reg_n_0),
        .O(FSM_sequential_state_i_1_n_0));
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
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \byte_cnt[1]_i_1 
       (.I0(byte_cnt[1]),
        .I1(byte_cnt[0]),
        .O(\byte_cnt[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \byte_cnt[2]_i_1 
       (.I0(i_d_valid),
        .I1(FSM_sequential_state_reg_n_0),
        .O(\byte_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h6C)) 
    \byte_cnt[2]_i_2 
       (.I0(byte_cnt[1]),
        .I1(byte_cnt[2]),
        .I2(byte_cnt[0]),
        .O(\byte_cnt[2]_i_2_n_0 ));
  FDRE \byte_cnt_reg[0] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(\byte_cnt[0]_i_1_n_0 ),
        .Q(byte_cnt[0]),
        .R(1'b0));
  FDRE \byte_cnt_reg[1] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(\byte_cnt[1]_i_1_n_0 ),
        .Q(byte_cnt[1]),
        .R(1'b0));
  FDRE \byte_cnt_reg[2] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(\byte_cnt[2]_i_2_n_0 ),
        .Q(byte_cnt[2]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \o_wr_addr[0]_i_1 
       (.I0(o_wr_addr[0]),
        .O(o_wr_addr_0[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \o_wr_addr[1]_i_1 
       (.I0(o_wr_addr[0]),
        .I1(o_wr_addr[1]),
        .O(o_wr_addr_0[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \o_wr_addr[2]_i_1 
       (.I0(o_wr_addr[2]),
        .I1(o_wr_addr[0]),
        .I2(o_wr_addr[1]),
        .O(o_wr_addr_0[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
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
        .CE(FSM_sequential_state_reg_n_0),
        .D(o_wr_addr_0[0]),
        .Q(o_wr_addr[0]),
        .R(1'b0));
  FDRE \o_wr_addr_reg[1] 
       (.C(i_clk),
        .CE(FSM_sequential_state_reg_n_0),
        .D(o_wr_addr_0[1]),
        .Q(o_wr_addr[1]),
        .R(1'b0));
  FDRE \o_wr_addr_reg[2] 
       (.C(i_clk),
        .CE(FSM_sequential_state_reg_n_0),
        .D(o_wr_addr_0[2]),
        .Q(o_wr_addr[2]),
        .R(1'b0));
  FDRE \o_wr_addr_reg[3] 
       (.C(i_clk),
        .CE(FSM_sequential_state_reg_n_0),
        .D(o_wr_addr_0[3]),
        .Q(o_wr_addr[3]),
        .R(1'b0));
  FDRE \o_wr_addr_reg[4] 
       (.C(i_clk),
        .CE(FSM_sequential_state_reg_n_0),
        .D(o_wr_addr_0[4]),
        .Q(o_wr_addr[4]),
        .R(1'b0));
  FDRE \o_wr_addr_reg[5] 
       (.C(i_clk),
        .CE(FSM_sequential_state_reg_n_0),
        .D(o_wr_addr_0[5]),
        .Q(o_wr_addr[5]),
        .R(1'b0));
  FDRE \o_wr_addr_reg[6] 
       (.C(i_clk),
        .CE(FSM_sequential_state_reg_n_0),
        .D(o_wr_addr_0[6]),
        .Q(o_wr_addr[6]),
        .R(1'b0));
  FDRE \o_wr_addr_reg[7] 
       (.C(i_clk),
        .CE(FSM_sequential_state_reg_n_0),
        .D(o_wr_addr_0[7]),
        .Q(o_wr_addr[7]),
        .R(1'b0));
  FDRE \o_wr_data_reg[0] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[0]),
        .Q(o_wr_data[0]),
        .R(1'b0));
  FDRE \o_wr_data_reg[10] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[10]),
        .Q(o_wr_data[10]),
        .R(1'b0));
  FDRE \o_wr_data_reg[11] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[11]),
        .Q(o_wr_data[11]),
        .R(1'b0));
  FDRE \o_wr_data_reg[12] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[12]),
        .Q(o_wr_data[12]),
        .R(1'b0));
  FDRE \o_wr_data_reg[13] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[13]),
        .Q(o_wr_data[13]),
        .R(1'b0));
  FDRE \o_wr_data_reg[14] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[14]),
        .Q(o_wr_data[14]),
        .R(1'b0));
  FDRE \o_wr_data_reg[15] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[15]),
        .Q(o_wr_data[15]),
        .R(1'b0));
  FDRE \o_wr_data_reg[16] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[16]),
        .Q(o_wr_data[16]),
        .R(1'b0));
  FDRE \o_wr_data_reg[17] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[17]),
        .Q(o_wr_data[17]),
        .R(1'b0));
  FDRE \o_wr_data_reg[18] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[18]),
        .Q(o_wr_data[18]),
        .R(1'b0));
  FDRE \o_wr_data_reg[19] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[19]),
        .Q(o_wr_data[19]),
        .R(1'b0));
  FDRE \o_wr_data_reg[1] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[1]),
        .Q(o_wr_data[1]),
        .R(1'b0));
  FDRE \o_wr_data_reg[20] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[20]),
        .Q(o_wr_data[20]),
        .R(1'b0));
  FDRE \o_wr_data_reg[21] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[21]),
        .Q(o_wr_data[21]),
        .R(1'b0));
  FDRE \o_wr_data_reg[22] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[22]),
        .Q(o_wr_data[22]),
        .R(1'b0));
  FDRE \o_wr_data_reg[23] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[23]),
        .Q(o_wr_data[23]),
        .R(1'b0));
  FDRE \o_wr_data_reg[24] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[24]),
        .Q(o_wr_data[24]),
        .R(1'b0));
  FDRE \o_wr_data_reg[25] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[25]),
        .Q(o_wr_data[25]),
        .R(1'b0));
  FDRE \o_wr_data_reg[26] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[26]),
        .Q(o_wr_data[26]),
        .R(1'b0));
  FDRE \o_wr_data_reg[27] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[27]),
        .Q(o_wr_data[27]),
        .R(1'b0));
  FDRE \o_wr_data_reg[28] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[28]),
        .Q(o_wr_data[28]),
        .R(1'b0));
  FDRE \o_wr_data_reg[29] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[29]),
        .Q(o_wr_data[29]),
        .R(1'b0));
  FDRE \o_wr_data_reg[2] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[2]),
        .Q(o_wr_data[2]),
        .R(1'b0));
  FDRE \o_wr_data_reg[30] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[30]),
        .Q(o_wr_data[30]),
        .R(1'b0));
  FDRE \o_wr_data_reg[31] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[31]),
        .Q(o_wr_data[31]),
        .R(1'b0));
  FDRE \o_wr_data_reg[32] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[32]),
        .Q(o_wr_data[32]),
        .R(1'b0));
  FDRE \o_wr_data_reg[33] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[33]),
        .Q(o_wr_data[33]),
        .R(1'b0));
  FDRE \o_wr_data_reg[34] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[34]),
        .Q(o_wr_data[34]),
        .R(1'b0));
  FDRE \o_wr_data_reg[35] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[35]),
        .Q(o_wr_data[35]),
        .R(1'b0));
  FDRE \o_wr_data_reg[36] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[36]),
        .Q(o_wr_data[36]),
        .R(1'b0));
  FDRE \o_wr_data_reg[37] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[37]),
        .Q(o_wr_data[37]),
        .R(1'b0));
  FDRE \o_wr_data_reg[38] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[38]),
        .Q(o_wr_data[38]),
        .R(1'b0));
  FDRE \o_wr_data_reg[39] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[39]),
        .Q(o_wr_data[39]),
        .R(1'b0));
  FDRE \o_wr_data_reg[3] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[3]),
        .Q(o_wr_data[3]),
        .R(1'b0));
  FDRE \o_wr_data_reg[40] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[40]),
        .Q(o_wr_data[40]),
        .R(1'b0));
  FDRE \o_wr_data_reg[41] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[41]),
        .Q(o_wr_data[41]),
        .R(1'b0));
  FDRE \o_wr_data_reg[42] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[42]),
        .Q(o_wr_data[42]),
        .R(1'b0));
  FDRE \o_wr_data_reg[43] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[43]),
        .Q(o_wr_data[43]),
        .R(1'b0));
  FDRE \o_wr_data_reg[44] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[44]),
        .Q(o_wr_data[44]),
        .R(1'b0));
  FDRE \o_wr_data_reg[45] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[45]),
        .Q(o_wr_data[45]),
        .R(1'b0));
  FDRE \o_wr_data_reg[46] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[46]),
        .Q(o_wr_data[46]),
        .R(1'b0));
  FDRE \o_wr_data_reg[47] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[47]),
        .Q(o_wr_data[47]),
        .R(1'b0));
  FDRE \o_wr_data_reg[48] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[48]),
        .Q(o_wr_data[48]),
        .R(1'b0));
  FDRE \o_wr_data_reg[49] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[49]),
        .Q(o_wr_data[49]),
        .R(1'b0));
  FDRE \o_wr_data_reg[4] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[4]),
        .Q(o_wr_data[4]),
        .R(1'b0));
  FDRE \o_wr_data_reg[50] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[50]),
        .Q(o_wr_data[50]),
        .R(1'b0));
  FDRE \o_wr_data_reg[51] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[51]),
        .Q(o_wr_data[51]),
        .R(1'b0));
  FDRE \o_wr_data_reg[52] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[52]),
        .Q(o_wr_data[52]),
        .R(1'b0));
  FDRE \o_wr_data_reg[53] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[53]),
        .Q(o_wr_data[53]),
        .R(1'b0));
  FDRE \o_wr_data_reg[54] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[54]),
        .Q(o_wr_data[54]),
        .R(1'b0));
  FDRE \o_wr_data_reg[55] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[55]),
        .Q(o_wr_data[55]),
        .R(1'b0));
  FDRE \o_wr_data_reg[56] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(i_data[0]),
        .Q(o_wr_data[56]),
        .R(1'b0));
  FDRE \o_wr_data_reg[57] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(i_data[1]),
        .Q(o_wr_data[57]),
        .R(1'b0));
  FDRE \o_wr_data_reg[58] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(i_data[2]),
        .Q(o_wr_data[58]),
        .R(1'b0));
  FDRE \o_wr_data_reg[59] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(i_data[3]),
        .Q(o_wr_data[59]),
        .R(1'b0));
  FDRE \o_wr_data_reg[5] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[5]),
        .Q(o_wr_data[5]),
        .R(1'b0));
  FDRE \o_wr_data_reg[60] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(i_data[4]),
        .Q(o_wr_data[60]),
        .R(1'b0));
  FDRE \o_wr_data_reg[61] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(i_data[5]),
        .Q(o_wr_data[61]),
        .R(1'b0));
  FDRE \o_wr_data_reg[62] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(i_data[6]),
        .Q(o_wr_data[62]),
        .R(1'b0));
  FDRE \o_wr_data_reg[63] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(i_data[7]),
        .Q(o_wr_data[63]),
        .R(1'b0));
  FDRE \o_wr_data_reg[6] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[6]),
        .Q(o_wr_data[6]),
        .R(1'b0));
  FDRE \o_wr_data_reg[7] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[7]),
        .Q(o_wr_data[7]),
        .R(1'b0));
  FDRE \o_wr_data_reg[8] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[8]),
        .Q(o_wr_data[8]),
        .R(1'b0));
  FDRE \o_wr_data_reg[9] 
       (.C(i_clk),
        .CE(o_wr_dv_i_1_n_0),
        .D(p_0_in[9]),
        .Q(o_wr_data[9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00008000)) 
    o_wr_dv_i_1
       (.I0(byte_cnt[1]),
        .I1(byte_cnt[2]),
        .I2(byte_cnt[0]),
        .I3(i_d_valid),
        .I4(FSM_sequential_state_reg_n_0),
        .O(o_wr_dv_i_1_n_0));
  FDRE o_wr_dv_reg
       (.C(i_clk),
        .CE(1'b1),
        .D(o_wr_dv_i_1_n_0),
        .Q(o_wr_dv),
        .R(1'b0));
  FDRE \shift_reg_reg[10] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[10]),
        .Q(p_0_in[2]),
        .R(1'b0));
  FDRE \shift_reg_reg[11] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[11]),
        .Q(p_0_in[3]),
        .R(1'b0));
  FDRE \shift_reg_reg[12] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[12]),
        .Q(p_0_in[4]),
        .R(1'b0));
  FDRE \shift_reg_reg[13] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[13]),
        .Q(p_0_in[5]),
        .R(1'b0));
  FDRE \shift_reg_reg[14] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[14]),
        .Q(p_0_in[6]),
        .R(1'b0));
  FDRE \shift_reg_reg[15] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[15]),
        .Q(p_0_in[7]),
        .R(1'b0));
  FDRE \shift_reg_reg[16] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[16]),
        .Q(p_0_in[8]),
        .R(1'b0));
  FDRE \shift_reg_reg[17] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[17]),
        .Q(p_0_in[9]),
        .R(1'b0));
  FDRE \shift_reg_reg[18] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[18]),
        .Q(p_0_in[10]),
        .R(1'b0));
  FDRE \shift_reg_reg[19] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[19]),
        .Q(p_0_in[11]),
        .R(1'b0));
  FDRE \shift_reg_reg[20] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[20]),
        .Q(p_0_in[12]),
        .R(1'b0));
  FDRE \shift_reg_reg[21] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[21]),
        .Q(p_0_in[13]),
        .R(1'b0));
  FDRE \shift_reg_reg[22] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[22]),
        .Q(p_0_in[14]),
        .R(1'b0));
  FDRE \shift_reg_reg[23] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[23]),
        .Q(p_0_in[15]),
        .R(1'b0));
  FDRE \shift_reg_reg[24] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[24]),
        .Q(p_0_in[16]),
        .R(1'b0));
  FDRE \shift_reg_reg[25] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[25]),
        .Q(p_0_in[17]),
        .R(1'b0));
  FDRE \shift_reg_reg[26] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[26]),
        .Q(p_0_in[18]),
        .R(1'b0));
  FDRE \shift_reg_reg[27] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[27]),
        .Q(p_0_in[19]),
        .R(1'b0));
  FDRE \shift_reg_reg[28] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[28]),
        .Q(p_0_in[20]),
        .R(1'b0));
  FDRE \shift_reg_reg[29] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[29]),
        .Q(p_0_in[21]),
        .R(1'b0));
  FDRE \shift_reg_reg[30] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[30]),
        .Q(p_0_in[22]),
        .R(1'b0));
  FDRE \shift_reg_reg[31] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[31]),
        .Q(p_0_in[23]),
        .R(1'b0));
  FDRE \shift_reg_reg[32] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[32]),
        .Q(p_0_in[24]),
        .R(1'b0));
  FDRE \shift_reg_reg[33] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[33]),
        .Q(p_0_in[25]),
        .R(1'b0));
  FDRE \shift_reg_reg[34] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[34]),
        .Q(p_0_in[26]),
        .R(1'b0));
  FDRE \shift_reg_reg[35] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[35]),
        .Q(p_0_in[27]),
        .R(1'b0));
  FDRE \shift_reg_reg[36] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[36]),
        .Q(p_0_in[28]),
        .R(1'b0));
  FDRE \shift_reg_reg[37] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[37]),
        .Q(p_0_in[29]),
        .R(1'b0));
  FDRE \shift_reg_reg[38] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[38]),
        .Q(p_0_in[30]),
        .R(1'b0));
  FDRE \shift_reg_reg[39] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[39]),
        .Q(p_0_in[31]),
        .R(1'b0));
  FDRE \shift_reg_reg[40] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[40]),
        .Q(p_0_in[32]),
        .R(1'b0));
  FDRE \shift_reg_reg[41] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[41]),
        .Q(p_0_in[33]),
        .R(1'b0));
  FDRE \shift_reg_reg[42] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[42]),
        .Q(p_0_in[34]),
        .R(1'b0));
  FDRE \shift_reg_reg[43] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[43]),
        .Q(p_0_in[35]),
        .R(1'b0));
  FDRE \shift_reg_reg[44] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[44]),
        .Q(p_0_in[36]),
        .R(1'b0));
  FDRE \shift_reg_reg[45] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[45]),
        .Q(p_0_in[37]),
        .R(1'b0));
  FDRE \shift_reg_reg[46] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[46]),
        .Q(p_0_in[38]),
        .R(1'b0));
  FDRE \shift_reg_reg[47] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[47]),
        .Q(p_0_in[39]),
        .R(1'b0));
  FDRE \shift_reg_reg[48] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[48]),
        .Q(p_0_in[40]),
        .R(1'b0));
  FDRE \shift_reg_reg[49] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[49]),
        .Q(p_0_in[41]),
        .R(1'b0));
  FDRE \shift_reg_reg[50] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[50]),
        .Q(p_0_in[42]),
        .R(1'b0));
  FDRE \shift_reg_reg[51] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[51]),
        .Q(p_0_in[43]),
        .R(1'b0));
  FDRE \shift_reg_reg[52] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[52]),
        .Q(p_0_in[44]),
        .R(1'b0));
  FDRE \shift_reg_reg[53] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[53]),
        .Q(p_0_in[45]),
        .R(1'b0));
  FDRE \shift_reg_reg[54] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[54]),
        .Q(p_0_in[46]),
        .R(1'b0));
  FDRE \shift_reg_reg[55] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[55]),
        .Q(p_0_in[47]),
        .R(1'b0));
  FDRE \shift_reg_reg[56] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(i_data[0]),
        .Q(p_0_in[48]),
        .R(1'b0));
  FDRE \shift_reg_reg[57] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(i_data[1]),
        .Q(p_0_in[49]),
        .R(1'b0));
  FDRE \shift_reg_reg[58] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(i_data[2]),
        .Q(p_0_in[50]),
        .R(1'b0));
  FDRE \shift_reg_reg[59] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(i_data[3]),
        .Q(p_0_in[51]),
        .R(1'b0));
  FDRE \shift_reg_reg[60] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(i_data[4]),
        .Q(p_0_in[52]),
        .R(1'b0));
  FDRE \shift_reg_reg[61] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(i_data[5]),
        .Q(p_0_in[53]),
        .R(1'b0));
  FDRE \shift_reg_reg[62] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(i_data[6]),
        .Q(p_0_in[54]),
        .R(1'b0));
  FDRE \shift_reg_reg[63] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(i_data[7]),
        .Q(p_0_in[55]),
        .R(1'b0));
  FDRE \shift_reg_reg[8] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[8]),
        .Q(p_0_in[0]),
        .R(1'b0));
  FDRE \shift_reg_reg[9] 
       (.C(i_clk),
        .CE(\byte_cnt[2]_i_1_n_0 ),
        .D(p_0_in[9]),
        .Q(p_0_in[1]),
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
