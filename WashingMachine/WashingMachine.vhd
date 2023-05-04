library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WashingMachine is 
port(switch,clock: in std_logic; pump, motor: out std_logic);
end ghasala;

architecture behaviour of WashingMachine IS
signal ticks: integer;
signal seconds: integer;
begin
process(switch, clock) is
begin
if switch = '0' then 
pump <= '0';
motor <='0';
ticks<= 0;
else
 if rising_edge(clock) then
	ticks <=ticks+1;
	if ticks =50000000 then
		ticks<=0;
		seconds<=seconds+1;
		if seconds =1 then pump<='1'; else if seconds =11 then pump<='0'; motor<='1'; end if;end if;
	end if;
 end if;
end if;
end process;
end behaviour;