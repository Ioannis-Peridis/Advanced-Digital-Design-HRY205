----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:32:05 05/01/2020 
-- Design Name: 
-- Module Name:    FSM - Behavioral 
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

entity FSM is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Control : out  STD_LOGIC_VECTOR(2 DOWNTO 0));
end FSM;

architecture Behavioral of FSM is
	TYPE state_type IS (S0,S1,S2,S3,S4);
	SIGNAL state:state_type;

begin
	process
	begin
		-- wait for clock
		WAIT UNTIL CLK'EVENT and CLK='1';
		-- if Rst=1 return to state S0
		if RST='1' then
			state<=S0;
		-- else the state is one of the following	
		else
		CASE state IS
				-- When we are in state S0, go at the state, the input indicates
				WHEN S0=>
					if (A xor B)='0'then
						state<=S0;
					elsif (A='0') and (B='1') then
						state<=S4;
					else 
						state<=S1;
					end if;
				-- When we are in state S1, go at the state, the input indicates
				WHEN S1=>
					if (A xor B)='0' then
						state<=S1;
					elsif (A='0') and (B='1') then
						state<=S0;
					else 
						state<=S2;
				   end if;
				-- When we are in state S2, go at the state, the input indicates
				WHEN S2=>
					if (A xor B)='0' then
						state<=S2;
					elsif (A='0') and (B='1') then
						state<=S1;
					else 
						state<=S3;	
					end if;
				-- When we are in state S3, go at the state, the input indicates
				WHEN S3=>
					if (A xor B)='0' then
						state<=S3;
					elsif (A='0') and (B='1') then
						state<=S2;
					else 
						state<=S4;	
					end if;
				-- When we are in state S4, go at the state, the input indicates
				WHEN S4=>
					if (A xor B)='0' then
						state<=S4;
					elsif (A='0') and (B='1') then
						state<=S3;
					else 
						state<=S0;
					end if;
				-- For all the other occassions return to state S0
				WHEN OTHERS=>
						state<=S0;
					
			end CASE;
		end if;
		
	end process;
	
-- The Control(0)-LSB, is '1' when one of the following happens.
Control(0)<= '1' WHEN((state = S0 and (A='1' and B='0')) or (state = S1 and ((A xor B)='0')) or (state = S2 and (A='0' and B='1')) or
(state= S2 and (A='1' and B='0')) or (state = S3 and ((A xor B)='0')) or (state = S4 and (A='0' and B='1'))) 
-- Otherwise '0'.
ELSE '0';	
-- The Control(1), is '1' when one of the following happens.				
Control(1)<= '1' WHEN((state = S1 and (A='1' and B='0')) or (state = S2 and ((A xor B)='0')) or (state = S2 and (A='1' and B='0')) or
(state = S3 and (A='0' and B='1')) or (state = S3 and ((A xor B)='0')) or (state= S4 and (A='0' and B='1')))
-- Otherwise '0'.
ELSE '0';	
-- The Control(3)-MSB, is '1' when one of the following happens.						
Control(2)<= '1' WHEN((state = S0 and (A='0' and B='1')) or (state = S4 and 
((A xor B)='0')) or (state = S3 and (A='1' and B='0'))) 
-- Otherwise '0'.
ELSE'0';

		
end Behavioral;

