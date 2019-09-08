library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity signed_adder is
	port(
		aclr : in   std_logic;    
		clk  : in   std_logic;    
		a    : in   std_logic_vector;    
		b    : in   std_logic_vector;    
		q    : out  std_logic_vector
		);
end signed_adder;

architecture signed_adder_arch of signed_adder is  
	signal q_s : signed(a'high+1 downto 0); -- extra bit wide
	
begin -- architecture 
	assert(a'length >= b'length)    
		report "Port A must be the longer vector if different sizes!"    
		severity FAILURE;  
	q <= std_logic_vector(q_s);
	
	adding_proc: 
	process (aclr, clk)    
		begin      
			if (aclr = '1') then        
				q_s <= (others => '0');      
			elsif rising_edge(clk) then        
				q_s <= ('0'&signed(a)) + ('0'&signed(b));      
			end if; -- clk'd    
		end process;
end signed adder arch;