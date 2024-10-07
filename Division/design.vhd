library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.subtraction.all;

entity division is
    port(
        A, B : in std_logic_vector(7 downto 0);
        Clk : in std_logic; 
        Y : out std_logic_vector(7 downto 0) := (others => '0');
        );
end division;

architecture div of division is 

type result is record
  sub : std_logic_vector(7 downto 0);
  res : std_logic;
end record;

function division(P, B : in std_logic_vector(7 downto 0); i : integer) return result is
    variable X_temp : Result;
begin
  if B > P then 
    X_temp.res := '0';
    X_temp.sub := P;
  else 
    X_temp.res := '1';
    X_temp.sub := sub8(P, B, '0').D;
  end if;
  return X_temp;
end;

begin
    process (Clk)
        variable i : integer:= 7;
        variable X : result;
        variable P : std_logic_vector(7 downto 0) := "00000000";
    begin
      if rising_edge(Clk) and i >= 0 then
          if B = "00000010" then 
            Y <= '0' & A(7 downto 1);
          else
            P := P(6 downto 0) & A(i);
            X := division(P, B, i);
            Y(i) <= X.res;
            P := X.sub;
          end if;
          i := i - 1;
      end if;
    end process;
end div;