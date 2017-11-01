library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------

entity SignExtend is 
port(x :in std_logic_vector(15 downto 0); 
y:out std_logic_vector(31 downto 0)
 ); 
end SignExtend;

--------------------------------------------------
architecture behav1 of Signextend is
begin
Process(x)
begin
        if(x(15) = '1') then
        y(31 downto 16) <= "1111111111111111";
	y(15 downto 0) <= x;
else
	y(31 downto 16) <= "0000000000000000";
	y(15 downto 0) <= x;
	end if;
	end process;
end behav1;
--------------------------------------------------