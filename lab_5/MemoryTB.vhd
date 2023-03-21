--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:39:44 05/13/2020
-- Design Name:   
-- Module Name:   C:/Xilinx/stack/MemoryTB.vhd
-- Project Name:  stack  
-- Description:   

-- Target Device:  
-- Tool versions:-- 
-- VHDL Test Bench Created by ISE for module: Memory
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
 
ENTITY MemoryTB IS
END MemoryTB;
 
ARCHITECTURE behavior OF MemoryTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Memory
    PORT(
         clka : IN  std_logic;
         wea : IN  std_logic_vector(0 downto 0);
         addra : IN  std_logic_vector(3 downto 0);
         dina : IN  std_logic_vector(3 downto 0);
         douta : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clka : std_logic := '0';
   signal wea : std_logic_vector(0 downto 0) := (others => '0');
   signal addra : std_logic_vector(3 downto 0) := (others => '0');
   signal dina : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal douta : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clka_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Memory PORT MAP (
          clka => clka,
          wea => wea,
          addra => addra,
          dina => dina,
          douta => douta
        );

   -- Clock process definitions
   clka_process :process
   begin
		clka <= '0';
		wait for clka_period/2;
		clka <= '1';
		wait for clka_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		-- Just a test to see how memory works.
		wea(0)<='1';
		addra<="0001";
		dina<="0101";
		wait for clka_period;
		wea(0)<='1';
		addra<="0010";
		dina<="0111";
		wait for clka_period;
		wea(0)<='0';
		addra<="0001";
		wait for clka_period;
		wea(0)<='0';
		addra<="0010";
      wait for clka_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
