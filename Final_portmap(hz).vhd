library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
--------------------------------------------------
entity final_hz is
port(clk : in std_logic
);
end final_hz;
--------------------------------------------------
architecture behav1 of final_hz is

component cycle1 is
port(clk :in std_logic;
PCSrc : in std_logic;
addresult : in std_logic_vector(31 downto 0);

Ins_out : out std_logic_vector(31 downto 0);
PC_4 : out std_logic_vector(31 downto 0)
);
end component;

component if_id is
port ( 	clk : in std_logic;
	im_in : in std_logic_vector(31 downto 0);
	pc_4in : in std_logic_vector(31 downto 0);
	
	im_out : out std_logic_vector(31 downto 0);
	pc_4out : out std_logic_vector(31 downto 0)
);
end component;

component cycle2_hz is
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
rs : out std_logic_vector(4 downto 0);
rt : out std_logic_vector(4 downto 0);
rd : out std_logic_vector(4 downto 0);
PCSrc : out std_logic
);
end component;

component id_ex_hz is
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
end component;

component cycle3_hz is
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
end component;

component ex_mem_hz is
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
end component;

component cycle4_hz is
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
end component;

component mem_wb is
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
end component;

component cycle5 is
port(WB : in std_logic_vector(1 downto 0);
Readdata : in std_logic_vector(31 downto 0);
AlUresult : in std_logic_vector(31 downto 0);
MUX5 : in std_logic_vector(4 downto 0);
RegWrite : out std_logic;
MUXd : out std_logic_vector(31 downto 0);
MUX5_o : out std_logic_vector(4 downto 0)
);
end component;

component fwdunit is
port(rs : in std_logic_vector(4 downto 0);
rt_co : in std_logic_vector(4 downto 0);
regwrite_exmem : in std_logic;
regwrite_memwb : in std_logic;
Mux_5_o : in std_logic_vector(4 downto 0);
mux5_w_o : in std_logic_vector(4 downto 0);
sel_1 : out std_logic_vector(1 downto 0);
sel_2 : out std_logic_vector(1 downto 0)
);
end component;

-------------------------------------------------------
signal PCSrc,hazard_out : std_logic;
signal RegWrite: std_logic;
signal addresult,addresult_1 : std_logic_vector(31 downto 0);
signal PC_4 : std_logic_vector(31 downto 0);
signal Ins_out : std_logic_vector(31 downto 0);
signal im_out : std_logic_vector(31 downto 0);
signal pc_4out,pc_4out_d,pc_4out_1 : std_logic_vector(31 downto 0);
signal WB,WB_1,WB_2,WB_3,WB_4,WB_5 : std_logic_vector(1 downto 0);
signal M,M_1,M_2,M_3: std_logic_vector(2 downto 0);
signal EX,EX_1 : std_logic_vector(3 downto 0);
signal RD1,RD2,Signextend,Signextend_o,RD1_o,RD2_o,RD2_1,RD2_2 : std_logic_vector(31 downto 0);
signal rt,rd,rt_co,rd_co,rs,rs_co : std_logic_vector(4 downto 0);
signal zero,zero_1 :  std_logic;
signal MUX,MUX_1,MUX_2,MUX_3,MUX_4 : std_logic_vector(4 downto 0);
signal aluresult,aluresult_1,aluresult_2,aluresult_3: std_logic_vector(31 downto 0);
signal Readdata,Readdata_1 : std_logic_vector(31 downto 0); 
signal MUXd : std_logic_vector(31 downto 0);
signal sel_1,sel_2 :  std_logic_vector(1 downto 0);

---------------------------------------------------------
begin

A1 : cycle1 port map(clk,PCSrc,addresult_1,Ins_out,PC_4);

A2 : if_id port map(clk,Ins_out,PC_4,im_out,pc_4out);

A3 : cycle2_hz port map(clk,im_out,RegWrite,MUX_4,MUXd,pc_4out,WB,M,EX,addresult_1,RD1,RD2,Signextend,rs,rt,rd,PCSrc);

A4 : id_ex_hz port map(clk,RD1,RD2,Signextend,rs,rt,rd,WB,M,EX,RD1_o,RD2_o,Signextend_o,rs_co,rt_co,rd_co,WB_1,M_1,EX_1);

A5 : cycle3_hz port map(WB_1,M_1,EX_1,RD1_o,RD2_o,Signextend_o,rt_co,rd_co,sel_1,sel_2,aluresult_1,MUXd,aluresult,RD2_1,MUX,WB_2,M_2);

A6 : ex_mem_hz port map(clk,WB_2,M_2,aluresult,RD2_1,MUX,WB_3,M_3,aluresult_1,RD2_2,MUX_1);

A7 : cycle4_hz port map(WB_3,M_3,aluresult_1,RD2_2,MUX_1,WB_4,Readdata,aluresult_2,MUX_2);

A8 : mem_wb port map(clk,WB_4,Readdata,aluresult_2,MUX_2,WB_5,Readdata_1,aluresult_3,MUX_3);

A9 : cycle5 port map(WB_5,Readdata_1,aluresult_3,MUX_3,RegWrite,MUXd,MUX_4);

A10 : fwdunit port map(rs_co,rt_co,WB_3(0),WB_5(0),MUX_2,MUX_4,sel_1,sel_2);

end behav1;
