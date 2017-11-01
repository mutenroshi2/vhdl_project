library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
--------------------------------------------------
entity hazard is
port( Branch : in std_logic;
Hazard_out : out std_logic
);
end hazard;
--------------------------------------------------
architecture behav1 of hazard is
begin 
	Process(Branch)
begin
	if(Branch = '1') then
	Hazard_out <= '1';
	else
	Hazard_out <= '0';

end if;
end process;
end behav1;
-------------------------------------------------- 
