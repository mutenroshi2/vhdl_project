library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
--------------------------------------------------
entity registers is 
port(clk : std_logic;
RR1 :in std_logic_vector(4 downto 0); 
RR2 :in std_logic_vector(4 downto 0); 
WR :in std_logic_vector(4 downto 0); 
WD :in std_logic_vector(31 downto 0); 
RegWrite:in std_logic; 
RD1 :out std_logic_vector(31 downto 0); 
RD2 :out std_logic_vector(31 downto 0)
); 
end registers;
--------------------------------------------------
architecture behav1 of registers is
subtype test is std_logic_vector(31 downto 0);
type memory is array(0 to 31) of test;
signal regmem : memory := (X"00000000",X"00000000",X"00000000",X"00000000",
		           X"00000000",X"00000000",X"00000000",X"00000000",
			   X"00000000",X"00000000",X"00000000",X"00000000",
	                   X"00000000",X"00000000",X"00000000",X"00000000",
                           X"00000000",X"00000009",X"00000004",X"00000007",
                           X"0000000A",X"00000000",X"00000000",X"00000000",others =>(test'range=>'0'));
begin
process(clk,RR1,RR2,WR)
variable reg1,reg2,wrreg:integer;
begin
reg1 := to_integer(unsigned(RR1));
reg2 := to_integer(unsigned(RR2));
wrreg := to_integer(unsigned(WR));
if(clk = '0') then
RD1 <= regmem(reg1);
RD2<= regmem(reg2);
end if;
if(RegWrite = '1')then
regmem(wrreg)<=WD;
end if;

end process;
end behav1;
--------------------------------------------------