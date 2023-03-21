--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:39:14 03/23/2020
-- Design Name:   
-- Module Name:   C:/Xilinx/lab2/cgpuTB.vhd
-- Project Name:  lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cgpu
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
 
ENTITY cgpuTB IS
END cgpuTB;
 
ARCHITECTURE behavior OF cgpuTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cgpu
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         P : OUT  std_logic_vector(3 downto 0);
         G : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal P : std_logic_vector(3 downto 0);
   signal G : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cgpu PORT MAP (
          A => A,
          B => B,
          P => P,
          G => G
        );

   -- Clock process definitions
--   <clock>_process :process
--  begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
	
	 --testbench,input arguments initialization to make a simulation
	 
    -- hold reset state for 100 ns, in every "wait for 100 ns" command
      wait for 100 ns;	
      A<="0000";
		B<="0000";
		wait for 100 ns;
      A<="0000";
		B<="1111";
		wait for 100 ns;
      A<="0101";
		B<="1010";
		wait for 100 ns;
      A<="0011";
		B<="1100";
		wait for 100 ns;
      A<="1101";
		B<="0100";
		wait for 100 ns;
      A<="1111";
		B<="1111";
		wait for 100 ns;


      -- insert stimulus here 

      wait;
   end process;

END;
