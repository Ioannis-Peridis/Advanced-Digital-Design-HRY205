--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:44:36 03/23/2020
-- Design Name:   
-- Module Name:   C:/Xilinx/lab2/suTB.vhd
-- Project Name:  lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: su
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
 
ENTITY suTB IS
END suTB;
 
ARCHITECTURE behavior OF suTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT su
    PORT(
         P : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         C : IN  std_logic_vector(2 downto 0);
         S : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal P : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';
   signal C : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal S : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: su PORT MAP (
          P => P,
          Cin => Cin,
          C => C,
          S => S
        );

   -- Clock process definitions
   --<clock>_process :process
   --begin
	--	<clock> <= '0';
	--	wait for <clock>_period/2;
	--	<clock> <= '1';
	--	wait for <clock>_period/2;
  -- end process;
 

   -- Stimulus process
   stim_proc: process
   begin		



	 --testbench,input arguments initialization to make a simulation
	 
    -- hold reset state for 100 ns, in every "wait for 100 ns" command      wait for 100 ns;
		P<="0000";
		C<="000";
		Cin<='0';
		wait for 100 ns;
		P<="0000";
		C<="000";
		Cin<='1';
		wait for 100 ns;
		P<="0101";
		C<="010";
		Cin<='0';
		wait for 100 ns;
		P<="0101";
		C<="010";
		Cin<='1';
		wait for 100 ns;
		P<="0011";
		C<="110";
		Cin<='0';
		wait for 100 ns;
		P<="0011";
		C<="110";
		Cin<='1';
		wait for 100 ns;
		P<="1101";
		C<="101";
		Cin<='0';
		wait for 100 ns;
		P<="1101";
		C<="101";
		Cin<='1';
		wait for 100 ns;
		P<="1111";
		C<="111";
		Cin<='0';
		wait for 100 ns;
		P<="1111";
		C<="111";
		Cin<='1';
		wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
