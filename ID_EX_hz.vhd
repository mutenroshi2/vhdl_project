library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
--------------------------------------------------
entity id_ex_hz is
port(clk : in std_logic;
RD1_reg :  in std_logic_vector(31 downto 0); 
RD2_reg :  in std_logic_vector(31 downto 0);
Sign_y:     in std_logic_vector(31 downto 0);
rs_co : in std_logic_vector(4 downto 0); 
rt_co : in std_logic_vector(4 downto 0);
rd : in std_logic_vector(4 downto 0);
wb :   in std_logic_vector(1 downto 0);
M : in std_logic_vector(2 downto 0);
EX : in std_logic_vector(3 downto 0);
RD1_reg_o : out std_logic_vector(31 downto 0); 
RD2_reg_o : out std_logic_vector(31 downto 0);
Sign_y_o: out std_logic_vector(31 downto 0);
rs_co_o : out std_logic_vector(4 downto 0); 
rt_co_o : out std_logic_vector(4 downto 0);
rd_o : out std_logic_vector(4 downto 0);
wb_o :   out std_logic_vector(1 downto 0);
M_o : out std_logic_vector(2 downto 0);
EX_o : out std_logic_vector(3 downto 0)
);
end id_ex_hz;
--------------------------------------------------
architecture behav1 of id_ex_hz is
begin
process(clk)
begin
if(clk = '1' and clk'event) then
if (now < 1 ns) then
--pc_4out_o <= (others=>'Z');
RD1_reg_o <= (others=>'Z');
RD2_reg_o <= (others=>'Z');
Sign_y_o  <= (others=>'Z');   
rs_co_o <= (others=>'Z'); 
rt_co_o <= (others=>'Z');
--rt_1_o <= (others=>'Z');
rd_o <= (others=>'Z');
wb_o <= (others=>'0');   
M_o <= (others=>'0'); 
EX_o <= "0ZZ0";
else
--pc_4out_o <= pc_4out;
RD1_reg_o <= RD1_reg;
RD2_reg_o <= RD2_reg;
Sign_y_o<= Sign_y;
rs_co_o<= rs_co;
rt_co_o <=rt_co;
--rt_1_o <= rt_1;
rd_o <= rd;
wb_o <= wb;
M_o <= M;
EX_o <= EX;
end if;
end if;
end process;
end behav1;
---------------------------------------------------
