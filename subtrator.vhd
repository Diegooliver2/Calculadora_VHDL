library ieee;
use ieee.std_logic_1164.all;

entity Subtrator is
port
	(
		Cisub, Asub, Bsub : in std_logic;
		Cosub, Ssub    : out std_logic
	);
end Subtrator;
 
architecture archSub of Subtrator is 

begin

	 Ssub <= ((Cisub and (Asub xnor Bsub)) or (not(Cisub) and (Asub xor Bsub)));
	 Cosub <= ((not(Asub) and (Bsub xor Cisub)) or (Bsub and Cisub));
	 
end archSub;
	