----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:42:37 05/19/2020 
-- Design Name: 
-- Module Name:    stack - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity stack is  -- The stack that intergrates the control and memory modules.
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Push : in  STD_LOGIC;
           Pop : in  STD_LOGIC;
           Empty : out  STD_LOGIC;
           Full : out  STD_LOGIC;
           AlmostEmpty : out  STD_LOGIC;
           AlmostFull : out  STD_LOGIC;
           NumberIN : in  STD_LOGIC_VECTOR( 3 DOWNTO 0);
           NumberOUT : out  STD_LOGIC_VECTOR(3 DOWNTO 0));
end stack;

architecture Behavioral of stack is

component control is  -- The control Unit of our stack
port(
		 CLK : IN  std_logic;
       RST : IN  std_logic;
       Push : IN  std_logic;
       Pop : IN  std_logic;
       Empty : OUT  std_logic;
       Full : OUT  std_logic;
       AlmostEmpty : OUT  std_logic;
       AlmostFull : OUT  std_logic;
       MemoryAddress : OUT  std_logic_vector(3 downto 0);
       WriteEnable : OUT  std_logic_vector(0 downto 0));
end component;

component Memory is  -- The Memory Unit of or stack
port(
		clka : IN STD_LOGIC;
		wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		addra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		dina : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		douta : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end component;
-- Integral signals
signal tMemoryAddress:STD_LOGIC_VECTOR(3 DOWNTO 0);
signal tWriteEnable:STD_LOGIC_VECTOR(0 DOWNTO 0);

begin

contr:control 
-- Mapping inputs and outputs of Control
port map(
		 CLK => CLK,
       RST => RST,
       Push => Push,
       Pop => Pop,
       Empty => Empty, 
       Full => Full,
       AlmostEmpty => AlmostEmpty,
       AlmostFull => AlmostFull,
       MemoryAddress => tMemoryAddress,
       WriteEnable(0) => tWriteEnable(0));

memor:Memory
-- Mapping inputs and outputs of memory
port map(
		clka =>CLK,
		wea(0) => tWriteEnable(0),
		addra => tMemoryAddress,
		dina => NumberIN,
		douta => NumberOUT);	
end Behavioral;

