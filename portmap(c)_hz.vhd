library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;
--------------------------------------------------
entity cycle3_hz is
port(WB :in std_logic_vector(1 downto 0);
M :in std_logic_vector(2 downto 0);
EX :in std_logic_vector(3 downto 0);
RD1 : in std_logic_vector(31 downto 0);
RD2 : in std_logic_vector(31 downto 0);
Signextend : in std_logic_vector(31 downto 0);
rt : in std_logic_vector(4 downto 0);
rd : in std_logic_vector(4 downto 0);
sel_1 : in std_logic_vector(1 downto 0);
sel_2 : in std_logic_vector(1 downto 0);
aluresult_ex : in std_logic_vector(31 downto 0);
mux_wb : in std_logic_vector(31 downto 0);
ALUresult : out std_logic_vector(31 downto 0);
MUX32_o: out std_logic_vector(31 downto 0);
MUXc : out std_logic_vector(4 downto 0);
WB_o : out std_logic_vector(1 downto 0);
M_o : out std_logic_vector(2 downto 0)
);
end cycle3_hz;
--------------------------------------------------
architecture behav1 of cycle3_hz is

component MUX32 is
port(x : in std_logic_vector(31 downto 0);
y : in std_logic_vector(31 downto 0);
sel : in std_logic;
z : out std_logic_vector(31 downto 0)
);
end component MUX32;

component MUX5 is
port(x : in std_logic_vector (4 downto 0);
y : in std_logic_vector (4 downto 0);
sel : in std_logic;
z : out std_logic_vector(4 downto 0)
);
end component MUX5;


component ALUControl is
port(ALUOp :in std_logic_vector(1 downto 0);
Funct :in std_logic_vector(5 downto 0);
Operation :out std_logic_vector(3 downto 0)
);
end component ALUControl;

component add is 
port(a : in std_logic_vector(31 downto 0);
	b : in std_logic_vector(31 downto 0);
	z : out std_logic_vector(31 downto 0)
);
end component add;

component ALU is
port(a : in std_logic_vector(31 downto 0);
b : in std_logic_vector(31 downto 0);
oper : in std_logic_vector(3 downto 0);
result : buffer std_logic_vector(31 downto 0);
zero : buffer std_logic;
overflow: buffer std_logic
);
end component ALU;

component ShiftLeft2 is
port(x :in std_logic_vector(31 downto 0);
y : out std_logic_vector(31 downto 0)
);
end  component ShiftLeft2;

component newmux is 
port(p :in std_logic_vector(31 downto 0);
 q :in std_logic_vector(31 downto 0); 
 r :in std_logic_vector(31 downto 0); 
 s :in std_logic_vector(31 downto 0); 
sel :in std_logic_vector(1 downto 0); 
t :out std_logic_vector(31 downto 0)
 ); 
end component newmux;

component newmux1 is 
port(p :in std_logic_vector(31 downto 0);
 q :in std_logic_vector(31 downto 0); 
 r :in std_logic_vector(31 downto 0); 
 sel :in std_logic_vector(1 downto 0); 
t :out std_logic_vector(31 downto 0)
 ); 
end component newmux1;
--------------------------------------------------
signal shiftleft2_o : std_logic_vector(31 downto 0);
signal newmux_1,newmux_2,B : std_logic_vector(31 downto 0);
signal Alu_op : std_logic_vector(31 downto 0);
signal overflow_o :std_logic;
signal alucontrol_out : std_logic_vector(3 downto 0);
signal RegDst,Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite : std_logic;
signal instruct : std_logic_vector(5 downto 0);
signal ALUOp : std_logic_vector(1 downto 0);
signal zero : std_logic;

begin

RegWrite <= WB(0);
MemtoReg <= WB(1);
Branch <=M(0);
MemRead <= M(1);
Memwrite <= M(2);
RegDst <= EX(0);
ALUOp <= EX(2 downto 1);
ALUSrc <= EX(3);
WB_o <= WB;
M_o <= M;
--RD2_ex <= RD2;
instruct <= Signextend(5 downto 0);
MUX32_o <= B;



A3 : ALU port map(newmux_1,B,alucontrol_out,ALUresult,zero,overflow_o);

A4 : newmux1 port map(RD1,aluresult_ex,mux_wb,sel_1,newmux_1);

A5 : newmux1 port map(RD2,aluresult_ex,mux_wb,sel_2,newmux_2);

A6 : MUX32 port map(newmux_2,Signextend,ALUSrc,B);

A7 : ALUControl port map(EX(2 downto 1),instruct,alucontrol_out);

A8 : MUX5 port map(rt,rd,RegDst,MUXc);

end behav1;




