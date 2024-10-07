library IEEE;
use IEEE.std_logic_1164.all;

entity fsm is
port(
	clk : in std_logic; 
	r : in std_logic;
    s : in std_logic;
    y : out std_logic_vector(2 downto 0));
end fsm;

architecture machine of fsm is 

type t_state is (IDLE, PREP, RUN, READY, ALMOST, WAITIN);
signal state: t_state;
begin 
	process(clk) is
    	variable i : integer := 0;
	begin
    	if r = '1' then
          case state is
          when IDLE => y <= "001";
          i := 0;
          state <= PREP;
          when PREP => y <= "010";
          state <= RUN;
          when RUN => y <= "011";
          state <= ALMOST;
          when ALMOST => y <= "100";
          i := i+1;
          if i = 3 then
              state <= READY;
          else 
              state <= ALMOST;
          end if;
          when READY => y <= "101";
          state <= WAITIN;
          when WAITIN => y <= "110";
          if s = '1' then 
          	state <= IDLE;
          else
          	state <= WAITIN;
          end if;
          when others => y <= "000";
          end case;
		else 
        	y <= "000";
        end if;
	end process;
end machine;
