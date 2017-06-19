library ieee;
 use ieee.std_logic_1164.all;
 use ieee.std_logic_unsigned.all;

 entity PC is
 port(clk,reset,load,add:in std_logic;
 inn:in std_logic_vector(7 downto 0);
 output:buffer std_logic_vector(7 downto 0));
 end;
 architecture one of PC is
 begin
 process(clk)
 begin
 --wt<=load&add;
 if clk'event and clk='1' then
 if reset='1' then output<="00000000";
 else if load='1' then output<=inn;
 else if add='1' then output<=output+1;
 else output<=output-1; end if;
 end if;
 end if;
 end if;
 end process;
 end;
