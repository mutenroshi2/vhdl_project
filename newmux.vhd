library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;
--------------------------------------------------
entity newmux is 
port(p :in std_logic_vector(31 downto 0);
 q :in std_logic_vector(31 downto 0); 
 r :in std_logic_vector(31 downto 0); 
 s :in std_logic_vector(31 downto 0); 
sel :in std_logic_vector(1 downto 0); 
t :out std_logic_vector(31 downto 0)
 ); 
end newmux;

--------------------------------------------------
architecture behav1 of newmux is
begin
	Process(p,q,r,s,sel)
begin
      if (sel = "00") then
	t <= p;
	elsif (sel = "01") then
	t <= q;
	elsif (sel = "10") then
	t <= r;
	elsif (sel = "11") then
	t <= s;
	end if;
	end Process;
end behav1;
--------------------------------------------------
