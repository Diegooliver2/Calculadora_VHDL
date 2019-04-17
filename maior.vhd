library ieee;
use ieee.std_logic_1164.all;

entity maior is
port
	(
		x,y : in std_logic_vector(3 downto 0);
		yma : out std_logic;
		S : out std_logic_vector(6 downto 0)
	);
end maior;

architecture archMaior of maior is
begin

	yma <= (x(3)and not(y(3)))
	or ((x(3) xnor y(3)) and (x(2) and not(y(2))))
	or ((x(3) xnor y(3)) and (x(2) xnor y(2)) and (x(1) and not(y(1))))
	or ((x(3) xnor y(3)) and (x(2) xnor y(2)) and (x(1) xnor y(1)) and (x(0) and not(y(0))));
	
	S <= not("0000000");
	
end archMaior;