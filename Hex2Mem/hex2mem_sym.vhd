--------------------------------------------------------
-- mcc V1.0.0904 - Custom microcode compiler (c)2020-... 
--    https://github.com/zpekic/MicroCodeCompiler
--------------------------------------------------------
-- Auto-generated file, do not modify. To customize, create 'symbol_template.vhd' file in mcc.exe folder
-- Supported placeholders:  [NAME], [FIELDS], [SIZES], [TYPE], [SIGNAL], [INSTANCE], [MEMORY].
--------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--use IEEE.numeric_std.all;

package hex2mem_sym is

-- memory block size
constant SYMBOL_DATA_WIDTH: 	positive := 256;
constant SYMBOL_ADDRESS_WIDTH: 	positive := 7;
constant SYMBOL_ADDRESS_LAST: 	positive := 127;
constant SYMBOL_BYTE_LAST: 	positive := 31;
constant SYMBOL_BYTE_WIDTH: positive := 5;


type t_h2m_symbol_entry is array(0 to SYMBOL_ADDRESS_LAST) of std_logic_vector(SYMBOL_DATA_WIDTH -1 downto 0);
type t_h2m_symbol_byte is array(0 to(SYMBOL_ADDRESS_LAST + 1) * (SYMBOL_BYTE_LAST + 1) - 1) of std_logic_vector(7 downto 0);


signal h2m_symbol_byte: t_h2m_symbol_byte;
signal h2m_sym_d: std_logic_vector(7 downto 0);
signal h2m_sym_a: std_logic_vector(SYMBOL_ADDRESS_WIDTH + SYMBOL_BYTE_WIDTH - 1 downto 0);
----Start boilerplate code(use with utmost caution!)
-- h2m_sym_a <= -- TODO concatenate microinstruction address and character address
-- h2m_sym_d <= h2m_symbol_byte(to_integer(unsigned(h2m_sym_a)));
----End boilerplate code






constant h2m_symbol_entry: t_h2m_symbol_entry := (

-- L0197@0000._reset:  TXDCHAR <= zero, errcode <= ok, checksum <= zero, poscnt_a = zero, lincnt_a = zero, hexcnt <= ptr_colon;
-- _reset: TXDCHAR <= zero, errcode <= ok, checksum <= zero, poscnt_a = zero, lincnt_a = zero, hexcnt <= ptr_colon;
0 => X"5F_72_65_73_65_74_3A_20_54_58_44_43_48_41_52_20_3C_3D_20_7A_65_72_6F_2C_20_65_72_72_63_6F_64_65",

-- L0199@0001._reset1:  TXDCHAR <= zero, errcode <= ok, checksum <= zero, poscnt_a = zero, lincnt_a = zero, hexcnt <= ptr_colon;
-- _reset1: TXDCHAR <= zero, errcode <= ok, checksum <= zero, poscnt_a = zero, lincnt_a = zero, hexcnt <= ptr_colon;
1 => X"5F_72_65_73_65_74_31_3A_20_54_58_44_43_48_41_52_20_3C_3D_20_7A_65_72_6F_2C_20_65_72_72_63_6F_64",

-- L0201@0002._reset2:  TXDCHAR <= zero, errcode <= ok, checksum <= zero, poscnt_a = zero, lincnt_a = zero, hexcnt <= ptr_colon;
-- _reset2: TXDCHAR <= zero, errcode <= ok, checksum <= zero, poscnt_a = zero, lincnt_a = zero, hexcnt <= ptr_colon;
2 => X"5F_72_65_73_65_74_32_3A_20_54_58_44_43_48_41_52_20_3C_3D_20_7A_65_72_6F_2C_20_65_72_72_63_6F_64",

-- L0203@0003._reset3:  TXDCHAR <= zero, errcode <= ok, checksum <= zero, poscnt_a = zero, lincnt_a = zero, hexcnt <= ptr_colon;
-- _reset3: TXDCHAR <= zero, errcode <= ok, checksum <= zero, poscnt_a = zero, lincnt_a = zero, hexcnt <= ptr_colon;
3 => X"5F_72_65_73_65_74_33_3A_20_54_58_44_43_48_41_52_20_3C_3D_20_7A_65_72_6F_2C_20_65_72_72_63_6F_64",

-- L0207@0004.deadloop:  BUSY = 0, if input_is_zero then repeat else next;
-- deadloop: BUSY = 0, if input_is_zero then repeat else next;
4 => X"64_65_61_64_6C_6F_6F_70_3A_20_42_55_53_59_20_3D_20_30_2C_20_69_66_20_69_6E_70_75_74_5F_69_73_5F",

-- L0208@0005.  if false then trace else trace;
-- if false then trace else trace;
5 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_74_72_61_63_65_20_65_6C_73_65_20_74_72_61_63_65_3B_20",

-- L0209@0006.  poscnt_cin = 1, if true then fork else fork;
-- poscnt_cin = 1, if true then fork else fork;
6 => X"70_6F_73_63_6E_74_5F_63_69_6E_20_3D_20_31_2C_20_69_66_20_74_72_75_65_20_74_68_65_6E_20_66_6F_72",

-- L0212@0007.badchar:  errcode <= err_badchar, if TRACE_ERROR then printerror else nextchar;
-- badchar: errcode <= err_badchar, if TRACE_ERROR then printerror else nextchar;
7 => X"62_61_64_63_68_61_72_3A_20_65_72_72_63_6F_64_65_20_3C_3D_20_65_72_72_5F_62_61_64_63_68_61_72_2C",

-- L0213@0008.badcolon:  errcode <= err_unexpected, if TRACE_ERROR then printerror else nextchar;
-- badcolon: errcode <= err_unexpected, if TRACE_ERROR then printerror else nextchar;
8 => X"62_61_64_63_6F_6C_6F_6E_3A_20_65_72_72_63_6F_64_65_20_3C_3D_20_65_72_72_5F_75_6E_65_78_70_65_63",

-- L0214@0009.badchecksum:  errcode <= err_badchecksum, if TRACE_ERROR then printerror else nextchar;
-- badchecksum: errcode <= err_badchecksum, if TRACE_ERROR then printerror else nextchar;
9 => X"62_61_64_63_68_65_63_6B_73_75_6D_3A_20_65_72_72_63_6F_64_65_20_3C_3D_20_65_72_72_5F_62_61_64_63",

-- L0215@000A.badtype:  errcode <= err_badrecordtype, if TRACE_ERROR then printerror else nextchar;
-- badtype: errcode <= err_badrecordtype, if TRACE_ERROR then printerror else nextchar;
10 => X"62_61_64_74_79_70_65_3A_20_65_72_72_63_6F_64_65_20_3C_3D_20_65_72_72_5F_62_61_64_72_65_63_6F_72",

-- L0216@000B.badlength:  errcode <= err_badrecordlength,if TRACE_ERROR then printerror else nextchar;
-- badlength: errcode <= err_badrecordlength,if TRACE_ERROR then printerror else nextchar;
11 => X"62_61_64_6C_65_6E_67_74_68_3A_20_65_72_72_63_6F_64_65_20_3C_3D_20_65_72_72_5F_62_61_64_72_65_63",

-- L0217@000C.badhex:  errcode <= err_unexpected, if TRACE_ERROR then next else nextchar;
-- badhex: errcode <= err_unexpected, if TRACE_ERROR then next else nextchar;
12 => X"62_61_64_68_65_78_3A_20_65_72_72_63_6F_64_65_20_3C_3D_20_65_72_72_5F_75_6E_65_78_70_65_63_74_65",

-- L0218@000D.printerror:  if false then emitChar else emitChar, TXDCHAR <= char_E;
-- printerror: if false then emitChar else emitChar, TXDCHAR <= char_E;
13 => X"70_72_69_6E_74_65_72_72_6F_72_3A_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68",

-- L0219@000E.  if false then emitChar else emitChar, TXDCHAR <= char_R;
-- if false then emitChar else emitChar, TXDCHAR <= char_R;
14 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0220@000F.  if false then emitChar else emitChar, TXDCHAR <= char_R;
-- if false then emitChar else emitChar, TXDCHAR <= char_R;
15 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0221@0010.  if false then emitChar else emitChar, TXDCHAR <= errcode;
-- if false then emitChar else emitChar, TXDCHAR <= errcode;
16 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0222@0011.  if false then emitChar else emitChar, TXDCHAR <= char_space;
-- if false then emitChar else emitChar, TXDCHAR <= char_space;
17 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0223@0012.  if false then emitChar else emitChar, TXDCHAR <= lin_chk3;
-- if false then emitChar else emitChar, TXDCHAR <= lin_chk3;
18 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0224@0013.  if false then emitChar else emitChar, TXDCHAR <= lin_chk2;
-- if false then emitChar else emitChar, TXDCHAR <= lin_chk2;
19 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0225@0014.  if false then emitChar else emitChar, TXDCHAR <= lin_chk1;
-- if false then emitChar else emitChar, TXDCHAR <= lin_chk1;
20 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0226@0015.  if false then emitChar else emitChar, TXDCHAR <= lin_chk0;
-- if false then emitChar else emitChar, TXDCHAR <= lin_chk0;
21 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0227@0016.  if false then emitChar else emitChar, TXDCHAR <= char_space;
-- if false then emitChar else emitChar, TXDCHAR <= char_space;
22 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0228@0017.  if false then emitChar else emitChar, TXDCHAR <= pos_ram1;
-- if false then emitChar else emitChar, TXDCHAR <= pos_ram1;
23 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0229@0018.  if false then emitChar else emitChar, TXDCHAR <= pos_ram0;
-- if false then emitChar else emitChar, TXDCHAR <= pos_ram0;
24 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0230@0019.  if false then emitChar else emitChar, TXDCHAR <= char_space;
-- if false then emitChar else emitChar, TXDCHAR <= char_space;
25 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0231@001A.  if false then emitChar else emitChar, TXDCHAR <= inp1;
-- if false then emitChar else emitChar, TXDCHAR <= inp1;
26 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0232@001B.  hexcnt <= ptr_colon, if false then emitChar else emitChar, TXDCHAR <= inp0;
-- hexcnt <= ptr_colon, if false then emitChar else emitChar, TXDCHAR <= inp0;
27 => X"68_65_78_63_6E_74_20_3C_3D_20_70_74_72_5F_63_6F_6C_6F_6E_2C_20_69_66_20_66_61_6C_73_65_20_74_68",

-- L0233@001C.  if false then print_crlf else print_crlf;
-- if false then print_crlf else print_crlf;
28 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_70_72_69_6E_74_5F_63_72_6C_66_20_65_6C_73_65_20_70_72",

-- L0235@001D.nextchar:  errcode <= ok, input_reset = 1, if false then next else deadloop;
-- nextchar: errcode <= ok, input_reset = 1, if false then next else deadloop;
29 => X"6E_65_78_74_63_68_61_72_3A_20_65_72_72_63_6F_64_65_20_3C_3D_20_6F_6B_2C_20_69_6E_70_75_74_5F_72",

-- L0237@001E.emitChar:  if TXDREADY then next else repeat;
-- emitChar: if TXDREADY then next else repeat;
30 => X"65_6D_69_74_43_68_61_72_3A_20_69_66_20_54_58_44_52_45_41_44_59_20_74_68_65_6E_20_6E_65_78_74_20",

-- L0238@001F.  if TXDREADY then next else repeat;
-- if TXDREADY then next else repeat;
31 => X"69_66_20_54_58_44_52_45_41_44_59_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_72_65_70_65_61",

-- L0239@0020.  if TXDREADY then next else repeat;
-- if TXDREADY then next else repeat;
32 => X"69_66_20_54_58_44_52_45_41_44_59_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_72_65_70_65_61",

-- L0240@0021.  if TXDSEND then return else return;
-- if TXDSEND then return else return;
33 => X"69_66_20_54_58_44_53_45_4E_44_20_74_68_65_6E_20_72_65_74_75_72_6E_20_65_6C_73_65_20_72_65_74_75",

-- L0242@0022.printramR:  if false then emitChar else emitChar, TXDCHAR <= char_R;
-- printramR: if false then emitChar else emitChar, TXDCHAR <= char_R;
34 => X"70_72_69_6E_74_72_61_6D_52_3A_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61",

-- L0243@0023.printram:  if false then emitChar else emitChar, TXDCHAR <= char_EQU;
-- printram: if false then emitChar else emitChar, TXDCHAR <= char_EQU;
35 => X"70_72_69_6E_74_72_61_6D_3A_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72",

-- L0244@0024.  if false then emitChar else emitChar, TXDCHAR <= pos_ram1;
-- if false then emitChar else emitChar, TXDCHAR <= pos_ram1;
36 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0245@0025.  if false then emitChar else emitChar, TXDCHAR <= pos_ram0;
-- if false then emitChar else emitChar, TXDCHAR <= pos_ram0;
37 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0246@0026.print_crlf:  if false then emitChar else emitChar, TXDCHAR <= char_cr;
-- print_crlf: if false then emitChar else emitChar, TXDCHAR <= char_cr;
38 => X"70_72_69_6E_74_5F_63_72_6C_66_3A_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68",

-- L0247@0027.  if false then emitChar else emitChar, TXDCHAR <= char_lf;
-- if false then emitChar else emitChar, TXDCHAR <= char_lf;
39 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0248@0028.  if true then return else return;
-- if true then return else return;
40 => X"69_66_20_74_72_75_65_20_74_68_65_6E_20_72_65_74_75_72_6E_20_65_6C_73_65_20_72_65_74_75_72_6E_3B",

-- L0250@0029.printaddr:  if false then emitChar else emitChar, TXDCHAR <= addr3;
-- printaddr: if false then emitChar else emitChar, TXDCHAR <= addr3;
41 => X"70_72_69_6E_74_61_64_64_72_3A_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61",

-- L0251@002A.  if false then emitChar else emitChar, TXDCHAR <= addr2;
-- if false then emitChar else emitChar, TXDCHAR <= addr2;
42 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0252@002B.  if false then emitChar else emitChar, TXDCHAR <= addr1;
-- if false then emitChar else emitChar, TXDCHAR <= addr1;
43 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0253@002C.  if false then emitChar else emitChar, TXDCHAR <= addr0;
-- if false then emitChar else emitChar, TXDCHAR <= addr0;
44 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0254@002D.  if true then return else return;
-- if true then return else return;
45 => X"69_66_20_74_72_75_65_20_74_68_65_6E_20_72_65_74_75_72_6E_20_65_6C_73_65_20_72_65_74_75_72_6E_3B",

46 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

47 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0259@0030.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
48 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0263@0031.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
49 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0267@0032.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
50 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0271@0033.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
51 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0275@0034.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
52 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0279@0035.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
53 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0283@0036.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
54 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0287@0037.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
55 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0291@0038.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
56 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0295@0039.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
57 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0300@003A.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
58 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0305@003B.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
59 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0310@003C.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
60 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0315@003D.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
61 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0320@003E.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
62 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0325@003F.  ram_write = 1, ram_addr = bytecnt;
-- ram_write = 1, ram_addr = bytecnt;
63 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0326@0040.hexchar:  if bytecnt_at_colon then badhex;
-- hexchar: if bytecnt_at_colon then badhex;
64 => X"68_65_78_63_68_61_72_3A_20_69_66_20_62_79_74_65_63_6E_74_5F_61_74_5F_63_6F_6C_6F_6E_20_74_68_65",

-- L0327@0041.  if hexcnt_is_odd then next else dontadd;
-- if hexcnt_is_odd then next else dontadd;
65 => X"69_66_20_68_65_78_63_6E_74_5F_69_73_5F_6F_64_64_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20",

-- L0328@0042.  ram_addr = bytecnt, checksum <= add_ram;
-- ram_addr = bytecnt, checksum <= add_ram;
66 => X"72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E_74_2C_20_63_68_65_63_6B_73_75_6D_20_3C_3D_20",

-- L0329@0043.dontadd:  hexcnt <= inc, if false then next else nextchar;
-- dontadd: hexcnt <= inc, if false then next else nextchar;
67 => X"64_6F_6E_74_61_64_64_3A_20_68_65_78_63_6E_74_20_3C_3D_20_69_6E_63_2C_20_69_66_20_66_61_6C_73_65",

-- L0332@0044.  if prev_is_crorlf then nextchar else newline;
-- if prev_is_crorlf then nextchar else newline;
68 => X"69_66_20_70_72_65_76_5F_69_73_5F_63_72_6F_72_6C_66_20_74_68_65_6E_20_6E_65_78_74_63_68_61_72_20",

-- L0335@0045.  if prev_is_crorlf then nextchar else next;
-- if prev_is_crorlf then nextchar else next;
69 => X"69_66_20_70_72_65_76_5F_69_73_5F_63_72_6F_72_6C_66_20_74_68_65_6E_20_6E_65_78_74_63_68_61_72_20",

-- L0336@0046.newline:  compa = checksum_lsb, compb = zero, if compa_equals_compb then next else badchecksum;
-- newline: compa = checksum_lsb, compb = zero, if compa_equals_compb then next else badchecksum;
70 => X"6E_65_77_6C_69_6E_65_3A_20_63_6F_6D_70_61_20_3D_20_63_68_65_63_6B_73_75_6D_5F_6C_73_62_2C_20_63",

-- L0337@0047.  poscnt_a = zero, lincnt_cin = 1, if hexcnt_is_odd then badhex else next;
-- poscnt_a = zero, lincnt_cin = 1, if hexcnt_is_odd then badhex else next;
71 => X"70_6F_73_63_6E_74_5F_61_20_3D_20_7A_65_72_6F_2C_20_6C_69_6E_63_6E_74_5F_63_69_6E_20_3D_20_31_2C",

-- L0338@0048.  ram_addr = ptr_type, compa = ram, compb = one, if compa_equals_compb then lastrec;
-- ram_addr = ptr_type, compa = ram, compb = one, if compa_equals_compb then lastrec;
72 => X"72_61_6D_5F_61_64_64_72_20_3D_20_70_74_72_5F_74_79_70_65_2C_20_63_6F_6D_70_61_20_3D_20_72_61_6D",

-- L0339@0049.  ram_addr = ptr_type, compa = ram, compb = zero, if compa_equals_compb then next else badtype;
-- ram_addr = ptr_type, compa = ram, compb = zero, if compa_equals_compb then next else badtype;
73 => X"72_61_6D_5F_61_64_64_72_20_3D_20_70_74_72_5F_74_79_70_65_2C_20_63_6F_6D_70_61_20_3D_20_72_61_6D",

-- L0340@004A.  ram_addr = ptr_len, compa = ram, compb = bytecnt_dec, if compa_equals_compb then next else badlength;
-- ram_addr = ptr_len, compa = ram, compb = bytecnt_dec, if compa_equals_compb then next else badlength;
74 => X"72_61_6D_5F_61_64_64_72_20_3D_20_70_74_72_5F_6C_65_6E_2C_20_63_6F_6D_70_61_20_3D_20_72_61_6D_2C",

-- L0342@004B.  ram_addr = ptr_addr_hi, address <= shift8ram, hexcnt <= zero;
-- ram_addr = ptr_addr_hi, address <= shift8ram, hexcnt <= zero;
75 => X"72_61_6D_5F_61_64_64_72_20_3D_20_70_74_72_5F_61_64_64_72_5F_68_69_2C_20_61_64_64_72_65_73_73_20",

-- L0343@004C.  ram_addr = ptr_addr_lo, address <= shift8ram, hexcnt <= zero;
-- ram_addr = ptr_addr_lo, address <= shift8ram, hexcnt <= zero;
76 => X"72_61_6D_5F_61_64_64_72_20_3D_20_70_74_72_5F_61_64_64_72_5F_6C_6F_2C_20_61_64_64_72_65_73_73_20",

-- L0345@004D.writeloop:  ram_addr = ptr_len, compa = ram, compb = bytecnt, if compa_equals_compb then nextrec;
-- writeloop: ram_addr = ptr_len, compa = ram, compb = bytecnt, if compa_equals_compb then nextrec;
77 => X"77_72_69_74_65_6C_6F_6F_70_3A_20_72_61_6D_5F_61_64_64_72_20_3D_20_70_74_72_5F_6C_65_6E_2C_20_63",

-- L0347@004E.writemem:  ram_addr = bytecnt, nBUSREQ = 0;
-- writemem: ram_addr = bytecnt, nBUSREQ = 0;
78 => X"77_72_69_74_65_6D_65_6D_3A_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E_74_2C_20_6E_42",

-- L0348@004F.  ram_addr = bytecnt, nBUSREQ = 0, if nBUSACK then repeat else next;
-- ram_addr = bytecnt, nBUSREQ = 0, if nBUSACK then repeat else next;
79 => X"72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E_74_2C_20_6E_42_55_53_52_45_51_20_3D_20_30_2C",

-- L0349@0050.  ram_addr = bytecnt, nBUSREQ = 0, nWR = 0;
-- ram_addr = bytecnt, nBUSREQ = 0, nWR = 0;
80 => X"72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E_74_2C_20_6E_42_55_53_52_45_51_20_3D_20_30_2C",

-- L0350@0051.  ram_addr = bytecnt, nBUSREQ = 0, nWR = 0, if nWAIT then next else repeat;
-- ram_addr = bytecnt, nBUSREQ = 0, nWR = 0, if nWAIT then next else repeat;
81 => X"72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E_74_2C_20_6E_42_55_53_52_45_51_20_3D_20_30_2C",

-- L0352@0052.  if TRACE_WRITE then next else nextaddr;
-- if TRACE_WRITE then next else nextaddr;
82 => X"69_66_20_54_52_41_43_45_5F_57_52_49_54_45_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_6E_65",

-- L0353@0053.  if false then emitChar else emitChar, TXDCHAR <= char_A;
-- if false then emitChar else emitChar, TXDCHAR <= char_A;
83 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0354@0054.  if false then emitChar else emitChar, TXDCHAR <= char_open;
-- if false then emitChar else emitChar, TXDCHAR <= char_open;
84 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0355@0055.  if false then printaddr else printaddr;
-- if false then printaddr else printaddr;
85 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_70_72_69_6E_74_61_64_64_72_20_65_6C_73_65_20_70_72_69",

-- L0356@0056.  if false then emitChar else emitChar, TXDCHAR <= char_close;
-- if false then emitChar else emitChar, TXDCHAR <= char_close;
86 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0357@0057.  if false then printram else printram;
-- if false then printram else printram;
87 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_70_72_69_6E_74_72_61_6D_20_65_6C_73_65_20_70_72_69_6E",

-- L0359@0058.nextaddr:  hexcnt <= inc;
-- nextaddr: hexcnt <= inc;
88 => X"6E_65_78_74_61_64_64_72_3A_20_68_65_78_63_6E_74_20_3C_3D_20_69_6E_63_3B_20_20_20_20_20_20_20_20",

-- L0360@0059.  hexcnt <= inc, address <= inc, if false then next else writeloop;
-- hexcnt <= inc, address <= inc, if false then next else writeloop;
89 => X"68_65_78_63_6E_74_20_3C_3D_20_69_6E_63_2C_20_61_64_64_72_65_73_73_20_3C_3D_20_69_6E_63_2C_20_69",

-- L0362@005A.lastrec:  lincnt_a = zero, if resetout_done then next else next;
-- lastrec: lincnt_a = zero, if resetout_done then next else next;
90 => X"6C_61_73_74_72_65_63_3A_20_6C_69_6E_63_6E_74_5F_61_20_3D_20_7A_65_72_6F_2C_20_69_66_20_72_65_73",

-- L0363@005B.  ram_addr = ptr_len, compa = ram, compb = zero, if compa_equals_compb then next else badlength;
-- ram_addr = ptr_len, compa = ram, compb = zero, if compa_equals_compb then next else badlength;
91 => X"72_61_6D_5F_61_64_64_72_20_3D_20_70_74_72_5F_6C_65_6E_2C_20_63_6F_6D_70_61_20_3D_20_72_61_6D_2C",

-- L0364@005C.nextrec:  hexcnt <= ptr_colon, if false then next else nextchar;
-- nextrec: hexcnt <= ptr_colon, if false then next else nextchar;
92 => X"6E_65_78_74_72_65_63_3A_20_68_65_78_63_6E_74_20_3C_3D_20_70_74_72_5F_63_6F_6C_6F_6E_2C_20_69_66",

-- L0366@005D.dumpram:  if false then emitChar else emitChar, TXDCHAR <= char_R;
-- dumpram: if false then emitChar else emitChar, TXDCHAR <= char_R;
93 => X"64_75_6D_70_72_61_6D_3A_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20",

-- L0367@005E.  if false then emitChar else emitChar, TXDCHAR <= bytecnt1;
-- if false then emitChar else emitChar, TXDCHAR <= bytecnt1;
94 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0368@005F.  if false then emitChar else emitChar, TXDCHAR <= bytecnt0;
-- if false then emitChar else emitChar, TXDCHAR <= bytecnt0;
95 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0369@0060.  if false then printram else printram;
-- if false then printram else printram;
96 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_70_72_69_6E_74_72_61_6D_20_65_6C_73_65_20_70_72_69_6E",

-- L0370@0061.  if true then return else return;
-- if true then return else return;
97 => X"69_66_20_74_72_75_65_20_74_68_65_6E_20_72_65_74_75_72_6E_20_65_6C_73_65_20_72_65_74_75_72_6E_3B",

-- L0374@0062.space:  if prev_is_spaceortab then nextchar else next;
-- space: if prev_is_spaceortab then nextchar else next;
98 => X"73_70_61_63_65_3A_20_69_66_20_70_72_65_76_5F_69_73_5F_73_70_61_63_65_6F_72_74_61_62_20_74_68_65",

-- L0375@0063.  if hexcnt_is_odd then badchar else nextchar;
-- if hexcnt_is_odd then badchar else nextchar;
99 => X"69_66_20_68_65_78_63_6E_74_5F_69_73_5F_6F_64_64_20_74_68_65_6E_20_62_61_64_63_68_61_72_20_65_6C",

-- L0378@0064.colon:  checksum <= zero, if bytecnt_at_colon then next else badcolon;
-- colon: checksum <= zero, if bytecnt_at_colon then next else badcolon;
100 => X"63_6F_6C_6F_6E_3A_20_63_68_65_63_6B_73_75_6D_20_3C_3D_20_7A_65_72_6F_2C_20_69_66_20_62_79_74_65",

-- L0379@0065.  hexcnt <= inc;
-- hexcnt <= inc;
101 => X"68_65_78_63_6E_74_20_3C_3D_20_69_6E_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0380@0066.  hexcnt <= inc, if false then next else nextchar;
-- hexcnt <= inc, if false then next else nextchar;
102 => X"68_65_78_63_6E_74_20_3C_3D_20_69_6E_63_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78",

-- L0382@0067.trace:  if TRACE_CHAR then next else return;
-- trace: if TRACE_CHAR then next else return;
103 => X"74_72_61_63_65_3A_20_69_66_20_54_52_41_43_45_5F_43_48_41_52_20_74_68_65_6E_20_6E_65_78_74_20_65",

-- L0384@0068.  if false then emitChar else emitChar, TXDCHAR <= char_I;
-- if false then emitChar else emitChar, TXDCHAR <= char_I;
104 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0385@0069.  if false then emitChar else emitChar, TXDCHAR <= char_EQU;
-- if false then emitChar else emitChar, TXDCHAR <= char_EQU;
105 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0386@006A.  if false then emitChar else emitChar, TXDCHAR <= inp1;
-- if false then emitChar else emitChar, TXDCHAR <= inp1;
106 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0387@006B.  if false then emitChar else emitChar, TXDCHAR <= inp0;
-- if false then emitChar else emitChar, TXDCHAR <= inp0;
107 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0388@006C.  if false then emitChar else emitChar, TXDCHAR <= char_space;
-- if false then emitChar else emitChar, TXDCHAR <= char_space;
108 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0390@006D.  if false then emitChar else emitChar, TXDCHAR <= char_A;
-- if false then emitChar else emitChar, TXDCHAR <= char_A;
109 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0391@006E.  if false then emitChar else emitChar, TXDCHAR <= char_EQU;
-- if false then emitChar else emitChar, TXDCHAR <= char_EQU;
110 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0392@006F.  if false then printaddr else printaddr;
-- if false then printaddr else printaddr;
111 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_70_72_69_6E_74_61_64_64_72_20_65_6C_73_65_20_70_72_69",

-- L0393@0070.  if false then emitChar else emitChar, TXDCHAR <= char_space;
-- if false then emitChar else emitChar, TXDCHAR <= char_space;
112 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0395@0071.  if false then emitChar else emitChar, TXDCHAR <= char_C;
-- if false then emitChar else emitChar, TXDCHAR <= char_C;
113 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0396@0072.  if false then emitChar else emitChar, TXDCHAR <= char_EQU;
-- if false then emitChar else emitChar, TXDCHAR <= char_EQU;
114 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0397@0073.  if false then emitChar else emitChar, TXDCHAR <= lin_chk3;
-- if false then emitChar else emitChar, TXDCHAR <= lin_chk3;
115 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0398@0074.  if false then emitChar else emitChar, TXDCHAR <= lin_chk2;
-- if false then emitChar else emitChar, TXDCHAR <= lin_chk2;
116 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0399@0075.  if false then emitChar else emitChar, TXDCHAR <= lin_chk1;
-- if false then emitChar else emitChar, TXDCHAR <= lin_chk1;
117 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0400@0076.  if false then emitChar else emitChar, TXDCHAR <= lin_chk0;
-- if false then emitChar else emitChar, TXDCHAR <= lin_chk0;
118 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0401@0077.  if false then emitChar else emitChar, TXDCHAR <= char_space;
-- if false then emitChar else emitChar, TXDCHAR <= char_space;
119 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0408@0078.  if false then emitChar else emitChar, TXDCHAR <= char_B;
-- if false then emitChar else emitChar, TXDCHAR <= char_B;
120 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0409@0079.  if false then emitChar else emitChar, TXDCHAR <= char_EQU;
-- if false then emitChar else emitChar, TXDCHAR <= char_EQU;
121 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0410@007A.  if false then emitChar else emitChar, TXDCHAR <= bytecnt1;
-- if false then emitChar else emitChar, TXDCHAR <= bytecnt1;
122 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0411@007B.  if false then emitChar else emitChar, TXDCHAR <= bytecnt0;
-- if false then emitChar else emitChar, TXDCHAR <= bytecnt0;
123 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0412@007C.  if false then emitChar else emitChar, TXDCHAR <= char_space;
-- if false then emitChar else emitChar, TXDCHAR <= char_space;
124 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_65_6D_69_74_43_68_61_72_20_65_6C_73_65_20_65_6D_69_74",

-- L0414@007D.  if false then next else printramR;
-- if false then next else printramR;
125 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_70_72_69_6E_74_72_61_6D",

126 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

127 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20");

end hex2mem_sym;

