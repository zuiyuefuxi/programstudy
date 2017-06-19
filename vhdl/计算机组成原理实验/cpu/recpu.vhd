library ieee;                               
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity recpu is
	port(rd,reset,wt,clk:in std_logic;
		RA,M:in std_logic_vector(1 downto 0);
		D:in std_logic_vector(15 downto 0);
		sel:buffer std_logic_vector(2 downto 0);
		led7:out std_logic_vector(7 downto 0));
end entity recpu;


architecture one of recpu is
	signal R0,R1,R2,R3,PC,temp:std_logic_vector(7 downto 0);--buffering
	signal data:std_logic_vector(3 downto 0);
	signal sel_temp:std_logic_vector(2 downto 0);
	begin
		process(clk,reset,M)
			begin
				if clk'event and clk='0' then
					if reset='0' then PC<="00000000"; 
				else case M is
						when "00"=>PC<=D(15 downto 8); 
						when "01"=>PC<=PC+1; 
						when "10"=>PC<=PC-1; 
						when others=>NULL; 
					end case; 
					end if; 
				end if; 
		end process;
		
		
		process(RA,wt,rd)
			begin
				case RA is 
					when"00"=>if wt='0'and rd='1' then R0<=D(7 downto 0); 
								else if wt='1' and rd='0' then temp<=R0; 
								end if;
								end if; 

					when"01"=>if wt='0'and rd='1' then R1<=D(7 downto 0); 
								else if wt='1' and rd='0' then temp<=R1; 
								end if;
								end if; 
					when"10"=>if wt='0'and rd='1' then R2<=D(7 downto 0); 
								else if wt='1' and rd='0' then temp<=R2; 
								end if;
								end if; 
					when"11"=>if wt='0'and rd='1' then R3<=D(7 downto 0); 
								else if wt='1' and rd='0' then temp<=R3; 
								end if;
								end if; 
				end case;
		end process;
		
		
		process(clk)
			begin
				if clk'event and clk='1' then sel<=sel_temp+1; 
				if sel_temp>="011" then sel_temp<="000";
				end if; 
				sel<=sel_temp;
				case sel_temp is 
					when "000"=>data<=temp(7 downto 4); 
					when "001"=>data<=temp(3 downto 0); 
					when "010"=>data<=PC(7 downto 4); 
					when "011"=>data<=PC(3 downto 0); 
					when others=>NULL; 
				end case;
				end if;
		end process;
		
		
		process(data)
			begin
				case data is 
					WHEN "0000"=>led7<="00111111";--0 
					WHEN "0001"=>led7<="00000110";--1 
					WHEN "0010"=>led7<="01011011";--2 
					WHEN "0011"=>led7<="01001111";--3 
					WHEN "0100"=>led7<="01100110";--4 
					WHEN "0101"=>led7<="01101101";--5 
					WHEN "0110"=>led7<="01111101";--6 
					WHEN "0111"=>led7<="00000111";--7 
					WHEN "1000"=>led7<="01111111";--8 
					WHEN "1001"=>led7<="01101111";--9 
					WHEN "1010"=>led7<="01110111";--10 
					WHEN "1011"=>led7<="01111100";--11 
					WHEN "1100"=>led7<="00111001";--12 
					WHEN "1101"=>led7<="01011110";--13 
					WHEN "1110"=>led7<="01111001";--14 
					WHEN "1111"=>led7<="01110001";--15 
					WHEN OTHERS =>NULL; 
				end case; 
		end process; 
end one;