library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
--------------------------------------------------
entity mem_wb is
port(clk : in std_logic;
wb_in_1 : in std_logic_vector(1 downto 0);
read_data : in std_logic_vector(31 downto 0);
alu_result : in std_logic_vector(31 downto 0);
mux5_w : in std_logic_vector(4 downto 0);
wb_in_1_o : out std_logic_vector(1 downto 0);
read_data_o : out std_logic_vector(31 downto 0);
alu_result_o : out std_logic_vector(31 downto 0);
mux5_w_o : out std_logic_vector(4 downto 0)
);
end mem_wb;
--------------------------------------------------
architecture behav1 of mem_wb is
begin
process(clk)
begin
if(clk = '1' and clk'event) then
if (now < 1 ns) then
wb_in_1_o <= (others=>'Z');
read_data_o <= (others=>'Z');
alu_result_o <= (others=>'Z');
mux5_w_o <= (others=>'Z');
else
wb_in_1_o <= wb_in_1;
read_data_o <= read_data;
alu_result_o <= alu_result;
mux5_w_o <= mux5_w;
end if;
end if;
end process;
end behav1;
--------------------------------------------------