library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.addition.all;

package multiplication is

function mult(A : in std_logic_vector(7 downto 0); T : in std_logic) return std_logic_vector;

end package multiplication;

package body multiplication is

function mult(A : in std_logic_vector(7 downto 0); T : in std_logic) return std_logic_vector is
	variable temp : std_logic_vector(7 downto 0);
begin 
	if T = '1' then 
      	temp := A;
  	else
        temp := "00000000";
	end if;
	return temp;
end;

end package body multiplication;