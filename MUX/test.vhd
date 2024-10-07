library IEEE;
use IEEE.std_logic_1164.all;

entity test is
end test;

architecture tb of test is

component mux is 
	port(
    	X : in std_logic_vector(7 downto 0);
        S : in std_logic_vector(2 downto 0);
        Y : out std_logic;
        );
end component;

signal x : std_logic_vector(7 downto 0);
signal s : std_logic_vector(2 downto 0);
signal y : std_logic;

begin 

	DUT: mux port map(x, s, y);
    
    process
    begin
    	x <= "10011010";
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
        wait for 5 ns;
        s <= "110";
        wait for 5 ns;
        s <= "111";
        wait;
	end process;
    
end tb;