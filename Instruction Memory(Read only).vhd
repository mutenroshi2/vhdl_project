library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
--------------------------------------------------
entity IMEM is 
port(Address :in std_logic_vector(31 downto 0);
 ReadData:out std_logic_vector(31 downto 0)
 ); 
end IMEM; 
--------------------------------------------------
architecture behav1 of IMEM is
subtype test is std_logic_vector(7 downto 0);
type memory is array(0 to 65535) of test;
signal codemem : memory := ( --X"02" , X"11" , X"48" , X"20",
			     --X"8D" , X"0A" , X"00" , X"00",
			     --X"8D" , X"0B" , X"00" , X"04",
			     --X"02" , X"12" , X"60" , X"22",
			     --X"AD" , X"09" , X"00" , X"08",others => "00000000");
			     
			     --X"02" , X"11" , X"48" , X"20",
			     --X"8D" , X"0A" , X"00" , X"00",
			     --X"8D" , X"0B" , X"00" , X"04",
			     --X"02" , X"12" , X"60" , X"22",
			     --X"AD" , X"0C" , X"00" , X"08",others => "00000000");
			     
			     --X"12" , X"11" , X"00" , X"03",
			     --X"02" , X"52" , X"58" , X"20",
			     --"ZZZZZZZZ","ZZZZZZZZ","ZZZZZZZZ","ZZZZZZZZ",
			     --"ZZZZZZZZ","ZZZZZZZZ","ZZZZZZZZ","ZZZZZZZZ",
	                     --"ZZZZZZZZ","ZZZZZZZZ","ZZZZZZZZ","ZZZZZZZZ",
                            -- X"02" , X"53" , X"48" , X"20",
			    -- X"08" , X"00" , X"00" , X"01",
			     --X"02" , X"53" , X"50" , X"22",others => "00000000");
			     --"ZZZZZZZZ","ZZZZZZZZ","ZZZZZZZZ","ZZZZZZZZ",
			    -- "ZZZZZZZZ","ZZZZZZZZ","ZZZZZZZZ","ZZZZZZZZ",

			     
			     X"02" , X"34" , X"48" , X"20",
			     X"02" , X"53" , X"50" , X"22",
			     X"01" , X"2A" , X"B8" , X"20",others => "ZZZZZZZZ");
			     
				
			    
begin
	process(Address)
variable addloc : integer;
begin
addloc := to_integer(unsigned(Address));
ReadData <= codemem(addloc) & codemem(addloc + 1) & codemem(addloc + 2) & codemem(addloc + 3);
end process;
end behav1;
--------------------------------------------------