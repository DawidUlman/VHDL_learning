library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.division.all;
use work.multiplication.all;
use work.addition.all;
use work.subtraction.all;

entity ALU is 
	port(
    	A, B : in std_logic_vector(7 downto 0);
        S : in std_logic_vector(2 downto 0);
        Clk : in std_logic; 
        Y : out std_logic_vector(15 downto 0) := (others => '0');
    );
end ALU;

architecture Beh of ALU is 
signal C  : std_logic_vector(7 downto 0); 
signal D  : std_logic_vector(15 downto 0);
begin 

	selection: process (S, Clk)
    	variable O : std_logic_vector(7 downto 0) := (others => '0');
    begin
    if rising_edge(Clk) then 
    	case S is
          when "000" => Y <= O & add8(A, B, '0').S;
          when "001" => Y <= O & sub8(A, B, '0').D;
          when "010" => Y <= O & (A and B);
          when "011" => Y <= O & (A or B);
          when "100" => Y <= O & (A xor B);
          when "101" => Y <= O & not A;
          when "110" => Y <= O & C;
          when "111" => Y <= D;
          when others => Y <= (others => '0');
      end case;
    end if;
    end process selection;
    
	division: process (Clk)
        variable i : integer:= 7;
        variable X : result;
        variable P : std_logic_vector(7 downto 0) := "00000000";
    begin
      if rising_edge(Clk) and i >= 0 then
          if B = "00000010" then 
            C <= '0' & A(7 downto 1);
          else
            P := P(6 downto 0) & A(i);
            X := div(P, B);
            C(i) <= X.res;
            P := X.sub;
          end if;
          i := i - 1;
      end if;
    end process division;
    
    multiplier: process(Clk)
    variable T : std_logic;
    variable i : integer:= 0;
    variable C : std_logic;
    variable O : std_logic_vector(15 downto 0) := (others=>'0');
    begin 
    	if rising_edge(Clk) and i < 8 then 
        	T := B(i);
            if B = "00000010" then
            	D <= O(15 downto 7) & A & '0';
            else
              if i = 0 then 
                  D <= O(15 downto 8) & mult(A, T);
                  C := '0';
              else
                  O(7+i downto i) := mult(A, T);
                  D <= add16(D, O, C).S;
                  C := add16(D, O, C).C_out;
              end if;
            end if;
        	i := i+1;
        end if;
    end process multiplier;
    
end Beh;