--------------------------------------------------------
-- mcc V1.0.0807 - Custom microcode compiler (c)2020-... 
--    https://github.com/zpekic/MicroCodeCompiler
--------------------------------------------------------
-- Auto-generated file, do not modify. To customize, create 'code_template.vhd' file in mcc.exe folder
-- Supported placeholders:  [NAME], [FIELDS], [SIZES], [TYPE], [SIGNAL], [INSTANCE], [MEMORY].
--------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--use IEEE.numeric_std.all;

package hex2mem_code is

-- memory block size
constant CODE_DATA_WIDTH: 	positive := 34;
constant CODE_ADDRESS_WIDTH: 	positive := 7;
constant CODE_ADDRESS_LAST: 	positive := 127;
constant CODE_IF_WIDTH: 	positive := 4;


type h2m_code_memory is array(0 to 127) of std_logic_vector(33 downto 0);

signal h2m_uinstruction: std_logic_vector(33 downto 0);

--h2m_uinstruction <= h2m_microcode(to_integer(unsigned(TODO))); -- copy to file containing the control unit. TODO is typically replace with 'ui_address' control unit output

--
-- L0010.nBUSREQ: .valfield 1 values 0, 1 default 1
--
alias h2m_nBUSREQ: 	std_logic is h2m_uinstruction(33);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  nBUSREQ <= h2m_nBUSREQ;
---- End boilerplate code

--
-- L0011.nWR: .valfield 1 values 0, 1 default 1
--
alias h2m_nWR: 	std_logic is h2m_uinstruction(32);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  nWR <= h2m_nWR;
---- End boilerplate code

--
-- L0018.BUSY: .valfield 1 values 0, 1 default 1
--
alias h2m_BUSY: 	std_logic is h2m_uinstruction(31);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  BUSY <= h2m_BUSY;
---- End boilerplate code

--
-- L0025.seq_cond: .if 4 values true, nWAIT, nBUSACK, input_is_zero, TXDREADY, TXDSEND, -, -, -, -, -, -, -, -, -, false default true
--
alias h2m_seq_cond: 	std_logic_vector(3 downto 0) is h2m_uinstruction(30 downto 27);
constant seq_cond_true: 	integer := 0;
constant seq_cond_nWAIT: 	integer := 1;
constant seq_cond_nBUSACK: 	integer := 2;
constant seq_cond_input_is_zero: 	integer := 3;
constant seq_cond_TXDREADY: 	integer := 4;
constant seq_cond_TXDSEND: 	integer := 5;
--constant seq_cond_-: 	integer := 6;
--constant seq_cond_-: 	integer := 7;
--constant seq_cond_-: 	integer := 8;
--constant seq_cond_-: 	integer := 9;
--constant seq_cond_-: 	integer := 10;
--constant seq_cond_-: 	integer := 11;
--constant seq_cond_-: 	integer := 12;
--constant seq_cond_-: 	integer := 13;
--constant seq_cond_-: 	integer := 14;
constant seq_cond_false: 	integer := 15;
---- Start boilerplate code (use with utmost caution!)
---- include '.controller <filename.vhd>, <stackdepth>;' in .mcc file to generate pre-canned microcode control unit and feed 'conditions' with:
--  cond(seq_cond_true) => '1',
--  cond(seq_cond_nWAIT) => nWAIT,
--  cond(seq_cond_nBUSACK) => nBUSACK,
--  cond(seq_cond_input_is_zero) => input_is_zero,
--  cond(seq_cond_TXDREADY) => TXDREADY,
--  cond(seq_cond_TXDSEND) => TXDSEND,
--  cond(seq_cond_-) => -,
--  cond(seq_cond_-) => -,
--  cond(seq_cond_-) => -,
--  cond(seq_cond_-) => -,
--  cond(seq_cond_-) => -,
--  cond(seq_cond_-) => -,
--  cond(seq_cond_-) => -,
--  cond(seq_cond_-) => -,
--  cond(seq_cond_-) => -,
--  cond(seq_cond_false) => '0',
---- End boilerplate code

--
-- L0043.seq_then: .then 7 values next, repeat, return, fork, @ default next
--
alias h2m_seq_then: 	std_logic_vector(6 downto 0) is h2m_uinstruction(26 downto 20);
constant seq_then_next: 	std_logic_vector(6 downto 0) := "0000000";
constant seq_then_repeat: 	std_logic_vector(6 downto 0) := "0000001";
constant seq_then_return: 	std_logic_vector(6 downto 0) := "0000010";
constant seq_then_fork: 	std_logic_vector(6 downto 0) := "0000011";
-- Jump targets allowed!
-- include '.controller <filename.vhd>, <stackdepth>;' in .mcc file to generate pre-canned microcode control unit and connect 'then' to h2m_seq_then

--
-- L0044.seq_else: .else 7 values next, repeat, return, fork, 0b000000..0b111111, @ default next
--
alias h2m_seq_else: 	std_logic_vector(6 downto 0) is h2m_uinstruction(19 downto 13);
constant seq_else_next: 	std_logic_vector(6 downto 0) := "0000000";
constant seq_else_repeat: 	std_logic_vector(6 downto 0) := "0000001";
constant seq_else_return: 	std_logic_vector(6 downto 0) := "0000010";
constant seq_else_fork: 	std_logic_vector(6 downto 0) := "0000011";
-- Values from "0000000" to "0111111" allowed
-- Jump targets allowed!
-- include '.controller <filename.vhd>, <stackdepth>;' in .mcc file to generate pre-canned microcode control unit and connect 'else' to h2m_seq_else

--
-- L0047.TXDCHAR: .regfield 4 values same, char_input, char_space, char_cr, char_lf, char_E, char_R, zero, pos0, pos1, inp0, inp1, lin0, lin1, lin2, lin3 default same
--
alias h2m_TXDCHAR: 	std_logic_vector(3 downto 0) is h2m_uinstruction(12 downto 9);
constant TXDCHAR_same: 	std_logic_vector(3 downto 0) := X"0";
constant TXDCHAR_char_input: 	std_logic_vector(3 downto 0) := X"1";
constant TXDCHAR_char_space: 	std_logic_vector(3 downto 0) := X"2";
constant TXDCHAR_char_cr: 	std_logic_vector(3 downto 0) := X"3";
constant TXDCHAR_char_lf: 	std_logic_vector(3 downto 0) := X"4";
constant TXDCHAR_char_E: 	std_logic_vector(3 downto 0) := X"5";
constant TXDCHAR_char_R: 	std_logic_vector(3 downto 0) := X"6";
constant TXDCHAR_zero: 	std_logic_vector(3 downto 0) := X"7";
constant TXDCHAR_pos0: 	std_logic_vector(3 downto 0) := X"8";
constant TXDCHAR_pos1: 	std_logic_vector(3 downto 0) := X"9";
constant TXDCHAR_inp0: 	std_logic_vector(3 downto 0) := X"A";
constant TXDCHAR_inp1: 	std_logic_vector(3 downto 0) := X"B";
constant TXDCHAR_lin0: 	std_logic_vector(3 downto 0) := X"C";
constant TXDCHAR_lin1: 	std_logic_vector(3 downto 0) := X"D";
constant TXDCHAR_lin2: 	std_logic_vector(3 downto 0) := X"E";
constant TXDCHAR_lin3: 	std_logic_vector(3 downto 0) := X"F";
---- Start boilerplate code (use with utmost caution!)
-- update_TXDCHAR: process(clk, h2m_TXDCHAR)
-- begin
--	if (rising_edge(clk)) then
--		case h2m_TXDCHAR is
----			when TXDCHAR_same =>
----				TXDCHAR <= TXDCHAR;
--			when TXDCHAR_char_input =>
--				TXDCHAR <= char_input;
--			when TXDCHAR_char_space =>
--				TXDCHAR <= char_space;
--			when TXDCHAR_char_cr =>
--				TXDCHAR <= char_cr;
--			when TXDCHAR_char_lf =>
--				TXDCHAR <= char_lf;
--			when TXDCHAR_char_E =>
--				TXDCHAR <= char_E;
--			when TXDCHAR_char_R =>
--				TXDCHAR <= char_R;
--			when TXDCHAR_zero =>
--				TXDCHAR <= (others => '0');
--			when TXDCHAR_pos0 =>
--				TXDCHAR <= pos0;
--			when TXDCHAR_pos1 =>
--				TXDCHAR <= pos1;
--			when TXDCHAR_inp0 =>
--				TXDCHAR <= inp0;
--			when TXDCHAR_inp1 =>
--				TXDCHAR <= inp1;
--			when TXDCHAR_lin0 =>
--				TXDCHAR <= lin0;
--			when TXDCHAR_lin1 =>
--				TXDCHAR <= lin1;
--			when TXDCHAR_lin2 =>
--				TXDCHAR <= lin2;
--			when TXDCHAR_lin3 =>
--				TXDCHAR <= lin3;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0067.lincnt_a: .valfield 1 values zero, lincnt default lincnt
--
alias h2m_lincnt_a: 	std_logic is h2m_uinstruction(8);
constant lincnt_a_zero: 	std_logic := '0';
constant lincnt_a_lincnt: 	std_logic := '1';
---- Start boilerplate code (use with utmost caution!)
--	lincnt_a <= (others => '0') when (h2m_lincnt_a = lincnt_a_zero) else lincnt;
---- End boilerplate code

--
-- L0068.lincnt_cin: .valfield 1 values 0, 1 default 0
--
alias h2m_lincnt_cin: 	std_logic is h2m_uinstruction(7);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  lincnt_cin <= h2m_lincnt_cin;
---- End boilerplate code

--
-- L0071.poscnt_a: .valfield 1 values zero, poscnt default poscnt
--
alias h2m_poscnt_a: 	std_logic is h2m_uinstruction(6);
constant poscnt_a_zero: 	std_logic := '0';
constant poscnt_a_poscnt: 	std_logic := '1';
---- Start boilerplate code (use with utmost caution!)
--	poscnt_a <= (others => '0') when (h2m_poscnt_a = poscnt_a_zero) else poscnt;
---- End boilerplate code

--
-- L0072.poscnt_cin: .valfield 1 values 0, 1 default 0
--
alias h2m_poscnt_cin: 	std_logic is h2m_uinstruction(5);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  poscnt_cin <= h2m_poscnt_cin;
---- End boilerplate code

--
-- L0075.checksum: .regfield 2 values same, zero, inc, - default same
--
alias h2m_checksum: 	std_logic_vector(1 downto 0) is h2m_uinstruction(4 downto 3);
constant checksum_same: 	std_logic_vector(1 downto 0) := "00";
constant checksum_zero: 	std_logic_vector(1 downto 0) := "01";
constant checksum_inc: 	std_logic_vector(1 downto 0) := "10";
-- Value "11" not allowed (name '-' is not assignable)
---- Start boilerplate code (use with utmost caution!)
-- update_checksum: process(clk, h2m_checksum)
-- begin
--	if (rising_edge(clk)) then
--		case h2m_checksum is
----			when checksum_same =>
----				checksum <= checksum;
--			when checksum_zero =>
--				checksum <= (others => '0');
--			when checksum_inc =>
--				checksum <= std_logic_vector(unsigned(checksum) + 1);
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0083.error: .regfield 2 values same, on, off, - default same
--
alias h2m_error: 	std_logic_vector(1 downto 0) is h2m_uinstruction(2 downto 1);
constant error_same: 	std_logic_vector(1 downto 0) := "00";
constant error_on: 	std_logic_vector(1 downto 0) := "01";
constant error_off: 	std_logic_vector(1 downto 0) := "10";
-- Value "11" not allowed (name '-' is not assignable)
---- Start boilerplate code (use with utmost caution!)
-- update_error: process(clk, h2m_error)
-- begin
--	if (rising_edge(clk)) then
--		case h2m_error is
----			when error_same =>
----				error <= error;
--			when error_on =>
--				error <= on;
--			when error_off =>
--				error <= off;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0090.input_reset: .valfield 1 values 0, 1 default 0
--
alias h2m_input_reset: 	std_logic is h2m_uinstruction(0);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  input_reset <= h2m_input_reset;
---- End boilerplate code



constant h2m_microcode: h2m_code_memory := (

-- L0113@0000._reset:  TXDCHAR <= zero, checksum <= zero, poscnt_a = zero, lincnt_a = zero, error <= off
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 0111, lincnt_a = 0, lincnt_cin = 0, poscnt_a = 0, poscnt_cin = 0, checksum <= 01, error <= 10, input_reset = 0;
0 => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & X"7" & '0' & '0' & '0' & '0' & "01" & "10" & '0',

-- L0115@0001._reset1:  TXDCHAR <= zero, checksum <= zero, poscnt_a = zero, lincnt_a = zero, error <= off
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 0111, lincnt_a = 0, lincnt_cin = 0, poscnt_a = 0, poscnt_cin = 0, checksum <= 01, error <= 10, input_reset = 0;
1 => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & X"7" & '0' & '0' & '0' & '0' & "01" & "10" & '0',

-- L0117@0002._reset2:  TXDCHAR <= zero, checksum <= zero, poscnt_a = zero, lincnt_a = zero, error <= off
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 0111, lincnt_a = 0, lincnt_cin = 0, poscnt_a = 0, poscnt_cin = 0, checksum <= 01, error <= 10, input_reset = 0;
2 => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & X"7" & '0' & '0' & '0' & '0' & "01" & "10" & '0',

-- L0119@0003._reset3:  TXDCHAR <= zero, checksum <= zero, poscnt_a = zero, lincnt_a = zero, error <= off
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 0111, lincnt_a = 0, lincnt_cin = 0, poscnt_a = 0, poscnt_cin = 0, checksum <= 01, error <= 10, input_reset = 0;
3 => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & X"7" & '0' & '0' & '0' & '0' & "01" & "10" & '0',

-- L0123@0004.deadloop:  BUSY = 0, if input_is_zero then repeat else next
--  nBUSREQ = 1, nWR = 1, BUSY = 0, if (0011) then 0000001 else 0000000, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
4 => '1' & '1' & '0' & X"3" & "0000001" & "0000000" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0124@0005.echo:  if false then emitChar else emitChar, TXDCHAR <= char_input
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0111110 else 0111110, TXDCHAR <= 0001, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
5 => '1' & '1' & '1' & X"F" & "0111110" & "0111110" & X"1" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0125@0006.  poscnt_cin = 1, if true then fork else fork
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000011 else 0000011, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 1, checksum <= 00, error <= 00, input_reset = 0;
6 => '1' & '1' & '1' & X"0" & "0000011" & "0000011" & X"0" & '1' & '0' & '1' & '1' & "00" & "00" & '0',

-- L0128@0007.badchar:  error <= on, if false then print_crlf else print_crlf
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0111011 else 0111011, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 01, input_reset = 0;
7 => '1' & '1' & '1' & X"F" & "0111011" & "0111011" & X"0" & '1' & '0' & '1' & '0' & "00" & "01" & '0',

-- L0129@0008.  if false then emitChar else emitChar, TXDCHAR <= char_E
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0111110 else 0111110, TXDCHAR <= 0101, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
8 => '1' & '1' & '1' & X"F" & "0111110" & "0111110" & X"5" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0130@0009.  if false then emitChar else emitChar, TXDCHAR <= char_R
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0111110 else 0111110, TXDCHAR <= 0110, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
9 => '1' & '1' & '1' & X"F" & "0111110" & "0111110" & X"6" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0131@000A.  if false then emitChar else emitChar, TXDCHAR <= char_R
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0111110 else 0111110, TXDCHAR <= 0110, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
10 => '1' & '1' & '1' & X"F" & "0111110" & "0111110" & X"6" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0132@000B.  if false then emitChar else emitChar, TXDCHAR <= char_space
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0111110 else 0111110, TXDCHAR <= 0010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
11 => '1' & '1' & '1' & X"F" & "0111110" & "0111110" & X"2" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0133@000C.  if false then emitChar else emitChar, TXDCHAR <= lin3
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0111110 else 0111110, TXDCHAR <= 1111, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
12 => '1' & '1' & '1' & X"F" & "0111110" & "0111110" & X"F" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0134@000D.  if false then emitChar else emitChar, TXDCHAR <= lin2
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0111110 else 0111110, TXDCHAR <= 1110, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
13 => '1' & '1' & '1' & X"F" & "0111110" & "0111110" & X"E" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0135@000E.  if false then emitChar else emitChar, TXDCHAR <= lin1
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0111110 else 0111110, TXDCHAR <= 1101, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
14 => '1' & '1' & '1' & X"F" & "0111110" & "0111110" & X"D" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0136@000F.  if false then emitChar else emitChar, TXDCHAR <= lin0
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0111110 else 0111110, TXDCHAR <= 1100, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
15 => '1' & '1' & '1' & X"F" & "0111110" & "0111110" & X"C" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0137@0010.  if false then emitChar else emitChar, TXDCHAR <= char_space
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0111110 else 0111110, TXDCHAR <= 0010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
16 => '1' & '1' & '1' & X"F" & "0111110" & "0111110" & X"2" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0138@0011.  if false then emitChar else emitChar, TXDCHAR <= pos1
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0111110 else 0111110, TXDCHAR <= 1001, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
17 => '1' & '1' & '1' & X"F" & "0111110" & "0111110" & X"9" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0139@0012.  if false then emitChar else emitChar, TXDCHAR <= pos0
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0111110 else 0111110, TXDCHAR <= 1000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
18 => '1' & '1' & '1' & X"F" & "0111110" & "0111110" & X"8" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0140@0013.  if false then emitChar else emitChar, TXDCHAR <= char_space
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0111110 else 0111110, TXDCHAR <= 0010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
19 => '1' & '1' & '1' & X"F" & "0111110" & "0111110" & X"2" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0141@0014.  if false then emitChar else emitChar, TXDCHAR <= inp1
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0111110 else 0111110, TXDCHAR <= 1011, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
20 => '1' & '1' & '1' & X"F" & "0111110" & "0111110" & X"B" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0142@0015.  if false then emitChar else emitChar, TXDCHAR <= inp0
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0111110 else 0111110, TXDCHAR <= 1010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
21 => '1' & '1' & '1' & X"F" & "0111110" & "0111110" & X"A" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0143@0016.  if false then print_crlf else print_crlf
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0111011 else 0111011, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
22 => '1' & '1' & '1' & X"F" & "0111011" & "0111011" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0144@0017.nextchar:  error <= off, input_reset = 1, checksum <= inc, if false then next else deadloop
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0000100, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 10, error <= 10, input_reset = 1;
23 => '1' & '1' & '1' & X"F" & "0000000" & "0000100" & X"0" & '1' & '0' & '1' & '0' & "10" & "10" & '1',

-- L0149@0020.  if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0101111, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
32 => '1' & '1' & '1' & X"F" & "0000000" & "0101111" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0153@0021.  if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0101111, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
33 => '1' & '1' & '1' & X"F" & "0000000" & "0101111" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0157@0022.  if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0101111, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
34 => '1' & '1' & '1' & X"F" & "0000000" & "0101111" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0161@0023.  if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0101111, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
35 => '1' & '1' & '1' & X"F" & "0000000" & "0101111" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0165@0024.  if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0101111, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
36 => '1' & '1' & '1' & X"F" & "0000000" & "0101111" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0169@0025.  if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0101111, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
37 => '1' & '1' & '1' & X"F" & "0000000" & "0101111" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0173@0026.  if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0101111, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
38 => '1' & '1' & '1' & X"F" & "0000000" & "0101111" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0177@0027.  if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0101111, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
39 => '1' & '1' & '1' & X"F" & "0000000" & "0101111" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0181@0028.  if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0101111, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
40 => '1' & '1' & '1' & X"F" & "0000000" & "0101111" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0185@0029.  if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0101111, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
41 => '1' & '1' & '1' & X"F" & "0000000" & "0101111" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0190@002A.  if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0101111, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
42 => '1' & '1' & '1' & X"F" & "0000000" & "0101111" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0195@002B.  if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0101111, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
43 => '1' & '1' & '1' & X"F" & "0000000" & "0101111" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0200@002C.  if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0101111, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
44 => '1' & '1' & '1' & X"F" & "0000000" & "0101111" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0205@002D.  if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0101111, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
45 => '1' & '1' & '1' & X"F" & "0000000" & "0101111" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0210@002E.  if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0101111, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
46 => '1' & '1' & '1' & X"F" & "0000000" & "0101111" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0215@002F.hexchar:  if false then writemem else writemem
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1000001 else 1000001, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
47 => '1' & '1' & '1' & X"F" & "1000001" & "1000001" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0216@0030.  if false then next else nextchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0010111, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
48 => '1' & '1' & '1' & X"F" & "0000000" & "0010111" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0219@0031.tab:  if false then writemem else writemem
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1000001 else 1000001, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
49 => '1' & '1' & '1' & X"F" & "1000001" & "1000001" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0220@0032.  if false then next else nextchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0010111, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
50 => '1' & '1' & '1' & X"F" & "0000000" & "0010111" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0223@0033.lf:  if false then writemem else writemem
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1000001 else 1000001, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
51 => '1' & '1' & '1' & X"F" & "1000001" & "1000001" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0224@0034.  lincnt_cin = 1, if false then next else nextchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0010111, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 1, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
52 => '1' & '1' & '1' & X"F" & "0000000" & "0010111" & X"0" & '1' & '1' & '1' & '0' & "00" & "00" & '0',

-- L0227@0035.cr:  if false then writemem else writemem
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1000001 else 1000001, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
53 => '1' & '1' & '1' & X"F" & "1000001" & "1000001" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0228@0036.  poscnt_a = zero, if false then next else nextchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0010111, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 0, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
54 => '1' & '1' & '1' & X"F" & "0000000" & "0010111" & X"0" & '1' & '0' & '0' & '0' & "00" & "00" & '0',

-- L0231@0037.space:  if false then writemem else writemem
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1000001 else 1000001, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
55 => '1' & '1' & '1' & X"F" & "1000001" & "1000001" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0232@0038.  if false then next else nextchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0010111, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
56 => '1' & '1' & '1' & X"F" & "0000000" & "0010111" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0235@0039.colon:  if false then writemem else writemem
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1000001 else 1000001, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
57 => '1' & '1' & '1' & X"F" & "1000001" & "1000001" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0236@003A.  if false then next else nextchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0010111, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
58 => '1' & '1' & '1' & X"F" & "0000000" & "0010111" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0238@003B.print_crlf:  if false then emitChar else emitChar, TXDCHAR <= char_cr
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0111110 else 0111110, TXDCHAR <= 0011, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
59 => '1' & '1' & '1' & X"F" & "0111110" & "0111110" & X"3" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0239@003C.  if false then emitChar else emitChar, TXDCHAR <= char_lf
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0111110 else 0111110, TXDCHAR <= 0100, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
60 => '1' & '1' & '1' & X"F" & "0111110" & "0111110" & X"4" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0240@003D.  if true then return else return
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
61 => '1' & '1' & '1' & X"0" & "0000010" & "0000010" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0244@003E.emitChar:  if TXDSEND then next else next
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0101) then 0000000 else 0000000, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
62 => '1' & '1' & '1' & X"5" & "0000000" & "0000000" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0245@003F.emitChar2:  if true then next else next
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
63 => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0246@0040.  if TXDREADY then return else repeat
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0100) then 0000010 else 0000001, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
64 => '1' & '1' & '1' & X"4" & "0000010" & "0000001" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0251@0041.writemem:  nBUSREQ = 0
--  nBUSREQ = 0, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
65 => '0' & '1' & '1' & X"0" & "0000000" & "0000000" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0252@0042.  nBUSREQ = 0, if nBUSACK then repeat else next
--  nBUSREQ = 0, nWR = 1, BUSY = 1, if (0010) then 0000001 else 0000000, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
66 => '0' & '1' & '1' & X"2" & "0000001" & "0000000" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0253@0043.  nBUSREQ = 0, nWR = 0
--  nBUSREQ = 0, nWR = 0, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
67 => '0' & '0' & '1' & X"0" & "0000000" & "0000000" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0254@0044.  nBUSREQ = 0, nWR = 0, if nWAIT then return else repeat
--  nBUSREQ = 0, nWR = 0, BUSY = 1, if (0001) then 0000010 else 0000001, TXDCHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
68 => '0' & '0' & '1' & X"1" & "0000010" & "0000001" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- 67 location(s) in following ranges will be filled with default value
-- 0018 .. 001F
-- 0045 .. 007F

others => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0'
);

end hex2mem_code;

