library IEEE;
use IEEE.std_logic_1164.all;

entity mux is
	port(
    	X : in std_logic_vector(7 downto 0);
        S : in std_logic_vector(2 downto 0);
        Y : out std_logic;
        );
end mux;

architecture mx of mux is 
begin
	process(X, S)
	begin
      case S is
          when "000" => Y <= X(0);
          when "001" => Y <= X(1);
          when "010" => Y <= X(2);
          when "011" => Y <= X(3);
          when "100" => Y <= X(4);
          when "101" => Y <= X(5);
          when "110" => Y <= X(6);
          when "111" => Y <= X(7);
          when others => Y <= '0';
      end case;
	end process;
end mx;