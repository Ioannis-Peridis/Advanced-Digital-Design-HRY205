----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:25:06 03/23/2020 
-- Design Name: 
-- Module Name:    clau - Behavioral 
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


--carry look ahead unit implementation
entity clau is
    Port ( --inputs and outputs declaration
			  P : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           G : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           Cin : in  STD_LOGIC;
           C3 : out  STD_LOGIC;
           C : out  STD_LOGIC_VECTOR(2 DOWNTO 0));
end clau;

--architectural implementation of carry look ahead unit
architecture Behavioral of clau is

begin

C(0)<=G(0) OR (P(0) AND Cin);
C(1)<=G(1) OR (P(1) AND G(0)) OR (P(1) AND P(0) AND Cin);
C(2)<=G(2) OR (P(2) AND G(1)) OR (P(2) AND P(1) AND G(0)) OR (P(2) AND P(1) AND P(0) AND Cin);
C3<=G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND Cin);

end Behavioral;

