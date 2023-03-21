--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:54:49 04/08/2020
-- Design Name:   
-- Module Name:   C:/Xilinx/lab3/strangeCounterTB.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: strangeCounter
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
 
ENTITY strangeCounterTB IS
END strangeCounterTB;
 
ARCHITECTURE behavior OF strangeCounterTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT strangeCounter
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         Control : IN  std_logic_vector(2 downto 0);
         Count : OUT  std_logic_vector(7 downto 0);
         Overflow : OUT  std_logic;
         Underflow : OUT  std_logic;
         Valid : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal Control : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal Count : std_logic_vector(7 downto 0);
   signal Overflow : std_logic;
   signal Underflow : std_logic;
   signal Valid : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: strangeCounter PORT MAP (
          CLK => CLK,
          RST => RST,
          Control => Control,
          Count => Count,
          Overflow => Overflow,
          Underflow => Underflow,
          Valid => Valid
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
		RST<='0';--0
		Control<="110";--6
		wait for CLK_period;
		Control<="001";--4
		wait for CLK_period;
		Control<="010";--stay in the same 4
		wait for CLK_period;
		Control<="000"; --Underflow -1
		wait for CLK_period;
		Control<="111";--it wont change, it waits for reset to be enabled
		wait for CLK_period;
		RST<='1';
		wait for CLK_period;
		RST<='0';--0
		Control<="011";--1
		wait for CLK_period;
		Control<="100";--11
		wait for CLK_period*5;
		Control<="000";--1
		wait for CLK_period*2;
		Control<="111";--253
		wait for CLK_period*36;
		Control<="101";--Overflow 258
		wait for CLK_period;
		Control<="101";--it wont change,it waits for reset to be enabled
		wait for CLK_period;
		RST<='1';
		wait for CLK_period;
		RST<='0';--0
		Control<="110";--6
		wait for Clk_period*20;
      -- insert stimulus here 

      wait;
   end process;

END;
