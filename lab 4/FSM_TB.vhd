--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:09:04 05/01/2020
-- Design Name:   
-- Module Name:   C:/Xilinx/FSM/FSM_TB.vhd
-- Project Name:  FSM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FSM
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
 
ENTITY FSM_TB IS
END FSM_TB;
 
ARCHITECTURE behavior OF FSM_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FSM
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         A : IN  std_logic;
         B : IN  std_logic;
         Control : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal Control : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM PORT MAP (
          CLK => CLK,
          RST => RST,
          A => A,
          B => B,
          Control => Control
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.	
		RST<='1';
      wait for CLK_period*10;
		RST<='0';
		A<='0';
		B<='0';
		-- stays at S0
		wait for CLK_period;
		A<='1';
		B<='1';
		-- stays at S0
		wait for CLK_period;
		A<='0';
		B<='1';
		-- go to S4
		wait for CLK_period;
		A<='0';
		B<='0';
		-- stays at S4
		wait for CLK_period;
		A<='1';
		B<='1';
		-- stays at S4
		wait for CLK_period;
		A<='0';
		B<='1';
		-- go to S3
		wait for CLK_period;
		A<='0';
		B<='0';
		-- stays at S3
		wait for CLK_period;
		A<='1';
		B<='1';
		-- stays at S3
		wait for CLK_period;
		A<='0';
		B<='1';
		-- go to S2
		wait for CLK_period;
		A<='0';
		B<='0';
		-- stays at S2
		wait for CLK_period;
		A<='1';
		B<='1';
		-- stays at S2
		wait for CLK_period;
		A<='0';
		B<='1';
		-- go to S1
		wait for CLK_period;
		A<='0';
		B<='0';
		-- stays at S1
		wait for CLK_period;
		A<='1';
		B<='1';
		-- stays at S1
		wait for CLK_period;
		A<='0';
		B<='1';
		-- go to S0
		wait for CLK_period;
		A<='0';
		B<='0';
		-- stays at S0
		wait for CLK_period;
		A<='1';
		B<='1';
		-- stays at S0
		wait for CLK_period;
		A<='1';
		B<='0';
		-- go to S1->S2->S3->S4
		wait for CLK_period*4;
		RST<='1';
		

      -- insert stimulus here 

      wait;
   end process;

END;
