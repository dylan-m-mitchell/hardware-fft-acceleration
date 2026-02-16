-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Mon Feb 16 15:28:38 2026
-- Host        : dylan_pc running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/dlnmt/man_bram/man_bram.gen/sources_1/bd/design_1/ip/design_1_RAM64_0_0/design_1_RAM64_0_0_sim_netlist.vhdl
-- Design      : design_1_RAM64_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7s25csga324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_RAM64_0_0_RAM64 is
  port (
    o_Rd_DV : out STD_LOGIC;
    o_Rd_Data : out STD_LOGIC_VECTOR ( 63 downto 0 );
    i_Rd_En : in STD_LOGIC;
    i_Rd_Clk : in STD_LOGIC;
    i_Wr_Data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    i_Wr_Clk : in STD_LOGIC;
    i_Wr_DV : in STD_LOGIC;
    i_Wr_Addr : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_RAM64_0_0_RAM64 : entity is "RAM64";
end design_1_RAM64_0_0_RAM64;

architecture STRUCTURE of design_1_RAM64_0_0_RAM64 is
  signal r_Mem : STD_LOGIC;
  signal \r_Mem[0][63]_i_2_n_0\ : STD_LOGIC;
  signal \r_Mem_reg[0]\ : STD_LOGIC_VECTOR ( 63 downto 0 );
begin
o_Rd_DV_reg: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => i_Rd_En,
      Q => o_Rd_DV,
      R => '0'
    );
\o_Rd_Data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(0),
      Q => o_Rd_Data(0),
      R => '0'
    );
\o_Rd_Data_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(10),
      Q => o_Rd_Data(10),
      R => '0'
    );
\o_Rd_Data_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(11),
      Q => o_Rd_Data(11),
      R => '0'
    );
\o_Rd_Data_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(12),
      Q => o_Rd_Data(12),
      R => '0'
    );
\o_Rd_Data_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(13),
      Q => o_Rd_Data(13),
      R => '0'
    );
\o_Rd_Data_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(14),
      Q => o_Rd_Data(14),
      R => '0'
    );
\o_Rd_Data_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(15),
      Q => o_Rd_Data(15),
      R => '0'
    );
\o_Rd_Data_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(16),
      Q => o_Rd_Data(16),
      R => '0'
    );
\o_Rd_Data_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(17),
      Q => o_Rd_Data(17),
      R => '0'
    );
\o_Rd_Data_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(18),
      Q => o_Rd_Data(18),
      R => '0'
    );
\o_Rd_Data_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(19),
      Q => o_Rd_Data(19),
      R => '0'
    );
\o_Rd_Data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(1),
      Q => o_Rd_Data(1),
      R => '0'
    );
\o_Rd_Data_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(20),
      Q => o_Rd_Data(20),
      R => '0'
    );
\o_Rd_Data_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(21),
      Q => o_Rd_Data(21),
      R => '0'
    );
\o_Rd_Data_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(22),
      Q => o_Rd_Data(22),
      R => '0'
    );
\o_Rd_Data_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(23),
      Q => o_Rd_Data(23),
      R => '0'
    );
\o_Rd_Data_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(24),
      Q => o_Rd_Data(24),
      R => '0'
    );
\o_Rd_Data_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(25),
      Q => o_Rd_Data(25),
      R => '0'
    );
\o_Rd_Data_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(26),
      Q => o_Rd_Data(26),
      R => '0'
    );
\o_Rd_Data_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(27),
      Q => o_Rd_Data(27),
      R => '0'
    );
\o_Rd_Data_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(28),
      Q => o_Rd_Data(28),
      R => '0'
    );
\o_Rd_Data_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(29),
      Q => o_Rd_Data(29),
      R => '0'
    );
\o_Rd_Data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(2),
      Q => o_Rd_Data(2),
      R => '0'
    );
\o_Rd_Data_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(30),
      Q => o_Rd_Data(30),
      R => '0'
    );
\o_Rd_Data_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(31),
      Q => o_Rd_Data(31),
      R => '0'
    );
\o_Rd_Data_reg[32]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(32),
      Q => o_Rd_Data(32),
      R => '0'
    );
\o_Rd_Data_reg[33]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(33),
      Q => o_Rd_Data(33),
      R => '0'
    );
\o_Rd_Data_reg[34]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(34),
      Q => o_Rd_Data(34),
      R => '0'
    );
\o_Rd_Data_reg[35]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(35),
      Q => o_Rd_Data(35),
      R => '0'
    );
\o_Rd_Data_reg[36]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(36),
      Q => o_Rd_Data(36),
      R => '0'
    );
\o_Rd_Data_reg[37]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(37),
      Q => o_Rd_Data(37),
      R => '0'
    );
\o_Rd_Data_reg[38]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(38),
      Q => o_Rd_Data(38),
      R => '0'
    );
\o_Rd_Data_reg[39]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(39),
      Q => o_Rd_Data(39),
      R => '0'
    );
\o_Rd_Data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(3),
      Q => o_Rd_Data(3),
      R => '0'
    );
\o_Rd_Data_reg[40]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(40),
      Q => o_Rd_Data(40),
      R => '0'
    );
\o_Rd_Data_reg[41]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(41),
      Q => o_Rd_Data(41),
      R => '0'
    );
\o_Rd_Data_reg[42]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(42),
      Q => o_Rd_Data(42),
      R => '0'
    );
\o_Rd_Data_reg[43]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(43),
      Q => o_Rd_Data(43),
      R => '0'
    );
\o_Rd_Data_reg[44]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(44),
      Q => o_Rd_Data(44),
      R => '0'
    );
\o_Rd_Data_reg[45]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(45),
      Q => o_Rd_Data(45),
      R => '0'
    );
\o_Rd_Data_reg[46]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(46),
      Q => o_Rd_Data(46),
      R => '0'
    );
\o_Rd_Data_reg[47]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(47),
      Q => o_Rd_Data(47),
      R => '0'
    );
\o_Rd_Data_reg[48]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(48),
      Q => o_Rd_Data(48),
      R => '0'
    );
\o_Rd_Data_reg[49]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(49),
      Q => o_Rd_Data(49),
      R => '0'
    );
\o_Rd_Data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(4),
      Q => o_Rd_Data(4),
      R => '0'
    );
\o_Rd_Data_reg[50]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(50),
      Q => o_Rd_Data(50),
      R => '0'
    );
\o_Rd_Data_reg[51]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(51),
      Q => o_Rd_Data(51),
      R => '0'
    );
\o_Rd_Data_reg[52]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(52),
      Q => o_Rd_Data(52),
      R => '0'
    );
\o_Rd_Data_reg[53]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(53),
      Q => o_Rd_Data(53),
      R => '0'
    );
\o_Rd_Data_reg[54]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(54),
      Q => o_Rd_Data(54),
      R => '0'
    );
\o_Rd_Data_reg[55]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(55),
      Q => o_Rd_Data(55),
      R => '0'
    );
\o_Rd_Data_reg[56]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(56),
      Q => o_Rd_Data(56),
      R => '0'
    );
\o_Rd_Data_reg[57]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(57),
      Q => o_Rd_Data(57),
      R => '0'
    );
\o_Rd_Data_reg[58]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(58),
      Q => o_Rd_Data(58),
      R => '0'
    );
\o_Rd_Data_reg[59]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(59),
      Q => o_Rd_Data(59),
      R => '0'
    );
\o_Rd_Data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(5),
      Q => o_Rd_Data(5),
      R => '0'
    );
\o_Rd_Data_reg[60]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(60),
      Q => o_Rd_Data(60),
      R => '0'
    );
\o_Rd_Data_reg[61]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(61),
      Q => o_Rd_Data(61),
      R => '0'
    );
\o_Rd_Data_reg[62]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(62),
      Q => o_Rd_Data(62),
      R => '0'
    );
\o_Rd_Data_reg[63]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(63),
      Q => o_Rd_Data(63),
      R => '0'
    );
\o_Rd_Data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(6),
      Q => o_Rd_Data(6),
      R => '0'
    );
\o_Rd_Data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(7),
      Q => o_Rd_Data(7),
      R => '0'
    );
\o_Rd_Data_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(8),
      Q => o_Rd_Data(8),
      R => '0'
    );
\o_Rd_Data_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => i_Rd_Clk,
      CE => '1',
      D => \r_Mem_reg[0]\(9),
      Q => o_Rd_Data(9),
      R => '0'
    );
\r_Mem[0][63]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => i_Wr_DV,
      I1 => \r_Mem[0][63]_i_2_n_0\,
      I2 => i_Wr_Addr(7),
      I3 => i_Wr_Addr(6),
      I4 => i_Wr_Addr(4),
      I5 => i_Wr_Addr(5),
      O => r_Mem
    );
\r_Mem[0][63]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => i_Wr_Addr(2),
      I1 => i_Wr_Addr(3),
      I2 => i_Wr_Addr(0),
      I3 => i_Wr_Addr(1),
      O => \r_Mem[0][63]_i_2_n_0\
    );
\r_Mem_reg[0][0]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(0),
      Q => \r_Mem_reg[0]\(0),
      R => '0'
    );
\r_Mem_reg[0][10]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(10),
      Q => \r_Mem_reg[0]\(10),
      R => '0'
    );
\r_Mem_reg[0][11]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(11),
      Q => \r_Mem_reg[0]\(11),
      R => '0'
    );
\r_Mem_reg[0][12]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(12),
      Q => \r_Mem_reg[0]\(12),
      R => '0'
    );
\r_Mem_reg[0][13]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(13),
      Q => \r_Mem_reg[0]\(13),
      R => '0'
    );
\r_Mem_reg[0][14]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(14),
      Q => \r_Mem_reg[0]\(14),
      R => '0'
    );
\r_Mem_reg[0][15]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(15),
      Q => \r_Mem_reg[0]\(15),
      R => '0'
    );
\r_Mem_reg[0][16]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(16),
      Q => \r_Mem_reg[0]\(16),
      R => '0'
    );
\r_Mem_reg[0][17]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(17),
      Q => \r_Mem_reg[0]\(17),
      R => '0'
    );
\r_Mem_reg[0][18]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(18),
      Q => \r_Mem_reg[0]\(18),
      R => '0'
    );
\r_Mem_reg[0][19]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(19),
      Q => \r_Mem_reg[0]\(19),
      R => '0'
    );
\r_Mem_reg[0][1]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(1),
      Q => \r_Mem_reg[0]\(1),
      R => '0'
    );
\r_Mem_reg[0][20]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(20),
      Q => \r_Mem_reg[0]\(20),
      R => '0'
    );
\r_Mem_reg[0][21]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(21),
      Q => \r_Mem_reg[0]\(21),
      R => '0'
    );
\r_Mem_reg[0][22]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(22),
      Q => \r_Mem_reg[0]\(22),
      R => '0'
    );
\r_Mem_reg[0][23]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(23),
      Q => \r_Mem_reg[0]\(23),
      R => '0'
    );
\r_Mem_reg[0][24]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(24),
      Q => \r_Mem_reg[0]\(24),
      R => '0'
    );
\r_Mem_reg[0][25]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(25),
      Q => \r_Mem_reg[0]\(25),
      R => '0'
    );
\r_Mem_reg[0][26]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(26),
      Q => \r_Mem_reg[0]\(26),
      R => '0'
    );
\r_Mem_reg[0][27]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(27),
      Q => \r_Mem_reg[0]\(27),
      R => '0'
    );
\r_Mem_reg[0][28]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(28),
      Q => \r_Mem_reg[0]\(28),
      R => '0'
    );
\r_Mem_reg[0][29]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(29),
      Q => \r_Mem_reg[0]\(29),
      R => '0'
    );
\r_Mem_reg[0][2]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(2),
      Q => \r_Mem_reg[0]\(2),
      R => '0'
    );
\r_Mem_reg[0][30]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(30),
      Q => \r_Mem_reg[0]\(30),
      R => '0'
    );
\r_Mem_reg[0][31]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(31),
      Q => \r_Mem_reg[0]\(31),
      R => '0'
    );
\r_Mem_reg[0][32]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(32),
      Q => \r_Mem_reg[0]\(32),
      R => '0'
    );
\r_Mem_reg[0][33]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(33),
      Q => \r_Mem_reg[0]\(33),
      R => '0'
    );
\r_Mem_reg[0][34]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(34),
      Q => \r_Mem_reg[0]\(34),
      R => '0'
    );
\r_Mem_reg[0][35]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(35),
      Q => \r_Mem_reg[0]\(35),
      R => '0'
    );
\r_Mem_reg[0][36]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(36),
      Q => \r_Mem_reg[0]\(36),
      R => '0'
    );
\r_Mem_reg[0][37]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(37),
      Q => \r_Mem_reg[0]\(37),
      R => '0'
    );
\r_Mem_reg[0][38]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(38),
      Q => \r_Mem_reg[0]\(38),
      R => '0'
    );
\r_Mem_reg[0][39]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(39),
      Q => \r_Mem_reg[0]\(39),
      R => '0'
    );
\r_Mem_reg[0][3]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(3),
      Q => \r_Mem_reg[0]\(3),
      R => '0'
    );
\r_Mem_reg[0][40]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(40),
      Q => \r_Mem_reg[0]\(40),
      R => '0'
    );
\r_Mem_reg[0][41]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(41),
      Q => \r_Mem_reg[0]\(41),
      R => '0'
    );
\r_Mem_reg[0][42]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(42),
      Q => \r_Mem_reg[0]\(42),
      R => '0'
    );
\r_Mem_reg[0][43]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(43),
      Q => \r_Mem_reg[0]\(43),
      R => '0'
    );
\r_Mem_reg[0][44]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(44),
      Q => \r_Mem_reg[0]\(44),
      R => '0'
    );
\r_Mem_reg[0][45]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(45),
      Q => \r_Mem_reg[0]\(45),
      R => '0'
    );
\r_Mem_reg[0][46]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(46),
      Q => \r_Mem_reg[0]\(46),
      R => '0'
    );
\r_Mem_reg[0][47]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(47),
      Q => \r_Mem_reg[0]\(47),
      R => '0'
    );
\r_Mem_reg[0][48]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(48),
      Q => \r_Mem_reg[0]\(48),
      R => '0'
    );
\r_Mem_reg[0][49]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(49),
      Q => \r_Mem_reg[0]\(49),
      R => '0'
    );
\r_Mem_reg[0][4]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(4),
      Q => \r_Mem_reg[0]\(4),
      R => '0'
    );
\r_Mem_reg[0][50]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(50),
      Q => \r_Mem_reg[0]\(50),
      R => '0'
    );
\r_Mem_reg[0][51]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(51),
      Q => \r_Mem_reg[0]\(51),
      R => '0'
    );
\r_Mem_reg[0][52]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(52),
      Q => \r_Mem_reg[0]\(52),
      R => '0'
    );
\r_Mem_reg[0][53]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(53),
      Q => \r_Mem_reg[0]\(53),
      R => '0'
    );
\r_Mem_reg[0][54]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(54),
      Q => \r_Mem_reg[0]\(54),
      R => '0'
    );
\r_Mem_reg[0][55]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(55),
      Q => \r_Mem_reg[0]\(55),
      R => '0'
    );
\r_Mem_reg[0][56]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(56),
      Q => \r_Mem_reg[0]\(56),
      R => '0'
    );
\r_Mem_reg[0][57]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(57),
      Q => \r_Mem_reg[0]\(57),
      R => '0'
    );
\r_Mem_reg[0][58]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(58),
      Q => \r_Mem_reg[0]\(58),
      R => '0'
    );
\r_Mem_reg[0][59]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(59),
      Q => \r_Mem_reg[0]\(59),
      R => '0'
    );
\r_Mem_reg[0][5]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(5),
      Q => \r_Mem_reg[0]\(5),
      R => '0'
    );
\r_Mem_reg[0][60]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(60),
      Q => \r_Mem_reg[0]\(60),
      R => '0'
    );
\r_Mem_reg[0][61]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(61),
      Q => \r_Mem_reg[0]\(61),
      R => '0'
    );
\r_Mem_reg[0][62]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(62),
      Q => \r_Mem_reg[0]\(62),
      R => '0'
    );
\r_Mem_reg[0][63]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(63),
      Q => \r_Mem_reg[0]\(63),
      R => '0'
    );
\r_Mem_reg[0][6]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(6),
      Q => \r_Mem_reg[0]\(6),
      R => '0'
    );
\r_Mem_reg[0][7]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(7),
      Q => \r_Mem_reg[0]\(7),
      R => '0'
    );
\r_Mem_reg[0][8]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(8),
      Q => \r_Mem_reg[0]\(8),
      R => '0'
    );
\r_Mem_reg[0][9]\: unisim.vcomponents.FDRE
     port map (
      C => i_Wr_Clk,
      CE => r_Mem,
      D => i_Wr_Data(9),
      Q => \r_Mem_reg[0]\(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_RAM64_0_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_RAM64_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_RAM64_0_0 : entity is "design_1_RAM64_0_0,RAM64,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_RAM64_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_RAM64_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_RAM64_0_0 : entity is "RAM64,Vivado 2025.1";
end design_1_RAM64_0_0;

architecture STRUCTURE of design_1_RAM64_0_0 is
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
inst: entity work.design_1_RAM64_0_0_RAM64
     port map (
      i_Rd_Clk => i_Rd_Clk,
      i_Rd_En => i_Rd_En,
      i_Wr_Addr(7 downto 0) => i_Wr_Addr(7 downto 0),
      i_Wr_Clk => i_Wr_Clk,
      i_Wr_DV => i_Wr_DV,
      i_Wr_Data(63 downto 0) => i_Wr_Data(63 downto 0),
      o_Rd_DV => o_Rd_DV,
      o_Rd_Data(63 downto 0) => o_Rd_Data(63 downto 0)
    );
end STRUCTURE;
