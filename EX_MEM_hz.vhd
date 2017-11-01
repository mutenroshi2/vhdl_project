library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
--------------------------------------------------
entity ex_mem_hz is
port(clk : in std_logic;
wb_in : in std_logic_vector(1 downto 0);
m_in : in std_logic_vector(2 downto 0);
--add_in : in std_logic_vector(31 downto 0);
alu_result : in std_logic_vector(31 downto 0);
RD2_reg_m : in std_logic_vector(31 downto 0);
Mux_5 : in std_logic_vector(4 downto 0);
--zero_m : in std_logic;
wb_in_o : out std_logic_vector(1 downto 0);
m_in_o : out std_logic_vector(2 downto 0);
--add_in_o : out std_logic_vector(31 downto 0);
alu_result_o : out std_logic_vector(31 downto 0);
RD2_reg_m_o : out std_logic_vector(31 downto 0);
Mux_5_o : out std_logic_vector(4 downto 0)
--zero_m_o : out std_logic
);
end ex_mem_hz;
--------------------------------------------------
architecture behav1 of ex_mem_hz is
begin
process(clk) 
begin
if(clk = '1' and clk'event) then
if (now < 1 ns) then
wb_in_o <= (others=>'0'); 
m_in_o <= (others=>'0');
--add_in_o <= (others=>'0');
alu_result_o <= (others=>'Z');
RD2_reg_m_o <= (others=>'Z');
Mux_5_o <= (others=>'Z');
--zero_m_o <= '0';
else
wb_in_o <= wb_in;
m_in_o <= m_in;
--add_in_o <= add_in;
alu_result_o <= alu_result;
RD2_reg_m_o <= RD2_reg_m;
Mux_5_o <= Mux_5;
--zero_m_o <= zero_m;
end if;
end if;
end process;
end behav1;
--------------------------------------------------

