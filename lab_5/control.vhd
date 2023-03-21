----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:18:52 05/13/2020 
-- Design Name: 
-- Module Name:    control - Behavioral 
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
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:18:52 05/13/2020 
-- Design Name: 
-- Module Name:    control - Behavioral 
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

entity control is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Push : in  STD_LOGIC;
           Pop : in  STD_LOGIC;
           Empty : out  STD_LOGIC;
           Full : out  STD_LOGIC;
           AlmostEmpty : out  STD_LOGIC;
           AlmostFull : out  STD_LOGIC;
			  MemoryAddress: out STD_LOGIC_VECTOR(3 DOWNTO 0);
			  WriteEnable : out STD_LOGIC_VECTOR(0 DOWNTO 0));
			  
end control;

architecture Behavioral of control is
	
	TYPE state_type IS (STATEempty,STATEalmostEmpty,STATEregular,STATEfull,STATEalmostFull);
	SIGNAL state:state_type;
	signal tEmpty,tFull,tAlmostFull,tAlmostEmpty:STD_LOGIC;
	signal tWriteEnable:STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal tMemoryAddress:STD_LOGIC_VECTOR(3 DOWNTO 0);
	
begin
			
	process -- Process that handles the transtions between states and the outputs.
	begin -- process
		WAIT UNTIL CLK'EVENT and CLK='1';
	
		if RST='1' then
		state<=STATEempty;
		tEmpty<='1';
		tWriteEnable(0)<='0';
		tFull<='0';
		tAlmostEmpty<='0';
		tAlmostFull<='0';
		tMemoryAddress<="0000";
		
		else--RST=0
		CASE state IS
				WHEN STATEempty=> 		
					if Push='1' and Pop='0' then
					tWriteEnable(0)<='1';
					tMemoryAddress<=tMemoryAddress+1;
					state<=STATEalmostEmpty;
					tEmpty<='0';
					tAlmostEmpty<='1';
					else--any other case
					tWriteEnable(0)<='0';
					state<=STATEempty;
					tEmpty<='1';
					tAlmostEmpty<='0';
					end if;	
					
				WHEN STATEalmostEmpty=>	
					if Push='1' and Pop='0' then
						tWriteEnable(0)<='1';
						tMemoryAddress<=tMemoryAddress+1;
						if tMemoryAddress="0011" then 
						state<=STATEregular;
						tAlmostEmpty<='0';
						else--any other case
						state<=STATEalmostEmpty;
						tEmpty<='0';
						tAlmostEmpty<='1';
						end if;
					elsif Push='0' and Pop='1' then
						tWriteEnable(0)<='0';
						tMemoryAddress<=tMemoryAddress-1;
						if tMemoryAddress="0001" then 
						state<=STATEempty;
						tEmpty<='1';
						tAlmostEmpty<='0';
						else--any other case
						state<=STATEalmostEmpty;
						tEmpty<='0';
						tAlmostEmpty<='1';
						end if;
					end if;				
						
				WHEN STATEregular=>
					if Push='1' and Pop='0' then
						tWriteEnable(0)<='1';
						tMemoryAddress<=tMemoryAddress+1;
						if tMemoryAddress="0110" then 
						state<=STATEalmostFull;
						tAlmostFull<='1';
						else--any other case
						state<=STATEregular;
						tAlmostEmpty<='0';
						tAlmostFull<='0';
						end if;	
					elsif Push='0' and Pop='1' then 
						tWriteEnable(0)<='0';
						tMemoryAddress<=tMemoryAddress-1;
						if tMemoryAddress="0100" then 
						state<=STATEalmostEmpty;
						tEmpty<='0';
						tAlmostEmpty<='1';
						else--any other case
						state<=STATEregular;
						tAlmostEmpty<='0';
						tAlmostFull<='0';
						end if;
					end if;
						
				WHEN STATEalmostFull=>		
					if Push='1' and Pop='0' then
						tWriteEnable(0)<='1';
						tMemoryAddress<=tMemoryAddress+1;
						if tMemoryAddress="1001" then 
						state<=STATEfull;
						tFull<='1';
						tAlmostFull<='0';
						else--any other case
						state<=STATEalmostFull;
						tFull<='0';
						tAlmostFull<='1';
						end if;
					elsif Push='0' and Pop='1' then 
						tWriteEnable(0)<='0';
						tMemoryAddress<=tMemoryAddress-1;
						if tMemoryAddress="0111" then 
						state<=STATEregular;
						tAlmostFull<='0';
						else--any other case
						state<=STATEalmostFull;
						tFull<='0';
						tAlmostFull<='1';
						end if;
					end if;
					
					WHEN STATEfull=>
					if Push='0' and Pop='1' then 
					tWriteEnable(0)<='0';
					tMemoryAddress<=tMemoryAddress-1;
					state<=STATEalmostFull;
					tFull<='0';
					tAlmostFull<='1';
					else--any other case
					tWriteEnable(0)<='1';
					tMemoryAddress<="1010";
					state<=STATEfull;
					tFull<='1';
					tAlmostFull<='0';
					end if;
					
					end CASE;
				end if; -- RST condition
		end process;

-- Fill in the outputs in regards wih the integral signals.
 Empty<=tEmpty;
 Full<=tFull;
 AlmostEmpty<=tAlmostEmpty;
 AlmostFull<=tAlmostFull;
 MemoryAddress<=tMemoryAddress;
 WriteEnable(0)<=tWriteEnable(0);

end Behavioral;


