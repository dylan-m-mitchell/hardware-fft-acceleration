-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Wed Feb 18 19:01:13 2026
-- Host        : dylan_pc running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/dlnmt/man_bram/man_bram.gen/sources_1/bd/design_1/ip/design_1_RAM128_0_0/design_1_RAM128_0_0_sim_netlist.vhdl
-- Design      : design_1_RAM128_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7s25csga324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_RAM128_0_0_RAM128 is
  port (
    o_Rd_Data : out STD_LOGIC_VECTOR ( 127 downto 0 );
    o_Rd_DV : out STD_LOGIC;
    o_RAM_Full : out STD_LOGIC;
    i_Rd_Clk : in STD_LOGIC;
    i_Wr_Clk : in STD_LOGIC;
    i_Rd_Addr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    i_Wr_Addr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    i_Wr_Data : in STD_LOGIC_VECTOR ( 127 downto 0 );
    i_Wr_DV : in STD_LOGIC;
    i_Rd_En : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_RAM128_0_0_RAM128 : entity is "RAM128";
end design_1_RAM128_0_0_RAM128;

architecture STRUCTURE of design_1_RAM128_0_0_RAM128 is
  signal o_RAM_Full_i_1_n_0 : STD_LOGIC;
  signal o_RAM_Full_i_2_n_0 : STD_LOGIC;
  signal o_RAM_Full_i_3_n_0 : STD_LOGIC;
  signal r_Mem_reg_1_i_1_n_0 : STD_LOGIC;
  signal r_frame_done : STD_LOGIC;
  signal r_frame_done_i_1_n_0 : STD_LOGIC;
  signal NLW_r_Mem_reg_0_CASCADEOUTA_UNCONNECTED : STD_LOGIC;
  signal NLW_r_Mem_reg_0_CASCADEOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_r_Mem_reg_0_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_r_Mem_reg_0_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_r_Mem_reg_0_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_r_Mem_reg_0_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_r_Mem_reg_1_CASCADEOUTA_UNCONNECTED : STD_LOGIC;
  signal NLW_r_Mem_reg_1_CASCADEOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_r_Mem_reg_1_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_r_Mem_reg_1_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_r_Mem_reg_1_DOBDO_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 24 );
  signal NLW_r_Mem_reg_1_DOPADOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_r_Mem_reg_1_DOPBDOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_r_Mem_reg_1_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_r_Mem_reg_1_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of o_RAM_Full_i_1 : label is "soft_lutpair0";
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of r_Mem_reg_0 : label is "p8_d64";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of r_Mem_reg_0 : label is "p8_d64";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of r_Mem_reg_0 : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of r_Mem_reg_0 : label is 32768;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of r_Mem_reg_0 : label is "design_1_RAM128_0_0/inst/r_Mem_reg";
  attribute RTL_RAM_STYLE : string;
  attribute RTL_RAM_STYLE of r_Mem_reg_0 : label is "auto";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of r_Mem_reg_0 : label is "RAM_SDP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of r_Mem_reg_0 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of r_Mem_reg_0 : label is 511;
  attribute ram_offset : integer;
  attribute ram_offset of r_Mem_reg_0 : label is 256;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of r_Mem_reg_0 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of r_Mem_reg_0 : label is 71;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of r_Mem_reg_1 : label is "p0_d56";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of r_Mem_reg_1 : label is "p0_d56";
  attribute METHODOLOGY_DRC_VIOS of r_Mem_reg_1 : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS of r_Mem_reg_1 : label is 32768;
  attribute RTL_RAM_NAME of r_Mem_reg_1 : label is "design_1_RAM128_0_0/inst/r_Mem_reg";
  attribute RTL_RAM_STYLE of r_Mem_reg_1 : label is "auto";
  attribute RTL_RAM_TYPE of r_Mem_reg_1 : label is "RAM_SDP";
  attribute ram_addr_begin of r_Mem_reg_1 : label is 0;
  attribute ram_addr_end of r_Mem_reg_1 : label is 511;
  attribute ram_offset of r_Mem_reg_1 : label is 256;
  attribute ram_slice_begin of r_Mem_reg_1 : label is 72;
  attribute ram_slice_end of r_Mem_reg_1 : label is 127;
  attribute SOFT_HLUTNM of r_frame_done_i_1 : label is "soft_lutpair0";
begin
o_RAM_Full_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0100"
    )
        port map (
      I0 => r_frame_done,
      I1 => o_RAM_Full_i_2_n_0,
      I2 => o_RAM_Full_i_3_n_0,
      I3 => i_Wr_DV,
      O => o_RAM_Full_i_1_n_0
    );
o_RAM_Full_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => i_Wr_Addr(7),
      I1 => i_Wr_Addr(6),
      I2 => i_Wr_Addr(4),
      I3 => i_Wr_Addr(5),
      O => o_RAM_Full_i_2_n_0
    );
o_RAM_Full_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => i_Wr_Addr(2),
      I1 => i_Wr_Addr(3),
      I2 => i_Wr_Addr(0),
      I3 => i_Wr_Addr(1),
      O => o_RAM_Full_i_3_n_0
    );
o_RAM_Full_reg: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => '1',
      D => o_RAM_Full_i_1_n_0,
      Q => o_RAM_Full,
      R => '0'
    );
o_Rd_DV_reg: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => i_Rd_En,
      Q => o_Rd_DV,
      R => '0'
    );
r_Mem_reg_0: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "SDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 72,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 0,
      WRITE_WIDTH_B => 72
    )
        port map (
      ADDRARDADDR(15 downto 14) => B"11",
      ADDRARDADDR(13 downto 6) => i_Rd_Addr(7 downto 0),
      ADDRARDADDR(5 downto 0) => B"111111",
      ADDRBWRADDR(15 downto 14) => B"11",
      ADDRBWRADDR(13 downto 6) => i_Wr_Addr(7 downto 0),
      ADDRBWRADDR(5 downto 0) => B"111111",
      CASCADEINA => '0',
      CASCADEINB => '0',
      CASCADEOUTA => NLW_r_Mem_reg_0_CASCADEOUTA_UNCONNECTED,
      CASCADEOUTB => NLW_r_Mem_reg_0_CASCADEOUTB_UNCONNECTED,
      CLKARDCLK => i_Rd_Clk,
      CLKBWRCLK => i_Wr_Clk,
      DBITERR => NLW_r_Mem_reg_0_DBITERR_UNCONNECTED,
      DIADI(31 downto 0) => i_Wr_Data(31 downto 0),
      DIBDI(31 downto 0) => i_Wr_Data(63 downto 32),
      DIPADIP(3 downto 0) => i_Wr_Data(67 downto 64),
      DIPBDIP(3 downto 0) => i_Wr_Data(71 downto 68),
      DOADO(31 downto 0) => o_Rd_Data(31 downto 0),
      DOBDO(31 downto 0) => o_Rd_Data(63 downto 32),
      DOPADOP(3 downto 0) => o_Rd_Data(67 downto 64),
      DOPBDOP(3 downto 0) => o_Rd_Data(71 downto 68),
      ECCPARITY(7 downto 0) => NLW_r_Mem_reg_0_ECCPARITY_UNCONNECTED(7 downto 0),
      ENARDEN => '1',
      ENBWREN => r_Mem_reg_1_i_1_n_0,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => NLW_r_Mem_reg_0_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_r_Mem_reg_0_SBITERR_UNCONNECTED,
      WEA(3 downto 0) => B"0000",
      WEBWE(7) => i_Wr_DV,
      WEBWE(6) => i_Wr_DV,
      WEBWE(5) => i_Wr_DV,
      WEBWE(4) => i_Wr_DV,
      WEBWE(3) => i_Wr_DV,
      WEBWE(2) => i_Wr_DV,
      WEBWE(1) => i_Wr_DV,
      WEBWE(0) => i_Wr_DV
    );
r_Mem_reg_1: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "SDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 72,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 0,
      WRITE_WIDTH_B => 72
    )
        port map (
      ADDRARDADDR(15 downto 14) => B"11",
      ADDRARDADDR(13 downto 6) => i_Rd_Addr(7 downto 0),
      ADDRARDADDR(5 downto 0) => B"111111",
      ADDRBWRADDR(15 downto 14) => B"11",
      ADDRBWRADDR(13 downto 6) => i_Wr_Addr(7 downto 0),
      ADDRBWRADDR(5 downto 0) => B"111111",
      CASCADEINA => '0',
      CASCADEINB => '0',
      CASCADEOUTA => NLW_r_Mem_reg_1_CASCADEOUTA_UNCONNECTED,
      CASCADEOUTB => NLW_r_Mem_reg_1_CASCADEOUTB_UNCONNECTED,
      CLKARDCLK => i_Rd_Clk,
      CLKBWRCLK => i_Wr_Clk,
      DBITERR => NLW_r_Mem_reg_1_DBITERR_UNCONNECTED,
      DIADI(31 downto 0) => i_Wr_Data(103 downto 72),
      DIBDI(31 downto 24) => B"11111111",
      DIBDI(23 downto 0) => i_Wr_Data(127 downto 104),
      DIPADIP(3 downto 0) => B"1111",
      DIPBDIP(3 downto 0) => B"1111",
      DOADO(31 downto 0) => o_Rd_Data(103 downto 72),
      DOBDO(31 downto 24) => NLW_r_Mem_reg_1_DOBDO_UNCONNECTED(31 downto 24),
      DOBDO(23 downto 0) => o_Rd_Data(127 downto 104),
      DOPADOP(3 downto 0) => NLW_r_Mem_reg_1_DOPADOP_UNCONNECTED(3 downto 0),
      DOPBDOP(3 downto 0) => NLW_r_Mem_reg_1_DOPBDOP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_r_Mem_reg_1_ECCPARITY_UNCONNECTED(7 downto 0),
      ENARDEN => '1',
      ENBWREN => r_Mem_reg_1_i_1_n_0,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => NLW_r_Mem_reg_1_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_r_Mem_reg_1_SBITERR_UNCONNECTED,
      WEA(3 downto 0) => B"0000",
      WEBWE(7) => i_Wr_DV,
      WEBWE(6) => i_Wr_DV,
      WEBWE(5) => i_Wr_DV,
      WEBWE(4) => i_Wr_DV,
      WEBWE(3) => i_Wr_DV,
      WEBWE(2) => i_Wr_DV,
      WEBWE(1) => i_Wr_DV,
      WEBWE(0) => i_Wr_DV
    );
r_Mem_reg_1_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_frame_done,
      O => r_Mem_reg_1_i_1_n_0
    );
r_frame_done_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AB00"
    )
        port map (
      I0 => r_frame_done,
      I1 => o_RAM_Full_i_3_n_0,
      I2 => o_RAM_Full_i_2_n_0,
      I3 => i_Wr_DV,
      O => r_frame_done_i_1_n_0
    );
r_frame_done_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_Wr_Clk,
      CE => '1',
      D => r_frame_done_i_1_n_0,
      Q => r_frame_done,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_RAM128_0_0 is
  port (
    i_Wr_Clk : in STD_LOGIC;
    i_Wr_Addr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    i_Wr_DV : in STD_LOGIC;
    i_Wr_Data : in STD_LOGIC_VECTOR ( 127 downto 0 );
    i_Rd_Clk : in STD_LOGIC;
    i_Rd_Addr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    i_Rd_En : in STD_LOGIC;
    o_Rd_DV : out STD_LOGIC;
    o_Rd_Data : out STD_LOGIC_VECTOR ( 127 downto 0 );
    o_RAM_Full : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_RAM128_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_RAM128_0_0 : entity is "design_1_RAM128_0_0,RAM128,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_RAM128_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_RAM128_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_RAM128_0_0 : entity is "RAM128,Vivado 2025.1";
end design_1_RAM128_0_0;

architecture STRUCTURE of design_1_RAM128_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of i_Rd_Clk : signal is "xilinx.com:signal:clock:1.0 i_Rd_Clk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of i_Rd_Clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of i_Rd_Clk : signal is "XIL_INTERFACENAME i_Rd_Clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_in1_0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of i_Wr_Clk : signal is "xilinx.com:signal:clock:1.0 i_Wr_Clk CLK";
  attribute X_INTERFACE_MODE of i_Wr_Clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER of i_Wr_Clk : signal is "XIL_INTERFACENAME i_Wr_Clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_in1_0, INSERT_VIP 0";
begin
inst: entity work.design_1_RAM128_0_0_RAM128
     port map (
      i_Rd_Addr(7 downto 0) => i_Rd_Addr(7 downto 0),
      i_Rd_Clk => i_Rd_Clk,
      i_Rd_En => i_Rd_En,
      i_Wr_Addr(7 downto 0) => i_Wr_Addr(7 downto 0),
      i_Wr_Clk => i_Wr_Clk,
      i_Wr_DV => i_Wr_DV,
      i_Wr_Data(127 downto 0) => i_Wr_Data(127 downto 0),
      o_RAM_Full => o_RAM_Full,
      o_Rd_DV => o_Rd_DV,
      o_Rd_Data(127 downto 0) => o_Rd_Data(127 downto 0)
    );
end STRUCTURE;
