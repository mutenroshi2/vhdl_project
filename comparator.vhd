library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;
--------------------------------------------------
entity comparator is
port( RD1 : in std_logic_vector(31 downto 0);
RD2 : in std_logic_vector(31 downto 0);
Branch : out std_logic
);
end comparator;
--------------------------------------------------
architecture behav1 of comparator is
begin
	process(RD1,RD2)
begin
	if(RD1 = RD2)then
	Branch <= '1';
	else
	Branch <= '0';
end if;
end process;
end behav1;
--------------------------------------------------
