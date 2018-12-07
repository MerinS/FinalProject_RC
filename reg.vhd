-- Greg Stitt
--
-- File: reg.vhd
-- Entity: REG
--
-- Description: This entity implements a generic register
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

-------------------------------------------------------------------------------
-- Generic
-- width: width of the register
-- init: initialization value (all bits will be reset to this value)

-- Port
-- clk: clock
-- rst (active hi): reset
-- en (active hi): enables the register (doesn't store if 0)
-- input: input to the register
-- output: output from the register
-------------------------------------------------------------------------------

entity reg is
generic (width : positive := 16);
port(clk       : in  std_logic;
   rst       : in  std_logic;
   en        : in  std_logic;
   input     : in  std_logic_vector(width-1 downto 0);
   output    : out std_logic_vector(width-1 downto 0));
end reg;

architecture Behavioral of reg is

begin
  process(clk, rst)
  begin
    if (rst = '1') then
      output   <= (others => '0');
    elsif (clk'event and clk = '1') then
      if (en = '1') then
        output <= input;
      end if;
    end if;
  end process;
end Behavioral;
