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
    	variable temp : result2;
        variable C : std_logic_vector(6 downto 0);
    begin
    	temp.D(0) := sub(A(0), B(0), C_in).D;
        C(0) := sub(A(0), B(0), C_in).C_out;
    	for i in 1 to 6 loop
          temp.D(i) := sub(A(i), B(i), C(i-1)).D;
          C(i) := sub(A(i), B(i), C(i-1)).C_out;
        end loop;
        temp.D(7) := sub(A(7), B(7), C(6)).D;
        temp.C_out := sub(A(7), B(7), C(6)).C_out;
    	return temp;
    end;

end package body subtraction;