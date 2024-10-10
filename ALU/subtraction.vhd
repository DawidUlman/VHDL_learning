library IEEE;
use IEEE.std_logic_1164.all;

package subtraction is 
	
  type result1 is record 
	D, C_out : std_logic;
  end record result1;
  
  type result2 is record 
      D : std_logic_vector(7 downto 0);
      C_out : std_logic;
  end record result2;
	
  function sub(A, B, C_in : in std_logic) return result1;
  function sub8(A, B : in std_logic_vector(7 downto 0); C_in : in std_logic;) return result2;

end package subtraction;

package body subtraction is
	
    function sub(A, B, C_in : in std_logic) return result1 is
    	variable Y : result1;
    begin
    	Y.D := A xor B xor C_in;
    	Y.C_out := (C_in and not(A xor B)) or (B and not A);
    	return Y; 
    end;

	function sub8(A, B : in std_logic_vector(7 downto 0); C_in : in std_logic) return result2 is
    	variable Y : result2;
        variable C : std_logic_vector(8 downto 0);
    begin
        C(0) := C_in;
    	for i in 0 to 7 loop
          Y.D(i) := sub(A(i), B(i), C(i)).D;
          C(i+1) := sub(A(i), B(i), C(i)).C_out;
        end loop;
        Y.C_out := C(8);
    	return Y;
    end;

end package body subtraction;