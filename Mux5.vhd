library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------

entity MUX5 is port
(x :in std_logic_vector (4 downto 0); 
y :in std_logic_vector (4 downto 0); 
sel :in std_logic;
z :out std_logic_vector(4 downto 0) 
); 
end MUX5; 

--------------------------------------------------
architecture behav1 of MUX5 is
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