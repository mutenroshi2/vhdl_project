library ieee;
use ieee.std_logic_1164.all;
--------------------------------------------------

entity AND2 is
 port(x :in std_logic; 
y :in std_logic; 
z :out std_logic ); 
end AND2;

--------------------------------------------------
architecture behav1 of AND2 is
begin

    process(x, y)
    begin
        -- compare to truth table
        if ((x='1') and (y='1')) then
	    z <= '1';
	else
	    z <= '0';
	end if;
    end process;
end behav1;
--------------------------------------------------