library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE IEEE.STD_LOGIC_ARITH.ALL;
entity yunsuan is
port(clk,wt,rd,reset,sout,cin,sin:in std_logic;
cout:out std_logic;
RA,M,rw:in std_logic_vector(1 downto 0);
d: in std_logic_vector(3 downto 0);
s: in std_LOGIC_VECTOR(2 downto 0);
din:in std_logic_vector(1 downto 0); --用于选择输入00置入0-3位 01置入高4-7位 10置入PC 0-3位 11置入PC 4-7位
sel:buffer std_logic_vector(2 downto 0);
led7:out std_logic_vector(7 downto 0));
end;
architecture one of yunsuan is
	signal temp,f_r:std_logic_vector(7 downto 0);
	SIGNAL temp1 : Integer;
	signal data:std_logic_vector(3 downto 0);
	signal sel_temp:std_logic_vector(2 downto 0);
	SIGNAL cin1:std_logic:='0' ;
begin
process(clk,reset,M,ra,data)
variable R0,R1,R2,R3,PC:std_logic_vector(7 downto 0);
variable a,b :STD_LOGIC_VECTOR(7 DOWNTO 0);
VARIABLE z : STD_LOGIC_VECTOR(8 DOWNTO 0):="000000000";
begin
cin1<= cin xor '1';
temp1 <= Conv_Integer(A)+Conv_Integer(B)+Conv_Integer(cin1);
z:=Conv_Std_Logic_Vector(temp1,9);

if clk'event and clk='0' then
	if reset='0' then PC:="00000000";
	else 	case M is
				when "11"=>
					if sin='1' then
					case din is             -----置入4位2进制
					when "10"=>pc(3 downto 0):=d;
					when "11"=>pc(7 downto 4):=d;
					when others=>null;
					end case;
					else pc:=f_r;end if;
				when "00"=>PC:=PC+1;
				when "01"=>PC:=PC-1;
				when others=>NULL;
			end case;
		end if;	
	end if;

case RA is
	when"00"=>if wt='0'and rd='1' then
				if sin='1' then
				case din is             -----置入4位2进制
				when "00"=>R0(3 downto 0):=d;
				when "01"=>R0(7 downto 4):=d;
				when others=>null;end case;
				else R0:=f_r;end if;				
				else if wt='1' and rd='0' then temp<=R0;
				end if; end if;
	when"01"=>if wt='0'and rd='1' then 
				if sin='1' then
				case din is             -----置入4位2进制
				when "00"=>R1(3 downto 0):=d;
				when "01"=>R1(7 downto 4):=d;
				when others=>null;end case;
				else R1:=f_r;end if;				
				else if wt='1' and rd='0' then temp<=R1;
				end if; end if;	
	when"10"=>if wt='0'and rd='1' then
				if sin='1' then
				case din is             -----置入4位2进制
				when "00"=>R2(3 downto 0):=d;
				when "01"=>R2(7 downto 4):=d;
				when others=>null;end case;
				else R2:=f_r;end if;				
				else if wt='1' and rd='0' then temp<=R2;
				end if; end if;		
	when"11"=>if wt='0'and rd='1' then 
				if sin='1' then
				case din is             -----置入4位2进制
				when "00"=>R3(3 downto 0):=d;
				when "01"=>R3(7 downto 4):=d;
				when others=>null;end case;
				else R3:=f_r;end if;				
				else if wt='1' and rd='0' then temp<=R3;		
		end if; end if;
end case;			

case rw is                          ---选择置入暂存器A或B
when "10"=>
			if sout='1' then
				a(7 downto 0):=temp;
			else a(7 downto 0):=pc;
			end if;
when "01"=>
			if sout='1' then
				b(7 downto 0):=temp;
			else b(7 downto 0):=pc;
			end if;
when others=>null;
end case;

case s is
when "000"=>f_r<="00000000";cout<='0';---清零
when "001"=>f_r<=a(7 downto 0) and b(7 downto 0);cout<='0';---逻辑乘
when "010"=>f_r<=a(7 downto 0) or b(7 downto 0);cout<='0';---逻辑加
when "011"=>f_r<=a(7 downto 0) xor b(7 downto 0);cout<='0';--逻辑异或
when "100"=>f_r<=z(7 downto 0);cout<=z(8);---带进位输入的算术加法
when "101"=>f_r<=a(6 downto 0)&'0';cout<='0';---A左移一位
when "110"=>f_r<='0'& a(7 downto 1);cout<='0';---A右移一位
when "111"=>f_r<=a(7) & a(7 downto 1);cout<='0';--A算术右移一位
when others=>null;
end case;

if clk'event and clk='1' then
			sel_temp<=sel_temp+1;
			if sel_temp>="011" then sel_temp<="000";end if;
			sel<=sel_temp;
			case sel_temp is
					when "000"=>data<=temp(7 downto 4);
					when "001"=>data<=temp(3 downto 0);
					when "010"=>data<=PC(7 downto 4);
					when "011"=>data<=PC(3 downto 0);
					when others=>NULL;
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