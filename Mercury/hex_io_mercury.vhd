----------------------------------------------------------------------------------
-- Company: @Home
-- Engineer: zpekic@hotmail.com
-- 
-- Create Date: 07/17/2021 21:23:02 PM
-- Design Name: Hex_IO
-- Module Name: hex_io_mercury - Behavioral
-- Project Name: 
-- Target Devices: https://www.micro-nova.com/mercury/ + Baseboard
-- Input devices: 
--
-- Tool Versions: ISE 14.7 (nt)
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.99 - Kinda works...
-- Additional Comments:
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;
--use work.tms0800_package.all;

entity hex_io_mercury is
    Port ( 
				-- 50MHz on the Mercury board
				CLK: in std_logic;
				
				-- 12MHz external clock
				EXT_CLK: in std_logic;
				
				-- Master reset button on Mercury board
				USR_BTN: in std_logic; 

				-- Switches on baseboard
				-- SW(0) -- direction when scrolling
				-- SW(1) -- data source selection for 7seg display
				-- SW(2) -- palette selection (best on)
				-- SW(3) -- palette selection (best off)
				-- SW(4) -- off
				-- SW(5) -- on
				-- SW(6) -- off
				-- SW(7)	-- off

				SW: in std_logic_vector(7 downto 0); 

				-- Push buttons on baseboard
				-- BTN0 - scroll
				-- BTN1 - video only test pattern (memory not affected)
				-- BTN2 - fill left/right
				-- BTN3 - fill top/down
				BTN: in std_logic_vector(3 downto 0); 

				-- Stereo audio output on baseboard
				--AUDIO_OUT_L, AUDIO_OUT_R: out std_logic;

				-- 7seg LED on baseboard 
				A_TO_G: out std_logic_vector(6 downto 0); 
				AN: out std_logic_vector(3 downto 0); 
				DOT: out std_logic; 
				-- 4 LEDs on Mercury board (3 and 2 are used by VGA VSYNC and HSYNC)
				LED: inout std_logic_vector(1 downto 0);

				-- ADC interface
				-- channel	input
				-- 0			Audio Left
				-- 1 			Audio Right
				-- 2			Temperature
				-- 3			Light	
				-- 4			Pot
				-- 5			Channel 5 (free)
				-- 6			Channel 6 (free)
				-- 7			Channel 7 (free)
				--ADC_MISO: in std_logic;
				--ADC_MOSI: out std_logic;
				--ADC_SCK: out std_logic;
				--ADC_CSN: out std_logic;
				--PS2_DATA: inout std_logic;
				--PS2_CLOCK: inout std_logic;

				--VGA interface
				--register state is traced to VGA after each instruction if SW0 = on
				--640*480 50Hz mode is used, which give 80*60 character display
				--but to save memory, only 80*50 are used which fits into 4k video RAM
				HSYNC: out std_logic;
				VSYNC: out std_logic;
				RED: out std_logic_vector(2 downto 0);
				GRN: out std_logic_vector(2 downto 0);
				BLU: out std_logic_vector(1 downto 0);
				
				--PMOD interface
				--connection to https://store.digilentinc.com/pmod-kypd-16-button-keypad/
				PMOD: inout std_logic_vector(7 downto 0)
				--PMOD(7 downto 6): in std_logic_vector(1 downto 0);
				--PMOD(5 downto 4): out std_logic_vector(1 downto 0);
				--PMOD(3 downto 0): in std_logic_vector(3 downto 0)
          );
end hex_io_mercury;

architecture Structural of hex_io_mercury is

-- key HEX_IO components 
COMPONENT ram32k8_dualport
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    clkb : IN STD_LOGIC;
    addrb : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;

component mem2hex is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  --
   		  debug: out STD_LOGIC_VECTOR(23 downto 0);
			  --
           nRD : out  STD_LOGIC;
           nBUSREQ : out STD_LOGIC;
           nBUSACK : in STD_LOGIC;
           nWAIT : in  STD_LOGIC;
           ABUS : out  STD_LOGIC_VECTOR (15 downto 0);
           DBUS : in  STD_LOGIC_VECTOR (7 downto 0);
           START : in  STD_LOGIC;
			  BUSY : out STD_LOGIC;
           PAGE : in  STD_LOGIC_VECTOR (7 downto 0);
           COUNTSEL : in  STD_LOGIC;
           TXDREADY : in  STD_LOGIC;
			  TXDSEND: out STD_LOGIC;
           CHAR : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component uart_par2ser is
    Port ( reset : in  STD_LOGIC;
			  txd_clk: in STD_LOGIC;
			  send: in STD_LOGIC;
			  mode: in STD_LOGIC_VECTOR(2 downto 0);
			  data: in STD_LOGIC_VECTOR(7 downto 0);
           ready : buffer STD_LOGIC;
           txd : out  STD_LOGIC);
end component;

component uart_ser2par is
    Port ( reset : in  STD_LOGIC;
           rxd_clk : in  STD_LOGIC;
           mode : in  STD_LOGIC_VECTOR (2 downto 0);
           char : out  STD_LOGIC_VECTOR (7 downto 0);
           ready : buffer  STD_LOGIC;
           valid : out  STD_LOGIC;
           rxd : in  STD_LOGIC);
end component;

-- Misc components
component sn74hc4040 is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR(11 downto 0));
end component;

component fourdigitsevensegled is
    Port ( -- inputs
			  hexdata : in  STD_LOGIC_VECTOR (3 downto 0);
           digsel : in  STD_LOGIC_VECTOR (1 downto 0);
           showdigit : in  STD_LOGIC_VECTOR (3 downto 0);
           showdot : in  STD_LOGIC_VECTOR (3 downto 0);
			  -- outputs
           anode : out  STD_LOGIC_VECTOR (3 downto 0);
           segment : out  STD_LOGIC_VECTOR (7 downto 0)
			 );
end component;

component freqcounter is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           freq : in  STD_LOGIC;
           bcd : in  STD_LOGIC;
			  add: in STD_LOGIC_VECTOR(15 downto 0);
			  cin: in STD_LOGIC;
			  cout: out STD_LOGIC;
           value : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component vga_controller is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  mode_tms: in STD_LOGIC;
			  offsetclk: in STD_LOGIC;
			  offsetcmd: in STD_LOGIC_VECTOR(3 downto 0);
           hsync : out  STD_LOGIC;
           vsync : out  STD_LOGIC;
			  h_valid: buffer STD_LOGIC;
			  v_valid: buffer STD_LOGIC;
			  h : buffer STD_LOGIC_VECTOR(9 downto 0);
			  v : buffer STD_LOGIC_VECTOR(9 downto 0);
			  x_valid: out STD_LOGIC;
			  y_valid: buffer STD_LOGIC;
           x : out  STD_LOGIC_VECTOR (8 downto 0);
           y : out  STD_LOGIC_VECTOR (8 downto 0));
end component;

component chargen_rom is
    Port ( a : in  STD_LOGIC_VECTOR (10 downto 0);
           d : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component debouncer8channel is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           signal_raw : in STD_LOGIC_VECTOR (7 downto 0);
           signal_debounced : out STD_LOGIC_VECTOR (7 downto 0));
end component;

constant color_transparent:				std_logic_vector(7 downto 0):= "00000000";
constant color_medgreen: 					std_logic_vector(7 downto 0):= "00010000";
constant color_dkgreen:						std_logic_vector(7 downto 0):= "00001000";
constant color_dkblue:						std_logic_vector(7 downto 0):= "00000010";
constant color_medred:						std_logic_vector(7 downto 0):= "01100000";
constant color_dkred:						std_logic_vector(7 downto 0):= "01000000";
constant color_ltcyan:						std_logic_vector(7 downto 0):= "00001110";
constant color_dkyellow:					std_logic_vector(7 downto 0):= "10010000";
constant color_magenta:						std_logic_vector(7 downto 0):= "01100010";

constant color_black:						std_logic_vector(7 downto 0):= "00000000";
constant color_blue,		color_ltblue:	std_logic_vector(7 downto 0):= "00000011";
constant color_green,	color_ltgreen:	std_logic_vector(7 downto 0):= "00011100";
constant color_cyan:							std_logic_vector(7 downto 0):= "00011111";
constant color_red,		color_ltred:	std_logic_vector(7 downto 0):= "11100000";
constant color_purple:						std_logic_vector(7 downto 0):= "11100011";
constant color_yellow,	color_ltyellow:std_logic_vector(7 downto 0):= "11111100";
constant color_white:						std_logic_vector(7 downto 0):= "11111111";
constant color_ltgray:						std_logic_vector(7 downto 0):= "01101110"; 
constant color_dkgray,  color_gray:		std_logic_vector(7 downto 0):= "10010010";

type color_lookup is array (0 to 15) of std_logic_vector(7 downto 0);

-- standard TMS9918 16-color palette (http://www.cs.columbia.edu/~sedwards/papers/TMS9918.pdf page 26) 
signal video_color: color_lookup := (
	color_transparent,	-- VGA does not support is, so "black"
	color_black,
	color_medgreen,	
	color_ltgreen,
	
	color_dkblue,
	color_ltblue,	
	color_dkred,	
	color_cyan,	

	color_medred,
	color_ltred,
	color_dkyellow,
	color_ltyellow,

	color_dkgreen,
	color_magenta,
	color_gray,
	color_white
	);

type prescale_lookup is array (0 to 7) of integer range 0 to 65535;
signal prescale_value: prescale_lookup := (
		(50000000 / (16 * 300)),
		(50000000 / (16 * 600)),
		(50000000 / (16 * 1200)),
		(50000000 / (16 * 2400)),
		(50000000 / (16 * 4800)),
		(50000000 / (16 * 9600)),
		(50000000 / (16 * 19200)),
		(50000000 / (16 * 38400))
	);
	
signal RESET: std_logic;

-- Connect to PmodUSBUART 
alias PMOD_RTS: std_logic is PMOD(4);
alias PMOD_RXD: std_logic is PMOD(5);
alias PMOD_TXD: std_logic is PMOD(6);
alias PMOD_CTS: std_logic is PMOD(7);

-- debug
signal hexdata, showdigit: std_logic_vector(3 downto 0);
signal charpat: std_logic_vector(7 downto 0);
signal display, sum: std_logic_vector(15 downto 0);
signal cin: std_logic;
---

--- frequency signals
signal freq96M: std_logic;
signal freq: std_logic_vector(11 downto 0);
alias byte_clk: std_logic is freq(4); -- 3MHz
alias debounce_clk: std_logic is freq(9);
alias digsel: std_logic_vector(1 downto 0) is freq(11 downto 10);
signal prescale_baud, prescale_power: integer range 0 to 65535;
signal freq4096, freq1, freq2, freq4, freq25M: std_logic;		

--- video sync signals
signal x_valid, y_valid: std_logic;
signal h_valid, v_valid : std_logic;
signal tim_window, vga_window, vga_hsync, vga_vsync, vga_sel, h_sync, v_sync: std_logic;
signal vga_x: std_logic_vector(8 downto 0); -- 512 pixels horizontally
signal vga_y: std_logic_vector(8 downto 0); -- 512 pixels vertically (either 256 or 384 are used)
signal vga_a: std_logic_vector(14 downto 0);
signal h, v: std_logic_vector(9 downto 0);
alias col: std_logic_vector(6 downto 0) is h(9 downto 3);
alias row: std_logic_vector(6 downto 0) is v(9 downto 3);
-- video data signals
signal vga_color, text_color: std_logic_vector(7 downto 0);
signal pair, color_sel: std_logic_vector(1 downto 0); -- 2 bit pixel and color lookup
signal char, pattern: std_logic_vector(7 downto 0);
signal text_pix: std_logic;

-- video memory bus
signal vram_dina, vram_douta: std_logic_vector(7 downto 0);
signal vdp_vram_dina, tim_vram_dina: std_logic_vector(7 downto 0);
signal vram_addra, vram_addrb: std_logic_vector(14 downto 0);
signal vram_wea: std_logic_vector(0 downto 0);

---
signal switch, button: std_logic_vector(7 downto 0);
alias switch_bcd: std_logic is switch(0);
alias switch_timpalette: std_logic is switch(0);
alias switch_tms: std_logic is switch(1);
alias switch_hexclk: std_logic_vector(2 downto 0) is switch(4 downto 2);
alias switch_baudrate: std_logic_vector(2 downto 0) is switch(7 downto 5);
signal offset_cmd: std_logic_vector(3 downto 0);
signal color_index, nibble: std_logic_vector(3 downto 0);

-- HEX common 
signal baudrate_x1, baudrate_x2, baudrate_x4, baudrate_x8: std_logic;
signal hex_clk: std_logic;

-- HEX output path
signal hexout_send, hexout_ready, hexout_nrd, hexout_nbusreq, hexout_nbusack: std_logic;
signal hexout_char: std_logic_vector(7 downto 0);
signal hexout_a: std_logic_vector(15 downto 0);

-- HEX input path
signal hexin_ready: std_logic;
signal hexin_char: std_logic_vector(7 downto 0);

begin
PMOD(0) <= v_sync;
PMOD(1) <= baudrate_x1;   
PMOD(2) <= baudrate_x2;   
PMOD(3) <= baudrate_x4;   
	
RESET <= USR_BTN;
freq96M <= EXT_CLK;
	
clockgen: sn74hc4040 port map (
			clock => freq96M,	-- 96MHz "half-size" crystal on Mercury baseboard
			reset => RESET,
			q => freq 
		);
		
prescale: process(CLK, baudrate_x8, freq4096, switch_baudrate)
begin
	if (rising_edge(CLK)) then
		freq25M <= not freq25M;	-- used for VGA 640*480
		if (prescale_baud = 0) then
			baudrate_x8 <= not baudrate_x8;
			prescale_baud <= prescale_value(to_integer(unsigned(switch_baudrate)));
		else
			prescale_baud <= prescale_baud - 1;
		end if;
		if (prescale_power = 0) then
			freq4096 <= not freq4096;
			prescale_power <= (50000000 / (2 * 4096));
		else
			prescale_power <= prescale_power - 1;
		end if;
	end if;
end process;

powergen: sn74hc4040 port map (
			clock => freq4096,
			reset => RESET,
			q(8 downto 0) => open, 
			q(9) => freq4,	
			q(10) => freq2,	
			q(11) => freq1	
		);
--	
	debounce_sw: debouncer8channel Port map ( 
		clock => debounce_clk, 
		reset => RESET,
		signal_raw => SW,
		signal_debounced => switch
	);

	debounce_btn: debouncer8channel Port map ( 
		clock => debounce_clk, 
		reset => RESET,
		signal_raw(7 downto 4) => "0000",
		signal_raw(3 downto 0) => BTN,
		signal_debounced => button
	);
	
offset_cmd <= button(3 downto 0);-- when (switch_tms = '1') else "0000";
vga: vga_controller Port map ( 
		reset => RESET,
      clk => freq25M,
		mode_tms => switch_tms,
		offsetclk => freq4, 
		offsetcmd => offset_cmd, 
      hsync => h_sync,
      vsync => v_sync,
		h_valid => h_valid,
		v_valid => v_valid,
		h => h,
		v => v,
		x_valid => x_valid,
		y_valid => y_valid,
      x => vga_x,
      y => vga_y
	);

HSYNC <= h_sync;
VSYNC <= v_sync;

vram: ram32k8_dualport PORT MAP(
		-- sampler only writes
    clka => byte_clk,
    ena => '1',
    wea => vram_wea,
    addra => vram_addra,
    dina => vram_dina,
		-- vga only reads
    clkb => CLK,
    addrb => vram_addrb,
    doutb => vram_douta
  );

-- HEX out processor has read access if it managed to grab bus during high VSYNC
vram_addrb <= hexout_a(14 downto 0) when (hexout_nrd = '0') else vga_a; 

tim_window <= x_valid and y_valid;
vga_window <= v_valid and h_valid;

vga_a <= vga_y(8 downto 1) & vga_x(8 downto 2) when (switch_tms = '1') else vga_y(7 downto 0) & vga_x(8 downto 2); 
-- TODO: modify VGA controller to expand y from 256 to 384 (2*192) pixels
vram_wea <= (others => '1'); --sampler_wr_nrd);

--we_in <= switch(0) when (tim_window = '0') else '0';

-- TIM sample: pixels are stored 11003322
-- see https://github.com/zpekic/Sys_TIM-011/blob/master/Img2Tim/Img2Tim/Program.cs
with vga_x(1 downto 0) select pair <=
	vram_douta(5 downto 4) when "00",
	vram_douta(7 downto 6) when "01",
	vram_douta(1 downto 0) when "10",
	vram_douta(3 downto 2) when others;

-- V9958 sample: pixels are stored XRGBXRGB
-- high nibble contains higher x-coordinate pixel (as sampler shifts MSB <- LSB)
with vga_x(1) select nibble <=  
	vram_douta(3 downto 0) when '1',
	vram_douta(7 downto 4) when others;

-- index depends on the V9958 or TIM mode
--color_index <= '1' & nibble(2 downto 0) when (switch_tms = '1') else '0' & switch_timpalette & pair;	
color_index <= nibble when (switch_tms = '1') else '1' & switch_timpalette & pair;	

-- color index also takes into account selected palette and if in TIM window
color_sel <= vga_window & tim_window; 
with color_sel select vga_color <=
	color_white when "00",													-- should never show
	text_color when "10",													-- text outside tim window
	video_color(to_integer(unsigned(color_index))) when "11",	-- tim or vdp pixel 
	color_black when others;												-- outside pixel area (border)
	
-- now convert to VGA 8-bit color
RED <= vga_color(7 downto 5);
GRN <= vga_color(4 downto 2);
BLU <= vga_color(1 downto 0);

-- background text display for fun
char <= (row & '0') xor (col & '0');

chargen: chargen_rom Port map ( 
		a(10 downto 3) => char,
		a(2 downto 0) => v(2 downto 0),
      d => pattern
	);

with h(2 downto 0) select text_pix <= 
	pattern(7) when O"0",
	pattern(6) when O"1",
	pattern(5) when O"2",
	pattern(4) when O"3",
	pattern(3) when O"4",
	pattern(2) when O"5",
	pattern(1) when O"6",
	pattern(0) when others;
	
text_color <= color_cyan when (text_pix = '1') else color_blue;
							
-- common clock for hex input and output processors
--hex_clk <= freq(to_integer(4 + unsigned(switch_hexclk)));
							
-- memory to serial output path, in Intel Hex format
hexout_nbusack <= hexout_nbusreq or (not v_sync);
	
hexout: mem2hex Port map ( 
			clk => baudrate_x8, --hex_clk,
			reset => RESET,
			--
   		debug => open,
			--
			nRD => hexout_nrd,
			nBUSREQ => hexout_nbusreq,
			nBUSACK => hexout_nbusack, -- access when required and v_sync allows 
			nWAIT => '1',
			ABUS => hexout_a,
			DBUS => vram_douta,
			START => button(0),
			BUSY => LED(1),
			PAGE => "00001111", --switch, -- dump lower 32k
			COUNTSEL => '0', -- 16 bytes per line
			TXDREADY => hexout_ready,
			TXDSEND => hexout_send,
			CHAR => hexout_char
		);							

txdout: uart_par2ser Port map (
			reset => reset,
			txd_clk => baudrate_x1,
			send => hexout_send,
			mode => "000", --switch(4 downto 2), -- no parity (extra stop bit will be generated)
			data => hexout_char,
         ready => hexout_ready,
         txd => PMOD_RXD		-- looking from the PC side
		);
		
rxdin: uart_ser2par Port map ( 
			reset => reset,
         rxd_clk => baudrate_x4,
         mode => "000", --switch(4 downto 2), -- no parity
         char => hexin_char,
         ready => hexin_ready,
         valid => open, 		-- not yet implemented
         rxd => PMOD_TXD		-- looking from the PC side
		);
		
--on_hexin_ready: process(reset, hexin_ready, hexin_char)
--begin
--	if (reset = '1') then
--		display <= X"0000";
--	else
--		if (rising_edge(hexin_ready)) then
--			display <= display(7 downto 0) & hexin_char;
--			--display <= sum;
--		end if;
--	end if;
--end process;
		
showdigit <= "1111" when (freq(9) = '0') else "0000";
		
-- 7 seg LED debug display		
leds: fourdigitsevensegled Port map ( 
			-- inputs
			hexdata => hexdata,
			digsel => digsel,
			showdigit => showdigit,
			showdot => button(3 downto 0),
			-- outputs
			anode => AN,
			segment(7) => DOT,
			segment(6 downto 0) => A_TO_G
		);

with digsel select
	hexdata <= 	display(3 downto 0) when "00",	
					display(7 downto 4) when "01",
					display(11 downto 8) when "10",
					display(15 downto 12) when others;
					
counter: freqcounter Port map ( 
		reset => RESET,
      clk => freq1,
      freq => baudrate_x1,
		bcd => switch_bcd,
		add => X"0001",
		cin => '1',
		cout => open,
      value => display
	);
			
baudgen: sn74hc4040 port map (
			clock => baudrate_x8,
			reset => RESET,
			q(0) => baudrate_x4, 
			q(1) => baudrate_x2,
			q(2) => baudrate_x1,
			q(11 downto 3) => open		
		);

end;
