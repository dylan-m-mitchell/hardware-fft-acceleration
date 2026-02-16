-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Mon Feb 16 15:28:38 2026
-- Host        : dylan_pc running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/dlnmt/man_bram/man_bram.gen/sources_1/bd/design_1/ip/design_1_RAM64_0_0/design_1_RAM64_0_0_stub.vhdl
-- Design      : design_1_RAM64_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7s25csga324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_RAM64_0_0 is
  Port ( 
    i_Wr_Clk : in STD_LOGIC;
    i_Wr_Addr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    i_Wr_DV : in STD_LOGIC;
    i_Wr_Data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    i_Rd_Clk : in STD_LOGIC;
    i_Rd_Addr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    i_Rd_En : in STD_LOGIC;
    o_Rd_DV : out STD_LOGIC;
    o_Rd_Data : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_RAM64_0_0 : entity is "design_1_RAM64_0_0,RAM64,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1_RAM64_0_0 : entity is "design_1_RAM64_0_0,RAM64,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=RAM64,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,WIDTH=64,DEPTH=256}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_RAM64_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_RAM64_0_0 : entity is "module_ref";
end design_1_RAM64_0_0;

architecture stub of design_1_RAM64_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "i_Wr_Clk,i_Wr_Addr[7:0],i_Wr_DV,i_Wr_Data[63:0],i_Rd_Clk,i_Rd_Addr[7:0],i_Rd_En,o_Rd_DV,o_Rd_Data[63:0]";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of i_Wr_Clk : signal is "xilinx.com:signal:clock:1.0 i_Wr_Clk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of i_Wr_Clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of i_Wr_Clk : signal is "XIL_INTERFACENAME i_Wr_Clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_in1_0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of i_Rd_Clk : signal is "xilinx.com:signal:clock:1.0 i_Rd_Clk CLK";
  attribute X_INTERFACE_MODE of i_Rd_Clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER of i_Rd_Clk : signal is "XIL_INTERFACENAME i_Rd_Clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_in1_0, INSERT_VIP 0";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "RAM64,Vivado 2025.1";
begin
end;
