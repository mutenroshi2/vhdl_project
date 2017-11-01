library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
--------------------------------------------------
entity ALU is 
port(a :in std_logic_vector(31 downto 0); 
b :in std_logic_vector(31 downto 0); 
oper :in std_logic_vector(3 downto 0); 
result :buffer std_logic_vector(31 downto 0); 
zero :buffer std_logic; 
overflow:buffer std_logic ); 
end ALU; 
--------------------------------------------------
architecture behav1 of ALU is 
component ZERO_DET32 is
 port(x :in std_logic_vector(31 downto 0); 
y :out std_logic ); 
end component ZERO_DET32; 
begin
	Process(b,oper)
	variable temp_result : std_logic_vector(31 downto 0) := (others=>'0');
	variable temp : std_logic := '0';
begin
overflow <= '0';
	if (oper = "0000") then 
	temp_result := a and b;
	elsif (oper = "0001") then
	temp_result := a or b;
	elsif (oper = "0010") then
	temp_result := a + b; 
	if(a(31)='0') and (b(31)='0') and (temp_result(31)='1') then temp := '1';
	elsif(a(31)='1') and (b(31) = '1') and (temp_result(31)='0') then temp := '0';
	else temp := '0';
	end if;
	elsif (oper = "0110") then 
	temp_result := a - b;
	if(a(31)='0') and (b(31)='1') and (temp_result(31)='1') then temp := '1';
	elsif(a(31)='1') and (b(31) = '0') and (temp_result(31)='0') then temp := '0';
	else temp := '0';
	end if;
	elsif (oper = "1100") then 
	temp_result := a nor b;
	elsif (oper = "0111")then 
	if (a < b) then
	temp_result := a;
	elsif(b > a) then
	temp_result := b;
	end if;
	elsif (oper = "ZZZZ") then
	temp_result := (others=>'Z');

end if;
result <= temp_result;
overflow <= temp;
end process;
A1 : Zero_Det32 port map(result,zero);
end behav1;
--------------------------------------------------