----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:18:17 08/28/2021 
-- Design Name: 
-- Module Name:    tracer - Behavioral 
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
use work.hex2mem_sym.all;


entity tracer is
    Port ( reset : in  STD_LOGIC;
           uart_data : out  STD_LOGIC_VECTOR (7 downto 0);
           uart_send : out  STD_LOGIC;
           uart_ready : in  STD_LOGIC;
           dev_data : in  STD_LOGIC_VECTOR(7 downto 0);
           dev_send : in  STD_LOGIC;
           dev_ready : out  STD_LOGIC;
			  trace: in STD_LOGIC;
           enable : in  STD_LOGIC;
           debug : in  STD_LOGIC_VECTOR (15 downto 0);
			  prefix: in STD_LOGIC_VECTOR(7 downto 0);
           dev_clk : out  STD_LOGIC);
end tracer;

architecture Behavioral of tracer is

-- TODO: move to a package
type lookup is array(0 to 15) of std_logic_vector(7 downto 0);
constant hex2ascii: lookup := (
	std_logic_vector(to_unsigned(natural(character'pos('0')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('1')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('2')), 8)), 	
	std_logic_vector(to_unsigned(natural(character'pos('3')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('4')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('5')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('6')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('7')), 8)),
	std_logic_vector(to_unsigned(natural(character'pos('8')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('9')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('A')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('B')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('C')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('D')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('E')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('F')), 8))
);

signal cnt, chr: std_logic_vector(5 downto 0); -- 64 chars per trace record
signal debug_data, ascii_hex, ascii_fix, format_d: std_logic_vector(7 downto 0);
signal debug_send: std_logic;
signal hexout: std_logic_vector(3 downto 0);
alias ui_address: std_logic_vector(6 downto 0) is debug(6 downto 0); -- 128 words microcode
-- for tracer

begin

gen_r: for r in 0 to SYMBOL_ADDRESS_LAST generate
begin
	gen_c: for c in 0 to SYMBOL_BYTE_LAST generate
	begin
			assert false report "r= " & integer'image(r) & " c= " & integer'image(c) severity note;
			h2m_symbol_byte(r * (SYMBOL_BYTE_LAST + 1) + c) <= h2m_symbol_entry(r)(SYMBOL_DATA_WIDTH - 8 * c - 1 downto SYMBOL_DATA_WIDTH - 8 * (c + 1));
	end generate;
end generate;

uart_data <= dev_data when (enable = '0') else debug_data;
uart_send <= dev_send when (enable = '0') else debug_send;
dev_ready <= uart_ready when (enable = '0') else '1'; -- fool the device into not waiting for output
dev_clk <= cnt(5);

debug_send <= trace and uart_ready;

on_debug_send: process(reset, debug_send)
begin
	if (reset = '1') then
		cnt <= (others => '0');
	else
		if (rising_edge(debug_send)) then
			cnt <= std_logic_vector(unsigned(cnt) + 1);
		end if;
	end if;
end process;

-- output from source ROM or internal format
chr <= std_logic_vector(unsigned(cnt) - 8);
h2m_sym_a <= ui_address & chr(4 downto 0);
h2m_sym_d <= h2m_symbol_byte(to_integer(unsigned(h2m_sym_a)));
with cnt(5 downto 3) select debug_data <=
	format_d when O"0",
	h2m_sym_d when O"1",
	h2m_sym_d when O"2",
	h2m_sym_d when O"3",
	h2m_sym_d when O"4",
	format_d when O"7",
	X"20" when others;
	
with cnt(3 downto 0) select format_d <=
	ascii_hex when X"1",	-- debug
	ascii_hex when X"2",	-- debug
	ascii_hex when X"4",	-- debug
	ascii_hex when X"5",	-- debug
	ascii_fix when X"7", -- sanitized prefix
	X"0D" when X"E",  -- CR
	X"0A" when X"F", 	-- LF
	X"20" when others;
	
-- data from debug port
ascii_hex <= hex2ascii(to_integer(unsigned(hexout)));
with cnt(3 downto 0) select hexout <=
	debug(7 downto 4) when X"1",
	debug(3 downto 0) when X"2",
	debug(15 downto 12) when X"4",
	debug(11 downto 8) when X"5",
	X"0" when others;

-- sanitize ascii code coming through prefix port to make it displayable
with prefix(7 downto 5) select ascii_fix <= 
	X"2E" when "000",		-- 00..1F (show dot)
	prefix when "001",	-- 20..3F
	prefix when "010",	-- 40..5F
	prefix when "011",	-- 60..7F
	X"7E" when others;	-- 80..FF (show tilde)
	
end Behavioral;

