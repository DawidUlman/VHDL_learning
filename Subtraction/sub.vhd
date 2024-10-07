library IEEE;
use IEEE.std_logic_1164.all;

entity sub is
	port(
    	A, B, C_in : in std_logic;
        D, C_out : out std_logic;
        );
end sub;

architecture Beh of sub is
begin
	D <= A xor B xor C_in;
    C_out <= (C_in and not(A xor B)) or (B and not A);
end Beh;