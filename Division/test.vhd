library IEEE;
use IEEE.std_logic_1164.all;

entity test is 
end test;

architecture tb of test is

component division is 
	port(
    	A, B : in std_logic_vector(7 downto 0);
        Clk : in std_logic; 
        Y : out std_logic_vector(7 downto 0);
        );
end component;

signal a, b, y : std_logic_vector(7 downto 0);
signal clk : std_logic := '0';
signal Stop : BOOLEAN;

begin

	DUT : division port map(a, b, clk, y);

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
        wait for 50 ns;
        Stop <= TRUE;
        wait;
    end process sigGen;
    
end tb;
         