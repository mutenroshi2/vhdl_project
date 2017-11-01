
library ieee;
use ieee.std_logic_1164.all;
--------------------------------------------------
entity Control_1 is 
port(Opcode :in std_logic_vector(5 downto 0); 
WB : out std_logic_vector(1 downto 0);
M : out std_logic_vector(2 downto 0);
EX : out std_logic_vector(3 downto 0);
Jump : out std_logic
 ); 
end Control_1; 
--------------------------------------------------
architecture behav1 of Control_1 is 
begin


	Process(Opcode)
begin
	case Opcode is
	when "000000" => 
		 EX(0) <= '1';
		 M(0) <= '0'; 
		 M(1) <= '0';
		 WB(1) <= '0';
		 M(2) <= '0';
		 EX(3) <= '0';
		 WB(0) <= '1';
		 Jump <= '0';
		 EX(2 downto 1) <= "10";
		
	when "100011" => 
		 EX(0) <= '0';
		 M(0) <= '0'; 
		 M(1) <= '1';
		 WB(1) <= '1';
		 M(2) <= '0';
		 EX(3) <= '1';
		 WB(0) <= '1';
		 Jump <= '0';
		 EX(2 downto 1) <= "00";

	when "101011" => 
		 EX(0) <= 'X';
		 M(0) <= '0'; 
		 M(1) <= '0';
		 WB(1) <= 'X';
		 M(2) <= '1';
		 EX(3) <= '1';
		 WB(0) <= '0';
		 Jump <= '0';
		 EX(2 downto 1) <= "00";

	when "000100" => 
		 EX(0) <= 'X';
		 M(0) <= '1'; 
		 M(1) <= '0';
		 WB(1) <= 'X';
		 M(2) <= '0';
		 EX(3) <= '0';
		 WB(0) <= '0';
		 Jump <= '0';
		 EX(2 downto 1) <= "01";
	
	when "000010" => 
		 EX(0) <= '0';
		 M(0) <= '0'; 
		 M(1) <= '0';
		 WB(1) <= '0';
		 M(2) <= '0';
		 EX(3) <= '0';
		 WB(0) <= '0';
		 Jump <= '1';
		 EX(2 downto 1) <= "00";

	when "ZZZZZZ" =>
		EX(0) <= '0';
		 M(0) <= '0'; 
		 M(1) <= '0';
		 WB(1) <= '0';
		 M(2) <= '0';
		 EX(3) <= '0';
		 WB(0) <= '0';
		 Jump <= '0';
		 EX(2 downto 1) <= "ZZ";
	when others => 
end case;
end process;
end behav1;
--------------------------------------------------