library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--------------------------------------------------
entity ShiftLeft2 is 
port(x :in std_logic_vector(31 downto 0); 
y:out std_logic_vector(31 downto 0)
 ); 
end ShiftLeft2;
--------------------------------------------------
architecture behav of ShiftLeft2 is
	begin
		process(x)
		begin
		y <= x(29 downto 0) & "00";
	end process;
end behav;
--------------------------------------------------