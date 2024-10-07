library IEEE;
use IEEE.std_logic_1164.all;

entity sub8 is 
	port(
    	A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(7 downto 0);
        C_in : in std_logic;
        D : out std_logic_vector(7 downto 0);
        C_out : out std_logic;
        );
end sub8;

architecture Beh of sub8 is 

component sub is
Port (A,B,C_in : in STD_LOGIC;
       D,C_out : out STD_LOGIC);
end component;

signal C : std_logic_vector(6 downto 0);

begin
	
    FS1: sub port map(A(0), B(0), C_in, D(0), C(0));
    FS2: sub port map(A(1), B(1), C(0), D(1), C(1)); 
    FS3: sub port map(A(2), B(2), C(1), D(2), C(2));
    FS4: sub port map(A(3), B(3), C(2), D(3), C(3)); 
    FS5: sub port map(A(4), B(4), C(3), D(4), C(4)); 
    FS6: sub port map(A(5), B(5), C(4), D(5), C(5)); 
    FS7: sub port map(A(6), B(6), C(5), D(6), C(6)); 
    FS8: sub port map(A(7), B(7), C(6), D(7), C_out);

end Beh;