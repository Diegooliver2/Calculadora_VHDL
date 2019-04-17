library ieee;
use ieee.std_logic_1164.all;

entity Inversor is
port
	(
		x : in std_logic_vector(3 downto 0);
		y : out std_logic_Vector(6 downto 0);
		Co : out std_logic
	);
end Inversor;

architecture archInv of inversor is

component conversor is
	port(
		I : in std_logic_vector(3 downto 0);
		Y : out std_logic_vector(6 downto 0)
		);
end component;

signal s : std_logic_vector(3 downto 0);
signal ya : std_logic_vector(6 downto 0);

begin

	s <= not(x);
	Co <= '0';
	
	Yld : conversor port map(s, ya);

	y <= ya;
end archInv;