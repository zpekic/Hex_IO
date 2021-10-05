----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:17:56 08/31/2021 
-- Design Name: 
-- Module Name:    waitgen - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity waitgen is
    Port ( clear : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           delay : in  STD_LOGIC_VECTOR (2 downto 0);
           nWait : out  STD_LOGIC);
end waitgen;

architecture Behavioral of waitgen is

signal line: std_logic_vector(7 downto 0);

begin

nWait <= clear or line(to_integer(unsigned(delay)));

on_clk: process(clear, clk)
begin
	if (clear = '1') then
		line <= (others => '0');	-- force low 
	else
		if (rising_edge(clk)) then
			line <= line(6 downto 0) & '1'; -- filling with 1 means setting nWait to high after delay cycles
		end if;
	end if;
end process;

end Behavioral;

