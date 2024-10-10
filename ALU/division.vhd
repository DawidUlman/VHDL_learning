library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.subtraction.all;

package division is 

type result is record
  sub : std_logic_vector(7 downto 0);
  res : std_logic;
end record;

function div(P, B : in std_logic_vector(7 downto 0)) return result;

end package division;

package body division is

function div(P, B : in std_logic_vector(7 downto 0)) return result is
	variable X_temp : Result;
begin
  	if B > P then 
    	X_temp.res := '0';
    	X_temp.sub := P;
  	else 
    	X_temp.res := '1';
   		X_temp.sub := sub8(P, B, '0').D;
  	end if;
  return X_temp;
end;

end package body division;