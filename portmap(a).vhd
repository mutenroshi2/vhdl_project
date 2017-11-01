library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;
--------------------------------------------------
entity cycle1 is
port(clk :in std_logic;
PCSrc : in std_logic;
addresult : in std_logic_vector(31 downto 0);
Ins_out : out std_logic_vector(31 downto 0);
PC_4 : out std_logic_vector(31 downto 0)
);
end cycle1;
--------------------------------------------------
architecture behav1 of cycle1 is

component PC is
port(clk :in std_logic;
AddressIn :in std_logic_vector(31 downto 0);
AddressOut:out std_logic_vector(31 downto 0)
);
end component PC;


component IMEM is
port(Address : in std_logic_vector(31 downto 0);
ReadData: out std_logic_vector(31 downto 0)
);
end component IMEM;


component add is 
port(a : in std_logic_vector(31 downto 0);
	b : in std_logic_vector(31 downto 0);
	z : out std_logic_vector(31 downto 0)
);
end component add;

component MUX32 is
port(x : in std_logic_vector(31 downto 0);
y : in std_logic_vector(31 downto 0);
sel : in std_logic;
z : out std_logic_vector(31 downto 0)
);
end component MUX32;

--------------------------------------------------

signal PC_input : std_logic_vector(31 downto 0) := (others=>'0');
signal PC_output : std_logic_vector(31 downto 0);
signal PC_4_o : std_logic_vector(31 downto 0);



begin
PC_4 <= PC_4_o;

A1 : PC port map(clk,PC_input,PC_output);

A2: IMEM port map(PC_output,Ins_out);

A3 : add port map(PC_output,X"00000004",PC_4_o);

A4 : MUX32 port map(PC_4_o,addresult,PCSrc,PC_input);

end behav1;

