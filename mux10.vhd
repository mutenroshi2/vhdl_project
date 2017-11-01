library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;
--------------------------------------------------
entity MUX10 is 
port(x :in std_logic_vector(9 downto 0);
 y :in std_logic_vector(9 downto 0); 
sel :in std_logic; 
z :out std_logic_vector(9 downto 0)
 ); 
end MUX10;
--------------------------------------------------
architecture behav1 of MUX10 is
begin
	Process(x,y,sel)
begin
      if (sel = '0') then
	z <= x;
	else z <= y;
	end if;
	end Process;
end behav1;
--------------------------------------------------