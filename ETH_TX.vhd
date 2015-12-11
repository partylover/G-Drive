----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:36:14 07/12/2012 
-- Design Name: 
-- Module Name:    ETH_TX - Behavioral 
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

entity ETH_TX is
	Port (  CLK : in  STD_LOGIC;
			  RESET : in  STD_LOGIC;
			  PHY_TXD : out  STD_LOGIC_VECTOR (7 downto 0);
        --   TX_CLK : in  STD_LOGIC;
           GTX_CLK : out  STD_LOGIC;
           TX_EN : out  STD_LOGIC;
         --  PHY_RESET : out  STD_LOGIC;
			  PHY_MDC : out  STD_LOGIC;
			  PHY_MDIO : out  STD_LOGIC;
			--  ENABLE_RX : in  STD_LOGIC;
			--	fifo_empty : in  STD_LOGIC;
			  DATA_IN : in  STD_LOGIC_VECTOR (8 downto 0);
			  RD_COUNT : in  STD_LOGIC_VECTOR (10 downto 0);
			  RD_EN : out  STD_LOGIC;
			  DEBUG1 : out  STD_LOGIC;
			  DEBUG2 : out  STD_LOGIC;
			  DEBUG3 : out  STD_LOGIC;
			  DEBUG4 : out  STD_LOGIC);
end ETH_TX;

architecture Behavioral of ETH_TX is
type mystate is (waiting,WAIT_FIFO_DATA,preamable_WB ,Header_WB,SEND_WB,EOF_WB ,preamable_VER ,Header_VER,SEND_VER,EOF_VER ,preamable_DATA ,Header_DATA	,SEND_DATA,EOF_DATA	,preamable_GAMMA,Header_GAMMA,SEND_GAMMA,EOF_GAMMA,preamable_STATUS,Header_STATUS,SEND_STATUS,EOF_STATUS,EOF_DATA1 );
signal state : mystate := waiting;
signal nextstate : mystate := waiting;
signal RESET_PHY_FAG : std_logic :='0';
signal counter_rst : integer range 0 to 125000000 :=0;
signal counter_rst1 : integer range 0 to 125000000 :=0;
signal counter_rst2 : integer range 0 to 125000000 :=0;
signal BUFF_A : STD_LOGIC_VECTOR (7 downto 0) :=x"00";
signal PHY_TXD_b : STD_LOGIC_VECTOR (7 downto 0) :=x"00";
signal DATA_BUFF : STD_LOGIC_VECTOR(7 downto 0) :=x"AA";
signal counter3: integer range 0 to 1023 :=0;
signal counter_x : integer range 0 to 1023 :=0;
signal counter_y : integer range 0 to 2047 :=0;
--signal counter_bit : integer range 0 to 3 :=0;
signal counter_byte  : integer range 0 to 63 :=0;
signal counter_package  : integer range 0 to 1023 :=0;
signal byte_counter : integer range 0 to 63 :=0;
signal half_Full_a : std_logic :='0';
signal TX_EN_b : std_logic :='0';
signal start_flag : std_logic :='0';
signal send_trig_flag : std_logic :='0';
signal send_trig2 : std_logic :='0';
signal VP_MODE2 : std_logic :='0';
signal Y_SIZE : integer range 0 to 1023  :=720;


signal bit_nibble : STD_LOGIC :='0';
signal bit_test : STD_LOGIC :='0';
signal test_counter : integer range 0 to 63 :=0;
constant PACKAGE_SIZE : integer  :=511;
signal PACKAGE_SIZE_V  : integer range 0 to 1023 :=511;
--constant RGB_size : integer  :=4;

constant FIFO_MIN_COUNT : STD_LOGIC_VECTOR  :="00000111111";   --- = 64

constant HEAD_WBR  : STD_LOGIC_VECTOR :=x"41";
constant HEAD_WBS  : STD_LOGIC_VECTOR :=x"40";
constant HEAD_VERSION  : STD_LOGIC_VECTOR :=x"30";
constant HEAD_STATUS  : STD_LOGIC_VECTOR :=x"20";
constant HEAD_GAMMA  : STD_LOGIC_VECTOR :=x"10";
constant HEAD_VP_START  : STD_LOGIC_VECTOR :=x"00";
constant HEAD_VP  : STD_LOGIC_VECTOR :=x"01";
constant HEAD_RP_START  : STD_LOGIC_VECTOR :=x"02";
constant HEAD_RP  : STD_LOGIC_VECTOR :=x"03";

constant SIZE_X  : STD_LOGIC_VECTOR :=x"3F";    ----- standart size 64

constant SYN_DELAY  : integer  :=4;
constant PACKAGE_DELAY  : integer  :=25;

constant STATUS_TIMEOUT  : integer  := 4000000;   ----- 100 ms
begin

GTX_CLK<=CLK;
PHY_MDC<='1';
PHY_MDIO<='1';

--process(CLK,RESET)
--begin
--if(reset ='1')then
--		counter_rst<=0;
----		PHY_RESET<='0';
--		RESET_PHY_FAG<='0';
--elsif(rising_edge(CLK))then
----	if(RESET_PHY_FAG='0')then
----		if(counter_rst>=100000000)then ---------- 0.5 sec
----			PHY_RESET<='1';
------			RESET_PHY_FAG<='1';
----		else
----			counter_rst<=counter_rst+1;
----			PHY_RESET<='0';
----		end if;
------	else
----		if(ENABLE_RX='0')then --No Link
----			if(counter_rst1>=100000000)then
----				counter_rst1<=0;
----				if(counter_rst2>=100000)then
----					counter_rst2<=0;
----				else
----					counter_rst2<=counter_rst2+1;
----				end if;
----			else
----				counter_rst1<=counter_rst1+1;
----			end if;
----			if(counter_rst2>=99000)then
----				PHY_RESET<='0';
----			else
----				PHY_RESET<='1';
----			end if;
----		else
----			PHY_RESET<='1';
----		end if;
----	end if;		
--end if;
--end process;


process(CLK,reset)
begin
if(reset ='1')then
	
	state<=waiting;
--	counter_bit<=0;
	counter_byte<=0;
	counter_package<=0;
	counter_y<=0;
	RD_EN<='0';
	start_flag<='0';
	TX_EN<='0';	
	TX_EN_b<='0';	
	PHY_TXD<=x"55";
	PHY_TXD_b<=x"55";
	
elsif(falling_edge(CLK))then
	VP_MODE2<='0';		--'1'=VP '0'=RP
	bit_nibble<=not bit_nibble;
TX_EN<=TX_EN_b;
PHY_TXD<=PHY_TXD_b;


if(state=WAIT_FIFO_DATA)then
	DEBUG1<='1';
else
	DEBUG1<='0';
end if;	

if(state=preamable_DATA or state=SEND_DATA )then
	DEBUG2<='1';
else
	DEBUG2<='0';
end if;	

	case(state)is
		when waiting => 	TX_EN_b<='0';							
								RD_EN<='0';							
									
									
									if(counter_rst>=100000000)then
										state<=WAIT_FIFO_DATA;	
									else
										counter_rst<=counter_rst+1;
										state<=waiting;
									end if;
									counter_byte<=0;
									counter_package<=0;
									bit_nibble<='0';
		when	 WAIT_FIFO_DATA => 
								TX_EN_b<='0';
								RD_EN<='0';							
							
							 if(RD_COUNT>=FIFO_MIN_COUNT)then
								if(bit_nibble='1')then
									state<=preamable_DATA;
								else
									state<=WAIT_FIFO_DATA;
								end if;								
							 else
								state<=WAIT_FIFO_DATA;
							 end if;
		when	 preamable_DATA => 	 
								
								TX_EN_b<='1';
								
								if(byte_counter=6)then
									DATA_BUFF<=x"D5";	
								else
									DATA_BUFF<=x"55";
								end if;
								if(byte_counter=7)then	
									byte_counter<=0;
									counter_byte<=0;
									PHY_TXD_b<= DATA_BUFF;
									state<=SEND_DATA;
									RD_EN<='1';
								else										
									byte_counter<=byte_counter+1;
									state<=preamable_DATA;
									PHY_TXD_b<=DATA_BUFF;
									RD_EN<='0';
								end if;
					
		when	  SEND_DATA =>
										
								if(DATA_IN(8)='1' or RD_COUNT="00000000000")then
									state<=EOF_DATA;	
									counter_byte<=0;
									start_flag<='1';
									counter_package<=0;
									TX_EN_b<='1';
									PHY_TXD_b<=x"00";
									
									RD_EN<='0';
								else
									state<=SEND_DATA;
									RD_EN<='1';
									TX_EN_b<='1';
									
									PHY_TXD_b<=DATA_IN(7 downto 0);
								end if;
								
		when	  EOF_DATA =>			
								RD_EN<='0';	
								DATA_BUFF<=x"00";
								if(byte_counter=15)then
									byte_counter<=0;
									state<=EOF_DATA1;
									TX_EN_b<='0';
								else
									byte_counter<=byte_counter+1;
									state<=EOF_DATA;
									TX_EN_b<='1';
								end if;		
								PHY_TXD_b<=x"00";
		when	  EOF_DATA1 =>			
								RD_EN<='0';	
								DATA_BUFF<=x"00";
								if(byte_counter=15)then
									byte_counter<=0;
									state<=WAIT_FIFO_DATA;
								else
									byte_counter<=byte_counter+1;
									state<=EOF_DATA1;
								end if;								
								TX_EN_b<='0';	
								PHY_TXD_b<=x"00";
		when others => 
								state<=WAIT_FIFO_DATA;
	end case;
end if;
end process;
end Behavioral;

