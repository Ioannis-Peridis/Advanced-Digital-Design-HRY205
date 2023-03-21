--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:48:26 05/16/2020
-- Design Name:   
-- Module Name:   C:/Xilinx/stack/controlTB.vhd
-- Project Name:  stack
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: control
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
 
ENTITY controlTB IS
END controlTB;
 
ARCHITECTURE behavior OF controlTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         Push : IN  std_logic;
         Pop : IN  std_logic;
         Empty : OUT  std_logic;
         Full : OUT  std_logic;
         AlmostEmpty : OUT  std_logic;
         AlmostFull : OUT  std_logic;
         MemoryAddress : OUT  std_logic_vector(3 downto 0);
         WriteEnable : OUT  std_logic_vector(0 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal Push : std_logic := '0';
   signal Pop : std_logic := '0';

 	--Outputs
   signal Empty : std_logic;
   signal Full : std_logic;
   signal AlmostEmpty : std_logic;
   signal AlmostFull : std_logic;
   signal MemoryAddress : std_logic_vector(3 downto 0);
   signal WriteEnable : std_logic_vector(0 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control PORT MAP (
          CLK => CLK,
          RST => RST,
          Push => Push,
          Pop => Pop,
          Empty => Empty,
          Full => Full,
          AlmostEmpty => AlmostEmpty,
          AlmostFull => AlmostFull,
          MemoryAddress => MemoryAddress,
          WriteEnable => WriteEnable
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
	
			RST<='1';--RST to empty status
			wait for CLK_period; 
			RST<='0';
         Push<='1';--Push 12 times to advance to memory=1010 , and try to overdflow.
         Pop<='0';
			wait for CLK_period*12;
         Push<='0';
         Pop<='1';--Pop 12 times to reach to memory=0000 , and try to underflow.
			wait for CLK_period*12;
			Pop<='0';
			RST<='1';--RST to empty status
			wait;
   end process;

END;
