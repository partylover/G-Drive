----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:28:48 02/21/2007 
-- Design Name: 
-- Module Name:    serial_management - Behavioral 
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

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity serial_management is
    Port ( CLK : in  STD_LOGIC;
	 		CONFIG_REG : in  STD_LOGIC_VECTOR (31 downto 0);
				PHY_RESET_A_in : in  STD_LOGIC;
				PHY_RESET_B_in : in  STD_LOGIC;
           MDIO : out  STD_LOGIC;
           MDC : out  STD_LOGIC);
end serial_management;

architecture Behavioral of serial_management is

type mystate	is (waiting, header,data, header2,data2,waiting2,Preamable);
signal	state : mystate := waiting;

signal CLKx : std_logic :='0';
signal CLK_Counter : integer range 0 to 511 :=0;
signal Counter : integer range 0 to 2047 :=0; 

signal header_RD : std_logic_vector (5 downto 0) := "010101";
signal header_PHY : std_logic_vector (2 downto 0) := "000";
--signal header_PHY2 : std_logic_vector (2 downto 0) := "001";

signal REG_ADDRESS : std_logic_vector (4 downto 0) := "00000";

	signal POS_X : STD_LOGIC_VECTOR (3 downto 0) :=x"0";
	signal POS_Y : STD_LOGIC_VECTOR (3 downto 0) :=x"0";
	signal DIP_SW : STD_LOGIC_VECTOR (7 downto 0) :=x"00";
	signal DIP_SW1 : STD_LOGIC_VECTOR (2 downto 0) :="000";

------------------- BASIC CONTROL ----------------------
signal REG0_RESET : std_logic :='0';
signal REG0_LOOBBACK : std_logic :='0';
signal REG0_SPEED_select_b13 : std_logic :='0';
signal REG0_SPEED_select_b6 : std_logic :='1';
signal REG0_AUTONEOG : std_logic :='1';
signal REG0_POWER_DOWN : std_logic :='0';
signal REG0_Isolate : std_logic :='0';
signal REG0_RE_AUTONEG : std_logic :='0';
signal REG0_DUPLEX : std_logic :='1';
signal REG0_COL_TEST : std_logic :='0';
-------------REG 9 1000 BASE T control ---------------------
signal REG9_TEST_MODE : std_logic_vector (2 downto 0) :="000";
signal REG9_b12 : std_logic :='0';
signal REG9_b11 : std_logic :='0';
signal REG9_PORT_TYPE : std_logic :='0';
signal REG9_FULL_DUPLEX : std_logic :='1';
signal REG9_HALF_DUPLEX : std_logic :='1';
---------------------------------------

signal REG0_A : std_logic_vector (15 downto 0)  ; ---- register 0
signal REG0_B : std_logic_vector (15 downto 0)  ; ---- register 0
signal REG9 : std_logic_vector (15 downto 0)  ; ---- register 9
signal REG : std_logic_vector (15 downto 0)  := x"0000";

begin
POS_X<=CONFIG_REG(7 downto 4);
POS_Y<=CONFIG_REG(3 downto 0);
DIP_SW<=CONFIG_REG(15 downto 8);
DIP_SW1<=CONFIG_REG(26 downto 24);

REG0_A<=PHY_RESET_A_in & REG0_LOOBBACK & REG0_SPEED_select_b13 & REG0_AUTONEOG & REG0_POWER_DOWN & REG0_Isolate & REG0_RE_AUTONEG & REG0_DUPLEX & REG0_COL_TEST & REG0_SPEED_select_b6 & "000000";
REG0_B<=PHY_RESET_B_in & REG0_LOOBBACK & REG0_SPEED_select_b13 & REG0_AUTONEOG & REG0_POWER_DOWN & REG0_Isolate & REG0_RE_AUTONEG & REG0_DUPLEX & REG0_COL_TEST & REG0_SPEED_select_b6 & "000000";

REG9<=REG9_TEST_MODE & REG9_b12 & REG9_b11 & REG9_PORT_TYPE & REG9_FULL_DUPLEX & REG9_HALF_DUPLEX & x"00";




process(CLK)
begin

if(rising_edge(CLK))then
	if(CLK_Counter>=255)then
		CLK_Counter<=0;
		CLKx<=not CLKx;
	else
		CLK_Counter<=CLK_Counter+1;
	end if;
end if;
end process;


--MDC <= not CLKx;

MDC <= '0';

process(CLKx)
variable headerx : std_logic_vector (15 downto 0);
--variable headerx2 : std_logic_vector (15 downto 0);
begin

--headerx := header_RD & header_PHY & header_REG;
--headerx2 := header_RD & header_PHY2 & header_REG;


if(rising_edge(CLKx))then
headerx := "010100" & header_PHY & REG_ADDRESS & "10";
	case(state)is
		when	waiting	=>	MDIO <='0';
									if(Counter>=1023)then
										Counter<=0;
										state<=Preamable;
										
											if(header_PHY="000")then
												REG<=REG0_A;  ----- REG 0 PHY A
											else
												REG<=REG0_B;  ----- REG 0 PHY B	
											end if;
										
											if(header_PHY="001")then
												header_PHY<="000";
												
--												if(REG_ADDRESS="00000")then
--													REG_ADDRESS<="01001"; ----- REG ADD 9
--													REG<=REG9;  ----- REG 9
--												else
													REG_ADDRESS<="00000"; ----- REG ADD 0
													
													REG<=REG0_A;  ----- REG 0
												--end if;
												
											else
												header_PHY<=header_PHY+1;
											end if;
										--	header_PHY<="001";
									else
										Counter<=Counter+1;
									end if;
									
		when	Preamable	=>	MDIO <='1';	
									if(Counter>=31)then
										Counter<=0;
										state<=header;
									else
										state<=Preamable;
										Counter<=Counter+1;
									end if;
									
		
		when	header	=>		if(Counter>=15)then
										Counter<=0;
										state<=data;
									else
										Counter<=Counter+1;
										state<=header;
									end if;
									
									MDIO<=headerx(15-counter);
		
		when	data		=>		if(Counter=15)then
										Counter<=0;
										state<=waiting;
									else
										Counter<=Counter+1;
										state<=data;
									end if;
									
								--	MDIO<= 'Z';
									
									MDIO<= REG(15-counter);
									
--		when	waiting2	=>	MDIO <='1';
--									if(Counter=65)then
--										Counter<=0;
--										state<=header2;
--									else
--										Counter<=Counter+1;
--									end if;									
--									
--									
--									
--									
--		when	header2	=>		if(Counter=15)then
--										Counter<=0;
--										state<=data2;
--									else
--										Counter<=Counter+1;
--									end if;
--									
--									MDIO<=headerx2(15-counter);
--		
--		when	data2		=>		if(Counter=15)then
--										Counter<=0;
--										state<=waiting;
--									else
--										Counter<=Counter+1;
--									end if;
--									
--								--	MDIO<= 'Z';
--									
--									MDIO<= datax(15-counter);									
									
									
									
									
									
									
									
									
									
									
									
		
		when	others	=>	state<= waiting;
		
		end case;
end if;
		
end process;


end Behavioral;

