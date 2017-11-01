library ieee;
use ieee.std_logic_1164.all;
--------------------------------------------------
entity ALUControl is 
port(ALUOp :in std_logic_vector(1 downto 0); 
Funct :in std_logic_vector(5 downto 0); 
Operation :out std_logic_vector(3 downto 0)
 ); 
end ALUControl;
--------------------------------------------------
architecture behav of ALUControl is
begin
	Process(ALUOp,Funct)
begin
	if(ALUOp = "00") then
	Operation <= "0010";
	elsif(ALUOp = "01") then
	Operation <= "0110";
	elsif(ALUOp = "10" and Funct = "100000") then
	Operation <= "0010";
	elsif(ALUOp = "10" and Funct = "100010") then
	Operation <= "0110";
	elsif(ALUOp = "10" and Funct = "100100") then
	Operation <= "0000";
	elsif(ALUOp = "10" and Funct = "100101") then
	Operation <= "0001";
	elsif(ALUOp = "10" and Funct = "101010") then
	Operation <= "0111";
	elsif(ALUOp = "ZZ") then
	Operation <= "ZZZZ";
		end if;
	end process;
end behav;
--------------------------------------------------