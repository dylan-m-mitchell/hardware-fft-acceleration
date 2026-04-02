-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Thu Feb 12 23:48:28 2026
-- Host        : dylan_pc running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/dlnmt/man_bram/man_bram.gen/sources_1/bd/design_1/ip/design_1_UART_0_2/design_1_UART_0_2_sim_netlist.vhdl
-- Design      : design_1_UART_0_2
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7s25csga324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_UART_0_2_UART_CLK_DIV is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_UART_0_2_UART_CLK_DIV : entity is "UART_CLK_DIV";
end design_1_UART_0_2_UART_CLK_DIV;

architecture STRUCTURE of design_1_UART_0_2_UART_CLK_DIV is
  signal \clk_div_cnt[5]_i_1_n_0\ : STD_LOGIC;
  signal \clk_div_cnt[5]_i_3_n_0\ : STD_LOGIC;
  signal clk_div_cnt_mark : STD_LOGIC;
  signal clk_div_cnt_reg : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal data0 : STD_LOGIC_VECTOR ( 5 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \clk_div_cnt[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \clk_div_cnt[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \clk_div_cnt[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \clk_div_cnt[4]_i_1\ : label is "soft_lutpair0";
begin
\DIV_MARK_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0400000000000000"
    )
        port map (
      I0 => clk_div_cnt_reg(3),
      I1 => clk_div_cnt_reg(4),
      I2 => clk_div_cnt_reg(1),
      I3 => clk_div_cnt_reg(5),
      I4 => clk_div_cnt_reg(0),
      I5 => clk_div_cnt_reg(2),
      O => clk_div_cnt_mark
    );
DIV_MARK_reg: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => clk_div_cnt_mark,
      Q => E(0),
      R => '0'
    );
\clk_div_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_div_cnt_reg(0),
      O => data0(0)
    );
\clk_div_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => clk_div_cnt_reg(0),
      I1 => clk_div_cnt_reg(1),
      O => data0(1)
    );
\clk_div_cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => clk_div_cnt_reg(0),
      I1 => clk_div_cnt_reg(1),
      I2 => clk_div_cnt_reg(2),
      O => data0(2)
    );
\clk_div_cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => clk_div_cnt_reg(1),
      I1 => clk_div_cnt_reg(0),
      I2 => clk_div_cnt_reg(2),
      I3 => clk_div_cnt_reg(3),
      O => data0(3)
    );
\clk_div_cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => clk_div_cnt_reg(2),
      I1 => clk_div_cnt_reg(0),
      I2 => clk_div_cnt_reg(1),
      I3 => clk_div_cnt_reg(3),
      I4 => clk_div_cnt_reg(4),
      O => data0(4)
    );
\clk_div_cnt[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => RST,
      I1 => \clk_div_cnt[5]_i_3_n_0\,
      O => \clk_div_cnt[5]_i_1_n_0\
    );
\clk_div_cnt[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => clk_div_cnt_reg(3),
      I1 => clk_div_cnt_reg(1),
      I2 => clk_div_cnt_reg(0),
      I3 => clk_div_cnt_reg(2),
      I4 => clk_div_cnt_reg(4),
      I5 => clk_div_cnt_reg(5),
      O => data0(5)
    );
\clk_div_cnt[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0008000000000000"
    )
        port map (
      I0 => clk_div_cnt_reg(0),
      I1 => clk_div_cnt_reg(5),
      I2 => clk_div_cnt_reg(3),
      I3 => clk_div_cnt_reg(1),
      I4 => clk_div_cnt_reg(4),
      I5 => clk_div_cnt_reg(2),
      O => \clk_div_cnt[5]_i_3_n_0\
    );
\clk_div_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => data0(0),
      Q => clk_div_cnt_reg(0),
      R => \clk_div_cnt[5]_i_1_n_0\
    );
\clk_div_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => data0(1),
      Q => clk_div_cnt_reg(1),
      R => \clk_div_cnt[5]_i_1_n_0\
    );
\clk_div_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => data0(2),
      Q => clk_div_cnt_reg(2),
      R => \clk_div_cnt[5]_i_1_n_0\
    );
\clk_div_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => data0(3),
      Q => clk_div_cnt_reg(3),
      R => \clk_div_cnt[5]_i_1_n_0\
    );
\clk_div_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => data0(4),
      Q => clk_div_cnt_reg(4),
      R => \clk_div_cnt[5]_i_1_n_0\
    );
\clk_div_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => data0(5),
      Q => clk_div_cnt_reg(5),
      R => \clk_div_cnt[5]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \design_1_UART_0_2_UART_CLK_DIV__parameterized0\ is
  port (
    rx_clk_en : out STD_LOGIC;
    \FSM_onehot_fsm_pstate_reg[3]\ : out STD_LOGIC;
    DIV_MARK_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    FRAME_ERROR0 : out STD_LOGIC;
    CLK : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 2 downto 0 );
    DEB_OUT : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \design_1_UART_0_2_UART_CLK_DIV__parameterized0\ : entity is "UART_CLK_DIV";
end \design_1_UART_0_2_UART_CLK_DIV__parameterized0\;

architecture STRUCTURE of \design_1_UART_0_2_UART_CLK_DIV__parameterized0\ is
  signal DIV_MARK_i_1_n_0 : STD_LOGIC;
  signal \clk_div_cnt[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \clk_div_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \clk_div_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \clk_div_cnt[3]_i_1_n_0\ : STD_LOGIC;
  signal \clk_div_cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \clk_div_cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \clk_div_cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \clk_div_cnt_reg_n_0_[3]\ : STD_LOGIC;
  signal \^rx_clk_en\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of DOUT_VLD_i_1 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of FRAME_ERROR_i_1 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \clk_div_cnt[0]_i_1__1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \clk_div_cnt[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \clk_div_cnt[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \clk_div_cnt[3]_i_1\ : label is "soft_lutpair2";
begin
  rx_clk_en <= \^rx_clk_en\;
DIV_MARK_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => E(0),
      I1 => \clk_div_cnt_reg_n_0_[0]\,
      I2 => \clk_div_cnt_reg_n_0_[1]\,
      I3 => \clk_div_cnt_reg_n_0_[3]\,
      I4 => \clk_div_cnt_reg_n_0_[2]\,
      O => DIV_MARK_i_1_n_0
    );
DIV_MARK_reg: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIV_MARK_i_1_n_0,
      Q => \^rx_clk_en\,
      R => '0'
    );
DOUT_VLD_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => Q(2),
      I1 => \^rx_clk_en\,
      I2 => DEB_OUT,
      O => \FSM_onehot_fsm_pstate_reg[3]\
    );
FRAME_ERROR_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => Q(2),
      I1 => \^rx_clk_en\,
      I2 => DEB_OUT,
      O => FRAME_ERROR0
    );
\clk_div_cnt[0]_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \clk_div_cnt_reg_n_0_[0]\,
      O => \clk_div_cnt[0]_i_1__1_n_0\
    );
\clk_div_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \clk_div_cnt_reg_n_0_[1]\,
      I1 => \clk_div_cnt_reg_n_0_[0]\,
      O => \clk_div_cnt[1]_i_1_n_0\
    );
\clk_div_cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \clk_div_cnt_reg_n_0_[1]\,
      I1 => \clk_div_cnt_reg_n_0_[0]\,
      I2 => \clk_div_cnt_reg_n_0_[2]\,
      O => \clk_div_cnt[2]_i_1_n_0\
    );
\clk_div_cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \clk_div_cnt_reg_n_0_[1]\,
      I1 => \clk_div_cnt_reg_n_0_[0]\,
      I2 => \clk_div_cnt_reg_n_0_[2]\,
      I3 => \clk_div_cnt_reg_n_0_[3]\,
      O => \clk_div_cnt[3]_i_1_n_0\
    );
\clk_div_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => E(0),
      D => \clk_div_cnt[0]_i_1__1_n_0\,
      Q => \clk_div_cnt_reg_n_0_[0]\,
      R => Q(0)
    );
\clk_div_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => E(0),
      D => \clk_div_cnt[1]_i_1_n_0\,
      Q => \clk_div_cnt_reg_n_0_[1]\,
      R => Q(0)
    );
\clk_div_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => E(0),
      D => \clk_div_cnt[2]_i_1_n_0\,
      Q => \clk_div_cnt_reg_n_0_[2]\,
      R => Q(0)
    );
\clk_div_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => E(0),
      D => \clk_div_cnt[3]_i_1_n_0\,
      Q => \clk_div_cnt_reg_n_0_[3]\,
      R => Q(0)
    );
\rx_data[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^rx_clk_en\,
      I1 => Q(1),
      O => DIV_MARK_reg_0(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \design_1_UART_0_2_UART_CLK_DIV__parameterized1\ is
  port (
    tx_clk_en : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 4 downto 0 );
    CLK : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    tx_nstate2 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 4 downto 0 );
    DIN_VLD : in STD_LOGIC;
    tx_bit_count : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \design_1_UART_0_2_UART_CLK_DIV__parameterized1\ : entity is "UART_CLK_DIV";
end \design_1_UART_0_2_UART_CLK_DIV__parameterized1\;

architecture STRUCTURE of \design_1_UART_0_2_UART_CLK_DIV__parameterized1\ is
  signal \DIV_MARK_i_1__0_n_0\ : STD_LOGIC;
  signal \clk_div_cnt[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \clk_div_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \clk_div_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \clk_div_cnt[3]_i_1_n_0\ : STD_LOGIC;
  signal \clk_div_cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \clk_div_cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \clk_div_cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \clk_div_cnt_reg_n_0_[3]\ : STD_LOGIC;
  signal \^tx_clk_en\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_tx_pstate[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \FSM_onehot_tx_pstate[1]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \clk_div_cnt[0]_i_1__0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \clk_div_cnt[1]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \clk_div_cnt[2]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \clk_div_cnt[3]_i_1\ : label is "soft_lutpair7";
begin
  tx_clk_en <= \^tx_clk_en\;
\DIV_MARK_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => E(0),
      I1 => \clk_div_cnt_reg_n_0_[1]\,
      I2 => \clk_div_cnt_reg_n_0_[0]\,
      I3 => \clk_div_cnt_reg_n_0_[3]\,
      I4 => \clk_div_cnt_reg_n_0_[2]\,
      O => \DIV_MARK_i_1__0_n_0\
    );
DIV_MARK_reg: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \DIV_MARK_i_1__0_n_0\,
      Q => \^tx_clk_en\,
      R => '0'
    );
\FSM_onehot_tx_pstate[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0E0A"
    )
        port map (
      I0 => Q(0),
      I1 => \^tx_clk_en\,
      I2 => DIN_VLD,
      I3 => Q(4),
      O => D(0)
    );
\FSM_onehot_tx_pstate[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF44F444"
    )
        port map (
      I0 => \^tx_clk_en\,
      I1 => Q(1),
      I2 => Q(0),
      I3 => DIN_VLD,
      I4 => Q(4),
      O => D(1)
    );
\FSM_onehot_tx_pstate[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(1),
      I1 => \^tx_clk_en\,
      I2 => Q(2),
      O => D(2)
    );
\FSM_onehot_tx_pstate[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFF88888888"
    )
        port map (
      I0 => Q(2),
      I1 => \^tx_clk_en\,
      I2 => tx_bit_count(2),
      I3 => tx_bit_count(0),
      I4 => tx_bit_count(1),
      I5 => Q(3),
      O => D(3)
    );
\FSM_onehot_tx_pstate[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"880F8800"
    )
        port map (
      I0 => tx_nstate2,
      I1 => Q(3),
      I2 => DIN_VLD,
      I3 => \^tx_clk_en\,
      I4 => Q(4),
      O => D(4)
    );
\clk_div_cnt[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \clk_div_cnt_reg_n_0_[0]\,
      O => \clk_div_cnt[0]_i_1__0_n_0\
    );
\clk_div_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \clk_div_cnt_reg_n_0_[1]\,
      I1 => \clk_div_cnt_reg_n_0_[0]\,
      O => \clk_div_cnt[1]_i_1_n_0\
    );
\clk_div_cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \clk_div_cnt_reg_n_0_[1]\,
      I1 => \clk_div_cnt_reg_n_0_[0]\,
      I2 => \clk_div_cnt_reg_n_0_[2]\,
      O => \clk_div_cnt[2]_i_1_n_0\
    );
\clk_div_cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \clk_div_cnt_reg_n_0_[1]\,
      I1 => \clk_div_cnt_reg_n_0_[0]\,
      I2 => \clk_div_cnt_reg_n_0_[2]\,
      I3 => \clk_div_cnt_reg_n_0_[3]\,
      O => \clk_div_cnt[3]_i_1_n_0\
    );
\clk_div_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => E(0),
      D => \clk_div_cnt[0]_i_1__0_n_0\,
      Q => \clk_div_cnt_reg_n_0_[0]\,
      R => Q(0)
    );
\clk_div_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => E(0),
      D => \clk_div_cnt[1]_i_1_n_0\,
      Q => \clk_div_cnt_reg_n_0_[1]\,
      R => Q(0)
    );
\clk_div_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => E(0),
      D => \clk_div_cnt[2]_i_1_n_0\,
      Q => \clk_div_cnt_reg_n_0_[2]\,
      R => Q(0)
    );
\clk_div_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => E(0),
      D => \clk_div_cnt[3]_i_1_n_0\,
      Q => \clk_div_cnt_reg_n_0_[3]\,
      R => Q(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_UART_0_2_UART_DEBOUNCER is
  port (
    DEB_OUT : out STD_LOGIC;
    DEB_OUT_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_UART_0_2_UART_DEBOUNCER : entity is "UART_DEBOUNCER";
end design_1_UART_0_2_UART_DEBOUNCER;

architecture STRUCTURE of design_1_UART_0_2_UART_DEBOUNCER is
  signal \^deb_out\ : STD_LOGIC;
  signal DEB_OUT_i_1_n_0 : STD_LOGIC;
  signal \input_shreg_reg_n_0_[0]\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal p_2_in : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of DEB_OUT_i_1 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \rx_data[7]_i_2\ : label is "soft_lutpair11";
begin
  DEB_OUT <= \^deb_out\;
DEB_OUT_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EAAAAAA8"
    )
        port map (
      I0 => \^deb_out\,
      I1 => p_1_in,
      I2 => \input_shreg_reg_n_0_[0]\,
      I3 => D(0),
      I4 => p_2_in,
      O => DEB_OUT_i_1_n_0
    );
DEB_OUT_reg: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DEB_OUT_i_1_n_0,
      Q => \^deb_out\,
      R => '0'
    );
\input_shreg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => D(0),
      Q => \input_shreg_reg_n_0_[0]\,
      R => '0'
    );
\input_shreg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \input_shreg_reg_n_0_[0]\,
      Q => p_1_in,
      R => '0'
    );
\input_shreg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => p_1_in,
      Q => p_2_in,
      R => '0'
    );
\rx_data[7]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^deb_out\,
      O => DEB_OUT_reg_0(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_UART_0_2_UART_RX is
  port (
    DOUT_VLD : out STD_LOGIC;
    FRAME_ERROR : out STD_LOGIC;
    DOUT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    DEB_OUT : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_UART_0_2_UART_RX : entity is "UART_RX";
end design_1_UART_0_2_UART_RX;

architecture STRUCTURE of design_1_UART_0_2_UART_RX is
  signal \^dout\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal FRAME_ERROR0 : STD_LOGIC;
  signal \FSM_onehot_fsm_pstate[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_fsm_pstate[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_fsm_pstate[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_fsm_pstate[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_fsm_pstate_reg_n_0_[1]\ : STD_LOGIC;
  signal fsm_databits : STD_LOGIC;
  signal fsm_idle : STD_LOGIC;
  signal fsm_stopbit : STD_LOGIC;
  signal rx_bit_count : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal rx_bit_count0 : STD_LOGIC;
  signal \rx_bit_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \rx_bit_count[1]_i_1_n_0\ : STD_LOGIC;
  signal \rx_bit_count[2]_i_1_n_0\ : STD_LOGIC;
  signal rx_clk_divider_i_n_1 : STD_LOGIC;
  signal rx_clk_en : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_fsm_pstate_reg[0]\ : label is "startbit:0010,databits:0100,paritybit:011,stopbit:1000,idle:0001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_fsm_pstate_reg[1]\ : label is "startbit:0010,databits:0100,paritybit:011,stopbit:1000,idle:0001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_fsm_pstate_reg[2]\ : label is "startbit:0010,databits:0100,paritybit:011,stopbit:1000,idle:0001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_fsm_pstate_reg[3]\ : label is "startbit:0010,databits:0100,paritybit:011,stopbit:1000,idle:0001";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \rx_bit_count[1]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \rx_bit_count[2]_i_1\ : label is "soft_lutpair5";
begin
  DOUT(7 downto 0) <= \^dout\(7 downto 0);
DOUT_VLD_reg: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => rx_clk_divider_i_n_1,
      Q => DOUT_VLD,
      R => RST
    );
FRAME_ERROR_reg: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => FRAME_ERROR0,
      Q => FRAME_ERROR,
      R => RST
    );
\FSM_onehot_fsm_pstate[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F444"
    )
        port map (
      I0 => DEB_OUT,
      I1 => fsm_idle,
      I2 => rx_clk_en,
      I3 => fsm_stopbit,
      O => \FSM_onehot_fsm_pstate[0]_i_1_n_0\
    );
\FSM_onehot_fsm_pstate[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => DEB_OUT,
      I1 => fsm_idle,
      I2 => rx_clk_en,
      I3 => \FSM_onehot_fsm_pstate_reg_n_0_[1]\,
      O => \FSM_onehot_fsm_pstate[1]_i_1_n_0\
    );
\FSM_onehot_fsm_pstate[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFF88888888"
    )
        port map (
      I0 => \FSM_onehot_fsm_pstate_reg_n_0_[1]\,
      I1 => rx_clk_en,
      I2 => rx_bit_count(2),
      I3 => rx_bit_count(0),
      I4 => rx_bit_count(1),
      I5 => fsm_databits,
      O => \FSM_onehot_fsm_pstate[2]_i_1_n_0\
    );
\FSM_onehot_fsm_pstate[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000FFFF80000000"
    )
        port map (
      I0 => rx_bit_count(2),
      I1 => rx_bit_count(0),
      I2 => rx_bit_count(1),
      I3 => fsm_databits,
      I4 => rx_clk_en,
      I5 => fsm_stopbit,
      O => \FSM_onehot_fsm_pstate[3]_i_1_n_0\
    );
\FSM_onehot_fsm_pstate_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \FSM_onehot_fsm_pstate[0]_i_1_n_0\,
      Q => fsm_idle,
      S => RST
    );
\FSM_onehot_fsm_pstate_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \FSM_onehot_fsm_pstate[1]_i_1_n_0\,
      Q => \FSM_onehot_fsm_pstate_reg_n_0_[1]\,
      R => RST
    );
\FSM_onehot_fsm_pstate_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \FSM_onehot_fsm_pstate[2]_i_1_n_0\,
      Q => fsm_databits,
      R => RST
    );
\FSM_onehot_fsm_pstate_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \FSM_onehot_fsm_pstate[3]_i_1_n_0\,
      Q => fsm_stopbit,
      R => RST
    );
\rx_bit_count[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => rx_clk_en,
      I1 => fsm_databits,
      I2 => rx_bit_count(0),
      O => \rx_bit_count[0]_i_1_n_0\
    );
\rx_bit_count[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => rx_bit_count(0),
      I1 => rx_clk_en,
      I2 => fsm_databits,
      I3 => rx_bit_count(1),
      O => \rx_bit_count[1]_i_1_n_0\
    );
\rx_bit_count[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => rx_bit_count(0),
      I1 => rx_bit_count(1),
      I2 => rx_clk_en,
      I3 => fsm_databits,
      I4 => rx_bit_count(2),
      O => \rx_bit_count[2]_i_1_n_0\
    );
\rx_bit_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \rx_bit_count[0]_i_1_n_0\,
      Q => rx_bit_count(0),
      R => RST
    );
\rx_bit_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \rx_bit_count[1]_i_1_n_0\,
      Q => rx_bit_count(1),
      R => RST
    );
\rx_bit_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \rx_bit_count[2]_i_1_n_0\,
      Q => rx_bit_count(2),
      R => RST
    );
rx_clk_divider_i: entity work.\design_1_UART_0_2_UART_CLK_DIV__parameterized0\
     port map (
      CLK => CLK,
      DEB_OUT => DEB_OUT,
      DIV_MARK_reg_0(0) => rx_bit_count0,
      E(0) => E(0),
      FRAME_ERROR0 => FRAME_ERROR0,
      \FSM_onehot_fsm_pstate_reg[3]\ => rx_clk_divider_i_n_1,
      Q(2) => fsm_stopbit,
      Q(1) => fsm_databits,
      Q(0) => fsm_idle,
      rx_clk_en => rx_clk_en
    );
\rx_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => rx_bit_count0,
      D => \^dout\(1),
      Q => \^dout\(0),
      R => '0'
    );
\rx_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => rx_bit_count0,
      D => \^dout\(2),
      Q => \^dout\(1),
      R => '0'
    );
\rx_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => rx_bit_count0,
      D => \^dout\(3),
      Q => \^dout\(2),
      R => '0'
    );
\rx_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => rx_bit_count0,
      D => \^dout\(4),
      Q => \^dout\(3),
      R => '0'
    );
\rx_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => rx_bit_count0,
      D => \^dout\(5),
      Q => \^dout\(4),
      R => '0'
    );
\rx_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => rx_bit_count0,
      D => \^dout\(6),
      Q => \^dout\(5),
      R => '0'
    );
\rx_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => rx_bit_count0,
      D => \^dout\(7),
      Q => \^dout\(6),
      R => '0'
    );
\rx_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => rx_bit_count0,
      D => D(0),
      Q => \^dout\(7),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_UART_0_2_UART_TX is
  port (
    UART_TXD : out STD_LOGIC;
    DIN_RDY : out STD_LOGIC;
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    DIN : in STD_LOGIC_VECTOR ( 7 downto 0 );
    DIN_VLD : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_UART_0_2_UART_TX : entity is "UART_TX";
end design_1_UART_0_2_UART_TX;

architecture STRUCTURE of design_1_UART_0_2_UART_TX is
  signal \FSM_onehot_tx_pstate_reg_n_0_[1]\ : STD_LOGIC;
  signal \FSM_onehot_tx_pstate_reg_n_0_[4]\ : STD_LOGIC;
  signal UART_TXD_i_1_n_0 : STD_LOGIC;
  signal UART_TXD_i_2_n_0 : STD_LOGIC;
  signal UART_TXD_i_3_n_0 : STD_LOGIC;
  signal tx_bit_count : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \tx_bit_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \tx_bit_count[1]_i_1_n_0\ : STD_LOGIC;
  signal \tx_bit_count[2]_i_1_n_0\ : STD_LOGIC;
  signal tx_clk_div_clr : STD_LOGIC;
  signal tx_clk_divider_i_n_1 : STD_LOGIC;
  signal tx_clk_divider_i_n_2 : STD_LOGIC;
  signal tx_clk_divider_i_n_3 : STD_LOGIC;
  signal tx_clk_divider_i_n_4 : STD_LOGIC;
  signal tx_clk_divider_i_n_5 : STD_LOGIC;
  signal tx_clk_en : STD_LOGIC;
  signal tx_data : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal tx_data0 : STD_LOGIC;
  signal tx_data_out_sel : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal tx_nstate2 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_tx_pstate[4]_i_2\ : label is "soft_lutpair10";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_tx_pstate_reg[0]\ : label is "startbit:00100,databits:01000,paritybit:100,txsync:00010,stopbit:10000,idle:00001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_tx_pstate_reg[1]\ : label is "startbit:00100,databits:01000,paritybit:100,txsync:00010,stopbit:10000,idle:00001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_tx_pstate_reg[2]\ : label is "startbit:00100,databits:01000,paritybit:100,txsync:00010,stopbit:10000,idle:00001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_tx_pstate_reg[3]\ : label is "startbit:00100,databits:01000,paritybit:100,txsync:00010,stopbit:10000,idle:00001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_tx_pstate_reg[4]\ : label is "startbit:00100,databits:01000,paritybit:100,txsync:00010,stopbit:10000,idle:00001";
  attribute SOFT_HLUTNM of \tx_bit_count[0]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \tx_bit_count[1]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \tx_bit_count[2]_i_1\ : label is "soft_lutpair9";
begin
DIN_RDY_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => tx_clk_div_clr,
      I1 => \FSM_onehot_tx_pstate_reg_n_0_[4]\,
      O => DIN_RDY
    );
\FSM_onehot_tx_pstate[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => tx_bit_count(1),
      I1 => tx_bit_count(0),
      I2 => tx_bit_count(2),
      O => tx_nstate2
    );
\FSM_onehot_tx_pstate_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => tx_clk_divider_i_n_5,
      Q => tx_clk_div_clr,
      S => RST
    );
\FSM_onehot_tx_pstate_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => tx_clk_divider_i_n_4,
      Q => \FSM_onehot_tx_pstate_reg_n_0_[1]\,
      R => RST
    );
\FSM_onehot_tx_pstate_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => tx_clk_divider_i_n_3,
      Q => tx_data_out_sel(0),
      R => RST
    );
\FSM_onehot_tx_pstate_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => tx_clk_divider_i_n_2,
      Q => tx_data_out_sel(1),
      R => RST
    );
\FSM_onehot_tx_pstate_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => tx_clk_divider_i_n_1,
      Q => \FSM_onehot_tx_pstate_reg_n_0_[4]\,
      R => RST
    );
UART_TXD_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"45405555"
    )
        port map (
      I0 => tx_data_out_sel(0),
      I1 => UART_TXD_i_2_n_0,
      I2 => tx_bit_count(2),
      I3 => UART_TXD_i_3_n_0,
      I4 => tx_data_out_sel(1),
      O => UART_TXD_i_1_n_0
    );
UART_TXD_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => tx_data(7),
      I1 => tx_data(6),
      I2 => tx_bit_count(1),
      I3 => tx_data(5),
      I4 => tx_bit_count(0),
      I5 => tx_data(4),
      O => UART_TXD_i_2_n_0
    );
UART_TXD_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => tx_data(3),
      I1 => tx_data(2),
      I2 => tx_bit_count(1),
      I3 => tx_data(1),
      I4 => tx_bit_count(0),
      I5 => tx_data(0),
      O => UART_TXD_i_3_n_0
    );
UART_TXD_reg: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => '1',
      D => UART_TXD_i_1_n_0,
      Q => UART_TXD,
      S => RST
    );
\tx_bit_count[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => tx_data_out_sel(1),
      I1 => tx_clk_en,
      I2 => tx_bit_count(0),
      O => \tx_bit_count[0]_i_1_n_0\
    );
\tx_bit_count[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => tx_bit_count(0),
      I1 => tx_data_out_sel(1),
      I2 => tx_clk_en,
      I3 => tx_bit_count(1),
      O => \tx_bit_count[1]_i_1_n_0\
    );
\tx_bit_count[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => tx_bit_count(0),
      I1 => tx_bit_count(1),
      I2 => tx_data_out_sel(1),
      I3 => tx_clk_en,
      I4 => tx_bit_count(2),
      O => \tx_bit_count[2]_i_1_n_0\
    );
\tx_bit_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \tx_bit_count[0]_i_1_n_0\,
      Q => tx_bit_count(0),
      R => RST
    );
\tx_bit_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \tx_bit_count[1]_i_1_n_0\,
      Q => tx_bit_count(1),
      R => RST
    );
\tx_bit_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \tx_bit_count[2]_i_1_n_0\,
      Q => tx_bit_count(2),
      R => RST
    );
tx_clk_divider_i: entity work.\design_1_UART_0_2_UART_CLK_DIV__parameterized1\
     port map (
      CLK => CLK,
      D(4) => tx_clk_divider_i_n_1,
      D(3) => tx_clk_divider_i_n_2,
      D(2) => tx_clk_divider_i_n_3,
      D(1) => tx_clk_divider_i_n_4,
      D(0) => tx_clk_divider_i_n_5,
      DIN_VLD => DIN_VLD,
      E(0) => E(0),
      Q(4) => \FSM_onehot_tx_pstate_reg_n_0_[4]\,
      Q(3 downto 2) => tx_data_out_sel(1 downto 0),
      Q(1) => \FSM_onehot_tx_pstate_reg_n_0_[1]\,
      Q(0) => tx_clk_div_clr,
      tx_bit_count(2 downto 0) => tx_bit_count(2 downto 0),
      tx_clk_en => tx_clk_en,
      tx_nstate2 => tx_nstate2
    );
\tx_data[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => DIN_VLD,
      I1 => \FSM_onehot_tx_pstate_reg_n_0_[4]\,
      I2 => tx_clk_div_clr,
      O => tx_data0
    );
\tx_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => tx_data0,
      D => DIN(0),
      Q => tx_data(0),
      R => '0'
    );
\tx_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => tx_data0,
      D => DIN(1),
      Q => tx_data(1),
      R => '0'
    );
\tx_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => tx_data0,
      D => DIN(2),
      Q => tx_data(2),
      R => '0'
    );
\tx_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => tx_data0,
      D => DIN(3),
      Q => tx_data(3),
      R => '0'
    );
\tx_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => tx_data0,
      D => DIN(4),
      Q => tx_data(4),
      R => '0'
    );
\tx_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => tx_data0,
      D => DIN(5),
      Q => tx_data(5),
      R => '0'
    );
\tx_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => tx_data0,
      D => DIN(6),
      Q => tx_data(6),
      R => '0'
    );
\tx_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => tx_data0,
      D => DIN(7),
      Q => tx_data(7),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_UART_0_2_UART is
  port (
    DOUT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DOUT_VLD : out STD_LOGIC;
    FRAME_ERROR : out STD_LOGIC;
    UART_TXD : out STD_LOGIC;
    DIN_RDY : out STD_LOGIC;
    RST : in STD_LOGIC;
    CLK : in STD_LOGIC;
    DIN : in STD_LOGIC_VECTOR ( 7 downto 0 );
    DIN_VLD : in STD_LOGIC;
    UART_RXD : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_UART_0_2_UART : entity is "UART";
end design_1_UART_0_2_UART;

architecture STRUCTURE of design_1_UART_0_2_UART is
  signal DEB_OUT : STD_LOGIC;
  signal os_clk_en : STD_LOGIC;
  signal uart_rxd_debounced : STD_LOGIC;
  signal uart_rxd_meta_n : STD_LOGIC;
  signal uart_rxd_meta_n_i_1_n_0 : STD_LOGIC;
  signal uart_rxd_synced_n : STD_LOGIC;
begin
os_clk_divider_i: entity work.design_1_UART_0_2_UART_CLK_DIV
     port map (
      CLK => CLK,
      E(0) => os_clk_en,
      RST => RST
    );
uart_rx_i: entity work.design_1_UART_0_2_UART_RX
     port map (
      CLK => CLK,
      D(0) => uart_rxd_debounced,
      DEB_OUT => DEB_OUT,
      DOUT(7 downto 0) => DOUT(7 downto 0),
      DOUT_VLD => DOUT_VLD,
      E(0) => os_clk_en,
      FRAME_ERROR => FRAME_ERROR,
      RST => RST
    );
uart_rxd_meta_n_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => UART_RXD,
      O => uart_rxd_meta_n_i_1_n_0
    );
uart_rxd_meta_n_reg: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => uart_rxd_meta_n_i_1_n_0,
      Q => uart_rxd_meta_n,
      R => '0'
    );
uart_rxd_synced_n_reg: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => uart_rxd_meta_n,
      Q => uart_rxd_synced_n,
      R => '0'
    );
uart_tx_i: entity work.design_1_UART_0_2_UART_TX
     port map (
      CLK => CLK,
      DIN(7 downto 0) => DIN(7 downto 0),
      DIN_RDY => DIN_RDY,
      DIN_VLD => DIN_VLD,
      E(0) => os_clk_en,
      RST => RST,
      UART_TXD => UART_TXD
    );
\use_debouncer_g.debouncer_i\: entity work.design_1_UART_0_2_UART_DEBOUNCER
     port map (
      CLK => CLK,
      D(0) => uart_rxd_synced_n,
      DEB_OUT => DEB_OUT,
      DEB_OUT_reg_0(0) => uart_rxd_debounced
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_UART_0_2 is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    UART_TXD : out STD_LOGIC;
    UART_RXD : in STD_LOGIC;
    DIN : in STD_LOGIC_VECTOR ( 7 downto 0 );
    DIN_VLD : in STD_LOGIC;
    DIN_RDY : out STD_LOGIC;
    DOUT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DOUT_VLD : out STD_LOGIC;
    FRAME_ERROR : out STD_LOGIC;
    PARITY_ERROR : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_UART_0_2 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_UART_0_2 : entity is "design_1_UART_0_2,UART,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_UART_0_2 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_UART_0_2 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_UART_0_2 : entity is "UART,Vivado 2025.1";
end design_1_UART_0_2;

architecture STRUCTURE of design_1_UART_0_2 is
  signal \<const0>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of CLK : signal is "xilinx.com:signal:clock:1.0 CLK CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of CLK : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of CLK : signal is "XIL_INTERFACENAME CLK, ASSOCIATED_RESET RST, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_in1_0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of RST : signal is "xilinx.com:signal:reset:1.0 RST RST";
  attribute X_INTERFACE_MODE of RST : signal is "slave";
  attribute X_INTERFACE_PARAMETER of RST : signal is "XIL_INTERFACENAME RST, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
begin
  PARITY_ERROR <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.design_1_UART_0_2_UART
     port map (
      CLK => CLK,
      DIN(7 downto 0) => DIN(7 downto 0),
      DIN_RDY => DIN_RDY,
      DIN_VLD => DIN_VLD,
      DOUT(7 downto 0) => DOUT(7 downto 0),
      DOUT_VLD => DOUT_VLD,
      FRAME_ERROR => FRAME_ERROR,
      RST => RST,
      UART_RXD => UART_RXD,
      UART_TXD => UART_TXD
    );
end STRUCTURE;
