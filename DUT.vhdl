-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the


library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(7 downto 0);
       	output_vector: out std_logic_vector(10 downto 0));
end entity;

architecture DutWrap of DUT is
   component atm is
	port(I: in std_logic_vector(7 downto 0);
	     p: out std_logic_vector(1 downto 0);
		  a: out std_logic_vector(1 downto 0);
		  b: out std_logic;
		  c: out std_logic_vector(5 downto 0));
   end component;

begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: atm
			port map (
					I(0) => input_vector(0),
               I(1) => input_vector(1),
					I(2) => input_vector(2),
					I(3) => input_vector(3),
					I(4)   => input_vector(4),
					I(5)  => input_vector(5),
					I(6)  => input_vector(6),
					I(7)   => input_vector(7),
				
					c(0) => output_vector(0),
					c(1) => output_vector(1),
					c(2) => output_vector(2),
					c(3) => output_vector(3),
					c(4) => output_vector(4),
					c(5) => output_vector(5),
					b => output_vector(6),
					a(0) => output_vector(7),
					a(1) => output_vector(8),
					p(0) => output_vector(9),
					p(1) => output_vector(10));

end DutWrap;
