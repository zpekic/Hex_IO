----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:49:00 08/07/2021 
-- Design Name: 
-- Module Name:    clocksync - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clocksync is
    Port ( reset : in  STD_LOGIC;
           clk0 : in  STD_LOGIC;
           clk1 : in  STD_LOGIC;
           sel0 : in  STD_LOGIC;
           sel1 : in  STD_LOGIC;
           clk : out  STD_LOGIC);
end clocksync;

architecture Behavioral of clocksync is

signal sel, sel_clk: std_logic;

begin

clk <= clk0 when (sel = '0') else clk1;
sel_clk <= sel1 when (sel = '0') else sel0;

on_sel_clk: process(reset, sel_clk)
begin
	if (reset = '1') then
		sel <= '0';
	else
		if (rising_edge(sel_clk)) then
			sel <= not sel;
		end if;
	end if;
end process;

end Behavioral;

