-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Mon Feb 16 16:24:16 2026
-- Host        : dylan_pc running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/dlnmt/man_bram/man_bram.gen/sources_1/bd/design_1/ip/design_1_to_ram_0_0/design_1_to_ram_0_0_sim_netlist.vhdl
-- Design      : design_1_to_ram_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7s25csga324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_to_ram_0_0_to_ram is
  port (
    o_wr_addr : out STD_LOGIC_VECTOR ( 7 downto 0 );
    o_wr_dv : out STD_LOGIC;
    o_wr_data : out STD_LOGIC_VECTOR ( 63 downto 0 );
    i_d_valid : in STD_LOGIC;
    i_clk : in STD_LOGIC;
    i_data : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_to_ram_0_0_to_ram : entity is "to_ram";
end design_1_to_ram_0_0_to_ram;

architecture STRUCTURE of design_1_to_ram_0_0_to_ram is
  signal FSM_sequential_state_i_1_n_0 : STD_LOGIC;
  signal FSM_sequential_state_reg_n_0 : STD_LOGIC;
  signal byte_cnt : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \byte_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \byte_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \byte_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \byte_cnt[2]_i_2_n_0\ : STD_LOGIC;
  signal \^o_wr_addr\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \o_wr_addr[6]_i_2_n_0\ : STD_LOGIC;
  signal \o_wr_addr[7]_i_2_n_0\ : STD_LOGIC;
  signal \o_wr_addr[7]_i_3_n_0\ : STD_LOGIC;
  signal o_wr_addr_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal o_wr_dv_i_1_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 55 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of FSM_sequential_state_reg : label is "STATE_NOT_FULL:0,STATE_WRITE:1,";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \byte_cnt[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \byte_cnt[2]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \o_wr_addr[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \o_wr_addr[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \o_wr_addr[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \o_wr_addr[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \o_wr_addr[4]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \o_wr_addr[6]_i_2\ : label is "soft_lutpair2";
begin
  o_wr_addr(7 downto 0) <= \^o_wr_addr\(7 downto 0);
FSM_sequential_state_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => i_d_valid,
      I1 => byte_cnt(0),
      I2 => byte_cnt(2),
      I3 => byte_cnt(1),
      I4 => FSM_sequential_state_reg_n_0,
      O => FSM_sequential_state_i_1_n_0
    );
FSM_sequential_state_reg: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => FSM_sequential_state_i_1_n_0,
      Q => FSM_sequential_state_reg_n_0,
      R => '0'
    );
\byte_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => byte_cnt(0),
      O => \byte_cnt[0]_i_1_n_0\
    );
\byte_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => byte_cnt(1),
      I1 => byte_cnt(0),
      O => \byte_cnt[1]_i_1_n_0\
    );
\byte_cnt[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => i_d_valid,
      I1 => FSM_sequential_state_reg_n_0,
      O => \byte_cnt[2]_i_1_n_0\
    );
\byte_cnt[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6C"
    )
        port map (
      I0 => byte_cnt(1),
      I1 => byte_cnt(2),
      I2 => byte_cnt(0),
      O => \byte_cnt[2]_i_2_n_0\
    );
\byte_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => \byte_cnt[0]_i_1_n_0\,
      Q => byte_cnt(0),
      R => '0'
    );
\byte_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => \byte_cnt[1]_i_1_n_0\,
      Q => byte_cnt(1),
      R => '0'
    );
\byte_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => \byte_cnt[2]_i_2_n_0\,
      Q => byte_cnt(2),
      R => '0'
    );
\o_wr_addr[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^o_wr_addr\(0),
      O => o_wr_addr_0(0)
    );
\o_wr_addr[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^o_wr_addr\(0),
      I1 => \^o_wr_addr\(1),
      O => o_wr_addr_0(1)
    );
\o_wr_addr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \^o_wr_addr\(2),
      I1 => \^o_wr_addr\(0),
      I2 => \^o_wr_addr\(1),
      O => o_wr_addr_0(2)
    );
\o_wr_addr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \^o_wr_addr\(3),
      I1 => \^o_wr_addr\(0),
      I2 => \^o_wr_addr\(1),
      I3 => \^o_wr_addr\(2),
      O => o_wr_addr_0(3)
    );
\o_wr_addr[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \^o_wr_addr\(4),
      I1 => \^o_wr_addr\(2),
      I2 => \^o_wr_addr\(1),
      I3 => \^o_wr_addr\(0),
      I4 => \^o_wr_addr\(3),
      O => o_wr_addr_0(4)
    );
\o_wr_addr[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^o_wr_addr\(5),
      I1 => \^o_wr_addr\(3),
      I2 => \^o_wr_addr\(0),
      I3 => \^o_wr_addr\(1),
      I4 => \^o_wr_addr\(2),
      I5 => \^o_wr_addr\(4),
      O => o_wr_addr_0(5)
    );
\o_wr_addr[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^o_wr_addr\(6),
      I1 => \^o_wr_addr\(4),
      I2 => \^o_wr_addr\(2),
      I3 => \o_wr_addr[6]_i_2_n_0\,
      I4 => \^o_wr_addr\(3),
      I5 => \^o_wr_addr\(5),
      O => o_wr_addr_0(6)
    );
\o_wr_addr[6]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^o_wr_addr\(1),
      I1 => \^o_wr_addr\(0),
      O => \o_wr_addr[6]_i_2_n_0\
    );
\o_wr_addr[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B8CC"
    )
        port map (
      I0 => \o_wr_addr[7]_i_2_n_0\,
      I1 => \^o_wr_addr\(7),
      I2 => \o_wr_addr[7]_i_3_n_0\,
      I3 => \^o_wr_addr\(6),
      O => o_wr_addr_0(7)
    );
\o_wr_addr[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \^o_wr_addr\(4),
      I1 => \^o_wr_addr\(2),
      I2 => \^o_wr_addr\(0),
      I3 => \^o_wr_addr\(1),
      I4 => \^o_wr_addr\(3),
      I5 => \^o_wr_addr\(5),
      O => \o_wr_addr[7]_i_2_n_0\
    );
\o_wr_addr[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^o_wr_addr\(4),
      I1 => \^o_wr_addr\(2),
      I2 => \^o_wr_addr\(1),
      I3 => \^o_wr_addr\(0),
      I4 => \^o_wr_addr\(3),
      I5 => \^o_wr_addr\(5),
      O => \o_wr_addr[7]_i_3_n_0\
    );
\o_wr_addr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => FSM_sequential_state_reg_n_0,
      D => o_wr_addr_0(0),
      Q => \^o_wr_addr\(0),
      R => '0'
    );
\o_wr_addr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => FSM_sequential_state_reg_n_0,
      D => o_wr_addr_0(1),
      Q => \^o_wr_addr\(1),
      R => '0'
    );
\o_wr_addr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => FSM_sequential_state_reg_n_0,
      D => o_wr_addr_0(2),
      Q => \^o_wr_addr\(2),
      R => '0'
    );
\o_wr_addr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => FSM_sequential_state_reg_n_0,
      D => o_wr_addr_0(3),
      Q => \^o_wr_addr\(3),
      R => '0'
    );
\o_wr_addr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => FSM_sequential_state_reg_n_0,
      D => o_wr_addr_0(4),
      Q => \^o_wr_addr\(4),
      R => '0'
    );
\o_wr_addr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => FSM_sequential_state_reg_n_0,
      D => o_wr_addr_0(5),
      Q => \^o_wr_addr\(5),
      R => '0'
    );
\o_wr_addr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => FSM_sequential_state_reg_n_0,
      D => o_wr_addr_0(6),
      Q => \^o_wr_addr\(6),
      R => '0'
    );
\o_wr_addr_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => FSM_sequential_state_reg_n_0,
      D => o_wr_addr_0(7),
      Q => \^o_wr_addr\(7),
      R => '0'
    );
\o_wr_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(0),
      Q => o_wr_data(0),
      R => '0'
    );
\o_wr_data_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(10),
      Q => o_wr_data(10),
      R => '0'
    );
\o_wr_data_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(11),
      Q => o_wr_data(11),
      R => '0'
    );
\o_wr_data_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(12),
      Q => o_wr_data(12),
      R => '0'
    );
\o_wr_data_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(13),
      Q => o_wr_data(13),
      R => '0'
    );
\o_wr_data_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(14),
      Q => o_wr_data(14),
      R => '0'
    );
\o_wr_data_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(15),
      Q => o_wr_data(15),
      R => '0'
    );
\o_wr_data_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(16),
      Q => o_wr_data(16),
      R => '0'
    );
\o_wr_data_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(17),
      Q => o_wr_data(17),
      R => '0'
    );
\o_wr_data_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(18),
      Q => o_wr_data(18),
      R => '0'
    );
\o_wr_data_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(19),
      Q => o_wr_data(19),
      R => '0'
    );
\o_wr_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(1),
      Q => o_wr_data(1),
      R => '0'
    );
\o_wr_data_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(20),
      Q => o_wr_data(20),
      R => '0'
    );
\o_wr_data_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(21),
      Q => o_wr_data(21),
      R => '0'
    );
\o_wr_data_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(22),
      Q => o_wr_data(22),
      R => '0'
    );
\o_wr_data_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(23),
      Q => o_wr_data(23),
      R => '0'
    );
\o_wr_data_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(24),
      Q => o_wr_data(24),
      R => '0'
    );
\o_wr_data_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(25),
      Q => o_wr_data(25),
      R => '0'
    );
\o_wr_data_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(26),
      Q => o_wr_data(26),
      R => '0'
    );
\o_wr_data_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(27),
      Q => o_wr_data(27),
      R => '0'
    );
\o_wr_data_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(28),
      Q => o_wr_data(28),
      R => '0'
    );
\o_wr_data_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(29),
      Q => o_wr_data(29),
      R => '0'
    );
\o_wr_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(2),
      Q => o_wr_data(2),
      R => '0'
    );
\o_wr_data_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(30),
      Q => o_wr_data(30),
      R => '0'
    );
\o_wr_data_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(31),
      Q => o_wr_data(31),
      R => '0'
    );
\o_wr_data_reg[32]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(32),
      Q => o_wr_data(32),
      R => '0'
    );
\o_wr_data_reg[33]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(33),
      Q => o_wr_data(33),
      R => '0'
    );
\o_wr_data_reg[34]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(34),
      Q => o_wr_data(34),
      R => '0'
    );
\o_wr_data_reg[35]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(35),
      Q => o_wr_data(35),
      R => '0'
    );
\o_wr_data_reg[36]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(36),
      Q => o_wr_data(36),
      R => '0'
    );
\o_wr_data_reg[37]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(37),
      Q => o_wr_data(37),
      R => '0'
    );
\o_wr_data_reg[38]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(38),
      Q => o_wr_data(38),
      R => '0'
    );
\o_wr_data_reg[39]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(39),
      Q => o_wr_data(39),
      R => '0'
    );
\o_wr_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(3),
      Q => o_wr_data(3),
      R => '0'
    );
\o_wr_data_reg[40]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(40),
      Q => o_wr_data(40),
      R => '0'
    );
\o_wr_data_reg[41]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(41),
      Q => o_wr_data(41),
      R => '0'
    );
\o_wr_data_reg[42]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(42),
      Q => o_wr_data(42),
      R => '0'
    );
\o_wr_data_reg[43]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(43),
      Q => o_wr_data(43),
      R => '0'
    );
\o_wr_data_reg[44]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(44),
      Q => o_wr_data(44),
      R => '0'
    );
\o_wr_data_reg[45]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(45),
      Q => o_wr_data(45),
      R => '0'
    );
\o_wr_data_reg[46]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(46),
      Q => o_wr_data(46),
      R => '0'
    );
\o_wr_data_reg[47]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(47),
      Q => o_wr_data(47),
      R => '0'
    );
\o_wr_data_reg[48]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(48),
      Q => o_wr_data(48),
      R => '0'
    );
\o_wr_data_reg[49]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(49),
      Q => o_wr_data(49),
      R => '0'
    );
\o_wr_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(4),
      Q => o_wr_data(4),
      R => '0'
    );
\o_wr_data_reg[50]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(50),
      Q => o_wr_data(50),
      R => '0'
    );
\o_wr_data_reg[51]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(51),
      Q => o_wr_data(51),
      R => '0'
    );
\o_wr_data_reg[52]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(52),
      Q => o_wr_data(52),
      R => '0'
    );
\o_wr_data_reg[53]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(53),
      Q => o_wr_data(53),
      R => '0'
    );
\o_wr_data_reg[54]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(54),
      Q => o_wr_data(54),
      R => '0'
    );
\o_wr_data_reg[55]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(55),
      Q => o_wr_data(55),
      R => '0'
    );
\o_wr_data_reg[56]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => i_data(0),
      Q => o_wr_data(56),
      R => '0'
    );
\o_wr_data_reg[57]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => i_data(1),
      Q => o_wr_data(57),
      R => '0'
    );
\o_wr_data_reg[58]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => i_data(2),
      Q => o_wr_data(58),
      R => '0'
    );
\o_wr_data_reg[59]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => i_data(3),
      Q => o_wr_data(59),
      R => '0'
    );
\o_wr_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(5),
      Q => o_wr_data(5),
      R => '0'
    );
\o_wr_data_reg[60]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => i_data(4),
      Q => o_wr_data(60),
      R => '0'
    );
\o_wr_data_reg[61]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => i_data(5),
      Q => o_wr_data(61),
      R => '0'
    );
\o_wr_data_reg[62]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => i_data(6),
      Q => o_wr_data(62),
      R => '0'
    );
\o_wr_data_reg[63]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => i_data(7),
      Q => o_wr_data(63),
      R => '0'
    );
\o_wr_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(6),
      Q => o_wr_data(6),
      R => '0'
    );
\o_wr_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(7),
      Q => o_wr_data(7),
      R => '0'
    );
\o_wr_data_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(8),
      Q => o_wr_data(8),
      R => '0'
    );
\o_wr_data_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_wr_dv_i_1_n_0,
      D => p_0_in(9),
      Q => o_wr_data(9),
      R => '0'
    );
o_wr_dv_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => byte_cnt(1),
      I1 => byte_cnt(2),
      I2 => byte_cnt(0),
      I3 => i_d_valid,
      I4 => FSM_sequential_state_reg_n_0,
      O => o_wr_dv_i_1_n_0
    );
o_wr_dv_reg: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => o_wr_dv_i_1_n_0,
      Q => o_wr_dv,
      R => '0'
    );
\shift_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(10),
      Q => p_0_in(2),
      R => '0'
    );
\shift_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(11),
      Q => p_0_in(3),
      R => '0'
    );
\shift_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(12),
      Q => p_0_in(4),
      R => '0'
    );
\shift_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(13),
      Q => p_0_in(5),
      R => '0'
    );
\shift_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(14),
      Q => p_0_in(6),
      R => '0'
    );
\shift_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(15),
      Q => p_0_in(7),
      R => '0'
    );
\shift_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(16),
      Q => p_0_in(8),
      R => '0'
    );
\shift_reg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(17),
      Q => p_0_in(9),
      R => '0'
    );
\shift_reg_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(18),
      Q => p_0_in(10),
      R => '0'
    );
\shift_reg_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(19),
      Q => p_0_in(11),
      R => '0'
    );
\shift_reg_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(20),
      Q => p_0_in(12),
      R => '0'
    );
\shift_reg_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(21),
      Q => p_0_in(13),
      R => '0'
    );
\shift_reg_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(22),
      Q => p_0_in(14),
      R => '0'
    );
\shift_reg_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(23),
      Q => p_0_in(15),
      R => '0'
    );
\shift_reg_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(24),
      Q => p_0_in(16),
      R => '0'
    );
\shift_reg_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(25),
      Q => p_0_in(17),
      R => '0'
    );
\shift_reg_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(26),
      Q => p_0_in(18),
      R => '0'
    );
\shift_reg_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(27),
      Q => p_0_in(19),
      R => '0'
    );
\shift_reg_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(28),
      Q => p_0_in(20),
      R => '0'
    );
\shift_reg_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(29),
      Q => p_0_in(21),
      R => '0'
    );
\shift_reg_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(30),
      Q => p_0_in(22),
      R => '0'
    );
\shift_reg_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(31),
      Q => p_0_in(23),
      R => '0'
    );
\shift_reg_reg[32]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(32),
      Q => p_0_in(24),
      R => '0'
    );
\shift_reg_reg[33]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(33),
      Q => p_0_in(25),
      R => '0'
    );
\shift_reg_reg[34]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(34),
      Q => p_0_in(26),
      R => '0'
    );
\shift_reg_reg[35]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(35),
      Q => p_0_in(27),
      R => '0'
    );
\shift_reg_reg[36]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(36),
      Q => p_0_in(28),
      R => '0'
    );
\shift_reg_reg[37]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(37),
      Q => p_0_in(29),
      R => '0'
    );
\shift_reg_reg[38]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(38),
      Q => p_0_in(30),
      R => '0'
    );
\shift_reg_reg[39]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(39),
      Q => p_0_in(31),
      R => '0'
    );
\shift_reg_reg[40]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(40),
      Q => p_0_in(32),
      R => '0'
    );
\shift_reg_reg[41]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(41),
      Q => p_0_in(33),
      R => '0'
    );
\shift_reg_reg[42]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(42),
      Q => p_0_in(34),
      R => '0'
    );
\shift_reg_reg[43]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(43),
      Q => p_0_in(35),
      R => '0'
    );
\shift_reg_reg[44]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(44),
      Q => p_0_in(36),
      R => '0'
    );
\shift_reg_reg[45]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(45),
      Q => p_0_in(37),
      R => '0'
    );
\shift_reg_reg[46]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(46),
      Q => p_0_in(38),
      R => '0'
    );
\shift_reg_reg[47]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(47),
      Q => p_0_in(39),
      R => '0'
    );
\shift_reg_reg[48]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(48),
      Q => p_0_in(40),
      R => '0'
    );
\shift_reg_reg[49]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(49),
      Q => p_0_in(41),
      R => '0'
    );
\shift_reg_reg[50]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(50),
      Q => p_0_in(42),
      R => '0'
    );
\shift_reg_reg[51]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(51),
      Q => p_0_in(43),
      R => '0'
    );
\shift_reg_reg[52]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(52),
      Q => p_0_in(44),
      R => '0'
    );
\shift_reg_reg[53]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(53),
      Q => p_0_in(45),
      R => '0'
    );
\shift_reg_reg[54]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(54),
      Q => p_0_in(46),
      R => '0'
    );
\shift_reg_reg[55]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(55),
      Q => p_0_in(47),
      R => '0'
    );
\shift_reg_reg[56]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => i_data(0),
      Q => p_0_in(48),
      R => '0'
    );
\shift_reg_reg[57]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => i_data(1),
      Q => p_0_in(49),
      R => '0'
    );
\shift_reg_reg[58]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => i_data(2),
      Q => p_0_in(50),
      R => '0'
    );
\shift_reg_reg[59]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => i_data(3),
      Q => p_0_in(51),
      R => '0'
    );
\shift_reg_reg[60]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => i_data(4),
      Q => p_0_in(52),
      R => '0'
    );
\shift_reg_reg[61]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => i_data(5),
      Q => p_0_in(53),
      R => '0'
    );
\shift_reg_reg[62]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => i_data(6),
      Q => p_0_in(54),
      R => '0'
    );
\shift_reg_reg[63]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => i_data(7),
      Q => p_0_in(55),
      R => '0'
    );
\shift_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(8),
      Q => p_0_in(0),
      R => '0'
    );
\shift_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \byte_cnt[2]_i_1_n_0\,
      D => p_0_in(9),
      Q => p_0_in(1),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_to_ram_0_0 is
  port (
    i_clk : in STD_LOGIC;
    i_data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    i_d_valid : in STD_LOGIC;
    i_rst_n : in STD_LOGIC;
    o_wr_addr : out STD_LOGIC_VECTOR ( 7 downto 0 );
    o_wr_dv : out STD_LOGIC;
    o_wr_data : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_to_ram_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_to_ram_0_0 : entity is "design_1_to_ram_0_0,to_ram,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_to_ram_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_to_ram_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_to_ram_0_0 : entity is "to_ram,Vivado 2025.1";
end design_1_to_ram_0_0;

architecture STRUCTURE of design_1_to_ram_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of i_clk : signal is "xilinx.com:signal:clock:1.0 i_clk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of i_clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of i_clk : signal is "XIL_INTERFACENAME i_clk, ASSOCIATED_RESET i_rst_n, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_in1_0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of i_rst_n : signal is "xilinx.com:signal:reset:1.0 i_rst_n RST";
  attribute X_INTERFACE_MODE of i_rst_n : signal is "slave";
  attribute X_INTERFACE_PARAMETER of i_rst_n : signal is "XIL_INTERFACENAME i_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.design_1_to_ram_0_0_to_ram
     port map (
      i_clk => i_clk,
      i_d_valid => i_d_valid,
      i_data(7 downto 0) => i_data(7 downto 0),
      o_wr_addr(7 downto 0) => o_wr_addr(7 downto 0),
      o_wr_data(63 downto 0) => o_wr_data(63 downto 0),
      o_wr_dv => o_wr_dv
    );
end STRUCTURE;
