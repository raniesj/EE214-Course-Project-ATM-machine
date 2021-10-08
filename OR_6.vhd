library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity OR_6 is
	port(A : in std_logic_vector(5 downto 0);
		  Y: out std_logic);
		  
end entity OR_6;

Architecture struct of OR_6 is

signal p, q, r, s: std_logic;

begin

	or1: OR_2
	port map(A => A(5), B=> A(4), Y => p);
	or2: OR_2
	port map(A => A(3), B =>A(2), Y => q);
	or3: OR_2
	port map(A => A(1), B => A(0), Y => r);
	or4: OR_2
	port map(A => p, B => q, Y => s);
	or5: OR_2
	port map(A => s, B => r, Y => Y);
end struct;