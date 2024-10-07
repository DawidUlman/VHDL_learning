library IEEE;
use IEEE.std_logic_1164.all;

entity test is
end test;

architecture tb of test is

component adder8 is
	port(
    	A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(7 downto 0);
        C_in : in std_logic;
        S : out std_logic_vector(7 downto 0);
        C_out : out std_logic;
        );
end component;

signal a, b, s : std_logic_vector(7 downto 0);
signal c_in, c_out :  std_logic;

begin
	
    c_in <= '0';
    DUT: adder8 port map(a, b, c_in, s, c_out);
    
    process
    begin
    	a<="00000001";
		b<="00000010";
		wait for 5 ns;	
		a<="00100001";
		b<="00010010";
		wait for 5 ns;	
		a<="00000101";
		b<="00000110";
        wait;
	end process;
    
end tb;