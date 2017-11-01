library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;
--------------------------------------------------
entity newmux1 is 
port(p :in std_logic_vector(31 downto 0);
 q :in std_logic_vector(31 downto 0); 
 r :in std_logic_vector(31 downto 0); 
 sel :in std_logic_vector(1 downto 0); 
t :out std_logic_vector(31 downto 0)
 ); 
end newmux1;

--------------------------------------------------
architecture behav1 of newmux1 is
begin
	Process(p,q,r,sel)
begin
      if (sel = "00") then
	t <= p;
	elsif (sel = "01") then
	t <= q;
	elsif (sel = "10") then
	t <= r;
	end if;
	end Process;
end behav1;
--------------------------------------------------
