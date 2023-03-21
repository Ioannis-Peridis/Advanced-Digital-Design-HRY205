--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:16:54 05/19/2020
-- Design Name:   
-- Module Name:   C:/Xilinx/stack/stackTB.vhd
-- Project Name:  stack
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: stack
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
 
ENTITY stackTB IS
END stackTB;
 
ARCHITECTURE behavior OF stackTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT stack
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         Push : IN  std_logic;
         Pop : IN  std_logic;
         Empty : OUT  std_logic;
         Full : OUT  std_logic;
         AlmostEmpty : OUT  std_logic;
         AlmostFull : OUT  std_logic;
         NumberIN : IN  std_logic_vector(3 downto 0);
         NumberOUT : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal Push : std_logic := '0';
   signal Pop : std_logic := '0';
   signal NumberIN : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Empty : std_logic;
   signal Full : std_logic;
   signal AlmostEmpty : std_logic;
   signal AlmostFull : std_logic;
   signal NumberOUT : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: stack PORT MAP (
          CLK => CLK,
          RST => RST,
          Push => Push,
          Pop => Pop,
          Empty => Empty,
          Full => Full,
          AlmostEmpty => AlmostEmpty,
          AlmostFull => AlmostFull,
          NumberIN => NumberIN,
          NumberOUT => NumberOUT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
-- SOS Simulation Info --
--SET simulation time 3000ns to watch full simultaion.


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.

		RST<='1';
      wait for CLK_period;
		Rst<='0';
		wait for CLK_period*10; --wait ten periods without pop or push to stabilze memory
		RST<='0';
		Push<='1';--address 0001,value 1010
		Pop<='0';
		NumberIN<="1010";
      wait for CLK_period;
		Push<='0';
		wait for CLK_period*10; --wait ten periods without pop or push to stabilze memory
		Push<='1';--address 0010,value 0101
		NumberIN<="0101";
		wait for CLK_period;
		Push<='0';
		wait for CLK_period*10;--wait ten periods without pop or push to stabilze memory
		Push<='1';--address 0011,value 1001
		NumberIN<="1001";
		wait for CLK_period;
		Push<='0';
		wait for CLK_period*10;--wait ten periods without pop or push to stabilze memory
		Push<='1';--address 0100,value 0001
		NumberIN<="0001";
		wait for CLK_period;
		Push<='0';
		wait for CLK_period*10;--wait ten periods without pop or push to stabilze memory
		Push<='1';--address 0101,value 1001
		NumberIN<="1001";
		wait for CLK_period;
		Push<='0';
		wait for CLK_period*10;--wait ten periods without pop or push to stabilze memory
		Push<='1';--address 0110,value 1000
		NumberIN<="1000";
		wait for CLK_period;
		Push<='0';
		wait for CLK_period*10;--wait ten periods without pop or push to stabilze memory
		Push<='1';--address 0111,value 0000
		NumberIN<="0000";
		wait for CLK_period;
		Push<='0';
		wait for CLK_period*10;--wait ten periods without pop or push to stabilze memory
		Push<='1';--address 1000,value 1111
		NumberIN<="1111";
		wait for CLK_period;
		Push<='0';
		wait for CLK_period*10;--wait ten periods without pop or push to stabilze memory
		Push<='1';--address 1001,value 1001
		NumberIN<="1001";
		wait for CLK_period;
		Push<='0';
		wait for CLK_period*10;--wait ten periods without pop or push to stabilze memory
		Push<='1';--address 1010,value 1011
		NumberIN<="1011";
		wait for CLK_period;
		Push<='0';
		wait for CLK_period*10;--wait ten periods without pop or push to stabilze memory
		Push<='1';--overflow
		NumberIN<="1111";
		wait for CLK_period;
		Push<='0';
		wait for CLK_period*10;--wait ten periods without pop or push to stabilze memory
		Pop<='1';--tos pointer decrease
		wait for CLK_period;
		Pop<='0';
		wait for CLK_period*10;--wait ten periods without pop or push to stabilze memory
		Pop<='1';
		wait for CLK_period;
		Pop<='0';
		wait for CLK_period*10;--wait ten periods without pop or push to stabilze memory
		Pop<='1';
		wait for CLK_period;
		Pop<='0';
		wait for CLK_period*10;--wait ten periods without pop or push to stabilze memory
		Pop<='1';
		wait for CLK_period;
		Pop<='0';
		wait for CLK_period*10;--wait ten periods without pop or push to stabilze memory
		Pop<='1';
		wait for CLK_period;
		Pop<='0';
		wait for CLK_period*10;--wait ten periods without pop or push to stabilze memory
		Pop<='1';
		wait for CLK_period;
		Pop<='0';
		wait for CLK_period*10;--wait ten periods without pop or push to stabilze memory
		Pop<='1';
		wait for CLK_period;
		Pop<='0';
		wait for CLK_period*10;--wait ten periods without pop or push to stabilze memory
		Pop<='1';
		wait for CLK_period;
		Pop<='0';
		wait for CLK_period*10;--wait ten periods without pop or push to stabilze memory
		Pop<='1';
		wait for CLK_period;
		Pop<='0';
		wait for CLK_period*10;--wait ten periods without pop or push to stabilze memory
		Pop<='1';
		wait for CLK_period;
		Pop<='0';
		wait for CLK_period*10;--wait ten periods without pop or push to stabilze memory
		Pop<='1';
		wait for CLK_period;
		Pop<='0';
		wait for CLK_period*10;--wait ten periods without pop or push to stabilze memory
		Pop<='1';
		wait for CLK_period;
		Pop<='0';
		wait for CLK_period*10;--wait ten periods without pop or push to stabilze memory
	
      -- insert stimulus here 

      wait;
   end process;

END;
