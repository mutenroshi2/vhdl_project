
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;
--------------------------------------------------
entity cycle4_hz is
port(WB : in std_logic_vector(1 downto 0);
M : in std_logic_vector(2 downto 0);
--zero  : in std_logic;
ALUresult : in std_logic_vector(31 downto 0);
RD2 : in std_logic_vector(31 downto 0);
MUX5c : in std_logic_vector(4 downto 0);
WB_o : out std_logic_vector(1 downto 0);
Readdata : out std_logic_vector(31 downto 0);
ALUresult_o : out std_logic_vector(31 downto 0);
MUX5c_out : out std_logic_vector(4 downto 0)
--PCSrc : out std_logic
);
end cycle4_hz;
--------------------------------------------------
architecture behav1 of cycle4_hz is 

--And2
component AND2 is
port(x : in std_logic;
y : in std_logic;
z : out std_logic
);
end component AND2;

--Data Memory (Read/Write)
component DMEM is
port(WriteData :in std_logic_vector(31 downto 0);
Address :in std_logic_vector(31 downto 0);
MemRead :in std_logic;
MemWrite :in std_logic;
ReadData : out std_logic_vector(31 downto 0)
);
end component DMEM;
--------------------------------------------------

--signal Branch, MemRead,MemWrite : std_logic;
begin

--Branch <=M(0);
--MemRead <= M(1);
--Memwrite <= M(2);
WB_o <= WB;
MUX5c_out <= MUX5c;
ALUresult_o <= ALUresult;
A1 : DMEM port map(RD2,ALUresult,M(1),M(2),Readdata);



end behav1;
