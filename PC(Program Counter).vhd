library ieee;
use ieee.std_logic_1164.all;
--------------------------------------------------
entity PC is port
(clk :in std_logic; 
AddressIn :in std_logic_vector(31 downto 0); 
AddressOut:out std_logic_vector(31 downto 0)
 ); 
end PC;
--------------------------------------------------
architecture behav1 of PC is 
 
begin

process(clk,AddressIn)
variable temp : std_logic_vector(31 downto 0);
begin
if (clk = '1' and clk'event)then
if (now < 1ns) then temp := (others => '0');
else temp := AddressIn;
end if;
end if;
AddressOut <= temp;
end process;
end behav1;
--------------------------------------------------
