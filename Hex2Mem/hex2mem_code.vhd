--------------------------------------------------------
-- mcc V1.0.0616 - Custom microcode compiler (c)2020-... 
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
constant CODE_DATA_WIDTH: 	positive := 32;
constant CODE_ADDRESS_WIDTH: 	positive := 7;
constant CODE_ADDRESS_LAST: 	positive := 127;
constant CODE_IF_WIDTH: 	positive := 4;


type m2h_code_memory is array(0 to 127) of std_logic_vector(31 downto 0);

signal m2h_uinstruction: std_logic_vector(31 downto 0);

--m2h_uinstruction <= m2h_microcode(to_integer(unsigned(TODO))); -- copy to file containing the control unit. TODO is typically replace with 'ui_address' control unit output

--
-- L0010.nBUSREQ: .valfield 1 values 0, 1 default 1
--
alias m2h_nBUSREQ: 	std_logic is m2h_uinstruction(31);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  nBUSREQ <= m2h_nBUSREQ;
---- End boilerplate code

--
-- L0011.nWR: .valfield 1 values 0, 1 default 1
--
alias m2h_nWR: 	std_logic is m2h_uinstruction(30);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  nWR <= m2h_nWR;
---- End boilerplate code

--
-- L0018.BUSY: .valfield 1 values 0, 1 default 1
--
alias m2h_BUSY: 	std_logic is m2h_uinstruction(29);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  BUSY <= m2h_BUSY;
---- End boilerplate code

--
-- L0025.seq_cond: .if 4 values true, nWAIT, nBUSACK, input_is_zero, TXDREADY, TXDSEND, -, -, -, -, -, -, -, -, -, false default true
--
alias m2h_seq_cond: 	std_logic_vector(3 downto 0) is m2h_uinstruction(28 downto 25);
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
-- L0043.seq_then: .then 6 values next, repeat, return, fork, @ default next
--
alias m2h_seq_then: 	std_logic_vector(5 downto 0) is m2h_uinstruction(24 downto 19);
constant seq_then_next: 	std_logic_vector(5 downto 0) := "000000";
constant seq_then_repeat: 	std_logic_vector(5 downto 0) := "000001";
constant seq_then_return: 	std_logic_vector(5 downto 0) := "000010";
constant seq_then_fork: 	std_logic_vector(5 downto 0) := "000011";
-- Jump targets allowed!
-- include '.controller <filename.vhd>, <stackdepth>;' in .mcc file to generate pre-canned microcode control unit and connect 'then' to m2h_seq_then

--
-- L0044.seq_else: .else 6 values next, repeat, return, fork, 0b000000..0b111111, @ default next
--
alias m2h_seq_else: 	std_logic_vector(5 downto 0) is m2h_uinstruction(18 downto 13);
constant seq_else_next: 	std_logic_vector(5 downto 0) := "000000";
constant seq_else_repeat: 	std_logic_vector(5 downto 0) := "000001";
constant seq_else_return: 	std_logic_vector(5 downto 0) := "000010";
constant seq_else_fork: 	std_logic_vector(5 downto 0) := "000011";
-- Values from "000000" to "111111" allowed
-- Jump targets allowed!
-- include '.controller <filename.vhd>, <stackdepth>;' in .mcc file to generate pre-canned microcode control unit and connect 'else' to m2h_seq_else

--
-- L0047.CHAR: .regfield 4 values same, char_input, char_space, char_cr, char_lf, char_E, char_R, zero, pos0, pos1, pos2, pos3, lin0, lin1, lin2, lin3 default same
--
alias m2h_CHAR: 	std_logic_vector(3 downto 0) is m2h_uinstruction(12 downto 9);
constant CHAR_same: 	std_logic_vector(3 downto 0) := X"0";
constant CHAR_char_input: 	std_logic_vector(3 downto 0) := X"1";
constant CHAR_char_space: 	std_logic_vector(3 downto 0) := X"2";
constant CHAR_char_cr: 	std_logic_vector(3 downto 0) := X"3";
constant CHAR_char_lf: 	std_logic_vector(3 downto 0) := X"4";
constant CHAR_char_E: 	std_logic_vector(3 downto 0) := X"5";
constant CHAR_char_R: 	std_logic_vector(3 downto 0) := X"6";
constant CHAR_zero: 	std_logic_vector(3 downto 0) := X"7";
constant CHAR_pos0: 	std_logic_vector(3 downto 0) := X"8";
constant CHAR_pos1: 	std_logic_vector(3 downto 0) := X"9";
constant CHAR_pos2: 	std_logic_vector(3 downto 0) := X"A";
constant CHAR_pos3: 	std_logic_vector(3 downto 0) := X"B";
constant CHAR_lin0: 	std_logic_vector(3 downto 0) := X"C";
constant CHAR_lin1: 	std_logic_vector(3 downto 0) := X"D";
constant CHAR_lin2: 	std_logic_vector(3 downto 0) := X"E";
constant CHAR_lin3: 	std_logic_vector(3 downto 0) := X"F";
---- Start boilerplate code (use with utmost caution!)
-- update_CHAR: process(clk, m2h_CHAR)
-- begin
--	if (rising_edge(clk)) then
--		case m2h_CHAR is
----			when CHAR_same =>
----				CHAR <= CHAR;
--			when CHAR_char_input =>
--				CHAR <= char_input;
--			when CHAR_char_space =>
--				CHAR <= char_space;
--			when CHAR_char_cr =>
--				CHAR <= char_cr;
--			when CHAR_char_lf =>
--				CHAR <= char_lf;
--			when CHAR_char_E =>
--				CHAR <= char_E;
--			when CHAR_char_R =>
--				CHAR <= char_R;
--			when CHAR_zero =>
--				CHAR <= (others => '0');
--			when CHAR_pos0 =>
--				CHAR <= pos0;
--			when CHAR_pos1 =>
--				CHAR <= pos1;
--			when CHAR_pos2 =>
--				CHAR <= pos2;
--			when CHAR_pos3 =>
--				CHAR <= pos3;
--			when CHAR_lin0 =>
--				CHAR <= lin0;
--			when CHAR_lin1 =>
--				CHAR <= lin1;
--			when CHAR_lin2 =>
--				CHAR <= lin2;
--			when CHAR_lin3 =>
--				CHAR <= lin3;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0067.lincnt_a: .valfield 1 values zero, same default same
--
alias m2h_lincnt_a: 	std_logic is m2h_uinstruction(8);
constant lincnt_a_zero: 	std_logic := '0';
constant lincnt_a_same: 	std_logic := '1';
---- Start boilerplate code (use with utmost caution!)
--	lincnt_a <= (others => '0') when (m2h_lincnt_a = lincnt_a_zero) else same;
---- End boilerplate code

--
-- L0068.lincnt_cin: .valfield 1 values 0, 1 default 0
--
alias m2h_lincnt_cin: 	std_logic is m2h_uinstruction(7);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  lincnt_cin <= m2h_lincnt_cin;
---- End boilerplate code

--
-- L0071.poscnt_a: .valfield 1 values zero, same default same
--
alias m2h_poscnt_a: 	std_logic is m2h_uinstruction(6);
constant poscnt_a_zero: 	std_logic := '0';
constant poscnt_a_same: 	std_logic := '1';
---- Start boilerplate code (use with utmost caution!)
--	poscnt_a <= (others => '0') when (m2h_poscnt_a = poscnt_a_zero) else same;
---- End boilerplate code

--
-- L0072.poscnt_cin: .valfield 1 values 0, 1 default 0
--
alias m2h_poscnt_cin: 	std_logic is m2h_uinstruction(5);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  poscnt_cin <= m2h_poscnt_cin;
---- End boilerplate code

--
-- L0075.checksum: .regfield 2 values same, zero, inc, - default same
--
alias m2h_checksum: 	std_logic_vector(1 downto 0) is m2h_uinstruction(4 downto 3);
constant checksum_same: 	std_logic_vector(1 downto 0) := "00";
constant checksum_zero: 	std_logic_vector(1 downto 0) := "01";
constant checksum_inc: 	std_logic_vector(1 downto 0) := "10";
-- Value "11" not allowed (name '-' is not assignable)
---- Start boilerplate code (use with utmost caution!)
-- update_checksum: process(clk, m2h_checksum)
-- begin
--	if (rising_edge(clk)) then
--		case m2h_checksum is
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
alias m2h_error: 	std_logic_vector(1 downto 0) is m2h_uinstruction(2 downto 1);
constant error_same: 	std_logic_vector(1 downto 0) := "00";
constant error_on: 	std_logic_vector(1 downto 0) := "01";
constant error_off: 	std_logic_vector(1 downto 0) := "10";
-- Value "11" not allowed (name '-' is not assignable)
---- Start boilerplate code (use with utmost caution!)
-- update_error: process(clk, m2h_error)
-- begin
--	if (rising_edge(clk)) then
--		case m2h_error is
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
alias m2h_input_reset: 	std_logic is m2h_uinstruction(0);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  input_reset <= m2h_input_reset;
---- End boilerplate code



constant m2h_microcode: m2h_code_memory := (

-- L0109@0000._reset:  CHAR <= zero, checksum <= zero, poscnt_a = zero,lincnt_a = zero, error <= off
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 000000 else 000000, CHAR <= 0111, lincnt_a = 0, lincnt_cin = 0, poscnt_a = 0, poscnt_cin = 0, checksum <= 01, error <= 10, input_reset = 0;
0 => '1' & '1' & '1' & X"0" & O"00" & O"00" & X"7" & '0' & '0' & '0' & '0' & "01" & "10" & '0',

-- L0111@0001._reset1:  CHAR <= zero, checksum <= zero, poscnt_a = zero,lincnt_a = zero, error <= off
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 000000 else 000000, CHAR <= 0111, lincnt_a = 0, lincnt_cin = 0, poscnt_a = 0, poscnt_cin = 0, checksum <= 01, error <= 10, input_reset = 0;
1 => '1' & '1' & '1' & X"0" & O"00" & O"00" & X"7" & '0' & '0' & '0' & '0' & "01" & "10" & '0',

-- L0113@0002._reset2:  CHAR <= zero, checksum <= zero, poscnt_a = zero,lincnt_a = zero, error <= off
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 000000 else 000000, CHAR <= 0111, lincnt_a = 0, lincnt_cin = 0, poscnt_a = 0, poscnt_cin = 0, checksum <= 01, error <= 10, input_reset = 0;
2 => '1' & '1' & '1' & X"0" & O"00" & O"00" & X"7" & '0' & '0' & '0' & '0' & "01" & "10" & '0',

-- L0115@0003._reset3:  CHAR <= zero, checksum <= zero, poscnt_a = zero,lincnt_a = zero, error <= off
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 000000 else 000000, CHAR <= 0111, lincnt_a = 0, lincnt_cin = 0, poscnt_a = 0, poscnt_cin = 0, checksum <= 01, error <= 10, input_reset = 0;
3 => '1' & '1' & '1' & X"0" & O"00" & O"00" & X"7" & '0' & '0' & '0' & '0' & "01" & "10" & '0',

-- L0119@0004.deadloop:  BUSY = 0, if input_is_zero then repeat else next
--  nBUSREQ = 1, nWR = 1, BUSY = 0, if (0011) then 000001 else 000000, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
4 => '1' & '1' & '0' & X"3" & O"01" & O"00" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0120@0005.echo:  if false then emitChar else emitChar, CHAR <= char_input
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 100111 else 100111, CHAR <= 0001, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
5 => '1' & '1' & '1' & X"F" & O"47" & O"47" & X"1" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0121@0006.  poscnt_cin = 1, if true then fork else fork
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 000011 else 000011, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 1, checksum <= 00, error <= 00, input_reset = 0;
6 => '1' & '1' & '1' & X"0" & O"03" & O"03" & X"0" & '1' & '0' & '1' & '1' & "00" & "00" & '0',

-- L0124@0007.badchar:  error <= on, if false then print_crlf else print_crlf
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 100100 else 100100, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 01, input_reset = 0;
7 => '1' & '1' & '1' & X"F" & O"44" & O"44" & X"0" & '1' & '0' & '1' & '0' & "00" & "01" & '0',

-- L0125@0008.  if false then emitChar else emitChar, CHAR <= char_E
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 100111 else 100111, CHAR <= 0101, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
8 => '1' & '1' & '1' & X"F" & O"47" & O"47" & X"5" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0126@0009.  if false then emitChar else emitChar, CHAR <= char_R
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 100111 else 100111, CHAR <= 0110, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
9 => '1' & '1' & '1' & X"F" & O"47" & O"47" & X"6" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0127@000A.  if false then emitChar else emitChar, CHAR <= char_R
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 100111 else 100111, CHAR <= 0110, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
10 => '1' & '1' & '1' & X"F" & O"47" & O"47" & X"6" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0128@000B.  if false then emitChar else emitChar, CHAR <= char_space
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 100111 else 100111, CHAR <= 0010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
11 => '1' & '1' & '1' & X"F" & O"47" & O"47" & X"2" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0129@000C.  if false then emitChar else emitChar, CHAR <= lin3
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 100111 else 100111, CHAR <= 1111, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
12 => '1' & '1' & '1' & X"F" & O"47" & O"47" & X"F" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0130@000D.  if false then emitChar else emitChar, CHAR <= lin2
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 100111 else 100111, CHAR <= 1110, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
13 => '1' & '1' & '1' & X"F" & O"47" & O"47" & X"E" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0131@000E.  if false then emitChar else emitChar, CHAR <= lin1
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 100111 else 100111, CHAR <= 1101, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
14 => '1' & '1' & '1' & X"F" & O"47" & O"47" & X"D" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0132@000F.  if false then emitChar else emitChar, CHAR <= lin0
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 100111 else 100111, CHAR <= 1100, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
15 => '1' & '1' & '1' & X"F" & O"47" & O"47" & X"C" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0133@0010.  if false then emitChar else emitChar, CHAR <= char_space
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 100111 else 100111, CHAR <= 0010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
16 => '1' & '1' & '1' & X"F" & O"47" & O"47" & X"2" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0134@0011.  if false then emitChar else emitChar, CHAR <= pos3
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 100111 else 100111, CHAR <= 1011, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
17 => '1' & '1' & '1' & X"F" & O"47" & O"47" & X"B" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0135@0012.  if false then emitChar else emitChar, CHAR <= pos2
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 100111 else 100111, CHAR <= 1010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
18 => '1' & '1' & '1' & X"F" & O"47" & O"47" & X"A" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0136@0013.  if false then emitChar else emitChar, CHAR <= pos1
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 100111 else 100111, CHAR <= 1001, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
19 => '1' & '1' & '1' & X"F" & O"47" & O"47" & X"9" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0137@0014.  if false then emitChar else emitChar, CHAR <= pos0
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 100111 else 100111, CHAR <= 1000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
20 => '1' & '1' & '1' & X"F" & O"47" & O"47" & X"8" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0138@0015.  if false then print_crlf else print_crlf
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 100100 else 100100, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
21 => '1' & '1' & '1' & X"F" & O"44" & O"44" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0139@0016.  error <= off
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 000000 else 000000, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 10, input_reset = 0;
22 => '1' & '1' & '1' & X"0" & O"00" & O"00" & X"0" & '1' & '0' & '1' & '0' & "00" & "10" & '0',

-- L0140@0017.nextchar:  input_reset = 1, checksum <= inc, if false then next else deadloop
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 000000 else 000100, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 10, error <= 00, input_reset = 1;
23 => '1' & '1' & '1' & X"F" & O"00" & O"04" & X"0" & '1' & '0' & '1' & '0' & "10" & "00" & '1',

-- L0143@0018.tab:  if false then writemem else writemem
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 101001 else 101001, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
24 => '1' & '1' & '1' & X"F" & O"51" & O"51" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0144@0019.  if false then next else nextchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 000000 else 010111, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
25 => '1' & '1' & '1' & X"F" & O"00" & O"27" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0147@001A.lf:  if false then writemem else writemem
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 101001 else 101001, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
26 => '1' & '1' & '1' & X"F" & O"51" & O"51" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0148@001B.  lincnt_cin = 1, if false then next else nextchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 000000 else 010111, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 1, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
27 => '1' & '1' & '1' & X"F" & O"00" & O"27" & X"0" & '1' & '1' & '1' & '0' & "00" & "00" & '0',

-- L0151@001C.cr:  if false then writemem else writemem
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 101001 else 101001, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
28 => '1' & '1' & '1' & X"F" & O"51" & O"51" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0152@001D.  poscnt_a = zero, if false then next else nextchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 000000 else 010111, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 0, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
29 => '1' & '1' & '1' & X"F" & O"00" & O"27" & X"0" & '1' & '0' & '0' & '0' & "00" & "00" & '0',

-- L0155@001E.space:  if false then writemem else writemem
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 101001 else 101001, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
30 => '1' & '1' & '1' & X"F" & O"51" & O"51" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0156@001F.  if false then next else nextchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 000000 else 010111, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
31 => '1' & '1' & '1' & X"F" & O"00" & O"27" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0159@0020.colon:  if false then writemem else writemem
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 101001 else 101001, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
32 => '1' & '1' & '1' & X"F" & O"51" & O"51" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0160@0021.  if false then next else nextchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 000000 else 010111, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
33 => '1' & '1' & '1' & X"F" & O"00" & O"27" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0164@0022.hexchar:  if false then writemem else writemem
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 101001 else 101001, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
34 => '1' & '1' & '1' & X"F" & O"51" & O"51" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0165@0023.  if false then next else nextchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 000000 else 010111, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
35 => '1' & '1' & '1' & X"F" & O"00" & O"27" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0167@0024.print_crlf:  if false then emitChar else emitChar, CHAR <= char_cr
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 100111 else 100111, CHAR <= 0011, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
36 => '1' & '1' & '1' & X"F" & O"47" & O"47" & X"3" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0168@0025.  if false then emitChar else emitChar, CHAR <= char_lf
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 100111 else 100111, CHAR <= 0100, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
37 => '1' & '1' & '1' & X"F" & O"47" & O"47" & X"4" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0169@0026.  if true then return else return
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 000010 else 000010, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
38 => '1' & '1' & '1' & X"0" & O"02" & O"02" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0172@0027.emitChar:  if TXDSEND then next else next
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0101) then 000000 else 000000, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
39 => '1' & '1' & '1' & X"5" & O"00" & O"00" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0173@0028.  if TXDREADY then return else repeat
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0100) then 000010 else 000001, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
40 => '1' & '1' & '1' & X"4" & O"02" & O"01" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0176@0029.writemem:  nBUSREQ = 0
--  nBUSREQ = 0, nWR = 1, BUSY = 1, if (0000) then 000000 else 000000, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
41 => '0' & '1' & '1' & X"0" & O"00" & O"00" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0177@002A.  nBUSREQ = 0, if nBUSACK then repeat else next
--  nBUSREQ = 0, nWR = 1, BUSY = 1, if (0010) then 000001 else 000000, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
42 => '0' & '1' & '1' & X"2" & O"01" & O"00" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0178@002B.  nBUSREQ = 0, nWR = 0
--  nBUSREQ = 0, nWR = 0, BUSY = 1, if (0000) then 000000 else 000000, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
43 => '0' & '0' & '1' & X"0" & O"00" & O"00" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- L0179@002C.  nBUSREQ = 0, nWR = 0, if nWAIT then return else repeat
--  nBUSREQ = 0, nWR = 0, BUSY = 1, if (0001) then 000010 else 000001, CHAR <= 0000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, checksum <= 00, error <= 00, input_reset = 0;
44 => '0' & '0' & '1' & X"1" & O"02" & O"01" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0',

-- 83 location(s) in following ranges will be filled with default value
-- 002D .. 007F

others => '1' & '1' & '1' & X"0" & O"00" & O"00" & X"0" & '1' & '0' & '1' & '0' & "00" & "00" & '0'
);

end hex2mem_code;

