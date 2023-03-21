--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:45:54 03/23/2020
-- Design Name:   
-- Module Name:   C:/Xilinx/lab2/claa4bTB.vhd
-- Project Name:  lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: claa4b
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY claa4bTB IS
END claa4bTB;
 
ARCHITECTURE behavior OF claa4bTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT claa4b
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         C3 : OUT  std_logic;
         S : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal C3 : std_logic;
   signal S : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: claa4b PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          C3 => C3,
          S => S
        );

   -- Clock process definitions
  -- <clock>_process :process
   --begin
	--	<clock> <= '0';
	--	wait for <clock>_period/2;
	--	<clock> <= '1';
	--	wait for <clock>_period/2;
--end process;
 

   -- Stimulus process
   stim_proc: process
   begin		


	 --testbench,input arguments initialization to make a simulation
	 
    -- hold reset state for 100 ns, in every "wait for 100 ns" command      wait for 100 ns;	
		A<="0000";
		B<="0000";
		Cin<='0';
		wait for 100 ns;
		A<="0000";
		B<="0000";
		Cin<='1';
		wait for 100 ns;
		A<="0000";
		B<="1111";
		Cin<='0';
		wait for 100 ns;
		A<="0000";
		B<="1111";
		Cin<='1';
		wait for 100 ns;
		A<="0101";
		B<="1010";
		Cin<='0';
		wait for 100 ns;
		A<="0101";
		B<="1010";
		Cin<='1';
		wait for 100 ns;
		A<="0101";
		B<="0101";
		Cin<='0';
		wait for 100 ns;
		A<="0101";
		B<="0101";
		Cin<='1';
		wait for 100 ns;
		A<="0011";
		B<="1110";
		Cin<='0';
		wait for 100 ns;
		A<="0011";
		B<="1110";
		Cin<='1';
		wait for 100 ns;
		A<="1000";
		B<="0100";
		Cin<='0';
		wait for 100 ns;
		A<="1000";
		B<="0100";
		Cin<='1';
		wait for 100 ns;
		A<="1111";
		B<="1111";
		Cin<='0';
		wait for 100 ns;
		A<="1111";
		B<="1111";
		Cin<='1';
		wait for 100 ns;

     -- wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
