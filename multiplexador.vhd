library ieee;
use ieee.std_logic_1164.all;
entity multiplexador is

port(
  S : in std_logic_vector(2 downto 0);
  X0,X1,X2,X3,X4 : in std_logic_vector(6 downto 0);
  YS : out std_logic_vector(6 downto 0)
);
end multiplexador;

architecture archM of multiplexador is

begin

	WITH S SELECT
	  YS <= X0 WHEN "001",
				X1 WHEN "010",
				X2 WHEN "011",
				X3 WHEN "100",
				X4 WHEN "101",
				"0000000" WHEN OTHERS;
end archM;
