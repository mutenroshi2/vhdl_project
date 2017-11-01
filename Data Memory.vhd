library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
--------------------------------------------------
entity DMEM is 
port(WriteData :in std_logic_vector(31 downto 0); 
Address :in std_logic_vector(31 downto 0); 
MemRead :in std_logic; 
MemWrite :in std_logic; 
ReadData :out std_logic_vector(31 downto 0) 
); 
end DMEM;
--------------------------------------------------
architecture behav1 of DMEM is 
subtype test is std_logic_vector(31 downto 0);
type memory is array(0 to 65535) of test;
signal datamem : memory := (X"00000009",X"00000000",X"00000000",X"00000000",
			     X"00000008",X"00000000",X"00000000",X"00000000",
			     X"00000000",others => (test'range=>'0')	);
begin
process(Address)
variable input : integer;
begin
input := to_integer(unsigned(Address));
if(MemRead = '0') then 
ReadData <= (others => 'Z');
end if;
if(MemWrite = '1') then
datamem(input)<=WriteData;
end if;
if(MemRead = '1') then
ReadData <= datamem(input);
end if;
end process;
end behav1;
--------------------------------------------------