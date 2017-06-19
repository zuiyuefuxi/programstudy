library ieee;
 use ieee.std_logic_1164.all;
 use ieee.std_logic_unsigned.all;

 entity IR is
 port(clk1,clk2,aadd:in std_logic;
 input:in std_logic_vector(15 downto 0);
 sel:buffer std_logic_vector(2 downto 0);
 outadd:out std_logic;
 led7:out std_logic_vector(7 downto 0));
 end;

 architecture one of IR is
 signal sel_temp:std_logic_vector(2 downto 0);
 signal data:std_logic_vector(3 downto 0);
 begin
 process(clk1,clk2)
 begin
 if clk1'event and clk1='1' then
 if aadd='1' then outadd<='1';
 else outadd<='0'; end if;
 end if;
 if clk2'event and clk2='1' then
 sel_temp<=sel_temp+1;
 if sel_temp>="011" then sel_temp<="000"; end if; sel<=sel_temp;
 case sel_temp is
 when"000"=>data<=input(15 downto 12);
 when"001"=>data<=input(11 downto 8);
 when"010"=>data<=input(7 downto 4); when"011"=>data<=input(3 downto 0); when others=>null;
 end case;
 end if;
 case data is
 WHEN "0000"=> led7<="00111111";--0 
 WHEN "0001"=> led7<="00000110";--1 
 WHEN "0010"=> led7<="01011011";--2 
 WHEN "0011"=> led7<="01001111";--3 
 WHEN "0100"=> led7<="01100110";--4 
 WHEN "0101"=> led7<="01101101";--5 
 WHEN "0110"=> led7<="01111101";--6 
 WHEN "0111"=> led7<="00000111";--7 
 WHEN "1000"=> led7<="01111111";--8 
 WHEN "1001"=> led7<="01101111";--9 
 WHEN "1010"=> led7<="01110111";--10 
 WHEN "1011"=> led7<="01111100";--11 
 WHEN "1100"=> led7<="00111001";--12 
 WHEN "1101"=> led7<="01011110";--13 
 WHEN "1110"=> led7<="01111001";--14 
 WHEN "1111"=> led7<="01110001";--15 
 WHEN OTHERS =>NULL;
 end case;
 end process;
 end;
