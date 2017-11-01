library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;
--------------------------------------------------
entity fwdunit is
port(rs : in std_logic_vector(4 downto 0);
rt_co : in std_logic_vector(4 downto 0);
regwrite_exmem : in std_logic;
regwrite_memwb : in std_logic;
Mux_5_o : in std_logic_vector(4 downto 0);
mux5_w_o : in std_logic_vector(4 downto 0);
sel_1 : out std_logic_vector(1 downto 0);
sel_2 : out std_logic_vector(1 downto 0)
);
end fwdunit;
--------------------------------------------------
architecture behav1 of fwdunit is
begin
process(rs,rt_co,Mux_5_o,mux5_w_o)
variable temp1 : std_logic_vector(1 downto 0) := "00";
variable temp2 : std_logic_vector(1 downto 0) := "00";
begin
if ((regwrite_exmem = '1') and not(Mux_5_o = (Mux_5_o'range => '0')) and (Mux_5_o = rs)) then
temp1 := "10";
end if;
if ((regwrite_exmem = '1') and not(Mux_5_o = (Mux_5_o'range => '0')) and (Mux_5_o = rt_co)) then
temp2 := "10";
end if;

if ((regwrite_memwb = '1') and not(mux5_w_o = (mux5_w_o'range => '0')) and not(Mux_5_o = rs) and (mux5_w_o = rs)) then
temp1 := "01";
end if;
if ((regwrite_memwb = '1') and not(mux5_w_o = (mux5_w_o'range => '0')) and not(Mux_5_o = rt_co) and (mux5_w_o = rt_co)) then
temp2 := "01";
end if;
sel_1 <= temp1;
sel_2 <= temp2;
end process;
end behav1;
--------------------------------------------------
