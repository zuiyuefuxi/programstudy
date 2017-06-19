library ieee;
 use ieee.std_logic_1164.all;
 use ieee.std_logic_unsigned.all;

 entity FRQ is
 port(clk_in:in std_logic;
 clk_out:out std_logic);
 end;
architecture one of FRQ is
 signal temp:std_logic_vector(2 downto 0);
 begin
 process(clk_in)
 begin
 if clk_in'event and clk_in='1' then
 temp<=temp+1;
 clk_out<=temp(2);
 end if;
 end process; end;
