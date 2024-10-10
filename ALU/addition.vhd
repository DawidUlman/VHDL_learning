library IEEE;
use IEEE.std_logic_1164.all;

package addition is

type result1 is record
	S, C_out : std_logic;
end record result1;

type result2 is record 
	S : std_logic_vector(7 downto 0);
    C_out : std_logic;
end record result2;

type result3 is record 
	S : std_logic_vector(15 downto 0);
    C_out : std_logic;
end record result3;

function add(A, B, C_in : in std_logic) return result1;
function add8(A, B : in std_logic_vector(7 downto 0); C_in : in std_logic) return result2;
function add16(A, B : in std_logic_vector(15 downto 0); C_in : in std_logic) return result3;

end package addition;

package body addition is
	
    function add(A, B, C_in : in std_logic) return result1 is
    	variable Y : result1;
    begin 
    	Y.S := A xor B xor C_in;
        Y.C_out := (A and B) or (C_in and (A xor B));
   		return Y;
    end;
    
    function add8(A, B : in std_logic_vector(7 downto 0); C_in : in std_logic) return result2 is
    	variable Y : result2;
		variable C : std_logic_vector(8 downto 0);
    begin
        C(0) := C_in;
    	for i in 0 to 7 loop
          Y.S(i) := add(A(i), B(i), C(i)).S;
          C(i+1) := add(A(i), B(i), C(i)).C_out;
        end loop;
        Y.C_out := C(8);
    	return Y;
	end;
    
    function add16(A, B : in std_logic_vector(15 downto 0); C_in : in std_logic) return result3 is
    	variable Y : result3;
		variable C : std_logic_vector(16 downto 0);
    begin
        C(0) := C_in;
    	for i in 0 to 15 loop
          Y.S(i) := add(A(i), B(i), C(i)).S;
          C(i+1) := add(A(i), B(i), C(i)).C_out;
        end loop;
        Y.C_out := C(16);
    	return Y;
	end;
end package body addition;