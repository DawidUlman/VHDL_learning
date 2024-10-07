library IEEE;
use IEEE.std_logic_1164.all;

entity test is
end test;

architecture tb of test is

component fsm is
port(
	clk: in std_logic;
	r: in std_logic;
    s: in std_logic;
	y: out std_logic_vector(2 downto 0));
end component;

signal clk_in, r_in, s_in : std_logic;
signal y_out: std_logic_vector(2 downto 0);
signal Stop : BOOLEAN;

begin 

	DUT: fsm port map(clk_in, r_in, s_in, y_out);

	clkGen: process 
    begin
        while not Stop loop
        	clk_in <= '0';
     		 wait for 2 NS;
      		clk_in <= '1';
      		wait for 2 NS;
		end loop;
        wait;
	end process clkGen;
    
    ResetGen: process
  	begin
      r_in <= '0';
      wait for 10 NS;
      r_in <= '1';
      wait for 50 NS;
      r_in <= '0';
      wait for 20 NS;
	  r_in <= '1';
      Stop <= TRUE;
	  wait;
    end process ResetGen;
    
    startGen: process
    begin 
    	s_in <='0';
        wait for 13 NS;
        s_in <='1';
        wait for 7 NS;
        s_in <='0';
        wait for 7 NS;
        s_in <='1';
        wait for 7 NS;
        s_in <='0';
        wait for 7 NS;
        s_in <='1';
        wait;
     end process startGen;
  
end tb;