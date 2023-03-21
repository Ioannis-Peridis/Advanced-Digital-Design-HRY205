----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:26:12 03/23/2020 
-- Design Name: 
-- Module Name:    su - Behavioral 
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
--library implementation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--Sum unit entity declaration
entity su is
    Port ( --in and out signal implementation
			  P : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           Cin : in  STD_LOGIC;
           C : in  STD_LOGIC_VECTOR(2 DOWNTO 0);
           S : out  STD_LOGIC_VECTOR(3 DOWNTO 0));
end su;

--architectural implementation of sum unit
architecture Behavioral of su is

begin

S(0)<=P(0) XOR Cin;
S(1)<=P(1) XOR C(0);
S(2)<=P(2) XOR C(1);
S(3)<=P(3) XOR C(2);


end Behavioral;

