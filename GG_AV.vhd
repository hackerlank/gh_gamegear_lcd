library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity GG_AV is 
	port(
		red_out: 		out bit_vector(0 to 3);
		green_out: 		out bit_vector(0 to 3);
		blue_out: 		out bit_vector(0 to 3);
		d: 				in bit_vector(0 to 3);
		csync: 			in std_logic;
		hsync: 			in std_logic;
		pix_clk: 		in std_logic;
		sc_out: 		out std_logic;
		csync_out: 		out std_logic;
		oe: 			in std_logic;
		vcc5: 			out std_logic;
		d3_out: 		out std_logic
    );
end GG_AV;

architecture behavioral of GG_AV is
begin
end behavioral;
