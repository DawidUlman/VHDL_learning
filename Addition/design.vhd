library IEEE;
use IEEE.std_logic_1164.all;

entity adder8 is 
	port(
    	A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(7 downto 0);
        C_in : in std_logic;
        S : out std_logic_vector(7 downto 0);
        C_out : out std_logic;
        );
end adder8;

architecture full of adder8 is 

component adder is
Port (A,B,C_in : in STD_LOGIC;
       S,C_out : out STD_LOGIC);
end component;

signal C : std_logic_vector(6 downto 0);

begin

	FA1: adder port map(A(0), B(0), C_in, S(0), C(0));
    FA2: adder port map(A(1), B(1), C(0), S(1), C(1)); 
    FA3: adder port map(A(2), B(2), C(1), S(2), C(2));
    FA4: adder port map(A(3), B(3), C(2), S(3), C(3)); 
    FA5: adder port map(A(4), B(4), C(3), S(4), C(4)); 
    FA6: adder port map(A(5), B(5), C(4), S(5), C(5)); 
    FA7: adder port map(A(6), B(6), C(5), S(6), C(6)); 
    FA8: adder port map(A(7), B(7), C(6), S(7), C_out); 

end full;