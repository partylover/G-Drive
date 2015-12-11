----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:40:02 08/17/2012 
-- Design Name: 
-- Module Name:    ETH_SELECT_LOOP - Behavioral 
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

entity ETH_SELECT_LOOP is
    Port ( DIN1 : in  STD_LOGIC_VECTOR (8 downto 0);
           DIN2 : in  STD_LOGIC_VECTOR (8 downto 0);
			  WR_EN1 : in  STD_LOGIC;
           WR_EN2 : in  STD_LOGIC;
			  
           ENABLE1 : in  STD_LOGIC;
			  WR_ENO : out  STD_LOGIC;
			  ENABLE : out  STD_LOGIC;
			  DB : out  STD_LOGIC;
           ODIN1 : out  STD_LOGIC_VECTOR (8 downto 0));
end ETH_SELECT_LOOP;

architecture Behavioral of ETH_SELECT_LOOP is
begin
	process(DIN1,DIN2,ENABLE1,WR_EN1,WR_EN2)
	begin
		case enable1 is
		when '0' =>
				ODIN1<=DIN1;
				WR_ENO<=WR_EN1;
				ENABLE<='0';
				DB<=WR_EN1;
		when others =>
				ODIN1<=DIN2;
				WR_ENO<=WR_EN2;
				ENABLE<='1';
				DB<=WR_EN2;
		end case;
		
	end process;

end Behavioral;

