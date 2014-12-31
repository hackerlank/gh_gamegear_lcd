library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity GG_AV is 
	port(
		red_out: 	out bit_vector(0 to 3);
		green_out: 	out bit_vector(0 to 3);
		blue_out: 	out bit_vector(0 to 3);
		d_in:		in bit_vector(0 to 3);
		csync: 		in std_logic;
		hsync: 		in std_logic;
		pix_clk: 	in std_logic;
		sc_out: 	out std_logic;
		cs_out: 	out std_logic;
		en_in: 		in std_logic;
		en_out:		out std_logic
    );
end GG_AV;

architecture behavioral of GG_AV is
	signal ffa: std_logic;
	signal ffb: std_logic;
	signal ffc: std_logic;
	signal red_dff: bit_vector(0 to 3);
	signal green_dff: bit_vector(0 to 3);
	signal blue_dff: bit_vector(0 to 3);
begin
	process(pix_clk)
		variable cnt: integer range 0 to 8;
	begin
		if rising_edge(pix_clk) then
			ffa<= not ffc;
			ffb<= ffa;
			ffc<= ffb;
			
			if (hsync = '0') then
				ffa<= '0';
				ffb<= '0';
				ffc<= '0';
			end if;
		
			cnt:= cnt + 1;
			if (cnt >= 8) then
				cnt:= 0;
			end if;
			
			if (cnt >= 4) then
				sc_out<= '1';
			else
				sc_out<= '0';
			end if;
			
			cs_out<= csync;
			en_out<= '1';
		end if;
	end process;
	
	process(ffa)
	begin
		if rising_edge(ffa) then
			red_out<= d_in;
		end if;
	end process;
	
	process(ffb)
	begin
		if rising_edge(ffb) then
			green_out<= d_in;
		end if;
	end process;
	
	process(ffc)
	begin
		if falling_edge(ffc) then
			blue_out<= d_in;
		end if;
	end process;
end behavioral;
