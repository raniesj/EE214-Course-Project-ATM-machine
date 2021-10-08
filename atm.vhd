--///////////////////////////////////////////////////////////////////////////

-- @ Soumyajit Langal (WEL IITB)
-- The skeleton code for Mid-Semester EE214. 

--///////////////////////////////////////////////////////////////////////////

library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
use work.priority;
use work.OR_6;


entity atm is
	port(I: in std_logic_vector(7 downto 0);
	     p: out std_logic_vector(1 downto 0);
		  a: out std_logic_vector(1 downto 0);
		  b: out std_logic;
		  c: out std_logic_vector(5 downto 0));
end entity atm;

architecture struct of atm is

component div is
generic(
			N : integer:=8; -- operand width
			NN : integer:=16 -- result width
        );
port (
			Nu: in std_logic_vector(N-1 downto 0);-- Nu (read numerator) is dividend
			D: in std_logic_vector(N-1 downto 0);-- D (read Denominator) is divisor
			RQ: out std_logic_vector(NN-1 downto 0)--upper N bits of RQ will have remainder and lower N bits will have quotient
) ;
end component;

component priority is
port(Y: in std_logic_vector(2 downto 0);
		  o: out std_logic_vector(1 downto 0));
end component;

component OR_6 is
port(A : in std_logic_vector(5 downto 0);
		  Y: out std_logic);
end component;

-- write code here
signal s1, s2, s3: std_logic_vector(7 downto 0);
signal y: std_logic_vector(2 downto 0);
signal a1: std_logic_vector(1 downto 0);
signal b1: std_logic;
signal c1: std_logic_vector(5 downto 0);
signal e1: std_logic_vector(5 downto 0);
signal e2: std_logic_vector(6 downto 0);
signal e3: std_logic_vector(9 downto 0);
begin

-- Write code here(don't worry about generic, just ignore it and do normal port mapping for div)

	Div1: div
	port map(Nu => I, D(7) => '0', D(6) => '1', D(5) => '1', D(4) => '0', D(3) => '0', D(2) => '1', D(1) => '0', D(0) => '0', 
	RQ(15) => s1(7), RQ(14) => s1(6), RQ(13) => s1(5), RQ(12) => s1(4), RQ(11) => s1(3), RQ(10) => s1(2),RQ(9) => s1(1), RQ(8) => s1(0), 
	RQ(7) => e1(5),RQ(6) => e1(4),RQ(5) => e1(3),RQ(4) => e1(2),RQ(3) => e1(1), RQ(2) => e1(0),RQ(1) => a1(1), RQ(0) => a1(0));
	Div2: div
	port map(Nu => s1, D(7) => '0', D(6) => '0', D(5) => '1', D(4) => '1', D(3) => '0', D(2) => '0', D(1) => '1', D(0) => '0', 
	RQ(15) => s2(7), RQ(14) => s2(6), RQ(13) => s2(5), RQ(12) => s2(4), RQ(11) => s2(3), RQ(10) => s2(2),RQ(9) => s2(1), RQ(8) => s2(0), 
	RQ(7) => e2(5),RQ(6) => e2(4),RQ(5) => e2(3),RQ(4) => e2(2),RQ(3) => e2(1), RQ(2) => e2(0),RQ(1) => e2(6), RQ(0) => b1);
	Div3: div
	port map(Nu => s2, D(7) => '0', D(6) => '0', D(5) => '0', D(4) => '0', D(3) => '0', D(2) => '0', D(1) => '0', D(0) => '1', 
	RQ(0) => c1(0),RQ(1) => c1(1), RQ(2) => c1(2), RQ(3) => C1(3), RQ(4) => C1(4), RQ(5)=> C1(5),
	 RQ(6)=> e3(0), RQ(7)=> e3(1), RQ(8)=> e3(2), RQ(9)=> e3(3),RQ(10)=> e3(4), RQ(11)=> e3(5), RQ(12)=> e3(6), RQ(13)=> e3(7), RQ(14)=> e3(8), RQ(15)=> e3(9));
	
	or1: OR_2
	port map(A => a1(1), B => a1(0), Y => y(2));
	
	or2: OR_2
	port map(A => b1, B => '0', Y => y(1));
	
	or6_1: OR_6
	port map(A => c1, Y => y(0));
	
	p1: priority
	port map(y => y, o => p);
	
	a <= a1;
	b <= b1;
	c <= c1;

end struct;
