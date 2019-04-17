library ieee;
use ieee.std_logic_1164.all;

entity menor is
port
	(
		x,y : in std_logic_vector(3 downto 0);
		yme : out std_logic;
		S : out std_logic_vector(6 downto 0)
	);
end menor;

architecture archMenor of menor is
begin

	yme <= (y(3) and not(x(3)))
	or ((y(3) xnor x(3)) and (y(2) and not(x(2))))
	or ((y(3) xnor x(3)) and (y(2) xnor x(2)) and (y(1) and not(x(1))))
	or ((y(3) xnor x(3)) and (y(2) xnor x(2)) and (y(1) xnor x(1)) and (y(0) and not(x(0))));
	
	S <= not("0000000");
	
end archMenor;