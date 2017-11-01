library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
entity add is 
port(a : in std_logic_vector(31 downto 0);
	b : in std_logic_vector(31 downto 0);
	z : out std_logic_vector(31 downto 0)
);
end add;


architecture behav1 of add is
begin
process(a,b)
begin
z <= a + b;
end process;
end behav1;