// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Mon Feb 16 15:28:38 2026
// Host        : dylan_pc running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/dlnmt/man_bram/man_bram.gen/sources_1/bd/design_1/ip/design_1_RAM64_0_0/design_1_RAM64_0_0_sim_netlist.v
// Design      : design_1_RAM64_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s25csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_RAM64_0_0,RAM64,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "RAM64,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module design_1_RAM64_0_0
   (i_Wr_Clk,
    i_Wr_Addr,
    i_Wr_DV,
    i_Wr_Data,
    i_Rd_Clk,
    i_Rd_Addr,
    i_Rd_En,
    o_Rd_DV,
    o_Rd_Data);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 i_Wr_Clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_Wr_Clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_in1_0, INSERT_VIP 0" *) input i_Wr_Clk;
  input [7:0]i_Wr_Addr;
  input i_Wr_DV;
  input [63:0]i_Wr_Data;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 i_Rd_Clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_Rd_Clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_in1_0, INSERT_VIP 0" *) input i_Rd_Clk;
  input [7:0]i_Rd_Addr;
  input i_Rd_En;
  output o_Rd_DV;
  output [63:0]o_Rd_Data;

  wire i_Rd_Clk;
  wire i_Rd_En;
  wire [7:0]i_Wr_Addr;
  wire i_Wr_Clk;
  wire i_Wr_DV;
  wire [63:0]i_Wr_Data;
  wire o_Rd_DV;
  wire [63:0]o_Rd_Data;

  design_1_RAM64_0_0_RAM64 inst
       (.i_Rd_Clk(i_Rd_Clk),
        .i_Rd_En(i_Rd_En),
        .i_Wr_Addr(i_Wr_Addr),
        .i_Wr_Clk(i_Wr_Clk),
        .i_Wr_DV(i_Wr_DV),
        .i_Wr_Data(i_Wr_Data),
        .o_Rd_DV(o_Rd_DV),
        .o_Rd_Data(o_Rd_Data));
endmodule

(* ORIG_REF_NAME = "RAM64" *) 
module design_1_RAM64_0_0_RAM64
   (o_Rd_DV,
    o_Rd_Data,
    i_Rd_En,
    i_Rd_Clk,
    i_Wr_Data,
    i_Wr_Clk,
    i_Wr_DV,
    i_Wr_Addr);
  output o_Rd_DV;
  output [63:0]o_Rd_Data;
  input i_Rd_En;
  input i_Rd_Clk;
  input [63:0]i_Wr_Data;
  input i_Wr_Clk;
  input i_Wr_DV;
  input [7:0]i_Wr_Addr;

  wire i_Rd_Clk;
  wire i_Rd_En;
  wire [7:0]i_Wr_Addr;
  wire i_Wr_Clk;
  wire i_Wr_DV;
  wire [63:0]i_Wr_Data;
  wire o_Rd_DV;
  wire [63:0]o_Rd_Data;
  wire r_Mem;
  wire \r_Mem[0][63]_i_2_n_0 ;
  wire [63:0]\r_Mem_reg[0] ;

  FDRE o_Rd_DV_reg
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(i_Rd_En),
        .Q(o_Rd_DV),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[0] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [0]),
        .Q(o_Rd_Data[0]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[10] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [10]),
        .Q(o_Rd_Data[10]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[11] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [11]),
        .Q(o_Rd_Data[11]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[12] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [12]),
        .Q(o_Rd_Data[12]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[13] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [13]),
        .Q(o_Rd_Data[13]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[14] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [14]),
        .Q(o_Rd_Data[14]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[15] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [15]),
        .Q(o_Rd_Data[15]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[16] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [16]),
        .Q(o_Rd_Data[16]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[17] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [17]),
        .Q(o_Rd_Data[17]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[18] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [18]),
        .Q(o_Rd_Data[18]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[19] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [19]),
        .Q(o_Rd_Data[19]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[1] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [1]),
        .Q(o_Rd_Data[1]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[20] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [20]),
        .Q(o_Rd_Data[20]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[21] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [21]),
        .Q(o_Rd_Data[21]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[22] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [22]),
        .Q(o_Rd_Data[22]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[23] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [23]),
        .Q(o_Rd_Data[23]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[24] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [24]),
        .Q(o_Rd_Data[24]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[25] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [25]),
        .Q(o_Rd_Data[25]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[26] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [26]),
        .Q(o_Rd_Data[26]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[27] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [27]),
        .Q(o_Rd_Data[27]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[28] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [28]),
        .Q(o_Rd_Data[28]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[29] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [29]),
        .Q(o_Rd_Data[29]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[2] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [2]),
        .Q(o_Rd_Data[2]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[30] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [30]),
        .Q(o_Rd_Data[30]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[31] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [31]),
        .Q(o_Rd_Data[31]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[32] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [32]),
        .Q(o_Rd_Data[32]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[33] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [33]),
        .Q(o_Rd_Data[33]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[34] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [34]),
        .Q(o_Rd_Data[34]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[35] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [35]),
        .Q(o_Rd_Data[35]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[36] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [36]),
        .Q(o_Rd_Data[36]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[37] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [37]),
        .Q(o_Rd_Data[37]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[38] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [38]),
        .Q(o_Rd_Data[38]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[39] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [39]),
        .Q(o_Rd_Data[39]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[3] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [3]),
        .Q(o_Rd_Data[3]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[40] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [40]),
        .Q(o_Rd_Data[40]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[41] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [41]),
        .Q(o_Rd_Data[41]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[42] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [42]),
        .Q(o_Rd_Data[42]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[43] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [43]),
        .Q(o_Rd_Data[43]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[44] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [44]),
        .Q(o_Rd_Data[44]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[45] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [45]),
        .Q(o_Rd_Data[45]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[46] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [46]),
        .Q(o_Rd_Data[46]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[47] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [47]),
        .Q(o_Rd_Data[47]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[48] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [48]),
        .Q(o_Rd_Data[48]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[49] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [49]),
        .Q(o_Rd_Data[49]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[4] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [4]),
        .Q(o_Rd_Data[4]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[50] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [50]),
        .Q(o_Rd_Data[50]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[51] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [51]),
        .Q(o_Rd_Data[51]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[52] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [52]),
        .Q(o_Rd_Data[52]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[53] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [53]),
        .Q(o_Rd_Data[53]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[54] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [54]),
        .Q(o_Rd_Data[54]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[55] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [55]),
        .Q(o_Rd_Data[55]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[56] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [56]),
        .Q(o_Rd_Data[56]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[57] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [57]),
        .Q(o_Rd_Data[57]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[58] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [58]),
        .Q(o_Rd_Data[58]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[59] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [59]),
        .Q(o_Rd_Data[59]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[5] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [5]),
        .Q(o_Rd_Data[5]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[60] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [60]),
        .Q(o_Rd_Data[60]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[61] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [61]),
        .Q(o_Rd_Data[61]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[62] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [62]),
        .Q(o_Rd_Data[62]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[63] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [63]),
        .Q(o_Rd_Data[63]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[6] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [6]),
        .Q(o_Rd_Data[6]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[7] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [7]),
        .Q(o_Rd_Data[7]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[8] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [8]),
        .Q(o_Rd_Data[8]),
        .R(1'b0));
  FDRE \o_Rd_Data_reg[9] 
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(\r_Mem_reg[0] [9]),
        .Q(o_Rd_Data[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \r_Mem[0][63]_i_1 
       (.I0(i_Wr_DV),
        .I1(\r_Mem[0][63]_i_2_n_0 ),
        .I2(i_Wr_Addr[7]),
        .I3(i_Wr_Addr[6]),
        .I4(i_Wr_Addr[4]),
        .I5(i_Wr_Addr[5]),
        .O(r_Mem));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \r_Mem[0][63]_i_2 
       (.I0(i_Wr_Addr[2]),
        .I1(i_Wr_Addr[3]),
        .I2(i_Wr_Addr[0]),
        .I3(i_Wr_Addr[1]),
        .O(\r_Mem[0][63]_i_2_n_0 ));
  FDRE \r_Mem_reg[0][0] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[0]),
        .Q(\r_Mem_reg[0] [0]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][10] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[10]),
        .Q(\r_Mem_reg[0] [10]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][11] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[11]),
        .Q(\r_Mem_reg[0] [11]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][12] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[12]),
        .Q(\r_Mem_reg[0] [12]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][13] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[13]),
        .Q(\r_Mem_reg[0] [13]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][14] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[14]),
        .Q(\r_Mem_reg[0] [14]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][15] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[15]),
        .Q(\r_Mem_reg[0] [15]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][16] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[16]),
        .Q(\r_Mem_reg[0] [16]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][17] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[17]),
        .Q(\r_Mem_reg[0] [17]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][18] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[18]),
        .Q(\r_Mem_reg[0] [18]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][19] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[19]),
        .Q(\r_Mem_reg[0] [19]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][1] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[1]),
        .Q(\r_Mem_reg[0] [1]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][20] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[20]),
        .Q(\r_Mem_reg[0] [20]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][21] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[21]),
        .Q(\r_Mem_reg[0] [21]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][22] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[22]),
        .Q(\r_Mem_reg[0] [22]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][23] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[23]),
        .Q(\r_Mem_reg[0] [23]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][24] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[24]),
        .Q(\r_Mem_reg[0] [24]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][25] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[25]),
        .Q(\r_Mem_reg[0] [25]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][26] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[26]),
        .Q(\r_Mem_reg[0] [26]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][27] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[27]),
        .Q(\r_Mem_reg[0] [27]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][28] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[28]),
        .Q(\r_Mem_reg[0] [28]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][29] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[29]),
        .Q(\r_Mem_reg[0] [29]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][2] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[2]),
        .Q(\r_Mem_reg[0] [2]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][30] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[30]),
        .Q(\r_Mem_reg[0] [30]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][31] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[31]),
        .Q(\r_Mem_reg[0] [31]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][32] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[32]),
        .Q(\r_Mem_reg[0] [32]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][33] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[33]),
        .Q(\r_Mem_reg[0] [33]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][34] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[34]),
        .Q(\r_Mem_reg[0] [34]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][35] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[35]),
        .Q(\r_Mem_reg[0] [35]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][36] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[36]),
        .Q(\r_Mem_reg[0] [36]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][37] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[37]),
        .Q(\r_Mem_reg[0] [37]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][38] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[38]),
        .Q(\r_Mem_reg[0] [38]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][39] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[39]),
        .Q(\r_Mem_reg[0] [39]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][3] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[3]),
        .Q(\r_Mem_reg[0] [3]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][40] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[40]),
        .Q(\r_Mem_reg[0] [40]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][41] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[41]),
        .Q(\r_Mem_reg[0] [41]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][42] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[42]),
        .Q(\r_Mem_reg[0] [42]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][43] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[43]),
        .Q(\r_Mem_reg[0] [43]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][44] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[44]),
        .Q(\r_Mem_reg[0] [44]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][45] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[45]),
        .Q(\r_Mem_reg[0] [45]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][46] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[46]),
        .Q(\r_Mem_reg[0] [46]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][47] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[47]),
        .Q(\r_Mem_reg[0] [47]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][48] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[48]),
        .Q(\r_Mem_reg[0] [48]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][49] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[49]),
        .Q(\r_Mem_reg[0] [49]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][4] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[4]),
        .Q(\r_Mem_reg[0] [4]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][50] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[50]),
        .Q(\r_Mem_reg[0] [50]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][51] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[51]),
        .Q(\r_Mem_reg[0] [51]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][52] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[52]),
        .Q(\r_Mem_reg[0] [52]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][53] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[53]),
        .Q(\r_Mem_reg[0] [53]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][54] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[54]),
        .Q(\r_Mem_reg[0] [54]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][55] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[55]),
        .Q(\r_Mem_reg[0] [55]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][56] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[56]),
        .Q(\r_Mem_reg[0] [56]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][57] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[57]),
        .Q(\r_Mem_reg[0] [57]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][58] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[58]),
        .Q(\r_Mem_reg[0] [58]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][59] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[59]),
        .Q(\r_Mem_reg[0] [59]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][5] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[5]),
        .Q(\r_Mem_reg[0] [5]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][60] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[60]),
        .Q(\r_Mem_reg[0] [60]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][61] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[61]),
        .Q(\r_Mem_reg[0] [61]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][62] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[62]),
        .Q(\r_Mem_reg[0] [62]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][63] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[63]),
        .Q(\r_Mem_reg[0] [63]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][6] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[6]),
        .Q(\r_Mem_reg[0] [6]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][7] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[7]),
        .Q(\r_Mem_reg[0] [7]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][8] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[8]),
        .Q(\r_Mem_reg[0] [8]),
        .R(1'b0));
  FDRE \r_Mem_reg[0][9] 
       (.C(i_Wr_Clk),
        .CE(r_Mem),
        .D(i_Wr_Data[9]),
        .Q(\r_Mem_reg[0] [9]),
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
