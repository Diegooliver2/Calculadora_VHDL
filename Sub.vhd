library ieee;
use ieee.std_logic_1164.all;

entity Sub is
port
	(
		A, B: in std_logic_vector(3 downto 0);
		Yl : out std_logic_vector(6 downto 0);
		Co   : out std_logic
	);
end Sub;

architecture archSub of Sub is

component Subtrator is
port
	(
		Cisub, Asub, Bsub : in std_logic;
		Cosub, Ssub    : out std_logic
	);
end component;

component menor is
port
	(
		x,y : in std_logic_vector(3 downto 0);
		yme : out std_logic;
		S : out std_logic_vector(6 downto 0)
	);
end component;

component conversor is
	port
		(
			I : in std_logic_vector(3 downto 0);
			Y : out std_logic_vector(6 downto 0)
		);
end component;

signal carry : std_logic_vector(3 downto 0);
signal s : std_logic_vector(3 downto 0);
signal Sa : std_logic_vector(6 downto 0);
signal  subt  : std_logic_vector(3 downto 0);
signal auxSb : std_logic_vector(3 downto 0);
signal auxrSb : std_logic;
signal ya : std_logic_vector(6 downto 0);

begin
	sub0 : subtrator port map('0', A(0), B(0), carry(0), subt(0));
	sub1 : subtrator port map(carry(0), A(1), B(1), carry(1), subt(1));
	sub2 : subtrator port map(carry(1), A(2), B(2), carry(2), subt(2));
	sub3 : subtrator port map(carry(2), A(3), B(3), carry(3), subt(3));
	Co <= carry(3);

	AuxSub : Menor port map(A, B, auxrSb, Sa);
	 
	auxSb(0) <= not(auxrSb);
	auxSb(1) <= not(auxrSb);
	auxSb(2) <= not(auxrSb);
	auxSb(3) <= not(auxrSb);
	
	s <= subt and auxSb;
	
	Yld: conversor port map(s, Ya);
	
	with auxrSb select	
		Yl <= ya when '0',
				Sa when '1';
	
	
end archSub;
	