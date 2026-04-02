// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Tue Mar 17 21:22:45 2026
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
  input [127:0]i_Wr_Data;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 i_Rd_Clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_Rd_Clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_in1_0, INSERT_VIP 0" *) input i_Rd_Clk;
  input [7:0]i_Rd_Addr;
  input i_Rd_En;
  output o_Rd_DV;
  output [127:0]o_Rd_Data;

  wire [7:0]i_Rd_Addr;
  wire i_Rd_Clk;
  wire i_Rd_En;
  wire [7:0]i_Wr_Addr;
  wire i_Wr_Clk;
  wire i_Wr_DV;
  wire [127:0]i_Wr_Data;
  wire o_Rd_DV;
  wire [127:0]o_Rd_Data;

  design_1_RAM64_0_0_RAM64 inst
       (.i_Rd_Addr(i_Rd_Addr),
        .i_Rd_Clk(i_Rd_Clk),
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
   (o_Rd_Data,
    o_Rd_DV,
    i_Rd_Clk,
    i_Wr_Clk,
    i_Rd_Addr,
    i_Wr_Addr,
    i_Wr_Data,
    i_Wr_DV,
    i_Rd_En);
  output [127:0]o_Rd_Data;
  output o_Rd_DV;
  input i_Rd_Clk;
  input i_Wr_Clk;
  input [7:0]i_Rd_Addr;
  input [7:0]i_Wr_Addr;
  input [127:0]i_Wr_Data;
  input i_Wr_DV;
  input i_Rd_En;

  wire [7:0]i_Rd_Addr;
  wire i_Rd_Clk;
  wire i_Rd_En;
  wire [7:0]i_Wr_Addr;
  wire i_Wr_Clk;
  wire i_Wr_DV;
  wire [127:0]i_Wr_Data;
  wire o_Rd_DV;
  wire [127:0]o_Rd_Data;
  wire NLW_r_Mem_reg_0_CASCADEOUTA_UNCONNECTED;
  wire NLW_r_Mem_reg_0_CASCADEOUTB_UNCONNECTED;
  wire NLW_r_Mem_reg_0_DBITERR_UNCONNECTED;
  wire NLW_r_Mem_reg_0_SBITERR_UNCONNECTED;
  wire [7:0]NLW_r_Mem_reg_0_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_r_Mem_reg_0_RDADDRECC_UNCONNECTED;
  wire NLW_r_Mem_reg_1_CASCADEOUTA_UNCONNECTED;
  wire NLW_r_Mem_reg_1_CASCADEOUTB_UNCONNECTED;
  wire NLW_r_Mem_reg_1_DBITERR_UNCONNECTED;
  wire NLW_r_Mem_reg_1_SBITERR_UNCONNECTED;
  wire [31:24]NLW_r_Mem_reg_1_DOBDO_UNCONNECTED;
  wire [3:0]NLW_r_Mem_reg_1_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_r_Mem_reg_1_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_r_Mem_reg_1_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_r_Mem_reg_1_RDADDRECC_UNCONNECTED;

  FDRE o_Rd_DV_reg
       (.C(i_Rd_Clk),
        .CE(1'b1),
        .D(i_Rd_En),
        .Q(o_Rd_DV),
        .R(1'b0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p8_d64" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p8_d64" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "design_1_RAM64_0_0/inst/r_Mem_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "256" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "71" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    r_Mem_reg_0
       (.ADDRARDADDR({1'b1,1'b1,i_Rd_Addr,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,i_Wr_Addr,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(NLW_r_Mem_reg_0_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_r_Mem_reg_0_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(i_Rd_Clk),
        .CLKBWRCLK(i_Wr_Clk),
        .DBITERR(NLW_r_Mem_reg_0_DBITERR_UNCONNECTED),
        .DIADI(i_Wr_Data[31:0]),
        .DIBDI(i_Wr_Data[63:32]),
        .DIPADIP(i_Wr_Data[67:64]),
        .DIPBDIP(i_Wr_Data[71:68]),
        .DOADO(o_Rd_Data[31:0]),
        .DOBDO(o_Rd_Data[63:32]),
        .DOPADOP(o_Rd_Data[67:64]),
        .DOPBDOP(o_Rd_Data[71:68]),
        .ECCPARITY(NLW_r_Mem_reg_0_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(1'b1),
        .ENBWREN(1'b1),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_r_Mem_reg_0_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_r_Mem_reg_0_SBITERR_UNCONNECTED),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({i_Wr_DV,i_Wr_DV,i_Wr_DV,i_Wr_DV,i_Wr_DV,i_Wr_DV,i_Wr_DV,i_Wr_DV}));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d56" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d56" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "design_1_RAM64_0_0/inst/r_Mem_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "256" *) 
  (* ram_slice_begin = "72" *) 
  (* ram_slice_end = "127" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    r_Mem_reg_1
       (.ADDRARDADDR({1'b1,1'b1,i_Rd_Addr,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,i_Wr_Addr,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(NLW_r_Mem_reg_1_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_r_Mem_reg_1_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(i_Rd_Clk),
        .CLKBWRCLK(i_Wr_Clk),
        .DBITERR(NLW_r_Mem_reg_1_DBITERR_UNCONNECTED),
        .DIADI(i_Wr_Data[103:72]),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,i_Wr_Data[127:104]}),
        .DIPADIP({1'b1,1'b1,1'b1,1'b1}),
        .DIPBDIP({1'b1,1'b1,1'b1,1'b1}),
        .DOADO(o_Rd_Data[103:72]),
        .DOBDO({NLW_r_Mem_reg_1_DOBDO_UNCONNECTED[31:24],o_Rd_Data[127:104]}),
        .DOPADOP(NLW_r_Mem_reg_1_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_r_Mem_reg_1_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_r_Mem_reg_1_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(1'b1),
        .ENBWREN(1'b1),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_r_Mem_reg_1_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_r_Mem_reg_1_SBITERR_UNCONNECTED),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({i_Wr_DV,i_Wr_DV,i_Wr_DV,i_Wr_DV,i_Wr_DV,i_Wr_DV,i_Wr_DV,i_Wr_DV}));
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
