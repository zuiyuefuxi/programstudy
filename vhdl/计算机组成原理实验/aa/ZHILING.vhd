LIBRARY IEEE;  
USE IEEE.STD_LOGIC_1164.ALL;  
USE IEEE.STD_LOGIC_UNSIGNED.ALL;  
USE IEEE.STD_LOGIC_ARITH.ALL;  
  
 entity   ZHILING is
     PORT ( CLK,WE,KG:IN STD_LOGIC;  
           WTR,PC_IN:IN STD_LOGIC_VECTOR(1 DOWNTO 0);  
           INR:IN STD_LOGIC_VECTOR(3 DOWNTO 0);  
           COMMAND:IN STD_LOGIC_VECTOR(15 DOWNTO 0);  
           PC:BUFFER STD_LOGIC_VECTOR(1 DOWNTO 0);  
           SEL:BUFFER STD_LOGIC_VECTOR(2 DOWNTO 0);  
           SEG:BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0)  
          );  
END ENTITY ZHILING;  
  
ARCHITECTURE one OF ZHILING IS  
        SHARED VARIABLE CX,CY,CZ,OP,R1,R2,R3,R4:STD_LOGIC_VECTOR(3 DOWNTO 0);  
        SHARED VARIABLE X:STD_LOGIC_VECTOR(4 DOWNTO 0);  
        SHARED VARIABLE RX,RY,RZ:STD_LOGIC_VECTOR(1 DOWNTO 0);  
        SHARED VARIABLE TIMES:STD_LOGIC_VECTOR(3 DOWNTO 0);  
        SHARED VARIABLE STATE:INTEGER RANGE 0 TO 2 := 0;  
        SIGNAL CLK2:STD_LOGIC;  
    BEGIN  
        PROCESS(CLK2)   
        BEGIN  
            IF CLK2'EVENT AND CLK2='0' THEN  
                IF KG='0' THEN  
                    CASE WTR(1 DOWNTO 0) IS  
                        WHEN "00" => R1:=INR;  
                        WHEN "01" => R2:=INR;  
                        WHEN "10" => R3:=INR;  
                        WHEN "11" => R4:=INR;  
                        WHEN OTHERS => NULL;  
                    END CASE;  
                ELSE  
                    IF STATE=0 THEN  
                        IF WE='0' THEN   
                            PC<=PC_IN;  
                        ELSE  
                            IF PC = "10" THEN  
                                PC <= "00";  
                            ELSE  
                                PC<=PC+1;  
                            END IF;  
                        END IF;  
                        STATE:=1;  
                    END IF;  
                    IF STATE=1 THEN  
                        OP:=COMMAND(15 DOWNTO 12);  
                        RX:=COMMAND(11 DOWNTO 10);  
                        RY:=COMMAND(9 DOWNTO 8);  
                        RZ:=COMMAND(7 DOWNTO 6);  
                        CASE RX(1 DOWNTO 0) IS  
                            WHEN "00" => CX:=R1;  
                            WHEN "01" => CX:=R2;  
                            WHEN "10" => CX:=R3;  
                            WHEN "11" => CX:=R4;  
                            WHEN OTHERS => NULL;  
                        END CASE;  
                        CASE RY(1 DOWNTO 0) IS  
                            WHEN "00" => CY:=R1;  
                            WHEN "01" => CY:=R2;  
                            WHEN "10" => CY:=R3;  
                            WHEN "11" => CY:=R4;  
                            WHEN OTHERS => NULL;  
                        END CASE;  
                        CASE RZ(1 DOWNTO 0) IS  
                            WHEN "00" => CZ:=R1;  
                            WHEN "01" => CZ:=R2;  
                            WHEN "10" => CZ:=R3;  
                            WHEN "11" => CZ:=R4;  
                            WHEN OTHERS => NULL;  
                        END CASE;  
                        STATE:=2;  
                    END IF;  
                    IF STATE=2 THEN  
                        IF OP="0111" THEN  
                            CX:=CZ XOR CY;  
                        ELSIF OP="1000" THEN  
                            CX:='0' & CY(3 DOWNTO 1);  
                        END IF;  
                        CASE RX(1 DOWNTO 0) IS  
                            WHEN "00" => R1:=CX;  
                            WHEN "01" => R2:=CX;  
                            WHEN "10" => R3:=CX;  
                            WHEN "11" => R4:=CX;  
                            WHEN OTHERS => NULL;  
                        END CASE;  
                        CASE RY(1 DOWNTO 0) IS  
                            WHEN "00" => R1:=CY;  
                            WHEN "01" => R2:=CY;  
                            WHEN "10" => R3:=CY;  
                            WHEN "11" => R4:=CY;  
                            WHEN OTHERS => NULL;  
                        END CASE;  
                        CASE RZ(1 DOWNTO 0) IS  
                            WHEN "00" => R1:=CZ;  
                            WHEN "01" => R2:=CZ;  
                            WHEN "10" => R3:=CZ;  
                            WHEN "11" => R4:=CZ;  
                            WHEN OTHERS => NULL;  
                        END CASE;  
                        STATE:=0;  
                      
                    --ELSE   
                        --STATE:=0;  
                    END IF;  
                END IF;       
            END IF;  
        END PROCESS;  
        PROCESS(CLK)  
        BEGIN  
            IF CLK'EVENT AND CLK='1' THEN  
                TIMES:=TIMES+1;  
                IF TIMES="0" THEN   
                    CLK2<=NOT(CLK2);  
                END IF;  
                SEL<=SEL + 1;  
                CASE SEL(2 DOWNTO 0) IS  
                    WHEN "000" => X:="11111";  
                    WHEN "001" => X:="11111";  
                    WHEN "010" => X:="11111";  
                    WHEN "011" => X(4 DOWNTO 0):='0'&R1;  
                    WHEN "100" => X(4 DOWNTO 0):='0'&R2;  
                    WHEN "101" => X(4 DOWNTO 0):='0'&R3;  
                    WHEN "110" => X(4 DOWNTO 0):='0'&R4;  
                    WHEN "111" => X:="11111";  
                    WHEN OTHERS => NULL;  
                END CASE;  
                CASE X(4 DOWNTO 0) IS  
                    WHEN "00000" => SEG<="00111111";  
                    WHEN "00001" => SEG<="00000110";  
                    WHEN "00010" => SEG<="01011011";  
                    WHEN "00011" => SEG<="01001111";  
                    WHEN "00100" => SEG<="01100110";  
                    WHEN "00101" => SEG<="01101101";  
                    WHEN "00110" => SEG<="01111101";  
                    WHEN "00111" => SEG<="00000111";  
                    WHEN "01000" => SEG<="01111111";  
                    WHEN "01001" => SEG<="01101111";  
                    WHEN "01010" => SEG<="01110111";  
                    WHEN "01011" => SEG<="01111100";  
                    WHEN "01100" => SEG<="00111001";  
                    WHEN "01101" => SEG<="01011110";  
                    WHEN "01110" => SEG<="01111001";  
                    WHEN "01111" => SEG<="01110001";  
                    WHEN OTHERS => SEG<="00000000";  
                END CASE;  
            END IF;  
        END PROCESS;  
END one;
