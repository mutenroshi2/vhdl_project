library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;
--------------------------------------------------
entity cycle5 is
port(WB : in std_logic_vector(1 downto 0);
Readdata : in std_logic_vector(31 downto 0);
AlUresult : in std_logic_vector(31 downto 0);
MUX5 : in std_logic_vector(4 downto 0);
RegWrite : out std_logic;
MUXd : out std_logic_vector(31 downto 0);
MUX5_o : out std_logic_vector(4 downto 0)
);
end cycle5;
--------------------------------------------------
architecture behav1 of cycle5 is

component MUX32 is
port(x : in std_logic_vector(31 downto 0);
y : in std_logic_vector(31 downto 0);
sel : in std_logic;
z : out std_logic_vector(31 downto 0)
);
end component MUX32;
begin
MUX5_o <= MUX5;
RegWrite <= WB(0);
A1 : MUX32 port map(ALUresult,Readdata,WB(1),MUXd);

end behav1;