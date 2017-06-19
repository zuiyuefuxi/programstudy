library ieee;                                   ------¿â³ÌÐò°üµ÷ÓÃ
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity alu is
port(cin,sel,wt,clk:in std_logic;
	s:in std_logic_vector(2 downto 0);
	d:in std_logic_vector(7 downto 0);
	cou:out std_logic;
	se:buffer std_logic_vector(2 downto 0);
	led7:out std_logic_vector(7 downto 0));
end;
architecture one of alu is
	shared Variable a,b:std_logic_vector(7 downto 0);
	shared Variable aa,bb,temp:std_logic_vector(8 downto 0);
	signal data:std_logic_vector(3 downto 0);
	signal f:std_logic_vector(7 downto 0);
begin
process(sel , wt)
	begin
	if sel='1' then
		if wt='0' then a:=d;
		else if wt='1' then b:=d;
		end if;
		end if;
	end if;	
	end process;
	process(s)
	begin
	case s is
		when "000"=>f<="00000000";
		when "001"=>for i in 0 to 7 loop
			f(i)<=a(i)and b(i);
			end loop;
		when "010"=>for i in 0 to 7 loop
			f(i)<=a(i) or b(i);
			end loop;
		when "011"=>for i in 0 to 7 loop
			f(i)<=a(i) xor b(i);
			end loop;
		when "100"=> aa:='0'&a;bb:='0'&b;
				temp:=aa+bb+cin;
				cou<=temp(8);
				f<=temp(7 downto 0);
		when "101"=>f<=a(6 downto 0)&'0';--Âß¼­×óÒÆ
		when "110"=>f<='0'& a(7 downto 1);--Âß¼­ÓÒÒÆ
		when "111"=>f<=a(7)& a(7 downto 1);--ËãÊõÓÒÒÆ
		when others =>NULL;
	end case;
	end process;
	process(clk)
	begin
	if clk'event and clk='1' then
		if se>="101" then se<="000";
else  se<=se+1;
		end if;
		case se is
			when "101"=>data<=a(7 downto 4);
			when "000"=>data<=a(3 downto 0);
			when "001"=>data<=b(7 downto 4);
			when "010"=>data<=b(3 downto 0);
			when "011"=>data<=f(7 downto 4);
			when "100"=>data<=f(3 downto 0);
			when others=>NULL;
		end case;
	end if;
end process;
process(data)
		begin
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