library IEEE;
use IEEE.std_logic_1164.all;

entity adder is 
	port(
    	A : in std_logic;
        B : in std_logic;
        C_in : in std_logic;
        S : out std_logic;
        C_out : out std_logic;);
end adder;

architecture full of adder is 
begin

	S <= A xor B xor C_in;
    C_out <= (A and B) or (C_in and (A xor B));
    
end full;