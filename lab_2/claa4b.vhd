----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:28:17 03/23/2020 
-- Design Name: 
-- Module Name:    claa4b - Behavioral 
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


--carry look ahead unit 4 bit implementation
entity claa4b is
    Port ( --inputs and outputs declaration
			  A : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           B : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           Cin : in  STD_LOGIC;
           C3 : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR(3 DOWNTO 0));
end claa4b;

--architectural implementation of carry look ahead unit 4 bit
architecture Behavioral of claa4b is

--carry generate propagate component
component cgpu
port(
A : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
B : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
P : out  STD_LOGIC_VECTOR(3 DOWNTO 0);
G : out  STD_LOGIC_VECTOR(3 DOWNTO 0));
end component;

--carry look ahead unit component
component clau
port(
P : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
G : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
Cin : in  STD_LOGIC;
C3 : out  STD_LOGIC;
C : out  STD_LOGIC_VECTOR(2 DOWNTO 0));
end component;

--sum unit component
component su
port(
P : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
Cin : in  STD_LOGIC;
C : in  STD_LOGIC_VECTOR(2 DOWNTO 0);
S : out  STD_LOGIC_VECTOR(3 DOWNTO 0));
end component;

--integral signals
signal p,g: std_logic_vector(3 downto 0);
signal c : std_logic_vector(2 downto 0);

begin

--port mapping the 3 modules 
CarryPropagateGenerateUnit:cgpu
port map(
A=>A,
B=>B,
P=>p,
G=>g);

CarryLookAheadUnit:clau
port map(
P=>p,
G=>g,
Cin=>Cin,
C3=>C3,
C=>c);

SumUnit:su
port map(
C=>c,
Cin=>Cin,
P=>p,
S=>S);


end Behavioral;

