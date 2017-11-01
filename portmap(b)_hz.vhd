library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;
--------------------------------------------------
entity cycle2_hz is
port(clk : std_logic;
Ins_out : in std_logic_vector(31 downto 0);
RegWrite : in std_logic;
Writereg : in std_logic_vector(4 downto 0);
Writedata : in std_logic_vector(31 downto 0);
PC_4 : in std_logic_vector(31 downto 0);
WB : out std_logic_vector(1 downto 0);
M : buffer std_logic_vector(2 downto 0);
EX : out std_logic_vector(3 downto 0);
Branch_add : out std_logic_vector(31 downto 0);
RD1 : buffer std_logic_vector(31 downto 0);
RD2 : buffer std_logic_vector(31 downto 0);
Sign_Extend : buffer std_logic_vector(31 downto 0);
rs  : out std_logic_vector(4 downto 0);
rt  : out std_logic_vector(4 downto 0);
rd : out std_logic_vector(4 downto 0);
PCSrc : out std_logic
);
end cycle2_hz;
--------------------------------------------------
architecture behav1 of cycle2_hz is

--Sign Extend
component SignExtend is
port(x : in std_logic_vector(15 downto 0);
y : out std_logic_vector(31 downto 0)
);
end component SignExtend;

--Registers
component registers is
port(clk : std_logic;
RR1 :in std_logic_vector(4 downto 0);
RR2 :in std_logic_vector(4 downto 0);
WR :in std_logic_vector(4 downto 0);
WD : in std_logic_vector(31 downto 0);
RegWrite: in std_logic;
RD1 : out std_logic_vector(31 downto 0);
RD2 : out std_logic_vector(31 downto 0)
);
end component registers;

--CPU Control
component Control_1 is 
port(Opcode :in std_logic_vector(5 downto 0); 
WB : out std_logic_vector(1 downto 0);
M : out std_logic_vector(2 downto 0);
EX : out std_logic_vector(3 downto 0);
Jump : out std_logic
 ); 
end component; 

component add is 
port(a : in std_logic_vector(31 downto 0);
	b : in std_logic_vector(31 downto 0);
	z : out std_logic_vector(31 downto 0)
);
end component add;

component ShiftLeft2 is
port(x :in std_logic_vector(31 downto 0);
y : out std_logic_vector(31 downto 0)
);
end  component ShiftLeft2;

component AND2 is
port(x : in std_logic;
y : in std_logic;
z : out std_logic
);
end component AND2;

component MUX10 is 
port(x :in std_logic_vector(9 downto 0);
 y :in std_logic_vector(9 downto 0); 
sel :in std_logic; 
z :out std_logic_vector(9 downto 0)
 ); 
end component;

component comparator is
port( RD1 : in std_logic_vector(31 downto 0);
RD2 : in std_logic_vector(31 downto 0);
Branch : out std_logic
);
end component;
--------------------------------------------------
signal rt_o :  std_logic_vector(4 downto 0);
signal rd_o :  std_logic_vector(4 downto 0);
signal rs_o :  std_logic_vector(4 downto 0);
signal opcode : std_logic_vector(5 downto 0); 
signal shiftleft2_o : std_logic_vector(31 downto 0);
signal zero : std_logic;


begin
--PC_4_o <= PC_4;
opcode <= Ins_out(31 downto 26);
rt_o <= Ins_out(20 downto 16);
rd_o <= Ins_out(15 downto 11);
rs_o <= Ins_out(25 downto 21);
rt<= rt_o;
rs <= rs_o;
rd<= rd_o;

A1 : Control_1 port map(Ins_out(31 downto 26),WB,M,EX);

A2 : registers port map(clk,rs_o,rt_o,Writereg,Writedata,RegWrite,RD1,RD2);

A3 : SignExtend port map(Ins_out(15 downto 0),Sign_Extend);

A4 : add port map(PC_4,shiftleft2_o,Branch_add);

A5 : ShiftLeft2 port map(Sign_Extend,shiftleft2_o);

A6 : comparator port map(RD1,RD2,zero);

A7 : AND2 port map(M(0),zero,PCSrc);
end behav1;
--------------------------------------------------
