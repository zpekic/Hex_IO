----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:56:50 08/05/2021 
-- Design Name: 
-- Module Name:    hex2mem - Behavioral 
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

use work.hex2mem_code.all;
use work.hex2mem_map.all;

entity hex2mem is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  --
   		  debug: out STD_LOGIC_VECTOR(15 downto 0);
			  --
           nWR : out  STD_LOGIC;
           nBUSREQ : out  STD_LOGIC;
           nBUSACK : in  STD_LOGIC;
           nWAIT : in  STD_LOGIC;
           ABUS : out  STD_LOGIC_VECTOR (15 downto 0);
           DBUS : out  STD_LOGIC_VECTOR (7 downto 0);
			  BUSY: out STD_LOGIC;
			  --
			  HEXIN_READY: in STD_LOGIC;
			  HEXIN_CHAR: in STD_LOGIC_VECTOR (7 downto 0);
			  --
           ERROR : buffer  STD_LOGIC;
           TXDREADY : in  STD_LOGIC;
			  TXDSEND: out STD_LOGIC;
           TXDCHAR : buffer  STD_LOGIC_VECTOR (7 downto 0));
end hex2mem;

architecture Behavioral of hex2mem is

component adder16 is
    Port ( cin : in  STD_LOGIC;
           a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           na : in  STD_LOGIC;
           nb : in  STD_LOGIC;
           bcd : in  STD_LOGIC;
           y : out  STD_LOGIC_VECTOR (15 downto 0);
           cout : out  STD_LOGIC);
end component;

component hex2mem_control_unit is
     Generic (
            CODE_DEPTH : positive;
            IF_WIDTH : positive
          );
     Port ( 
          -- standard inputs
          reset : in  STD_LOGIC;
          clk : in  STD_LOGIC;
          -- design specific inputs
          seq_cond : in  STD_LOGIC_VECTOR (IF_WIDTH - 1 downto 0);
          seq_then : in  STD_LOGIC_VECTOR (CODE_DEPTH - 1 downto 0);
          seq_else : in  STD_LOGIC_VECTOR (CODE_DEPTH - 1 downto 0);
          seq_fork : in  STD_LOGIC_VECTOR (CODE_DEPTH - 1 downto 0);
          cond : in  STD_LOGIC_VECTOR (2 ** IF_WIDTH - 1 downto 0);
          -- outputs
          ui_nextinstr : buffer  STD_LOGIC_VECTOR (CODE_DEPTH - 1 downto 0);
          ui_address : out  STD_LOGIC_VECTOR (CODE_DEPTH - 1 downto 0));
end component;

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

-- control unit
signal ui_address: std_logic_vector(CODE_ADDRESS_WIDTH - 1 downto 0);
signal ui_nextinstr: std_logic_vector(CODE_ADDRESS_WIDTH -1  downto 0);

-- internal regs
signal checksum: std_logic_vector(15 downto 0); 
signal input: std_logic_vector(7 downto 0);
signal poscnt: std_logic_vector(15 downto 0);
signal lincnt: std_logic_vector(15 downto 0);

-- internal signals
signal input_is_zero: std_logic;
signal hex: std_logic_vector(3 downto 0);
signal ascii: std_logic_vector(7 downto 0);
signal poscnt_a, poscnt_sum: std_logic_vector(15 downto 0);
signal lincnt_a, lincnt_sum: std_logic_vector(15 downto 0);

begin

--debug <= input & "0" & ui_address;
debug <= input & TXDCHAR;

h2m_instructionstart <= h2m_mapper(to_integer(unsigned(input))); -- hex char input is the "instruction"
h2m_uinstruction <= h2m_microcode(to_integer(unsigned(ui_address))); -- copy to file containing the control unit. TODO is typically replace with 'ui_address' control unit output

cu_h2m: hex2mem_control_unit
     Generic map (
            CODE_DEPTH => CODE_ADDRESS_WIDTH,
            IF_WIDTH => CODE_IF_WIDTH
          )
     Port map ( 
          -- standard inputs
          reset => reset,
          clk => clk,
          -- design specific inputs
          seq_cond => h2m_seq_cond,
          seq_then => h2m_seq_then,
          seq_else => h2m_seq_else,
          seq_fork => h2m_instructionstart,
			 -- condition bits
			  cond(seq_cond_true) => '1',
			  cond(seq_cond_nWAIT) => nWAIT,
			  cond(seq_cond_nBUSACK) => nBUSACK,
			  cond(seq_cond_input_is_zero) => input_is_zero,
			  cond(seq_cond_TXDREADY) => TXDREADY,
			  cond(seq_cond_TXDSEND) => '1', -- HACKHACK (this will generate pulse for sending the char)
			  cond(6) => '1',
			  cond(7) => '1',
			  cond(8) => '1',
			  cond(9) => '1',
			  cond(10) => '1',
			  cond(11) => '1',
			  cond(12) => '1',
			  cond(13) => '1',
			  cond(14) => '1',
			  cond(seq_cond_false) => '0',
          -- outputs
          ui_nextinstr => ui_nextinstr,
          ui_address => ui_address
		);

-- conditions
input_is_zero <= '1' when (input = X"00") else '0';

-- hack that saves 1 microcode bit width
TXDSEND <= '1' when (unsigned(h2m_seq_cond) = seq_cond_TXDSEND) else '0';

---- Start boilerplate code (use with utmost caution!)
nBUSREQ <= h2m_nBUSREQ;
---- End boilerplate code

---- Start boilerplate code (use with utmost caution!)
nWR <= h2m_nWR when (nBUSACK = '0') else 'Z';
---- End boilerplate code

---- Start boilerplate code (use with utmost caution!)
BUSY <= h2m_BUSY;
---- End boilerplate code

ABUS <= checksum when (nBUSACK = '0') else "ZZZZZZZZZZZZZZZZ";

DBUS <= input when (nBUSACK = '0') else "ZZZZZZZZ";

---- Start boilerplate code (use with utmost caution!)
 update_TXDCHAR: process(clk, h2m_TXDCHAR)
 begin
	if (rising_edge(clk)) then
		case h2m_TXDCHAR is
			when TXDCHAR_same =>
				TXDCHAR <= TXDCHAR;
			when TXDCHAR_char_input =>
				TXDCHAR <= input;
			when TXDCHAR_char_space =>
				TXDCHAR <= std_logic_vector(to_unsigned(natural(character'pos(' ')), 8));
			when TXDCHAR_char_cr =>
				TXDCHAR <= X"0D";
			when TXDCHAR_char_lf =>
				TXDCHAR <= X"0A";
			when TXDCHAR_char_E =>
				TXDCHAR <= std_logic_vector(to_unsigned(natural(character'pos('E')), 8));
			when TXDCHAR_char_R =>
				TXDCHAR <= std_logic_vector(to_unsigned(natural(character'pos('R')), 8));
			when TXDCHAR_zero =>
				TXDCHAR <= (others => '0');
			when others =>
				TXDCHAR <= ascii;	-- go through lookup table
		end case;
 end if;
end process;

ascii <= hex2ascii(to_integer(unsigned(hex)));

with h2m_TXDCHAR select hex <= 
			poscnt(3 downto 0) when TXDCHAR_pos0,
			poscnt(7 downto 4) when TXDCHAR_pos1,
			poscnt(11 downto 8) when TXDCHAR_pos2,
			poscnt(15 downto 12) when TXDCHAR_pos3,
			input(3 downto 0) when TXDCHAR_lin0,
			input(7 downto 4) when TXDCHAR_lin1,
			checksum(11 downto 8) when TXDCHAR_lin2,
			checksum(15 downto 12) when TXDCHAR_lin3,
			X"0" when others;
		
---- End boilerplate code

-- Line BCD counter
lincnt_a <= (others => '0') when (h2m_lincnt_a = lincnt_a_zero) else lincnt;

lincnt_add: adder16 Port map ( 
				cin => h2m_lincnt_cin,
				a => lincnt_a,
				b => X"0000",
				na => '0',
				nb => '0',
				bcd => '1',
				y => lincnt_sum,
				cout => open
			);

update_lincnt: process(clk, lincnt_sum)
begin
	if (rising_edge(clk)) then
		lincnt <= lincnt_sum;
	end if;
end process;
			
-- Position BCD counter
poscnt_a <= (others => '0') when (h2m_poscnt_a = poscnt_a_zero) else poscnt;

poscnt_add: adder16 Port map ( 
				cin => h2m_poscnt_cin,
				a => poscnt_a,
				b => X"0000",
				na => '0',
				nb => '0',
				bcd => '1',
				y => poscnt_sum,
				cout => open
			);

update_poscnt: process(clk, poscnt_sum)
begin
	if (rising_edge(clk)) then
		poscnt <= poscnt_sum;
	end if;
end process;

---- Start boilerplate code (use with utmost caution!)
 update_checksum: process(clk, h2m_checksum)
 begin
	if (rising_edge(clk)) then
		case h2m_checksum is
--			when checksum_same =>
--				checksum <= checksum;
			when checksum_zero =>
				checksum <= (others => '0');
			when checksum_inc =>
				checksum <= std_logic_vector(unsigned(checksum) + 1);
			when others =>
				null;
		end case;
 end if;
 end process;
---- End boilerplate code

-- Start boilerplate code (use with utmost caution!)
 update_error: process(clk, h2m_error)
 begin
	if (rising_edge(clk)) then
		case h2m_error is
--			when error_same =>
--				error <= error;
			when error_on =>
				ERROR <= '1';
			when error_off =>
				ERROR <= '0';
			when others =>
				null;
		end case;
 end if;
 end process;
-- End boilerplate code

-- input register is clocked by ser 2 par UART, and cleared by reset or internal signal
on_hexin_ready: process(reset, h2m_input_reset, HEXIN_READY, HEXIN_CHAR)
begin
	if ((reset or h2m_input_reset) = '1') then
		input <= X"00";
	else
		if (rising_edge(HEXIN_READY)) then
			input <= HEXIN_CHAR;
		end if;
	end if;
end process;
			
end Behavioral;
