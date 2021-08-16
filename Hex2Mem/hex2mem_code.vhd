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
constant CODE_DATA_WIDTH: 	positive := 48;
constant CODE_ADDRESS_WIDTH: 	positive := 7;
constant CODE_ADDRESS_LAST: 	positive := 127;
constant CODE_IF_WIDTH: 	positive := 4;


type h2m_code_memory is array(0 to 127) of std_logic_vector(47 downto 0);

signal h2m_uinstruction: std_logic_vector(47 downto 0);

--h2m_uinstruction <= h2m_microcode(to_integer(unsigned(TODO))); -- copy to file containing the control unit. TODO is typically replace with 'ui_address' control unit output

--
-- L0010.nBUSREQ: .valfield 1 values 0, 1 default 1
--
alias h2m_nBUSREQ: 	std_logic is h2m_uinstruction(47);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  nBUSREQ <= h2m_nBUSREQ;
---- End boilerplate code

--
-- L0011.nWR: .valfield 1 values 0, 1 default 1
--
alias h2m_nWR: 	std_logic is h2m_uinstruction(46);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  nWR <= h2m_nWR;
---- End boilerplate code

--
-- L0018.BUSY: .valfield 1 values 0, 1 default 1
--
alias h2m_BUSY: 	std_logic is h2m_uinstruction(45);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  BUSY <= h2m_BUSY;
---- End boilerplate code

--
-- L0025.seq_cond: .if 4 values true, nWAIT, nBUSACK, input_is_zero, TXDREADY, TXDSEND, TRACEENABLED, bytecnt_at_colon, hexcnt_is_odd, prev_is_crorlf, prev_is_spaceortab, -, -, -, -, false default true
--
alias h2m_seq_cond: 	std_logic_vector(3 downto 0) is h2m_uinstruction(44 downto 41);
constant seq_cond_true: 	integer := 0;
constant seq_cond_nWAIT: 	integer := 1;
constant seq_cond_nBUSACK: 	integer := 2;
constant seq_cond_input_is_zero: 	integer := 3;
constant seq_cond_TXDREADY: 	integer := 4;
constant seq_cond_TXDSEND: 	integer := 5;
constant seq_cond_TRACEENABLED: 	integer := 6;
constant seq_cond_bytecnt_at_colon: 	integer := 7;
constant seq_cond_hexcnt_is_odd: 	integer := 8;
constant seq_cond_prev_is_crorlf: 	integer := 9;
constant seq_cond_prev_is_spaceortab: 	integer := 10;
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
--  cond(seq_cond_TRACEENABLED) => TRACEENABLED,
--  cond(seq_cond_bytecnt_at_colon) => bytecnt_at_colon,
--  cond(seq_cond_hexcnt_is_odd) => hexcnt_is_odd,
--  cond(seq_cond_prev_is_crorlf) => prev_is_crorlf,
--  cond(seq_cond_prev_is_spaceortab) => prev_is_spaceortab,
--  cond(seq_cond_-) => -,
--  cond(seq_cond_-) => -,
--  cond(seq_cond_-) => -,
--  cond(seq_cond_-) => -,
--  cond(seq_cond_false) => '0',
---- End boilerplate code

--
-- L0043.seq_then: .then 7 values next, repeat, return, fork, @ default next
--
alias h2m_seq_then: 	std_logic_vector(6 downto 0) is h2m_uinstruction(40 downto 34);
constant seq_then_next: 	std_logic_vector(6 downto 0) := "0000000";
constant seq_then_repeat: 	std_logic_vector(6 downto 0) := "0000001";
constant seq_then_return: 	std_logic_vector(6 downto 0) := "0000010";
constant seq_then_fork: 	std_logic_vector(6 downto 0) := "0000011";
-- Jump targets allowed!
-- include '.controller <filename.vhd>, <stackdepth>;' in .mcc file to generate pre-canned microcode control unit and connect 'then' to h2m_seq_then

--
-- L0044.seq_else: .else 7 values next, repeat, return, fork, 0b000000..0b111111, @ default next
--
alias h2m_seq_else: 	std_logic_vector(6 downto 0) is h2m_uinstruction(33 downto 27);
constant seq_else_next: 	std_logic_vector(6 downto 0) := "0000000";
constant seq_else_repeat: 	std_logic_vector(6 downto 0) := "0000001";
constant seq_else_return: 	std_logic_vector(6 downto 0) := "0000010";
constant seq_else_fork: 	std_logic_vector(6 downto 0) := "0000011";
-- Values from "0000000" to "0111111" allowed
-- Jump targets allowed!
-- include '.controller <filename.vhd>, <stackdepth>;' in .mcc file to generate pre-canned microcode control unit and connect 'else' to h2m_seq_else

--
-- L0047.TXDCHAR: .regfield 5 values same, char_F, char_space, char_cr, char_lf, char_E, char_R, char_I, char_H, char_A, char_C, char_EQU, -, -, -, zero, pos_ram0, pos_ram1, inp0, inp1, lin_chk0, lin_chk1, lin_chk2, lin_chk3, hexcnt0, hexcnt1, addr0, addr1, addr2, addr3, flags, - default same
--
alias h2m_TXDCHAR: 	std_logic_vector(4 downto 0) is h2m_uinstruction(26 downto 22);
constant TXDCHAR_same: 	std_logic_vector(4 downto 0) := "00000";
constant TXDCHAR_char_F: 	std_logic_vector(4 downto 0) := "00001";
constant TXDCHAR_char_space: 	std_logic_vector(4 downto 0) := "00010";
constant TXDCHAR_char_cr: 	std_logic_vector(4 downto 0) := "00011";
constant TXDCHAR_char_lf: 	std_logic_vector(4 downto 0) := "00100";
constant TXDCHAR_char_E: 	std_logic_vector(4 downto 0) := "00101";
constant TXDCHAR_char_R: 	std_logic_vector(4 downto 0) := "00110";
constant TXDCHAR_char_I: 	std_logic_vector(4 downto 0) := "00111";
constant TXDCHAR_char_H: 	std_logic_vector(4 downto 0) := "01000";
constant TXDCHAR_char_A: 	std_logic_vector(4 downto 0) := "01001";
constant TXDCHAR_char_C: 	std_logic_vector(4 downto 0) := "01010";
constant TXDCHAR_char_EQU: 	std_logic_vector(4 downto 0) := "01011";
-- Value "01100" not allowed (name '-' is not assignable)
-- Value "01101" not allowed (name '-' is not assignable)
-- Value "01110" not allowed (name '-' is not assignable)
constant TXDCHAR_zero: 	std_logic_vector(4 downto 0) := "01111";
constant TXDCHAR_pos_ram0: 	std_logic_vector(4 downto 0) := "10000";
constant TXDCHAR_pos_ram1: 	std_logic_vector(4 downto 0) := "10001";
constant TXDCHAR_inp0: 	std_logic_vector(4 downto 0) := "10010";
constant TXDCHAR_inp1: 	std_logic_vector(4 downto 0) := "10011";
constant TXDCHAR_lin_chk0: 	std_logic_vector(4 downto 0) := "10100";
constant TXDCHAR_lin_chk1: 	std_logic_vector(4 downto 0) := "10101";
constant TXDCHAR_lin_chk2: 	std_logic_vector(4 downto 0) := "10110";
constant TXDCHAR_lin_chk3: 	std_logic_vector(4 downto 0) := "10111";
constant TXDCHAR_hexcnt0: 	std_logic_vector(4 downto 0) := "11000";
constant TXDCHAR_hexcnt1: 	std_logic_vector(4 downto 0) := "11001";
constant TXDCHAR_addr0: 	std_logic_vector(4 downto 0) := "11010";
constant TXDCHAR_addr1: 	std_logic_vector(4 downto 0) := "11011";
constant TXDCHAR_addr2: 	std_logic_vector(4 downto 0) := "11100";
constant TXDCHAR_addr3: 	std_logic_vector(4 downto 0) := "11101";
constant TXDCHAR_flags: 	std_logic_vector(4 downto 0) := "11110";
-- Value "11111" not allowed (name '-' is not assignable)
---- Start boilerplate code (use with utmost caution!)
-- update_TXDCHAR: process(clk, h2m_TXDCHAR)
-- begin
--	if (rising_edge(clk)) then
--		case h2m_TXDCHAR is
----			when TXDCHAR_same =>
----				TXDCHAR <= TXDCHAR;
--			when TXDCHAR_char_F =>
--				TXDCHAR <= char_F;
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
--			when TXDCHAR_char_I =>
--				TXDCHAR <= char_I;
--			when TXDCHAR_char_H =>
--				TXDCHAR <= char_H;
--			when TXDCHAR_char_A =>
--				TXDCHAR <= char_A;
--			when TXDCHAR_char_C =>
--				TXDCHAR <= char_C;
--			when TXDCHAR_char_EQU =>
--				TXDCHAR <= char_EQU;
--			when TXDCHAR_zero =>
--				TXDCHAR <= (others => '0');
--			when TXDCHAR_pos_ram0 =>
--				TXDCHAR <= pos_ram0;
--			when TXDCHAR_pos_ram1 =>
--				TXDCHAR <= pos_ram1;
--			when TXDCHAR_inp0 =>
--				TXDCHAR <= inp0;
--			when TXDCHAR_inp1 =>
--				TXDCHAR <= inp1;
--			when TXDCHAR_lin_chk0 =>
--				TXDCHAR <= lin_chk0;
--			when TXDCHAR_lin_chk1 =>
--				TXDCHAR <= lin_chk1;
--			when TXDCHAR_lin_chk2 =>
--				TXDCHAR <= lin_chk2;
--			when TXDCHAR_lin_chk3 =>
--				TXDCHAR <= lin_chk3;
--			when TXDCHAR_hexcnt0 =>
--				TXDCHAR <= hexcnt0;
--			when TXDCHAR_hexcnt1 =>
--				TXDCHAR <= hexcnt1;
--			when TXDCHAR_addr0 =>
--				TXDCHAR <= addr0;
--			when TXDCHAR_addr1 =>
--				TXDCHAR <= addr1;
--			when TXDCHAR_addr2 =>
--				TXDCHAR <= addr2;
--			when TXDCHAR_addr3 =>
--				TXDCHAR <= addr3;
--			when TXDCHAR_flags =>
--				TXDCHAR <= flags;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0084.lincnt_a: .valfield 1 values zero, lincnt default lincnt
--
alias h2m_lincnt_a: 	std_logic is h2m_uinstruction(21);
constant lincnt_a_zero: 	std_logic := '0';
constant lincnt_a_lincnt: 	std_logic := '1';
---- Start boilerplate code (use with utmost caution!)
--	lincnt_a <= (others => '0') when (h2m_lincnt_a = lincnt_a_zero) else lincnt;
---- End boilerplate code

--
-- L0085.lincnt_cin: .valfield 1 values 0, 1 default 0
--
alias h2m_lincnt_cin: 	std_logic is h2m_uinstruction(20);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  lincnt_cin <= h2m_lincnt_cin;
---- End boilerplate code

--
-- L0088.poscnt_a: .valfield 1 values zero, poscnt default poscnt
--
alias h2m_poscnt_a: 	std_logic is h2m_uinstruction(19);
constant poscnt_a_zero: 	std_logic := '0';
constant poscnt_a_poscnt: 	std_logic := '1';
---- Start boilerplate code (use with utmost caution!)
--	poscnt_a <= (others => '0') when (h2m_poscnt_a = poscnt_a_zero) else poscnt;
---- End boilerplate code

--
-- L0089.poscnt_cin: .valfield 1 values 0, 1 default 0
--
alias h2m_poscnt_cin: 	std_logic is h2m_uinstruction(18);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  poscnt_cin <= h2m_poscnt_cin;
---- End boilerplate code

--
-- L0092.address: .regfield 2 values same, inc, shift8ram, - default same
--
alias h2m_address: 	std_logic_vector(1 downto 0) is h2m_uinstruction(17 downto 16);
constant address_same: 	std_logic_vector(1 downto 0) := "00";
constant address_inc: 	std_logic_vector(1 downto 0) := "01";
constant address_shift8ram: 	std_logic_vector(1 downto 0) := "10";
-- Value "11" not allowed (name '-' is not assignable)
---- Start boilerplate code (use with utmost caution!)
-- update_address: process(clk, h2m_address)
-- begin
--	if (rising_edge(clk)) then
--		case h2m_address is
----			when address_same =>
----				address <= address;
--			when address_inc =>
--				address <= std_logic_vector(unsigned(address) + 1);
--			when address_shift8ram =>
--				address <= shift8ram;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0108.ram_write: .valfield 1 values 0, 1 default 0
--
alias h2m_ram_write: 	std_logic is h2m_uinstruction(15);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  ram_write <= h2m_ram_write;
---- End boilerplate code

--
-- L0111.ram_addr: .valfield 3 values bytecnt, ptr_len, ptr_addr_hi, ptr_addr_lo, ptr_type, - - - default bytecnt
--
alias h2m_ram_addr: 	std_logic_vector(2 downto 0) is h2m_uinstruction(14 downto 12);
constant ram_addr_bytecnt: 	std_logic_vector(2 downto 0) := "000";
constant ram_addr_ptr_len: 	std_logic_vector(2 downto 0) := "001";
constant ram_addr_ptr_addr_hi: 	std_logic_vector(2 downto 0) := "010";
constant ram_addr_ptr_addr_lo: 	std_logic_vector(2 downto 0) := "011";
constant ram_addr_ptr_type: 	std_logic_vector(2 downto 0) := "100";
-- Value "101" not allowed (name '- - -' is not assignable)
---- Start boilerplate code (use with utmost caution!)
-- with h2m_ram_addr select ram_addr <=
--      bytecnt when ram_addr_bytecnt, -- default value
--      ptr_len when ram_addr_ptr_len,
--      ptr_addr_hi when ram_addr_ptr_addr_hi,
--      ptr_addr_lo when ram_addr_ptr_addr_lo,
--      ptr_type when ram_addr_ptr_type,
--      bytecnt when others;
---- End boilerplate code

--
-- L0123.hexcnt: .regfield 2 values same, inc, ptr_colon, - default same
--
alias h2m_hexcnt: 	std_logic_vector(1 downto 0) is h2m_uinstruction(11 downto 10);
constant hexcnt_same: 	std_logic_vector(1 downto 0) := "00";
constant hexcnt_inc: 	std_logic_vector(1 downto 0) := "01";
constant hexcnt_ptr_colon: 	std_logic_vector(1 downto 0) := "10";
-- Value "11" not allowed (name '-' is not assignable)
---- Start boilerplate code (use with utmost caution!)
-- update_hexcnt: process(clk, h2m_hexcnt)
-- begin
--	if (rising_edge(clk)) then
--		case h2m_hexcnt is
----			when hexcnt_same =>
----				hexcnt <= hexcnt;
--			when hexcnt_inc =>
--				hexcnt <= std_logic_vector(unsigned(hexcnt) + 1);
--			when hexcnt_ptr_colon =>
--				hexcnt <= ptr_colon;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0131.checksum: .regfield 2 values same, zero, add_ram, - default same
--
alias h2m_checksum: 	std_logic_vector(1 downto 0) is h2m_uinstruction(9 downto 8);
constant checksum_same: 	std_logic_vector(1 downto 0) := "00";
constant checksum_zero: 	std_logic_vector(1 downto 0) := "01";
constant checksum_add_ram: 	std_logic_vector(1 downto 0) := "10";
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
--			when checksum_add_ram =>
--				checksum <= add_ram;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0139.error: .regfield 2 values same, on, off, - default same
--
alias h2m_error: 	std_logic_vector(1 downto 0) is h2m_uinstruction(7 downto 6);
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
-- L0146.input_reset: .valfield 1 values 0, 1 default 0
--
alias h2m_input_reset: 	std_logic is h2m_uinstruction(5);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  input_reset <= h2m_input_reset;
---- End boilerplate code

--
-- L0149.dummy: .valfield 5 values * default 0
--
alias h2m_dummy: 	std_logic_vector(4 downto 0) is h2m_uinstruction(4 downto 0);
-- Values from "00000" to "11111" allowed
---- Start boilerplate code (use with utmost caution!)
--  dummy <= h2m_dummy;
---- End boilerplate code



constant h2m_microcode: h2m_code_memory := (

-- L0173@0000._reset:  TXDCHAR <= zero, checksum <= zero, poscnt_a = zero, lincnt_a = zero, error <= off, hexcnt <= ptr_colon
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 01111, lincnt_a = 0, lincnt_cin = 0, poscnt_a = 0, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 10, checksum <= 01, error <= 10, input_reset = 0, dummy = 00000;
0 => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & "01111" & '0' & '0' & '0' & '0' & "00" & '0' & O"0" & "10" & "01" & "10" & '0' & "00000",

-- L0175@0001._reset1:  TXDCHAR <= zero, checksum <= zero, poscnt_a = zero, lincnt_a = zero, error <= off, hexcnt <= ptr_colon
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 01111, lincnt_a = 0, lincnt_cin = 0, poscnt_a = 0, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 10, checksum <= 01, error <= 10, input_reset = 0, dummy = 00000;
1 => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & "01111" & '0' & '0' & '0' & '0' & "00" & '0' & O"0" & "10" & "01" & "10" & '0' & "00000",

-- L0177@0002._reset2:  TXDCHAR <= zero, checksum <= zero, poscnt_a = zero, lincnt_a = zero, error <= off, hexcnt <= ptr_colon
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 01111, lincnt_a = 0, lincnt_cin = 0, poscnt_a = 0, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 10, checksum <= 01, error <= 10, input_reset = 0, dummy = 00000;
2 => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & "01111" & '0' & '0' & '0' & '0' & "00" & '0' & O"0" & "10" & "01" & "10" & '0' & "00000",

-- L0179@0003._reset3:  TXDCHAR <= zero, checksum <= zero, poscnt_a = zero, lincnt_a = zero, error <= off, hexcnt <= ptr_colon
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 01111, lincnt_a = 0, lincnt_cin = 0, poscnt_a = 0, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 10, checksum <= 01, error <= 10, input_reset = 0, dummy = 00000;
3 => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & "01111" & '0' & '0' & '0' & '0' & "00" & '0' & O"0" & "10" & "01" & "10" & '0' & "00000",

-- L0183@0004.deadloop:  BUSY = 0, if input_is_zero then repeat else next
--  nBUSREQ = 1, nWR = 1, BUSY = 0, if (0011) then 0000001 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
4 => '1' & '1' & '0' & X"3" & "0000001" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0185@0005.  poscnt_cin = 1, if true then fork else fork
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000011 else 0000011, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 1, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
5 => '1' & '1' & '1' & X"0" & "0000011" & "0000011" & "00000" & '1' & '0' & '1' & '1' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0188@0006.badchar:  error <= on, if false then print_crlf else print_crlf
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0111011 else 0111011, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 01, input_reset = 0, dummy = 00000;
6 => '1' & '1' & '1' & X"F" & "0111011" & "0111011" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "01" & '0' & "00000",

-- L0189@0007.  if false then emitChar else emitChar, TXDCHAR <= char_E
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 00101, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
7 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "00101" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0190@0008.  if false then emitChar else emitChar, TXDCHAR <= char_R
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 00110, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
8 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "00110" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0191@0009.  if false then emitChar else emitChar, TXDCHAR <= char_R
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 00110, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
9 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "00110" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0192@000A.  if false then emitChar else emitChar, TXDCHAR <= char_space
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 00010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
10 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "00010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0193@000B.  if false then emitChar else emitChar, TXDCHAR <= lin_chk3
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 10111, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
11 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "10111" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0194@000C.  if false then emitChar else emitChar, TXDCHAR <= lin_chk2
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 10110, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
12 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "10110" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0195@000D.  if false then emitChar else emitChar, TXDCHAR <= lin_chk1
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 10101, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
13 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "10101" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0196@000E.  if false then emitChar else emitChar, TXDCHAR <= lin_chk0
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 10100, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
14 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "10100" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0197@000F.  if false then emitChar else emitChar, TXDCHAR <= char_space
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 00010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
15 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "00010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0198@0010.  if false then emitChar else emitChar, TXDCHAR <= pos_ram1
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 10001, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
16 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "10001" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0199@0011.  if false then emitChar else emitChar, TXDCHAR <= pos_ram0
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 10000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
17 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "10000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0200@0012.  if false then emitChar else emitChar, TXDCHAR <= char_space
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 00010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
18 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "00010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0201@0013.  if false then emitChar else emitChar, TXDCHAR <= inp1
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 10011, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
19 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "10011" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0202@0014.  if false then emitChar else emitChar, TXDCHAR <= inp0
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 10010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
20 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "10010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0203@0015.  if false then print_crlf else print_crlf
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0111011 else 0111011, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
21 => '1' & '1' & '1' & X"F" & "0111011" & "0111011" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0204@0016.nextchar:  if false then trace else trace
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0111110 else 0111110, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
22 => '1' & '1' & '1' & X"F" & "0111110" & "0111110" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0205@0017.  error <= off, input_reset = 1, if false then next else deadloop
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0000100, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 10, input_reset = 1, dummy = 00000;
23 => '1' & '1' & '1' & X"F" & "0000000" & "0000100" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "10" & '1' & "00000",

-- L0210@0020.  ram_write = 1, ram_addr = bytecnt, hexcnt <= inc, if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0110000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 01, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
32 => '1' & '1' & '1' & X"F" & "0000000" & "0110000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & "01" & "00" & "00" & '0' & "00000",

-- L0214@0021.  ram_write = 1, ram_addr = bytecnt, hexcnt <= inc, if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0110000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 01, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
33 => '1' & '1' & '1' & X"F" & "0000000" & "0110000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & "01" & "00" & "00" & '0' & "00000",

-- L0218@0022.  ram_write = 1, ram_addr = bytecnt, hexcnt <= inc, if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0110000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 01, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
34 => '1' & '1' & '1' & X"F" & "0000000" & "0110000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & "01" & "00" & "00" & '0' & "00000",

-- L0222@0023.  ram_write = 1, ram_addr = bytecnt, hexcnt <= inc, if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0110000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 01, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
35 => '1' & '1' & '1' & X"F" & "0000000" & "0110000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & "01" & "00" & "00" & '0' & "00000",

-- L0226@0024.  ram_write = 1, ram_addr = bytecnt, hexcnt <= inc, if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0110000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 01, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
36 => '1' & '1' & '1' & X"F" & "0000000" & "0110000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & "01" & "00" & "00" & '0' & "00000",

-- L0230@0025.  ram_write = 1, ram_addr = bytecnt, hexcnt <= inc, if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0110000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 01, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
37 => '1' & '1' & '1' & X"F" & "0000000" & "0110000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & "01" & "00" & "00" & '0' & "00000",

-- L0234@0026.  ram_write = 1, ram_addr = bytecnt, hexcnt <= inc, if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0110000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 01, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
38 => '1' & '1' & '1' & X"F" & "0000000" & "0110000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & "01" & "00" & "00" & '0' & "00000",

-- L0238@0027.  ram_write = 1, ram_addr = bytecnt, hexcnt <= inc, if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0110000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 01, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
39 => '1' & '1' & '1' & X"F" & "0000000" & "0110000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & "01" & "00" & "00" & '0' & "00000",

-- L0242@0028.  ram_write = 1, ram_addr = bytecnt, hexcnt <= inc, if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0110000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 01, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
40 => '1' & '1' & '1' & X"F" & "0000000" & "0110000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & "01" & "00" & "00" & '0' & "00000",

-- L0246@0029.  ram_write = 1, ram_addr = bytecnt, hexcnt <= inc, if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0110000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 01, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
41 => '1' & '1' & '1' & X"F" & "0000000" & "0110000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & "01" & "00" & "00" & '0' & "00000",

-- L0251@002A.  ram_write = 1, ram_addr = bytecnt, hexcnt <= inc, if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0110000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 01, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
42 => '1' & '1' & '1' & X"F" & "0000000" & "0110000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & "01" & "00" & "00" & '0' & "00000",

-- L0256@002B.  ram_write = 1, ram_addr = bytecnt, hexcnt <= inc, if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0110000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 01, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
43 => '1' & '1' & '1' & X"F" & "0000000" & "0110000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & "01" & "00" & "00" & '0' & "00000",

-- L0261@002C.  ram_write = 1, ram_addr = bytecnt, hexcnt <= inc, if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0110000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 01, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
44 => '1' & '1' & '1' & X"F" & "0000000" & "0110000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & "01" & "00" & "00" & '0' & "00000",

-- L0266@002D.  ram_write = 1, ram_addr = bytecnt, hexcnt <= inc, if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0110000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 01, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
45 => '1' & '1' & '1' & X"F" & "0000000" & "0110000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & "01" & "00" & "00" & '0' & "00000",

-- L0271@002E.  ram_write = 1, ram_addr = bytecnt, hexcnt <= inc, if false then next else hexchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0110000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 01, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
46 => '1' & '1' & '1' & X"F" & "0000000" & "0110000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & "01" & "00" & "00" & '0' & "00000",

-- L0276@002F.  ram_write = 1, ram_addr = bytecnt, hexcnt <= inc
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 01, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
47 => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & "01" & "00" & "00" & '0' & "00000",

-- L0277@0030.hexchar:  if bytecnt_at_colon then badchar else next
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0111) then 0000110 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
48 => '1' & '1' & '1' & X"7" & "0000110" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0278@0031.  if hexcnt_is_odd then nextchar else next
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1000) then 0010110 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
49 => '1' & '1' & '1' & X"8" & "0010110" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0279@0032.  ram_addr = bytecnt, checksum <= add_ram, if false then next else nextchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0010110, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 10, error <= 00, input_reset = 0, dummy = 00000;
50 => '1' & '1' & '1' & X"F" & "0000000" & "0010110" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "10" & "00" & '0' & "00000",

-- L0282@0033.  if prev_is_crorlf then nextchar else newline
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1001) then 0010110 else 0110101, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
51 => '1' & '1' & '1' & X"9" & "0010110" & "0110101" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0285@0034.  if prev_is_crorlf then nextchar else next
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1001) then 0010110 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
52 => '1' & '1' & '1' & X"9" & "0010110" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0286@0035.newline:  hexcnt <= ptr_colon, poscnt_a = zero, lincnt_cin = 1, if hexcnt_is_odd then badchar else nextchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1000) then 0000110 else 0010110, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 1, poscnt_a = 0, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 10, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
53 => '1' & '1' & '1' & X"8" & "0000110" & "0010110" & "00000" & '1' & '1' & '0' & '0' & "00" & '0' & O"0" & "10" & "00" & "00" & '0' & "00000",

-- L0290@0036.space:  if prev_is_spaceortab then nextchar else next
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1010) then 0010110 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
54 => '1' & '1' & '1' & X"A" & "0010110" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0291@0037.  if hexcnt_is_odd then badchar else nextchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1000) then 0000110 else 0010110, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
55 => '1' & '1' & '1' & X"8" & "0000110" & "0010110" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0294@0038.colon:  if bytecnt_at_colon then next else badchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0111) then 0000000 else 0000110, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
56 => '1' & '1' & '1' & X"7" & "0000000" & "0000110" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0295@0039.  hexcnt <= inc
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 01, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
57 => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "01" & "00" & "00" & '0' & "00000",

-- L0296@003A.  hexcnt <= inc, if false then next else nextchar
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0010110, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 01, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
58 => '1' & '1' & '1' & X"F" & "0000000" & "0010110" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "01" & "00" & "00" & '0' & "00000",

-- L0298@003B.print_crlf:  if false then emitChar else emitChar, TXDCHAR <= char_cr
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 00011, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
59 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "00011" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0299@003C.  if false then emitChar else emitChar, TXDCHAR <= char_lf
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 00100, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
60 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "00100" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0300@003D.  if true then return else return
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000010 else 0000010, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
61 => '1' & '1' & '1' & X"0" & "0000010" & "0000010" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0302@003E.trace:  if TRACEENABLED then next else return
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0110) then 0000000 else 0000010, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
62 => '1' & '1' & '1' & X"6" & "0000000" & "0000010" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0303@003F.  if false then emitChar else emitChar, TXDCHAR <= char_I
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 00111, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
63 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "00111" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0304@0040.  if false then emitChar else emitChar, TXDCHAR <= char_EQU
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 01011, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
64 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "01011" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0305@0041.  if false then emitChar else emitChar, TXDCHAR <= inp1
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 10011, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
65 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "10011" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0306@0042.  if false then emitChar else emitChar, TXDCHAR <= inp0
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 10010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
66 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "10010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0307@0043.  if false then emitChar else emitChar, TXDCHAR <= char_space
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 00010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
67 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "00010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0309@0044.  if false then emitChar else emitChar, TXDCHAR <= char_H
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 01000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
68 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "01000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0310@0045.  if false then emitChar else emitChar, TXDCHAR <= char_EQU
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 01011, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
69 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "01011" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0311@0046.  if false then emitChar else emitChar, TXDCHAR <= hexcnt1
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 11001, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
70 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "11001" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0312@0047.  if false then emitChar else emitChar, TXDCHAR <= hexcnt0
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 11000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
71 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "11000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0313@0048.  if false then emitChar else emitChar, TXDCHAR <= char_space
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 00010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
72 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "00010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0315@0049.  if false then emitChar else emitChar, TXDCHAR <= char_R
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 00110, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
73 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "00110" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0316@004A.  if false then emitChar else emitChar, TXDCHAR <= char_EQU
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 01011, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
74 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "01011" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0317@004B.  if false then emitChar else emitChar, TXDCHAR <= pos_ram1
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 10001, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
75 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "10001" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0318@004C.  if false then emitChar else emitChar, TXDCHAR <= pos_ram0
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 10000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
76 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "10000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0319@004D.  if false then emitChar else emitChar, TXDCHAR <= char_space
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 00010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
77 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "00010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0321@004E.  if false then emitChar else emitChar, TXDCHAR <= char_A
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 01001, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
78 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "01001" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0322@004F.  if false then emitChar else emitChar, TXDCHAR <= char_EQU
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 01011, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
79 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "01011" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0323@0050.  if false then emitChar else emitChar, TXDCHAR <= addr3
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 11101, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
80 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "11101" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0324@0051.  if false then emitChar else emitChar, TXDCHAR <= addr2
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 11100, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
81 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "11100" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0325@0052.  if false then emitChar else emitChar, TXDCHAR <= addr1
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 11011, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
82 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "11011" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0326@0053.  if false then emitChar else emitChar, TXDCHAR <= addr0
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 11010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
83 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "11010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0327@0054.  if false then emitChar else emitChar, TXDCHAR <= char_space
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 00010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
84 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "00010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0329@0055.  if false then emitChar else emitChar, TXDCHAR <= char_C
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 01010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
85 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "01010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0330@0056.  if false then emitChar else emitChar, TXDCHAR <= char_EQU
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 01011, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
86 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "01011" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0331@0057.  if false then emitChar else emitChar, TXDCHAR <= lin_chk3
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 10111, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
87 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "10111" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0332@0058.  if false then emitChar else emitChar, TXDCHAR <= lin_chk2
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 10110, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
88 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "10110" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0333@0059.  if false then emitChar else emitChar, TXDCHAR <= lin_chk1
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 10101, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
89 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "10101" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0334@005A.  if false then emitChar else emitChar, TXDCHAR <= lin_chk0
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 10100, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
90 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "10100" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0335@005B.  if false then emitChar else emitChar, TXDCHAR <= char_space
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 00010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
91 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "00010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0337@005C.  if false then emitChar else emitChar, TXDCHAR <= char_F
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 00001, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
92 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "00001" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0338@005D.  if false then emitChar else emitChar, TXDCHAR <= char_EQU
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 01011, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
93 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "01011" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0339@005E.  if false then emitChar else emitChar, TXDCHAR <= flags
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 1100001 else 1100001, TXDCHAR <= 11110, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
94 => '1' & '1' & '1' & X"F" & "1100001" & "1100001" & "11110" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0340@005F.  if false then print_crlf else print_crlf
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0111011 else 0111011, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
95 => '1' & '1' & '1' & X"F" & "0111011" & "0111011" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0341@0060.  if true then return else return
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000010 else 0000010, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
96 => '1' & '1' & '1' & X"0" & "0000010" & "0000010" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0348@0061.emitChar:  if TXDREADY then next else repeat
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0100) then 0000000 else 0000001, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
97 => '1' & '1' & '1' & X"4" & "0000000" & "0000001" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0349@0062.  if TXDREADY then next else repeat
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0100) then 0000000 else 0000001, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
98 => '1' & '1' & '1' & X"4" & "0000000" & "0000001" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0350@0063.  if TXDREADY then next else repeat
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0100) then 0000000 else 0000001, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
99 => '1' & '1' & '1' & X"4" & "0000000" & "0000001" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0351@0064.  if TXDSEND then return else return
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0101) then 0000010 else 0000010, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
100 => '1' & '1' & '1' & X"5" & "0000010" & "0000010" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0354@0065.writemem:  nBUSREQ = 0
--  nBUSREQ = 0, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
101 => '0' & '1' & '1' & X"0" & "0000000" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0355@0066.  nBUSREQ = 0, if nBUSACK then repeat else next
--  nBUSREQ = 0, nWR = 1, BUSY = 1, if (0010) then 0000001 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
102 => '0' & '1' & '1' & X"2" & "0000001" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0356@0067.  nBUSREQ = 0, nWR = 0
--  nBUSREQ = 0, nWR = 0, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
103 => '0' & '0' & '1' & X"0" & "0000000" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- L0357@0068.  nBUSREQ = 0, nWR = 0, if nWAIT then return else repeat
--  nBUSREQ = 0, nWR = 0, BUSY = 1, if (0001) then 0000010 else 0000001, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 00, checksum <= 00, error <= 00, input_reset = 0, dummy = 00000;
104 => '0' & '0' & '1' & X"1" & "0000010" & "0000001" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000",

-- 31 location(s) in following ranges will be filled with default value
-- 0018 .. 001F
-- 0069 .. 007F

others => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & "00" & "00" & "00" & '0' & "00000"
);

end hex2mem_code;

