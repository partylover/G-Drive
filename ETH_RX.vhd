
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

entity ETH_RX is
		Port ( 	CLK : in  STD_LOGIC;  ---- system clk
				  RESET : in  STD_LOGIC;  
				  PHY_RXD : in  STD_LOGIC_VECTOR (7 downto 0);   	----- GIGABIT PHY DATA IN
				  RX_CLK : in  STD_LOGIC;									----- GIGABIT PHY CLK in
				  RX_DV : in  STD_LOGIC;									----- GIGABIT PHY DATA IN valid
				  PHY_RESET : out  STD_LOGIC;								----- GIGABIT PHY reset active low
				  --------------------------------------------------------------------------------------------
				  ADDRESS : out  STD_LOGIC_VECTOR (13 downto 0);	----- Video address out to frame buffer
				  DATA : out  STD_LOGIC_VECTOR (23 downto 0);		----- Video DATA  (RGB) out to frame buffer
				  WE : out  STD_LOGIC;
				  --------------------------------------------------------------------------------------------
				  DATA_OUT_PHY : out STD_LOGIC_VECTOR (8 downto 0);----- MAIN DATA out to PHY (next g-drive)
				  WR_PHY_1 : out  STD_LOGIC;								   ----- MAIN WR out to PHY (next g-drive)
				  WR_PHY_2 : out  STD_LOGIC;								   ----- MAIN WR out to PHY (next g-drive)
				 -------------------------------------------------------------------------------------------- 
				  DATA_GAMMA : out  STD_LOGIC_VECTOR (23 downto 0);----- GAMMA table address and data (address(7:0) & data(15:0)) 
				  WR_GAMMA : out  STD_LOGIC;								----- GAMMA table WR 
				  -----------------------------------------------------------------------------------------
				  DATA_OUT_WB : out  STD_LOGIC_VECTOR (23 downto 0);	----- whitebalance gain control data RGB ( write from PC)
				  DATA_IN_WB : in  STD_LOGIC_VECTOR (23 downto 0);		----- whitebalance gain control data RGB (read back to PC)
				  ADD_WB : out  STD_LOGIC_VECTOR (7 downto 0);			----- whitebalance gain control address	
				  WR_WB : out  STD_LOGIC;										----- whitebalance gain control WR to ram
				  WB_EEP_WR : out  STD_LOGIC;									----- whitebalance gain control 
				--  WB_EN : in STD_LOGIC;
				  -----------------------------------------------------------------------------------------
				  BLINK_OUT :  out  STD_LOGIC;
				  RX_ACTIVE_IN : in  STD_LOGIC;
			     LED_ERROR_TG : out  STD_LOGIC;
				  RST_WB_BRAM : out  STD_LOGIC;
				  PAGE : out  STD_LOGIC;										----- Page bit togle when recive video data
			--	  enable : out  STD_LOGIC;										-----  data_enable out	 (active high)
				  PHY_B_RESET : out  STD_LOGIC;
				  PHY_A_RESET : out  STD_LOGIC;
				  LED_OS : out  STD_LOGIC;
				  CONFIG_REG : in  STD_LOGIC_VECTOR (31 downto 0);
				  DIMMER : out  STD_LOGIC_VECTOR (4 downto 0);
				  DEBUG1 : out  STD_LOGIC;
				  DEBUG2 : out  STD_LOGIC;
				  DEBUG3 : out  STD_LOGIC;
				  DEBUG4 : out  STD_LOGIC;
				  DEBUG5 : out  STD_LOGIC;
				  DEBUG6 : out  STD_LOGIC;
				  DEBUG7 : out  STD_LOGIC;
				  DEBUG8 : out  STD_LOGIC
				  
				  );
end ETH_RX;

architecture Behavioral of ETH_RX is

	type TON_state is (WAITING,END_package_B,END_package_AB,wait_preamable
	,recive_header1,recive_header_GD_CONFIG_READ2,recive_header_GD_CONFIG_READ3,recive_GD_CONFIG_READ,recive_header_GD_CONFIG2,recive_header_GD_CONFIG3,recive_GD_CONFIG,recive_header_VERSION2,recive_header_VERSION3,recive_VERSION
	,recive_header_STATUS2,recive_header_STATUS3,recive_STATUS,recive_header_GAMMA2,recive_header_RP_DATA2,recive_header_RP_CONFIG,recive_header_GAMMA3,recive_RP_DATA,recive_data2,recive_data3,recive_GAMMA
	,recive_header_EER2,recive_header_EER3
	,recive_gd_config2,recive_gd_config_read2,recive_status_read,recive_header_status_read2);
	signal STATE : TON_state :=WAITING;

	type TON_state2 is (WAITING2,wait_preamable2,recive_data_PHY);
	signal STATE2 : TON_state2 :=WAITING2;
	
		type TON_state3 is (wait_startup,wait_page,page_active,reset_out);
		signal STATE3 : TON_state3 :=wait_startup;	
		---------------- DE-SERIAL ------------------------
	signal counter : integer range 0 to 3 :=0;
	signal counter_byte : integer range 0 to 1023 :=0;
	signal counter_byte_rgb : integer range 0 to 63 :=0;
	signal counter_package : integer range 0 to 1023 :=0;
	--signal counter_byte_package : integer range 0 to 1023 :=0;
	signal DATA_IN : STD_LOGIC_VECTOR (7 downto 0) :=x"00";
	signal RGB_BUFF : STD_LOGIC_VECTOR (15 downto 0) :=x"0000";
	signal WR_x : STD_LOGIC :='0';
	signal WR_OUT : STD_LOGIC :='0';
	signal buff : STD_LOGIC_VECTOR (3 downto 0):=x"0";
	signal START_PACKAGE_FLAG : std_logic :='0';
	signal END_PACKAGE_FLAG : std_logic :='0';	
	signal SYN_FLAG : std_logic :='0';
	---------------------------------------------------
	signal ADD_counter_X : STD_logic_vector(11 downto 0):=x"000";
	signal ADD_counter_Y : STD_logic_vector(11 downto 0):=x"000";

	signal ADD_counter_Y_BUFF : std_logic_vector (11 downto 0):=x"000";
	signal ADD_counter_X_BUFF : std_logic_vector (11 downto 0):=x"000";

	signal ADDRESS_BUFF :  STD_LOGIC_VECTOR (13 downto 0):=(others=>'0');
	signal DATA_BUFF : STD_LOGIC_VECTOR (23 downto 0) :=(others => '0');

	signal ADD_counter_Y_capture : STD_logic_vector(11 downto 0):=x"000";
	signal ADD_counter_X_capture : STD_logic_vector(11 downto 0):=x"000";
	signal ADD_counter_GAMMA : STD_logic_vector(7 downto 0):=x"00";
	signal DATA_BUFF_GAMMA : STD_LOGIC_VECTOR (7 downto 0) :=x"00";

	signal ADD_counter_WB2 : STD_logic_vector(11 downto 0):=x"000";
	signal ADD_counter_WB : STD_logic_vector(11 downto 0):=x"000";
	signal DATA_BUFF_WB : STD_LOGIC_VECTOR (15 downto 0) :=x"0000";

	signal PACKAGE_COUNTER : STD_LOGIC_VECTOR (15 downto 0) :=x"0000";
	signal check_package_en  : std_logic :='0';
	signal package_count_correct  : std_logic :='0';	
	
	signal PAGE_flag : STD_LOGIC :='1'; 
	signal PAGE_flag2 : STD_LOGIC :='1'; 
	signal WB_TG_FLAG : std_logic :='0';
	signal LED_ERROR_TG_buff : STD_LOGIC :='0'; 
	signal RST_WB_BRAM_buff : STD_LOGIC :='0'; 

	signal DIM_x : std_logic_vector(4 downto 0):="11111";
	signal DIM_BUFF : std_logic_vector(4 downto 0):="11111";

	signal SIZE_X_VIDEO_IN : STD_LOGIC_VECTOR (7 downto 0):=x"1F";

	signal DIP_SW_ADDRESS : std_logic_vector(3 downto 0);

--	signal ID_GD : std_logic_vector(15 downto 0):=x"0000";
	signal ID_GD_LSB : std_logic_vector(7 downto 0):=x"00";
	signal ID_GD_MSB : std_logic_vector(7 downto 0):=x"00";
	signal ID_RX_BUFF : std_logic_vector(7 downto 0):=x"00";
	
	
	signal enable_gamma  : std_logic :='0';
	signal ID_MSB_enable  : std_logic :='0';
	signal counter_ID : std_logic_vector(7 downto 0):=x"00";
	signal LED_counter : integer range 0 to 1023:=0;
	signal LED_counter2 : integer range 0 to 100000000:=0;
	
--	signal ENABLE_flag : std_logic :='0';
	signal ENABLE_counter : integer range 0 to 2000000000:=0;
	signal ENABLE_counter2 : integer range 0 to 65535:=0;
	signal page_count : integer range 0 to 255:=0;
	signal PHY_TX_ENABLE : std_logic :='0';	
	signal WR_PHY_B : std_logic :='0';	
	signal WR_PHY_A : std_logic :='0';	
	
	signal RX_DV_flag : std_logic :='0';
	signal RX_DV_flag2 : std_logic :='0';
	signal RX_DV_b : std_logic :='0';
	signal PHY_RXD_b : STD_LOGIC_VECTOR (7 downto 0):=x"00";
	signal LED : std_logic :='0';	
	signal LED_CLK : std_logic :='0';	
	signal LED_CLK1 : std_logic :='0';			
	signal LED2 : std_logic :='0';		
	signal LED3 : std_logic :='0';		

	signal DB1  : std_logic :='0';			
	signal DB2  : std_logic :='0';	
	signal DB3  : std_logic :='0';			
	signal DB4  : std_logic :='0';		
	signal DB5  : std_logic :='0';
	signal DB6  : std_logic :='0';
	


	type TON_state_MCU is (MCU_WAITING,MCU_recive_status,MCU_ID,MCU_recive_version);
	signal MCU_STATE : TON_state_MCU :=MCU_WAITING;

	signal MCU_data_buff : STD_LOGIC_VECTOR (7 downto 0) :=x"00";
	signal MCU_address_counter : integer range 0 to 15 :=0;
	signal MCU_bit_counter : integer range 0 to 7 :=0;

	type array1 is array (0 to 31) of std_logic_vector(7 downto 0); 
	signal MCU_Version : array1;

--	---------------------------------------G     D     _     N     _     V     1     _		t     e     s     t     2     0
--	constant FPGA_Version : array1 :=  (x"47",x"44",x"5F",x"4E",x"5F",x"56",x"31",x"5F",x"74",x"65",x"73",x"74",x"33",x"30",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20");
	---------------------------------------G     D     _     N     _     V     1     h
--	constant FPGA_Version : array1 :=  (x"47",x"44",x"5F",x"4E",x"5F",x"56",x"31",x"68",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20");
	---------------------------------------G     D     _     N     _     C     _     V		1		p	
	constant FPGA_Version : array1 :=  (x"47",x"44",x"5F",x"4E",x"5F",x"43",x"5F",x"56",x"31",x"71",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20");
--
	signal enable_send_version : std_logic :='0';		
	signal ID_correct : std_logic :='0';		

	signal GD_TEMP : STD_LOGIC_VECTOR (7 downto 0) :=x"00";
	signal GD_LDR : STD_LOGIC_VECTOR (15 downto 0) :=x"0000";
	signal GD_Vcc : STD_LOGIC_VECTOR (15 downto 0) :=x"0000";
	signal GD_Vsolar : STD_LOGIC_VECTOR (15 downto 0) :=x"0000";
	signal GD_Vout : STD_LOGIC_VECTOR (15 downto 0) :=x"0000";
	signal GD_Isolar : STD_LOGIC_VECTOR (15 downto 0) :=x"0000";
	signal GD_Iac : STD_LOGIC_VECTOR (15 downto 0) :=x"0000";

	signal blink_counter : integer range 0 to 200000000 :=0;	
	signal blink_ena : std_logic :='0';		
	signal blink_flag : std_logic :='0';		


	signal POS_X : STD_LOGIC_VECTOR (3 downto 0) :=x"0";
	signal POS_Y : STD_LOGIC_VECTOR (3 downto 0) :=x"0";
	signal DIP_SW : STD_LOGIC_VECTOR (7 downto 0) :=x"00";
	signal DIP_SW1 : STD_LOGIC_VECTOR (2 downto 0) :="000";
	
	signal test_counter_x : STD_LOGIC_VECTOR (7 downto 0) :=x"00";
	signal test_counter_y : STD_LOGIC_VECTOR (7 downto 0) :=x"00";
	signal test_timer : integer range 0 to 40000000 :=0;

	signal timeout_counter : integer range 0 to 80000000 :=0;
	signal counter_rst : integer range 0 to 100000000 :=0;
	signal timer_counter : integer range 0 to 200000000 :=0;
	

--signal RX_ACTIVE_IN_b : STD_LOGIC :='0';
	signal size_db : STD_LOGIC :='0';
	
	signal PHY_RESET_b : STD_LOGIC :='0';
	signal PHY_RESET_c : STD_LOGIC :='0';
	signal eof_check : STD_LOGIC :='0';

	--constant PACKAGE_SIZE : integer :=511;  --- use with VMS
	
	
	constant PACKAGE_SIZE_PIXEL : integer :=255; ----------  255 pixel / 1 PACKAGE
	
	constant blink_timeout : integer :=25000000; ----------  0.2 s @125mhz
	
	
--	constant SIZE_X_CAPTURE : STD_LOGIC_VECTOR  :=x"3FF";  -- 1024
--	constant SIZE_Y_CAPTURE : STD_LOGIC_VECTOR  :=x"1F";   -- 32

	constant SIZE_X_CAPTURE : STD_LOGIC_VECTOR  :=x"7F";  -- 127
	constant SIZE_Y_CAPTURE : STD_LOGIC_VECTOR  :=x"7F";   -- 127

	constant HEADER_VP_START : STD_logic_vector(7 downto 0):=x"00";
	constant HEADER_VP : STD_logic_vector(7 downto 0):=x"01";
	constant HEADER_RP_START : STD_logic_vector(7 downto 0):=x"02";
	constant HEADER_RP : STD_logic_vector(7 downto 0):=x"03";
	constant HEADER_GAMMA : STD_logic_vector(7 downto 0):=x"10";
	constant HEADER_STATUS : STD_logic_vector(7 downto 0):=x"20";
	constant HEADER_VERSION : STD_logic_vector(7 downto 0):=x"30";
	constant HEADER_GD_CONFIG : STD_logic_vector(7 downto 0):=x"40";
	constant HEADER_GD_CONFIG_READ : STD_logic_vector(7 downto 0):=x"41";
	constant HEADER_EER : STD_logic_vector(7 downto 0):=x"42";
begin
PHY_A_RESET<=PHY_RESET_c;
PHY_B_RESET<='0';
PHY_RESET<=PHY_RESET_b;

--ID_GD<=ID_GD_MSB & ID_GD_LSB;

RST_WB_BRAM<=RST_WB_BRAM_buff;

DEBUG1<=PAGE_flag;
DEBUG2<=DB2;
DEBUG3<=DB3;
DEBUG4<=DB4;
DEBUG5<=DB5;
DEBUG6<=DB6;
DEBUG7<=START_PACKAGE_FLAG;
DEBUG8<=ID_correct;


PAGE<=PAGE_flag;
DIMMER<=dim_x;
--ENABLE<=ENABLE_flag;
--ENABLE<='1';

POS_X<=CONFIG_REG(7 downto 4);
POS_Y<=CONFIG_REG(3 downto 0);
DIP_SW<=CONFIG_REG(15 downto 8);
GD_TEMP<=CONFIG_REG(23 downto 16);
--DIP_SW1<=CONFIG_REG(26 downto 24);

ADD_WB<= ADD_counter_WB(7 downto 0);
LED_ERROR_TG<=LED_ERROR_TG_buff;
WB_EEP_WR<=WB_TG_FLAG;

--- WR_PHY<=WR_PHY_B and PHY_TX_ENABLE; --- bug
WR_PHY_2<=WR_PHY_B ;
WR_PHY_1<=WR_PHY_A ;

--process(WR_PHY_A,WR_PHY_B,DIP_SW1)
--begin
--	if(DIP_SW1(0)='1')then
--		WR_PHY_1<=WR_PHY_B ;
--	else
--		WR_PHY_1<=WR_PHY_A ;
--	end if;
--end process;

-----------------------------------------------------------------------------------------------
-------------------------PHY Start UP RESET and check active ----------------------------------
-----------------------------------------------------------------------------------------------

process(CLK,RESET)
begin
if(reset ='1')then
		counter_rst<=0;
		PHY_RESET_b<='0';
--		ENABLE_flag <='0';
		ENABLE_counter<=0;
		ENABLE_counter2<=0;
		page_count<=0;
		STATE3<=wait_startup;
		PHY_TX_ENABLE<='0';
elsif(rising_edge(CLK))then

if((STATE3=wait_page and page_count>=2)  or  STATE3=page_active)then
	PHY_TX_ENABLE<='1';
else
	PHY_TX_ENABLE<='0';
end if;





	case(STATE3)is
		when	wait_startup	=> 	if(counter_rst>=12500000)then ---- reset  100 ms @ 125 mhz  (only at start up)
												PHY_RESET_b<='1';    ---- not reset 
												--STATE3<=wait_page;
												STATE3<=page_active;
												counter_rst<=0;
											else
												counter_rst<=counter_rst+1;
												PHY_RESET_b<='0';		---- reset active low
												STATE3<=wait_startup;
											end if;
											PHY_RESET_c<='1';
											
--		when	wait_page		=>		if(PAGE_flag2/=PAGE_flag)then	----- GIGABIT PHY check active		
--												ENABLE_counter<=0;
--													if(page_count>=30)then   ----- 0.5 sec ( @ 60 fps )
--														page_count<=0;
--														STATE3<=page_active;
--													else
--														page_count<=page_count+1;
--														STATE3<=wait_page;
--													end if;
--												
--											elsif(ENABLE_counter>=125000000)then	 ---- timeout  1x 60 sec		@ 125 mhz	
--												ENABLE_counter<=0;
--													if(ENABLE_counter2>=30)then  ------  30 sec to reset
--														ENABLE_counter2<=0;
--														STATE3<=reset_out;
--													else
--														ENABLE_counter2<=ENABLE_counter2+1;
--														STATE3<=wait_page;
--													end if;
--											else
--												ENABLE_counter<=ENABLE_counter+1;
--												STATE3<=wait_page;
--											end if;		
--											
--											PHY_RESET_b<='1';   ---- not reset 
--											PHY_RESET_c<='0';
											
		when	page_active		=>		if(PAGE_flag2/= PAGE_flag)then	----- GIGABIT PHY check active		
												ENABLE_counter<=0;
												STATE3<=page_active;
											elsif(ENABLE_counter>=125000000)then	 ---- timeout  2 s		@ 125 mhz	
													
													if(ENABLE_counter2>=40)then  ------  40 sec to reset
														ENABLE_counter2<=0;
														STATE3<=reset_out;
													else
														ENABLE_counter2<=ENABLE_counter2+1;
														STATE3<=page_active;
													end if;
												ENABLE_counter<=0;
											--	STATE3<=reset_out;
											else
												ENABLE_counter<=ENABLE_counter+1;
												STATE3<=page_active;
											end if;		
											PHY_RESET_c<='0';
											PHY_RESET_b<='1';   ---- not reset 	

		when	reset_out	=> 		if(counter_rst>=500000)then ---- reset  2 ms @ 125 mhz  (reset 20 ms)
												counter_rst<=0;
												PHY_RESET_c<='0';    ---- not reset 
												STATE3<=wait_page;
											else
												counter_rst<=counter_rst+1;
												PHY_RESET_c<='1';		---- reset 
												STATE3<=reset_out;
											end if;
												PHY_RESET_b<='0';
											
		when others	=> 				STATE3<=wait_startup;
											PHY_RESET_c<='0';
											PHY_RESET_b<='0';		---- reset active low
		end case;
											

	
	PAGE_flag2<=PAGE_flag;
	RX_DV_Flag<=RX_DV;
	RX_DV_Flag2<=RX_DV_Flag;
end if;
end process;


-----------------------------------------------------------------------------------------------
------------------------- decode Start package and end package --------------------------------
-----------------------------------------------------------------------------------------------

process(RX_CLK,RESET)
begin
if(reset ='1')then
	state2<=waiting2;
	WR_x<='0';
	DATA_IN<=x"00";
	START_PACKAGE_FLAG<='0';
	END_PACKAGE_FLAG<='0';
	SYN_FLAG<='0';
elsif(rising_edge(RX_CLK))then
	PHY_RXD_b<=PHY_RXD;  ----- first input latch
	RX_DV_b<=RX_DV;   ----- first input latch
	
	SYN_FLAG<=RX_DV_b;	
case(state2)is
	when	waiting2 => if(RX_DV_b='1' and SYN_FLAG='0')then
								state2<=wait_preamable2;
							else
								state2<=waiting2;
							end if;
								WR_x<='0';
								START_PACKAGE_FLAG<='0';
								END_PACKAGE_FLAG<='0';
	when	wait_preamable2 =>
							END_PACKAGE_FLAG<='0';
						  if(PHY_RXD_b=x"D5")then
								state2<=recive_data_PHY;
								DATA_IN<= PHY_RXD_b;								
								START_PACKAGE_FLAG<='1';
								WR_x<='1';
							else
								state2<=wait_preamable2;
								WR_x<='0';
								START_PACKAGE_FLAG<='0';									
							end if;	
							
	when	recive_data_PHY => 
							START_PACKAGE_FLAG<='0';
							if(SYN_FLAG='1')then
								DATA_IN<= PHY_RXD_b;
								WR_x<='1';	
								state2<=recive_data_PHY;
								END_PACKAGE_FLAG<='0';	
							else
								state2<=waiting2;
								WR_x<='0';								
								END_PACKAGE_FLAG<='1';								
							end if;
	when others => WR_x<='0';
						START_PACKAGE_FLAG<='0';
						END_PACKAGE_FLAG<='0';
end case;	
end if;
end process;


-----------------------------------------------------------------------------------------------
-------------------------------- MAIN PROTOCOL DECODER ----------------------------------------
-----------------------------------------------------------------------------------------------



process(RX_CLK,PHY_RESET_b)

begin



if(rising_edge(RX_CLK))then

if(PHY_RESET_b='0')then
	ADD_counter_X<=x"000";
	ADD_counter_Y<=x"000";
	STATE<=WAITING;
	WR_out<='0';	WR_GAMMA<='0';	 WR_PHY_B<='0';	WR_WB<='0';	WR_PHY_A<='0';
	DATA_OUT_PHY<='0' & DATA_IN;
else

--RX_ACTIVE_IN_b<=RX_ACTIVE_IN;
--RX_ACTIVE_IN_b<='1';
--------------- check for page activ ---------------
--PAGE_flag2<=PAGE_flag;
--	if(PAGE_flag/=PAGE_flag2)then	
--		timer_counter<=0;
--		PHY_TX_RESET<='0';
--	else
--		if(timer_counter>=125000000)then -------- time out = 1 sec @ 125mhz clk
--			PHY_TX_RESET<='1';
--		else
--			timer_counter<=timer_counter+1;
--			PHY_TX_RESET<='0';
--		end if;
--	end if;
-------------------  MAIN State mechine  ---------------------------------

if(STATE=WAITING)then
	DB1<='1';
else
	DB1<='0';
end if;

if(STATE=recive_header_RP_CONFIG or STATE=recive_header_RP_DATA2 )then
	DB2<='1';
else
	DB2<='0';
end if;

if(STATE=recive_RP_data)then
	DB3<='1';
else
	DB3<='0';
end if;

if(STATE=recive_header_GD_CONFIG2 or STATE=recive_GD_CONFIG  )then
	DB4<='1';
else
	DB4<='0';
end if;

 
if(STATE=recive_header_GD_CONFIG_READ2 or STATE=recive_GD_CONFIG_READ  )then
	DB5<='1';
else
	DB5<='0';
end if;


if(STATE=recive_header_STATUS_READ2 or STATE=recive_STATUS_READ  )then
	DB6<='1';
else
	DB6<='0';
end if;


if(blink_ena/=blink_flag)then
	blink_flag<=blink_ena;
	blink_counter<=blink_timeout;
	BLINK_OUT<='0';
elsif(blink_counter>0)then
	blink_counter<=blink_counter-1;
	BLINK_OUT<='0';
else
	BLINK_OUT<='1';
end if;

	
		WE<=WR_OUT;
	--	if(DIP_SW1(0)='0')then
			ADDRESS<=ADD_counter_Y_BUFF(6 downto 0) & ADD_counter_X_BUFF(6 downto 0);	--Y=128  X=128
--		else
--			ADDRESS<=ADD_counter_Y_BUFF(6 downto 0) & not ADD_counter_X_BUFF(6) & ADD_counter_X_BUFF(5 downto 0);	--Y=128  X=128
--		end if;
		
		DATA<=DATA_BUFF;
		
	if(END_PACKAGE_FLAG='1' and STATE/=WAITING)then
		WR_out<='0';	WR_GAMMA<='0';	 WR_PHY_B<='1'; WR_PHY_A<='1';	WR_WB<='0';	
		DATA_OUT_PHY<='1' & DATA_IN;
		STATE<=WAITING;
	elsif(WR_x='1')then	
--	if(WR_x='1')then				
		case(STATE)is
				when	WAITING	=>		
											if(START_PACKAGE_FLAG='1')then
												STATE<=recive_header1;
											else
												STATE<=WAITING;
											end if;
											WR_out<='0';	WR_GAMMA<='0';	 	WR_WB<='0';	
											DATA_OUT_PHY<='0' & DATA_IN;	WR_PHY_B<='0'; WR_PHY_A<='0';
									
				when	recive_header1 => 	
													case(DATA_IN)is
														when HEADER_RP_START =>	state<= recive_header_RP_CONFIG;
																						ADD_counter_X<=x"000";
																						ADD_counter_Y<=x"000";	
																						WR_PHY_A<='1';
																						PACKAGE_COUNTER<=x"0000";
														when HEADER_RP			=>state<= recive_header_RP_DATA2; WR_PHY_A<='0';
														when HEADER_GAMMA 	=>	state<= recive_header_GAMMA2;  WR_PHY_A<='1';
														when HEADER_STATUS 	=>	state<= recive_header_STATUS_READ2;	 WR_PHY_A<='1';
														when HEADER_VERSION 	=>	state<= recive_header_STATUS_READ2; WR_PHY_A<='1';
														when HEADER_GD_CONFIG_READ =>	state<= recive_header_GD_CONFIG_READ2; WR_PHY_A<='1';
														when HEADER_GD_CONFIG 		=>	state<= recive_header_GD_CONFIG2; WR_PHY_A<='1';
														when HEADER_EER 		=>	state<= recive_header_EER2; WR_PHY_A<='1';
														when others 			=> state<= WAITING;
																						
													end case;
													counter_byte<=0;
													counter_package<=0;
													counter_byte_rgb<=0;
													WR_out<='0';	WR_GAMMA<='0';	 WR_WB<='0';	
													DATA_OUT_PHY<='0' & DATA_IN;													
													
													WR_PHY_B<='1';
------------------------------------------------------------------------------------------
------------------------------------  RECIVE VIDEO DATA ----------------------------------	
------------------------------------------------------------------------------------------
												
				when	recive_header_RP_CONFIG =>	WR_out<='0';	WR_GAMMA<='0';	 	            ----------  recive Video parameter	(15 byte)																								
															WR_PHY_B<='1';  WR_PHY_A<='1';	----------  out to PHY
															if(counter_byte>=15)then							----------  counter 16 byte for recive parameter
																counter_byte<=0;
																PAGE_flag<=not page_flag;			-------- use start sync for page flag
																state<= recive_RP_data;			------ jump to recive video data state	
															else
																counter_byte<=counter_byte+1;
																state<= recive_header_RP_CONFIG;	
															end if;
															
															case(counter_byte)is	
															
															when 0 => SIZE_X_VIDEO_IN<=DATA_IN;
																			DATA_OUT_PHY<='0' & DATA_IN;
															
															when 1 => if(DATA_IN=x"FF")then 					------- LSB ID counter ( low byte ID)
																			ID_MSB_enable<='1';
																			DATA_OUT_PHY<='0' & DATA_IN;
																		else
																			ID_MSB_enable<='0';
																			DATA_OUT_PHY<='0' & (DATA_IN+1);
																		end if;
																		ID_GD_LSB<=DATA_IN;
																			
															when 2 => if(ID_MSB_enable='1')then			------- MSB ID counter  ( high byte ID)
																			DATA_OUT_PHY<='0' & (DATA_IN+1);
																		else
																			DATA_OUT_PHY<='0' & DATA_IN;
																		end if;
																		ID_GD_MSB<=DATA_IN;	
																		
															when 3 =>  DATA_OUT_PHY<='0' & DATA_IN;	
																			if(DATA_IN=x"01")then	------  check package count 01 = enable
																				check_package_en<='1';
																				package_count_correct<='1';
																			else
																				check_package_en<='0';
																				package_count_correct<='0';
																			end if;
															
																			
																					
															when others => DATA_OUT_PHY<='0' & DATA_IN;
														end case;
															
														
														
				when	recive_header_RP_DATA2 =>	WR_out<='0';	WR_GAMMA<='0';	 						----------  Rercive dummy byte ( 2 byte before recive video data )															
															DATA_OUT_PHY<='0' & DATA_IN; WR_PHY_B<='1';	 WR_PHY_A<='0';		----------  out to PHY
															if(counter_byte>=1)then									----------  counter 2 byte for recive parameter
																counter_byte<=0;
																state<= recive_RP_data;    ------ jump to recive video data state 
															else
																counter_byte<=counter_byte+1;
																state<= recive_header_RP_DATA2; 	
															end if;
															
															case(counter_byte)is																
																when 0 => if(DATA_IN=PACKAGE_COUNTER(15 downto 8))then
																				package_count_correct<='1';
																			else
																				package_count_correct<='0';
																			end if;
																when 1 => if(DATA_IN=PACKAGE_COUNTER(7 downto 0))then
																				
																			else
																				package_count_correct<='0';
																			end if;		
																when others =>		
															end case;
															
															
															
											
				when	recive_RP_data => 		WR_GAMMA<='0';										---------- RECIVE Video data state				
														DATA_OUT_PHY<='0' & DATA_IN;	WR_PHY_B<='1'; WR_PHY_A<='0';	 ----------  out to PHY
				
														if(counter_byte_rgb>=2)then					---------  Counter 3 byte <R1><G1><B1><R><G><B><R><G><B><R><G><B><R><G><B><R><G><B>
															counter_byte_rgb<=0;
															if(counter_package=PACKAGE_SIZE_PIXEL)then	---------  default 256 pixel / package														
																counter_package<=0;
																state<=END_package_B;
																PACKAGE_COUNTER<=PACKAGE_COUNTER+1;		---- check package counter for error send
															else
																counter_package<=counter_package+1;
																state<=recive_RP_data;
															end if;															
														else
															state<=recive_RP_data;
															counter_byte_rgb<=counter_byte_rgb+1;
														end if;
													
														
														case(counter_byte_rgb)is
															when 0 => 	RGB_BUFF(7 downto 0)<=DATA_IN;
																			WR_out<='0';
															when 1 => 	RGB_BUFF(15 downto 8)<=DATA_IN;
																			WR_out<='0';
															when 2 => 	
																			if(ADD_counter_X= x"1FF")then	  ------- 512 pixel
																				ADD_counter_X<=x"000";																				
																				if(ADD_counter_Y/= x"FFF")then ADD_counter_Y<=ADD_counter_Y+1; end if;
																			else
																				ADD_counter_X<=ADD_counter_X+1;		
																			end if; 
																			if((ADD_counter_Y >=ADD_counter_Y_capture and ADD_counter_Y<= ADD_counter_Y_capture + SIZE_Y_CAPTURE)and																			
																			   (ADD_counter_X>= ADD_counter_X_capture and ADD_counter_X<= ADD_counter_X_capture + SIZE_X_CAPTURE ))then
																					
																					ADD_counter_Y_BUFF<=ADD_counter_Y-ADD_counter_Y_capture;
																					ADD_counter_X_BUFF<=ADD_counter_X-ADD_counter_X_capture;
																					DATA_BUFF<=DATA_IN & RGB_BUFF;
																					
																					if(check_package_en='0' or (check_package_en='1' and package_count_correct='1'))then
																						WR_out<='1';
																					else
																						WR_out<='0';
																					end if;
																					
																			else
																			WR_out<='0';	
																			end if;	
																			
															when others => WR_out<='0';
														end case;


------------------------------------------------------------------------------------------
------------------------------------  RECIVE GAMMA TABLE ---------------------------------	
------------------------------------------------------------------------------------------							
											
				when	recive_header_GAMMA2 =>	
														WR_out<='0';	WR_GAMMA<='0';	
														DATA_OUT_PHY<='0' & DATA_IN; WR_PHY_B<='1'; WR_PHY_A<='1';	
														if(counter_byte>=6)then	
															counter_byte<=0;
															state<= recive_GAMMA;
														else
															counter_byte<=counter_byte+1;
															state<= recive_header_GAMMA2;
														end if;	
															
														case(counter_byte)is
															when 0 => DIM_buff<=	DATA_IN(4 downto 0);
																		 DATA_OUT_PHY<='0' & DATA_IN;
																		 enable_GAMMA<='1';																
															when	3	=>	if(DATA_IN/=x"55")then enable_GAMMA<='0'; end if;						
															when	4	=>	if(DATA_IN/=x"AA")then enable_GAMMA<='0'; end if;		
															when	5	=>	if(DATA_IN/=x"55")then enable_GAMMA<='0'; end if;						
															when	6	=>	if(DATA_IN/=x"AA")then enable_GAMMA<='0'; end if;																	
															when others => 
														end case;
														
														
														
										
				when	recive_GAMMA => if(counter_byte=1)then
													counter_byte<=0;													
													if(ADD_counter_GAMMA= x"FF")then
														ADD_counter_GAMMA<=x"00";
														 STATE<=END_package_AB;	
													--	if(enable_GAMMA='1')then dim_x<=DIM_buff; PAGE_flag<=not page_flag; end if;  --- use gamma for page flag
														if(enable_GAMMA='1')then dim_x<=DIM_buff; end if;
													else
														ADD_counter_GAMMA<=ADD_counter_GAMMA+1;
														STATE<=recive_GAMMA;										 	 
													end if; 
													DATA_GAMMA <= ADD_counter_GAMMA & DATA_BUFF_GAMMA & DATA_IN;
													WR_GAMMA<=enable_GAMMA;			
											 else
												counter_byte<=counter_byte+1;
												WR_GAMMA<='0';	
												DATA_BUFF_GAMMA<=DATA_IN;
											 end if;
													
												WR_out<='0';
												WR_PHY_B<='1';WR_PHY_A<='1';	
												DATA_OUT_PHY<='0' & DATA_IN;		

------------------------------------------------------------------------------------------ recive_header_GD_CONFIG2 recive_GD_CONFIG 
------------------------------------  RECIVE white balance -------------------------------	
------------------------------------------------------------------------------------------										
				
				when	recive_header_GD_CONFIG2	 =>	WR_out<='0';	WR_GAMMA<='0';	 	      ----------  recive from pc CONFIG parameter	(header 7 byte)																								
															DATA_OUT_PHY<='0' & DATA_IN;	WR_PHY_B<='1';WR_PHY_A<='1';		----------  out to PHY
															if(counter_byte>=6)then								----------  counter 7 byte for recive parameter
																counter_byte<=0;
																ADD_counter_WB2<=x"000";
																state<= recive_GD_CONFIG;						----- jump to recive whitebalance
															else
																counter_byte<=counter_byte+1;
																state<= recive_header_GD_CONFIG2;	
															end if;
															
															case(counter_byte)is
																when	0	=>	if(DATA_IN=ID_GD_MSB or DATA_IN=x"FF")then
																					ID_correct<='1';
																				else
																					ID_correct<='0';
																				end if;	
																when	1	=>	if(DATA_IN/=ID_GD_LSB and DATA_IN/=x"FF")then ID_correct<='0'; end if;	
																when	3	=>	if(DATA_IN/=x"55")then ID_correct<='0'; end if;						
																when	4	=>	if(DATA_IN/=x"AA")then ID_correct<='0'; end if;		
																when	5	=>	if(DATA_IN/=x"55")then ID_correct<='0'; end if;						
																when	6	=>	if(DATA_IN/=x"AA")then ID_correct<='0'; end if;	
																when others =>
															end case;
												
					when	recive_GD_CONFIG =>   if(counter_byte=2)then				-----	recive whitebalance  ( 768 (255x3) byte )
													counter_byte<=0;													
													if(ADD_counter_WB2>=x"0FF")then
														ADD_counter_WB2<=x"000";
														 STATE<=END_package_AB;		
															WB_TG_FLAG <= not WB_TG_FLAG;												 
													else
														ADD_counter_WB2<=ADD_counter_WB2+1;
														STATE<=recive_GD_CONFIG;										 	 
													end if; 													
													ADD_counter_WB<=ADD_counter_WB2;
													DATA_OUT_WB <= DATA_BUFF_WB & DATA_IN;
													
													WR_WB<=ID_correct;	
																				
											 elsif(counter_byte=1)then
												counter_byte<=counter_byte+1;
												WR_WB<='0';	
												DATA_BUFF_WB(7 downto 0)<=DATA_IN;
												STATE<=recive_GD_CONFIG;
											else
												counter_byte<=counter_byte+1;
												WR_WB<='0';	
												DATA_BUFF_WB(15 downto 8)<=DATA_IN;
												STATE<=recive_GD_CONFIG;
											 end if;
											 
												WR_GAMMA<='0';		
												WR_out<='0';
												WR_PHY_B<='1';WR_PHY_A<='1';	
												DATA_OUT_PHY<='0' & DATA_IN;	
												
					when	recive_GD_CONFIG2 =>   if(counter_byte>=255)then				-----	recive CONFIG   ( 256 byte )
														counter_byte<=0;
														STATE<=END_package_AB;	
													else
														counter_byte<=counter_byte+1;
														 STATE<=recive_GD_CONFIG2;	
												   end if;
												WR_WB<='0';	
												WR_GAMMA<='0';		
												WR_out<='0';
												WR_PHY_B<='1';WR_PHY_A<='1';	
												DATA_OUT_PHY<='0' & DATA_IN;												
	
------------------------------------------------------------------------------------------ recive_header_GD_CONFIG_READ2 recive_GD_CONFIG_READ
------------------------------------  READ BACK white balance ----------------------------	
------------------------------------------------------------------------------------------	
				
				when	recive_header_GD_CONFIG_READ2	 =>	
															WR_out<='0';	WR_GAMMA<='0';	 	            ----------  read back to pc CONFIG parameter	(header 7 byte)	  																							
															DATA_OUT_PHY<='0' & DATA_IN;	WR_PHY_B<='1';WR_PHY_A<='1';		----------  out to PHY
															if(counter_byte>=6)then							----------  counter 7 byte for recive parameter
																counter_byte<=0;
																ADD_counter_WB<=x"000";
																state<= recive_GD_CONFIG_READ;			------ jump to recive video data state	
																if(ID_correct='1')then		
																	blink_ena<=not blink_ena;
																end if;
															else
																counter_byte<=counter_byte+1;
																state<= recive_header_GD_CONFIG_READ2;	
															end if;
															
															case(counter_byte)is
																when	0	=>	if(DATA_IN=ID_GD_MSB)then
																					ID_correct<='1';
																				else
																					ID_correct<='0';
																				end if;	
																when	1	=>	if(DATA_IN/=ID_GD_LSB)then ID_correct<='0'; end if;	
																when	3	=>	if(DATA_IN/=x"55")then ID_correct<='0'; end if;						
																when	4	=>	if(DATA_IN/=x"AA")then ID_correct<='0'; end if;		
																when	5	=>	if(DATA_IN/=x"55")then ID_correct<='0'; end if;						
																when	6	=>	if(DATA_IN/=x"AA")then ID_correct<='0'; end if;	
																when others =>
															end case;
											
				when	recive_GD_CONFIG_READ => 												-----	 whitebalance  ( 768 (255x3) byte )
											if(counter_byte=2)then
													counter_byte<=0;	
													if(ADD_counter_WB>= x"100")then
														ADD_counter_WB<=x"000";
														STATE<=recive_GD_CONFIG_READ2;
													else														
														STATE<=recive_GD_CONFIG_READ;										 	 
													end if;
											elsif(counter_byte=1)then
												ADD_counter_WB<=ADD_counter_WB+1;
												counter_byte<=counter_byte+1;
												STATE<=recive_GD_CONFIG_READ;
											else
												counter_byte<=counter_byte+1;
												STATE<=recive_GD_CONFIG_READ;		
											end if;
											
											if(ID_correct='1')then		
												case(counter_byte)is
													when	0	=> DATA_OUT_PHY<='0' & DATA_IN_WB(23 downto 16);	
													when	1	=> DATA_OUT_PHY<='0' & DATA_IN_WB(15 downto 8);	
													when	2	=> DATA_OUT_PHY<='0' & DATA_IN_WB(7 downto 0);	
													when	others	=>DATA_OUT_PHY<='0' & DATA_IN_WB(23 downto 16);		
												end case;
											else
												DATA_OUT_PHY<='0' & DATA_IN;	
											end if;
											WR_WB<='0';	
											WR_GAMMA<='0';		
											WR_out<='0';
											WR_PHY_B<='1';WR_PHY_A<='1';	
											
				when	recive_GD_CONFIG_READ2 =>   if(counter_byte>=255)then				-----	 CONFIG   ( 256 byte )
														counter_byte<=0;
														STATE<=END_package_AB;	
													else
														counter_byte<=counter_byte+1;
														 STATE<=recive_GD_CONFIG_READ2;	
												   end if;
												WR_WB<='0';	
												WR_GAMMA<='0';		
												WR_out<='0';
												WR_PHY_B<='1';WR_PHY_A<='1';	
												DATA_OUT_PHY<='0' & DATA_IN;	
												
													
												
------------------------------------------------------------------------------------------ recive_header_STATUS_READ2 recive_STATUS_READ
------------------------------  READ BACK VERSION AND STATUS -----------------------------	
------------------------------------------------------------------------------------------	

				when	recive_header_STATUS_READ2	 =>	
															WR_out<='0';	WR_GAMMA<='0';	 	            ----------  read back to pc status	(header 7 byte)	  																							
															DATA_OUT_PHY<='0' & DATA_IN;	WR_PHY_B<='1';	WR_PHY_A<='1';	----------  out to PHY
															if(counter_byte>=6)then							----------  counter 7 byte for recive parameter
																counter_byte<=0;
																state<= recive_STATUS_READ;			
															else
																counter_byte<=counter_byte+1;
																state<= recive_header_STATUS_READ2;	
															end if;
															
															case(counter_byte)is
																when	0	=>	if(DATA_IN=ID_GD_MSB)then
																					ID_correct<='1';
																				else
																					ID_correct<='0';
																				end if;	
																when	1	=>	if(DATA_IN/=ID_GD_LSB)then ID_correct<='0'; end if;	
																when	3	=>	if(DATA_IN/=x"55")then ID_correct<='0'; end if;						
																when	4	=>	if(DATA_IN/=x"AA")then ID_correct<='0'; end if;		
																when	5	=>	if(DATA_IN/=x"55")then ID_correct<='0'; end if;						
																when	6	=>	if(DATA_IN/=x"AA")then ID_correct<='0'; end if;	
																when others =>
															end case;	
													
				when	recive_STATUS_READ => 			
												 if(counter_byte=63)then
													counter_byte<=0;	
													STATE<=END_package_AB;	
												 else
													counter_byte<=counter_byte+1;	
													STATE<=recive_STATUS_READ;
												 end if;
											 
												if(ID_correct='1')then
													case(counter_byte)is
														when 0 to 31 =>DATA_OUT_PHY<='0' & FPGA_Version(counter_byte);
														when 32 =>DATA_OUT_PHY<='0' & GD_TEMP;
														when 33 =>DATA_OUT_PHY<='0' & POS_Y & POS_X;
														when 34 =>DATA_OUT_PHY<='0' & DIP_SW;
														when others => DATA_OUT_PHY<='0' & x"00";
													end case;
												else
													DATA_OUT_PHY<='0' & DATA_IN;	
												end if;
												
												WR_GAMMA<='0';		
												WR_out<='0';
												WR_PHY_B<='1';	WR_PHY_A<='1';									
													
													
------------------------------------------------------------------------------------------
----------------------------------------  END PACKAGE  -----------------------------------	
------------------------------------------------------------------------------------------	
													
														
				when	END_package_AB	=>	STATE<=WAITING;--END_package1;										
											WR_out<='0';	 
											WR_GAMMA<='0';	
											WR_WB<='0';	
											DATA_OUT_PHY<='1' & x"00";
											WR_PHY_B<='1';WR_PHY_A<='1';	
											
				when	END_package_B	=>	STATE<=WAITING;--END_package1;										
											WR_out<='0';	 
											WR_GAMMA<='0';	
											WR_WB<='0';	
											DATA_OUT_PHY<='1' & x"00";
											WR_PHY_B<='1';WR_PHY_A<='0';	
																			
											
															
				when	others	=>		STATE<=END_package_B;
											WR_out<='0';
											WR_GAMMA<='0';
											
										
												
			end case;
	else
		WR_out<='0';
		WR_GAMMA<='0';
		WR_PHY_B<='0';
		WR_PHY_A<='0';
		DATA_OUT_PHY<='0' & DATA_IN;			
	end if;
	
end if;
end if;
end process;


process(CLK)
variable DIP_SW345_BUFF : std_logic_vector (2 downto 0);
variable offset_x : integer range 0 to 127;
variable offset_y : integer range 0 to 127;
begin
if(rising_edge(CLK))then

DIP_SW345_BUFF:=DIP_SW(4 downto 2);
-----------------------------------------------------------------	
case(DIP_SW345_BUFF)is
	when	"000"	=>	offset_x:=32; offset_y:=32; 
	when	"010"	=>	offset_x:=32; offset_y:=48; 
	when	"100"	=>	offset_x:=64; offset_y:=64; 	
	when	"110"	=>	offset_x:=80; offset_y:=80; 
	when	"001"	=>	offset_x:=80; offset_y:=40; 
	when	"011"	=>	offset_x:=32; offset_y:=40; 
	when	others	=>	offset_x:=32; offset_y:=32; 
end case;
	
	
	case(POS_Y)is		
		when x"0" =>ADD_counter_y_capture<=conv_std_logic_vector(offset_y*0,12);
		when x"1" =>ADD_counter_y_capture<=conv_std_logic_vector(offset_y*1,12);
		when x"2" =>ADD_counter_y_capture<=conv_std_logic_vector(offset_y*2,12);
		when x"3" =>ADD_counter_y_capture<=conv_std_logic_vector(offset_y*3,12);	
		when x"4" =>ADD_counter_y_capture<=conv_std_logic_vector(offset_y*4,12);
		when x"5" =>ADD_counter_y_capture<=conv_std_logic_vector(offset_y*5,12);
		when x"6" =>ADD_counter_y_capture<=conv_std_logic_vector(offset_y*6,12);
		when x"7" =>ADD_counter_y_capture<=conv_std_logic_vector(offset_y*7,12);		
		when x"8" =>ADD_counter_y_capture<=conv_std_logic_vector(offset_y*8,12);
		when x"9" =>ADD_counter_y_capture<=conv_std_logic_vector(offset_y*9,12);		
		when x"A" =>ADD_counter_y_capture<=conv_std_logic_vector(offset_y*10,12);
		when x"B" =>ADD_counter_y_capture<=conv_std_logic_vector(offset_y*11,12);		
		when x"C" =>ADD_counter_y_capture<=conv_std_logic_vector(offset_y*12,12);
		when x"D" =>ADD_counter_y_capture<=conv_std_logic_vector(offset_y*13,12);
		when x"E" =>ADD_counter_y_capture<=conv_std_logic_vector(offset_y*14,12);
		when x"F" =>ADD_counter_y_capture<=conv_std_logic_vector(offset_y*15,12);		
		when others =>	ADD_counter_y_capture<=x"000";
	end case;
	case(POS_X)is		
		when x"0" =>ADD_counter_X_capture<=conv_std_logic_vector(offset_x*0,12);
		when x"1" =>ADD_counter_X_capture<=conv_std_logic_vector(offset_x*1,12);
		when x"2" =>ADD_counter_X_capture<=conv_std_logic_vector(offset_x*2,12);
		when x"3" =>ADD_counter_X_capture<=conv_std_logic_vector(offset_x*3,12);		
		when x"4" =>ADD_counter_X_capture<=conv_std_logic_vector(offset_x*4,12);
		when x"5" =>ADD_counter_X_capture<=conv_std_logic_vector(offset_x*5,12);
		when x"6" =>ADD_counter_X_capture<=conv_std_logic_vector(offset_x*6,12);
		when x"7" =>ADD_counter_X_capture<=conv_std_logic_vector(offset_x*7,12);		
		when x"8" =>ADD_counter_X_capture<=conv_std_logic_vector(offset_x*8,12);
		when x"9" =>ADD_counter_X_capture<=conv_std_logic_vector(offset_x*9,12);		
		when x"A" =>ADD_counter_X_capture<=conv_std_logic_vector(offset_x*10,12);
		when x"B" =>ADD_counter_X_capture<=conv_std_logic_vector(offset_x*11,12);		
		when x"C" =>ADD_counter_X_capture<=conv_std_logic_vector(offset_x*12,12);
		when x"D" =>ADD_counter_X_capture<=conv_std_logic_vector(offset_x*13,12);
		when x"E" =>ADD_counter_X_capture<=conv_std_logic_vector(offset_x*14,12);
		when x"F" =>ADD_counter_X_capture<=conv_std_logic_vector(offset_x*15,12);	
		when others =>	ADD_counter_X_capture<=x"000";
	end case;
	
	
	end if;
end process;


end Behavioral;
