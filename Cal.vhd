library ieee;
use ieee.std_logic_1164.all;

entity Cal is
	port
		(
			A, B : in std_logic_vector(3 downto 0);
			cs : in std_logic_vector(2 downto 0);
			btn : in std_logic;
			Yleds    : out std_logic_vector(6 downto 0);
			Co   : out std_logic
		);
end Cal;


architecture archSoma of Cal is

	component Soma is
	port
		(
			A, B: in std_logic_vector(3 downto 0);
			Yl : out std_logic_vector(6 downto 0);
			Co   : out std_logic
		);
	end component;

	component Sub is
	port
		(
			A, B: in std_logic_vector(3 downto 0);
			Yl : out std_logic_vector(6 downto 0);
			Co   : out std_logic
		);
	end component;

	component conversor is
	port(
			  I      : in std_logic_vector(3 downto 0);
			  Y		: out std_logic_vector(6 downto 0)
		);
	end component;

	component multiplexador is
	port(
	  S : in std_logic_vector(2 downto 0);
	  X0,X1,X2,X3,X4 : in std_logic_vector(6 downto 0);
	  YS : out std_logic_vector(6 downto 0)
	);
	end component;

	component Maior is
	port
		(
			x,y : in std_logic_vector(3 downto 0);
			yma : out std_logic;
			S : out std_logic_vector(6 downto 0)
		);
	end component;

	component menor is
	port
		(
			x,y : in std_logic_vector(3 downto 0);
			yme : out std_logic;
			S : out std_logic_Vector(6 downto 0)
		);
	end component;

	component inversor is
	port
		(
			x : in std_logic_vector(3 downto 0);
			y : out std_logic_Vector(6 downto 0);
			Co : out std_logic
		);
	end component;


	signal Ysub : std_logic_vector(6 downto 0);
	signal Ysoma : std_logic_vector(6 downto 0);
	signal Ymaior : std_logic_vector(6 downto 0);
	signal Ymenor : std_logic_vector(6 downto 0);
	signal Yinv : std_logic_vector(6 downto 0);

	signal CoSub : std_logic;
	signal CoSoma : std_logic;
	signal CoMaior : std_logic;
	signal CoMenor : std_logic;
	signal CoInv : std_logic;

	signal Ysaida : std_logic_vector(6 downto 0);


	begin

		subC : Sub port map(A, B, Ysub, CoSub);
		somaC : Soma port map(A, B, Ysoma, CoSoma);	
		maiorC : Maior port map(A, B, CoMaior, Ymaior);
		menorC : Menor port map(A, B, CoMenor, Ymenor);
		invC : Inversor port map(A, Yinv, CoInv);
					
		mult : multiplexador port map(cs, Ysub, Ysoma, Ymaior, Ymenor, Yinv, Ysaida);
		
		Co <= (((Cosub and (not(cs(2)) and not(cs(1)) and cs(0))) and btn)
		or ((Cosoma and (not(cs(2)) and (cs(1)) and not(cs(0)))) and btn)
		or ((CoMaior and (not(cs(2)) and (cs(1)) and (cs(0)))) and btn)
		or((CoMenor and ((cs(2)) and not(cs(1)) and not(cs(0)))) and btn)
		or ((CoInv and ((cs(2)) and not(cs(1)) and (cs(0)))) and btn));
		
		with btn select
			Yleds <= Ysaida when '1',
				not("0000000") when '0';
			
		
	
end archSoma;
	