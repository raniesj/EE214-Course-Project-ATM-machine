
library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity priority is
	port(Y: in std_logic_vector(2 downto 0);
		  o: out std_logic_vector(1 downto 0));
end entity priority;

Architecture struct of priority is
signal p, q: std_logic;

begin

	not1: INVERTER
	port map(A =>Y(1), Y => p);

	and1: AND_2
	port map(A => p, B => Y(0), Y => q);
	
	or1: OR_2
	port map(A => q, B => Y(2), Y => o(0));
	
	or2: OR_2
	port map(A => Y(2), B => Y(1), Y => o(1));
	
end struct;