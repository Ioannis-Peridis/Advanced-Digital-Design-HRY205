----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:26:56 03/23/2020 
-- Design Name: 
-- Module Name:    cgpu - Behavioral 
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
--library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;



--carry generate propagate unit implementation
entity cgpu is
    Port (-- inputs and outputs declaration
			  A : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           B : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           P : out  STD_LOGIC_VECTOR(3 DOWNTO 0);
           G : out  STD_LOGIC_VECTOR(3 DOWNTO 0));
end cgpu;

--architecture implementation of carry genereate propagate unit
architecture Behavioral of cgpu is

begin

G<=A AND B;
P<=A XOR B;

end Behavioral;

