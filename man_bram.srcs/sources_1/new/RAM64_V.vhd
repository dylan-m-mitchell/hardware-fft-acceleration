library ieee;
use ieee.std_logic_1164.all;

entity RAM64_V is
    port (
        i_Wr_Clk: in std_logic;
        i_Wr_Addr: in std_logic_vector(255 downto 0);
        i_Wr_Dv: in std_logic;
        
    )