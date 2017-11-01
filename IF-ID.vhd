library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
--------------------------------------------------
entity if_id is
port ( 	clk : in std_logic;
	im_in : in std_logic_vector(31 downto 0);
	pc_4in : in std_logic_vector(31 downto 0);
	im_out : out std_logic_vector(31 downto 0);
	pc_4out : out std_logic_vector(31 downto 0)
);
end if_id;
--------------------------------------------------

architecture behav1 of if_id is
begin
process(clk)
begin
if(clk = '1' and clk'event) then
if (now < 1 ns) then
im_out <= (others=>'Z');
pc_4out<= (others=> 'Z');
else
im_out <= im_in;
pc_4out <= pc_4in;
end if;
end if;
end process;
end behav1;
--------------------------------------------------