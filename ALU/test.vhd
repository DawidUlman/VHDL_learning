library IEEE;
use IEEE.std_logic_1164.all;

entity test is 
end test;

architecture tb of test is

signal a, b : std_logic_vector(7 downto 0);
signal y : std_logic_vector(15 downto 0);
signal s : std_logic_vector(2 downto 0);
signal clk : std_logic := '0';
signal Stop : BOOLEAN;

begin

	ALU : entity work.ALU(Beh) port map(a, b, s, clk, y);

	clkGen : process
    begin 
    	while not Stop loop 
        	clk <= '0';
            wait for 2 ns;
            clk <= '1';
            wait for 2 ns;
        end loop;
     	wait;
    end process clkGen;
    
    sigGen : process
    begin 
        A <= "10110110";
        B <= "00011010";
        s <= "000";
        wait for 5 ns;
        s <= "001";
        wait for 5 ns;
        s <= "010";
        wait for 5 ns;
        s <= "011";
        wait for 5 ns;
        s <= "100";
        wait for 5 ns;
        s <= "101";
        wait for 10 ns;
        s <= "110";
        wait for 5 ns;
        s <= "111";
        Stop <= TRUE;
        wait;
    end process sigGen;
    
end tb;
         