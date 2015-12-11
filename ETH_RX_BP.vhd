----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:13:59 08/21/2012 
-- Design Name: 
-- Module Name:    ETH_RX_BP - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ETH_RX_BP is
    Port ( RX_CLK : in  STD_LOGIC;
				CLK : in  STD_LOGIC;
           RX_DV : in  STD_LOGIC;
           PHY_RXD : in  STD_LOGIC_VECTOR (7 downto 0);
           RESET : in  STD_LOGIC;
			  RX_ACTIVE :  out  STD_LOGIC;
           DATA_OUT_PHY : out  STD_LOGIC_VECTOR (8 downto 0);
           WR_PHY : out  STD_LOGIC);
end ETH_RX_BP;

architecture Behavioral of ETH_RX_BP is

	type TON_state2 is (WAITING,wait_preamable,recive_data_PHY);
	signal STATE2 : TON_state2 :=WAITING;
	signal RX_DV2 :  std_logic :='0';
	signal RX_DV3 :  std_logic :='0';
	signal DATA_IN : std_logic_vector (7 downto 0):=x"00";
	
	signal active_counter : integer range 0 to 200000000 :=0;

begin

process(CLK)
begin
if(rising_edge(CLK))then

	if(RX_DV3/=RX_DV2)then
		active_counter<=0;
		RX_ACTIVE<='1';
	elsif(active_counter<=125000000)then  ---- timeout 0.1 sec
		RX_ACTIVE<='1';
		active_counter<=active_counter+1;
	else
		RX_ACTIVE<='0';
	end if;
		
end if;
end process;

process(RX_CLK,RESET)
begin
if(reset ='1')then
	state2<=waiting;
	RX_DV3<='0';
	RX_DV2<='0';
	DATA_IN<=x"00";
elsif(rising_edge(RX_CLK))then
	DATA_IN<=PHY_RXD;
	RX_DV2<=RX_DV;	
	RX_DV3<=RX_DV2;	
	

	
	
case(state2)is
	when	waiting => if(RX_DV2='1' and RX_DV3='0')then
								state2<=wait_preamable;
							else
								state2<=waiting;
							end if;
								DATA_OUT_PHY<='0' & DATA_IN;
								WR_PHY<='0';
								
	when	wait_preamable =>
						  if(DATA_IN=x"D5")then
								state2<=recive_data_PHY;
							else
								state2<=wait_preamable;
																
							end if;	
								DATA_OUT_PHY<='0' & DATA_IN;
								WR_PHY<='0';
							
	when	recive_data_PHY => 							
							if(RX_DV3='1')then
								DATA_OUT_PHY<='0' & DATA_IN;
								state2<=recive_data_PHY;								
							else
								state2<=waiting;
								DATA_OUT_PHY<='1' & DATA_IN;						
							end if;
								WR_PHY<='1';
							
	when others => WR_PHY<='0';
end case;	
end if;
end process;


end Behavioral;

