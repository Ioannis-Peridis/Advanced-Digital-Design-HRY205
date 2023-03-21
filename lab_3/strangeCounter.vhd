----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:17:07 04/08/2020 
-- Design Name: 
-- Module Name:    strangeCounter - Behavioral 
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
use IEEE.numeric_std.all; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 
use IEEE.STD_LOGIC_ARITH.ALL; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity strangeCounter is
    Port ( -- Inputs/Outputs decleration       
			  CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Control : in  STD_LOGIC_VECTOR(2 DOWNTO 0);
           Count : out  STD_LOGIC_VECTOR(7 DOWNTO 0);
           Overflow : out  STD_LOGIC;
           Underflow : out  STD_LOGIC;
           Valid : out  STD_LOGIC);
end strangeCounter;

architecture Behavioral of strangeCounter is

-- Temporary signals used 
signal Counttemp: STD_LOGIC_VECTOR(7 DOWNTO 0);
signal Overflowtemp,Underflowtemp,Validtemp:STD_LOGIC;

begin 

-- In process is specified the functionality of the strange counter 
process
-- start of process
begin

WAIT UNTIL CLK'EVENT AND CLK='1';

-- if RST = 1, the strange counter's outputs are initialized at the wanted
-- values in order to start again. 
if RST='1' then 
	Counttemp<="00000000";
	Overflowtemp<='0';
	Underflowtemp<='0';
	Validtemp<='1';
	
-- else if RST = 0 
else 

-- If the signal ValidTemp = 1, Then we check for all the control values, whether an overflow or underflow occurs.
-- If there is one, the value of signal overflow or underflow is changed to 1, in appropriate manner, to showcase 
-- the reason of the error, and the ValidTemp becomes 0, to freeze the counter. In case that there is no error,
-- the counter is counting with the step that is given by the control values.
	if Validtemp='1' then
	
		if Control="000" then
			if (Counttemp<5) then
				Underflowtemp<='1';
				Validtemp<='0';
			else--(ctemp-5>0)
				Counttemp<=Counttemp-5;
			end if;--(counttemp)
			
		elsif Control="001" then
			if (Counttemp<0) then
				Underflowtemp<='1';
				Validtemp<='0';
			else--(ctemp-2>0)
				Counttemp<=Counttemp-2;
			end if;--(counttemp)
			
		elsif Control="010" then
			Counttemp<=Counttemp;
			
		elsif Control="011" then
			if (Counttemp>254) then
				Overflowtemp<='1';
				Validtemp<='0';
			else--(ctemp+1<255)
				Counttemp<=Counttemp+1;
			end if;--(counttemp)
			
		elsif Control="100" then
			if (Counttemp>253) then
				Overflowtemp<='1';
				Validtemp<='0';
			else--(ctemp+2<255)
				Counttemp<=Counttemp+2;
			end if;--(counttemp)
			
		elsif Control="101" then
			if (Counttemp>250) then
				Overflowtemp<='1';
				Validtemp<='0';
			else--(ctemp+5<255)
				Counttemp<=Counttemp+5;
			end if;--(counttemp)
			
		elsif Control="110" then
			if (Counttemp>249) then
				Overflowtemp<='1';
				Validtemp<='0';
			else--(ctemp+6<255)
				Counttemp<=Counttemp+6;
			end if;--(counttemp)
			
		else--(CONTROL=111)
			if (Counttemp>243) then
				Overflowtemp<='1';
				Validtemp<='0';
			else--(ctemp+12<255)
				Counttemp<=Counttemp+12;
			end if;--(counttemp)
			
		end if;--(control)
-- else if Valid = 0, The function of the counter is frozen, until it is reset(RST=1).
	else
		Counttemp<=Counttemp;
		Overflowtemp<=Overflowtemp;
		Underflowtemp<=Underflowtemp;
		
	end if;--(valid)

end if;--(rst)

end process;

-- Assigning the auxiliary signals to the final outputs of the circuit
Count<=Counttemp;
Valid<=Validtemp;
Underflow<=Underflowtemp;
Overflow<=Overflowtemp;

end Behavioral;

