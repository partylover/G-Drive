----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:08:22 09/07/2006 
-- Design Name: 
-- Module Name:    g_drive_controller - Behavioral 
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

entity g_drive_controller_shif_register is
    Port ( 	CLK : in  STD_LOGIC;  -------------  system clk
				CLK_PWM : in  STD_LOGIC;  -------------  PWM driver clk
				RESET : in  STD_LOGIC; 
				PAGE : in  STD_LOGIC; ------------- Page togle bit in for check data in active

		-----------------------------------------------------			  
           ADDRESS : out  STD_LOGIC_VECTOR (12 downto 0);  --------------  address out for frame buffer  128x128 pixel 
		----------------------------------------------------	  
           DATA : out  STD_LOGIC_VECTOR (7 downto 0);	-------------- data out for PWM compare / for bit counter 
		----------------------------------------------------	  
			  ADDRESS_WB : out  STD_LOGIC_VECTOR (7 downto 0); --------------  address out for whitebalance ram  8 row x 32 coloum
           DATA_WB : in  STD_LOGIC_VECTOR (23 downto 0);  -------------- data in for whitbalance  RGB (8 bit x 3)         
		------------------------------------------------------	  
				ROW_select : out  STD_LOGIC_VECTOR (3 downto 0);  ------------ 8 row select ( 8 port output to drive LED module)  
			  display_enable  : out  STD_LOGIC;  ------------------  enable display  0 = blank picture , 1 = diplay from frame buffer
			  config_enable : out  STD_LOGIC;  --------------- enable config mode for config led driver
			  config_data :  out  STD_LOGIC_VECTOR (47 downto 0); -------------- data config for led driver RGB (16 bit x 3)
			  MODE : out  STD_LOGIC; ---------------   select binary pwm or counter pwm
			  MODE_PWM : out  STD_LOGIC; ---------------   select PWM driver dim mode
			  ADD_BUS_WB_BUSY  : in  STD_LOGIC;
			  SEND_WB_BUSY :  out  STD_LOGIC;
			  
			  DIMMER : in STD_LOGIC_VECTOR (4 downto 0);
			  DIMMER_o :out std_logic_vector(4 downto 0);
			  -------------- SCK STROBE OE to led module ------------------------------
			  STROBE1 : out  STD_LOGIC;  
           OE1 : out  STD_LOGIC;
			  CLK_OUT1 : out  STD_LOGIC	;  
			  
			  STROBE2 : out  STD_LOGIC;
           OE2 : out  STD_LOGIC;
			  CLK_OUT2 : out  STD_LOGIC;
			  
			  HA : out  STD_LOGIC;
           HB : out  STD_LOGIC;
			  HC : out  STD_LOGIC;
			  HD : out  STD_LOGIC;

			Config_register : in  STD_LOGIC_VECTOR (31 downto 0)

			  
									);
end g_drive_controller_shif_register;

architecture Behavioral of g_drive_controller_shif_register is

type TON_state is (waiting,state_str_all,state_str,state_send_data,state_send_config,state_str_config,state_send_config_WB,state_str_config_WB,state_send_config_enable,state_delay,state_send_str_all);
signal STATE : TON_state :=state_send_data;

type TON_state2 is (wait_page,page_active);
signal state_active : TON_state2 :=wait_page;

signal timer_counter : integer range 0 to 270000000 :=0;  		------- timer for check page active
signal display_EN : std_logic  := '0';  								------- enable display when active
signal dimx : integer range 0 to 31 :=0;
signal DATA_counter : std_logic_vector (7 downto 0) := x"00";	
signal ADD : std_logic_vector (11 downto 0) := x"000";
--signal ADDx : std_logic_vector (11 downto 0):= x"000";  	-------- address mix

signal ADDRESS_X : std_logic_vector (6 downto 0) := (others=>'0');
signal ADDRESS_Y : std_logic_vector (6 downto 0) := (others=>'0');

signal ROW : std_logic_vector (2 downto 0) := "000";				-------- ROW counter
signal ROW_B : std_logic_vector (2 downto 0) := "000";			-------- ROW counter 2
signal ROW_C : std_logic_vector (2 downto 0) := "000";			-------- ROW counter 3
signal COL : std_logic_vector (3 downto 0) := "0000";				-------- COL counter
signal COL_B : std_logic_vector (3 downto 0) := "0000";			-------- COL counter 2
signal COL_C : std_logic_vector (3 downto 0) := "0000";			-------- COL counter 3

signal IC_ADD_counter : std_logic_vector (3 downto 0) := x"0";	-------- IC address counter 16 bit for 16 output
signal IC_BOARD_counter : std_logic_vector (3 downto 0):= x"0";-------- counter for number of led driver per 1 LED module
signal BOARD_counter : std_logic_vector (3 downto 0) := x"0";	-------- LED module counter per drive port
signal bit_counter : std_logic_vector (3 downto 0) := x"0";		-------- counter for send parallel data to serial ( 16 bit)
signal DATA_B : std_logic_vector (7 downto 0) := x"00";			-------- delay for data out
signal DATA_C : std_logic_vector (7 downto 0) := x"00";			-------- delay for data out 2
signal counter_send_config_delay : integer range 0 to 1023 :=0;
signal DIM_INi : integer range 0 to 31 :=0;
signal WB_PAGE_SELECT :  STD_LOGIC_VECTOR (1 downto 0) :="11";

signal LED_MODULE_SELECT : std_logic_vector (3 downto 0) := "0000";			-------- LED module select
signal page_count : integer range 0 to 255 :=0;
signal counter_div_clk_pwm : integer range 0 to 15 :=0;
signal PAGE_flag : std_logic  := '0';
signal PAGE_flag2 : std_logic  := '0';
signal STROBE : std_logic  := '0';
signal STROBE_A : std_logic  := '0';
signal STROBE_B : std_logic  := '0';
signal STROBE_C : std_logic  := '0';
signal STROBE_D : std_logic  := '0';
signal STROBE_E : std_logic  := '0';
signal STROBE_F : std_logic  := '0';
signal STROBE_I : std_logic  := '0';
signal STROBE_J : std_logic  := '0';
signal STROBE_K : std_logic  := '0';
signal STROBE_L : std_logic  := '0';
signal STROBE_M : std_logic  := '0';
signal STROBE_N : std_logic  := '0';
signal STROBE_O : std_logic  := '0';
signal STROBE_P : std_logic  := '0';

signal OE : std_logic  := '1';
signal OE_BUFF : std_logic  := '0';
signal OE_BUFF2 : std_logic  := '0';
signal OE_BUFF3 : std_logic  := '0';
signal OE_BUFF4 : std_logic  := '0';
signal MODE_flag : std_logic  := '0';
signal MODE_flag2 : std_logic  := '0';
signal MODE_flag3 : std_logic  := '0';
signal clk_pwm_buff : std_logic  := '1';

signal CLK_OUT_buff : std_logic  := '1';
signal CLK_OUT_buff2 : std_logic  := '1';
signal CLK_OUT_buff3 : std_logic  := '1';
signal CLK_OUT_buff4 : std_logic  := '1';

signal counter2 : integer range 0 to 1024 :=0;

signal DIP_ID1 :  STD_LOGIC_VECTOR (3 downto 0) :=x"0";
signal DIP_ID2 :  STD_LOGIC_VECTOR (3 downto 0) :=x"0";
signal DIP_SW :  STD_LOGIC_VECTOR (7 downto 0) :=x"00";
signal DIP_SW2 :  STD_LOGIC_VECTOR (2 downto 0) :="000";

signal MBI_register : std_logic_vector (15 downto 0) :="0000000000000000"; 


constant TC62C772_register3 : std_logic_vector (15 downto 0) :=x"FFFF";  --- all port on
constant TC62C772_register2 : std_logic_vector (15 downto 0) :="0000110000000000";  --- division pwm / asynchronous mode
constant TC62C772_register_WB : std_logic_vector (7 downto 0) :="00000000";  --- 16 bit pwm / not initialization / not stanby

constant MBI5041_register : std_logic_vector (15 downto 0) :="0000010000000000";  --- Manual sync mode MBI5041 code A
constant MBI5041B_register : std_logic_vector (15 downto 0) :="1000010000000000";  --- Manual sync mode MBI5041 code B


constant P16C_V1  : std_logic_vector (3 downto 0) := "0000";  ---- LATCH
constant P16C_V2  : std_logic_vector (3 downto 0) := "1000";  ---- LATCH
constant P10C_V1  : std_logic_vector (3 downto 0) := "0100";  ---- SCAN 4
constant P12C_V1  : std_logic_vector (3 downto 0) := "1100";  ---- SCAN 4
constant P16C_V3  : std_logic_vector (3 downto 0) := "0010";  ---- LATCH
constant P10C_V2  : std_logic_vector (3 downto 0) := "1010";  ---- SCAN 4
constant P12C_V2  : std_logic_vector (3 downto 0) := "0110";  ---- SCAN 2
constant P16C_PWM_V1  : std_logic_vector (3 downto 0) := "1110";  ---- LATCH PWM driver MBI5041
constant P12C_PWM_V1  : std_logic_vector (3 downto 0) := "0001";  ---- SCAN 4  PWM driver MBI5041
constant P10C_PWM_V1  : std_logic_vector (3 downto 0) := "1001";  ---- SCAN 4  PWM driver MBI5041
constant P16C_PWM_V2  : std_logic_vector (3 downto 0) := "0101";  ---- LATCH PWM driver MBI5041 code B
constant P762C_V1  : std_logic_vector (3 downto 0) := "1101";  ---- P7.26 scan8 mbi5026
constant P4C_V1  : std_logic_vector (3 downto 0) := "0011";  ---- P4 SCAN 16 MBI5024GP
constant P4C_PWM_V1  : std_logic_vector (3 downto 0) := "1011";  ---- P4 SCAN 16 MBI5041 

constant WB_RED  : std_logic_vector (7 downto 0) := x"55";
constant WB_GREEN  : std_logic_vector (7 downto 0) := x"55";
constant WB_BLUE  : std_logic_vector (7 downto 0) := x"55";

begin


LED_MODULE_SELECT<=DIP_SW(7 downto 5) & DIP_SW2(0) ;

DIP_SW<=Config_register(15 downto 8);
DIP_SW2<=Config_register(26 downto 24);
DIP_ID1<=Config_register(3 downto 0);
DIP_ID2<=Config_register(7 downto 4);


display_enable<= display_EN ;



process(CLK)
variable div_clk_pwm : integer range 0 to 15 :=0;
begin
if(falling_edge(CLK))then	


	if(counter_div_clk_pwm>=div_clk_pwm)then
		CLK_PWM_buff<=not CLK_PWM_buff;
		counter_div_clk_pwm<=0;
	else
		counter_div_clk_pwm<=counter_div_clk_pwm+1;
	end if;

	case LED_MODULE_SELECT is
	--	when  (P12C_PWM_V1)  =>	div_clk_pwm:=3; ---- div 6
		when others 			=> div_clk_pwm:=2; ---- div 4  
	end case;
		
		
		

	case LED_MODULE_SELECT is
			when (P16C_PWM_V1) | (P12C_PWM_V1) | (P10C_PWM_V1) | (P4C_PWM_V1)=>		
																STROBE1<=STROBE_K;  ----- delay Strobe for 1/2 clk
																STROBE2<=STROBE_K;  ----- delay Strobe for 1/2 clk
			when (P16C_PWM_V2) 	=>  		STROBE1<=STROBE_K;  ----- delay Strobe for 1/2 clk
													STROBE2<=STROBE_K;  ----- delay Strobe for 1/2 clk					
		when others 		=>	STROBE1<=STROBE_C;  ----- delay Strobe for 1/2 clk
									STROBE2<=STROBE_C;  ----- delay Strobe for 1/2 clk	
	end case;
									
end if;
end process;


process(OE_BUFF,CLK_PWM,CLK_PWM_buff,LED_MODULE_SELECT)
begin
	case LED_MODULE_SELECT is
		when (P16C_PWM_V1) | (P12C_PWM_V1) | (P10C_PWM_V1) | (P16C_PWM_V2)| (P4C_PWM_V1) =>	
--										OE1<=CLK_PWM;
--										OE2<=CLK_PWM;
										OE1<=CLK_PWM_buff;
										OE2<=CLK_PWM_buff;
										
		when others 	=>			OE1<=OE_BUFF;
										OE2<=OE_BUFF;	
	end case;
end process;



process(CLK)
begin
if(rising_edge(CLK))then	



	MODE_FLAG2<=MODE_FLAG;
	MODE_FLAG3<=MODE_FLAG2;
	MODE<=MODE_FLAG3;
	
---------  DELAY for OE  ---------------------	

--	OE1<=OE_BUFF;    	-------  
--	OE2<=OE_BUFF;		-------	
	

---------  DELAY for  CLK out   ---------------------	
  
	CLK_OUT_buff2<=CLK_OUT_buff;
	
	CLK_OUT1<=CLK_OUT_buff;
	CLK_OUT2<=CLK_OUT_buff;

--case LED_MODULE_SELECT is
--		when  (P12C_PWM_V1)  =>	
--								CLK_OUT1<=CLK_OUT_buff2;
--								CLK_OUT2<=CLK_OUT_buff2;
--										
--		when others 	=>	CLK_OUT1<=CLK_OUT_buff;
--								CLK_OUT2<=CLK_OUT_buff;
--	end case;

	

---------  DELAY for ROW out   ---------------------	

	ROW_B<=ROW;
	ROW_C<=ROW_B;
	ROW_select<='0' & ROW_C;

---------  DELAY for dataout    ---------------------	

	case LED_MODULE_SELECT is
		when (P16C_PWM_V1) | (P12C_PWM_V1) | (P10C_PWM_V1) | (P16C_PWM_V2) | (P4C_PWM_V1) =>		DATA_B<=x"0" & bit_counter;									
		when others 	=>			DATA_B<=DATA_counter;
	end case;

	
	
	
	DATA_C<=DATA_B;
	DATA<=DATA_C;

---------  DELAY for strobe out ---------------------	
	
	STROBE_A<=STROBE;	
	STROBE_B<=STROBE_A;
	STROBE_C<=STROBE_B;
	STROBE_D<=STROBE_C;
	STROBE_E<=STROBE_D;
	STROBE_F<=STROBE_E;
	STROBE_I<=STROBE_F;
	STROBE_J<=STROBE_I;
	STROBE_K<=STROBE_J;
	STROBE_L<=STROBE_K;
	STROBE_M<=STROBE_L;
	STROBE_N<=STROBE_M;
	STROBE_O<=STROBE_N;
	STROBE_P<=STROBE_O;
	
	case LED_MODULE_SELECT is
	
			when P12C_V2 =>HA<= COL_B(0);
								HB<= not COL_B(0);
								HC<='0';
								HD<='0';
			
			
			when others =>
							HA<=COL_B(0);
							HB<=COL_B(1);
							HC<=COL_B(2);
							HD<=COL_B(3);
	end case;
	
end if;
end process;

--------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------VIDEO ADDRESS MAP --------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------



-- ADDX(9 downto 0)<=  BOARD_counter(3 downto 0) & IC_BOARD_counter(1 downto 0) & IC_ADD_counter(3 downto 0)  ;  ----------  mix address for frame buffer ---- 
--ADDX(8 downto 0)<=  BOARD_counter(2 downto 0) & IC_BOARD_counter(1 downto 0) & IC_ADD_counter(3 downto 0)  ;  ----------  mix address for frame buffer ----


ADDRESS<=ADDRESS_Y(5 downto 0) & ADDRESS_X;

process(CLK)  ---------------------   Address MAP of LED module
variable SW : std_logic_vector (1 downto 0); 
variable ADDX : std_logic_vector (11 downto 0);  	-------- address mix
variable ADDX_B : std_logic_vector (11 downto 0);  	-------- address mix
variable ADDX_C : std_logic_vector (11 downto 0);  	-------- address mix
begin

if(rising_edge(CLK))then

ADDX(8 downto 0):=  BOARD_counter(2 downto 0) & IC_BOARD_counter(1 downto 0) & IC_ADD_counter(3 downto 0)  ;  ----------  mix address for frame buffer P16C_PWM_V1 P12C_PWM_V1 ----
ADDX_B(7 downto 0):=  BOARD_counter(2 downto 0) & IC_BOARD_counter(0) & IC_ADD_counter(3 downto 0)  ;  ----------  mix address for frame buffer P10C_PWM_V1  ----
ADDX_C(8 downto 0):=  BOARD_counter(1 downto 0) & IC_BOARD_counter(2 downto 0) & IC_ADD_counter(3 downto 0)  ;  ----------  mix address for frame buffer P4C_PWM_V1  scan 16 ----


	SW:=  ADD(3) & ADD(6);

	case LED_MODULE_SELECT is
		when P16C_V1 =>case(SW)is 
								when "00" =>ADDRESS_Y<= '0'& ROW & not ADD(6) & ADD(3)& not ADD(2)  ;
												ADDRESS_X<=(ADD(9 downto 7)) &  ADD(5 downto 4) & not ADD(1 downto 0) ;    				---- P16 16x16 chaina  real 1R1G1B  V1 SO.560600151
								when "01" =>ADDRESS_Y<= '0'& ROW & not ADD(6) & ADD(3)& not ADD(2) ;  
												ADDRESS_X<=(ADD(9 downto 7)) &  ADD(5 downto 4) & not ADD(1 downto 0) ;    				
								when "10" =>ADDRESS_Y<= '0'& ROW & not ADD(6) & ADD(3)& not ADD(2)  ;
												ADDRESS_X<=(ADD(9 downto 7)) &  ADD(5 downto 4) &  ADD(1 downto 0) ;    				
								when "11" =>ADDRESS_Y<= '0'& ROW & not ADD(6) & ADD(3)& not ADD(2);   
												ADDRESS_X<=(ADD(9 downto 7)) &  ADD(5 downto 4) &  ADD(1 downto 0) ;    				  
								when others => ADDRESS_X<= (others =>'0'); ADDRESS_Y<= (others =>'0');
							end case;
								counter2<=  CONV_INTEGER(ADD(9 downto 2)); 
								
		when P16C_V2 =>	ADDRESS_Y<= '0'& ROW & not ADD(6) & ADD(3 downto 2);
								ADDRESS_X<= ADD(9 downto 7) & ADD(5 downto 4) & ADD(1 downto 0);    				---- P16 16x16 chaina  real 1R1G1B   V2  SO. 560700173
								counter2<=  CONV_INTEGER(ADD(9 downto 2)); 
								
		when P16C_V3 =>	ADDRESS_Y<= '0'& ROW(2 downto 1) & not ADD(6) & ROW(0) & ADD(3 downto 2);
								ADDRESS_X<= ADD(9 downto 7) & ADD(5 downto 4) & ADD(1 downto 0);    				---- P16 16x16 chaina  real 1R1G1B   V3  SO. 560700265
								counter2<=  CONV_INTEGER(ADD(9 downto 2)); 						
																
		when P10C_V1 =>	ADDRESS_Y<= '0'& ROW &  ADD(3)  &  COL(1 downto 0);  
								ADDRESS_X<= ADD(7 downto 4) &  ADD(2 downto 0) ;    				---- P10 16x16 chaina   1R1G1B   V1 SO.
								counter2<=  CONV_INTEGER(ADD(7 downto 0)); 			
								
		when P10C_V2 =>	ADDRESS_Y<= '0'& ROW &  ADD(3)  &  COL(1 downto 0);  
								if(ADD(3)='1')then
									ADDRESS_X<= ADD(7 downto 4) &  ADD(2 downto 0) ;    				---- P10 16x16 chaina   1R1G1B   V2 SO.561000264 , 262 , 257
								else
									ADDRESS_X<= ADD(7 downto 4) & not ADD(2 downto 0) ;
								end if;
								counter2<=  CONV_INTEGER(ADD(7 downto 0)); 		

		when P12C_V1 =>	ADDRESS_Y<= '0'  & ROW(2 downto 1)& not ADD(5) &  ADD(3)  &  COL(1 downto 0);    ---- P12 16x16 chaina  real 1R1G1B   V1 SO.
								ADDRESS_X<= ADD(8 downto 6)  & ADD(4) &  not ADD(2 downto 0);
								counter2<=  CONV_INTEGER(ADD(8 downto 1));
								
		when P12C_V2 =>	ADDRESS_Y<= '0'& ROW(2 downto 1) & not ADD(5)  & ROW(0) &  ADD(3)  &  COL(0);  
								ADDRESS_X<= ADD(8 downto 6) & ADD(4) &  ADD(2 downto 0) ;    				---- P12 16x16 chaina   1R1G1B   V2 SO.561000269 
								counter2<=  CONV_INTEGER(ADD(8 downto 1));	
								
--		when P16C_PWM_V1 =>	ADDRESS_X<=	ADDX(9 downto 7) & ADDX(5 downto 4)  &  ADDX(1 downto 0)  ; 		---- P16 16x8 chaina   1R1G1B   V2 SO.						
--									ADDRESS_Y<= '0' &  ROW(2 downto 1) & ADDX(6)  & ROW(0)  &   ADDX(3 downto 2)  ;

		when (P16C_PWM_V1) | (P16C_PWM_V2) =>	
									ADDRESS_X<=	ADDX(8 downto 6) & ADDX(5 downto 4)  &  ADDX(1 downto 0)  ; 									
									ADDRESS_Y<= "00" &  ROW(2 downto 0)   &   ADDX(3 downto 2)  ;
									
		when P12C_PWM_V1 =>	ADDRESS_X<=	ADDX(8 downto 6) & ADDX(4)  &  not ADDX(2 downto 0)  ; 			-----  P12 16x16 chaina 1R1G1B SO.561100331						
									ADDRESS_Y<= "0" &  ROW(2 downto 1) & not ADDX(5) & ADDX(3) & COL(1 downto 0) ;
									
		when P10C_PWM_V1 =>	ADDRESS_X<=	ADDX_B(7 downto 5) & ADDX_B(4)  &  ADDX_B(2 downto 0)  ; 									
									ADDRESS_Y<= "0" &  ROW(2 downto 0)  & ADDX_B(3) & COL(1 downto 0) ;																	
									
		when P762C_V1 =>	

								ADDRESS_Y<=  not ADD(7 downto 5) & ROW(0) &  COL(2 downto 0) ; 
								ADDRESS_X<= (ROW(2 downto 1) &  ADD(4 downto 0));	
								
					
								counter2<=  CONV_INTEGER(ADD(7 downto 0)); 		
								
		when P4C_V1 =>		ADDRESS_Y<= '0'&  ROW(1 downto 0) & COL(3 downto 0);  
								ADDRESS_X<= ADD(6 downto 0) ;    ---- P10 32x32 chaina   2R2G2B   V1 SO.
								counter2<=  CONV_INTEGER(ADD(7 downto 0)); 	
		
		when (P4C_PWM_V1) =>	ADDRESS_X<= IC_BOARD_counter(2 downto 0) & IC_ADD_counter(3 downto 0); 			---- p4 chaina pcb 64x32 pixel						
									ADDRESS_Y<= "0" & ROW(1 downto 0) & COL(3 downto 0) ;	
	--------------------------------------------------							
		when others =>		ADDRESS_X<= (others =>'0'); ADDRESS_Y<= (others =>'0');
	end case;

end if;

end process;

--------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ CONFIG ADDRESS MAP --------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------

ADDRESS_WB<='0' & ROW_B  & WB_PAGE_SELECT  &  (not BOARD_counter(2 downto 1)) ;  ------ mix address for whitbalance RAM

--process(state,DATA_WB,DIP_SW)	--------------------   Address MAP of LED module
process(CLK)	--------------------   Address MAP of LED module
begin
if(rising_edge(CLK))then


	case LED_MODULE_SELECT is
		when P16C_PWM_V2 => MBI_register<=MBI5041B_register;
		when others =>	 MBI_register<=MBI5041_register;
	end case;
		

---------  select config data  -------------------
			
				if(DIP_SW(1)='1')then
					config_data(47 downto 32)<=MBI_register(15 downto 10) & WB_RED(7 downto 0) & "00" ;
					config_data(31 downto 16)<=MBI_register(15 downto 10) & WB_GREEN(7 downto 0) & "00" ;
					config_data(15 downto 0)<=MBI_register(15 downto 10) &  WB_BLUE(7 downto 0)& "00" ;
				else	
					config_data(47 downto 32)<=MBI_register(15 downto 10) & DATA_WB(7 downto 0) & "00" ; ---- RED
					config_data(31 downto 16)<=MBI_register(15 downto 10) & DATA_WB(15 downto 8) & "00" ; ---- GREEN
					config_data(15 downto 0)<=MBI_register(15 downto 10) &  DATA_WB(23 downto 16) & "00" ; ---- BLUE					
				end if;
end if;
end process	;

--------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------   MAIN PROCESS   --------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------
process(CLK,RESET)
begin

if(RESET='1')then
	ROW<="000";
	PAGE_flag<='0';
	bit_counter<=x"0";
	state<=state_send_data;
	IC_BOARD_counter<=x"0";	
	BOARD_counter<=x"0";
	IC_ADD_counter<=x"0";
	timer_counter<=0;
	display_EN<='0';
elsif(rising_edge(CLK))then
	PAGE_flag<=page;
------------- check for page activ ---------------

	DIM_INi<=conv_integer(DIMMER);
	case(DIM_INi)is

		when 0 to 7 => WB_PAGE_SELECT<="00";
		when 8 to 15 => WB_PAGE_SELECT<="01";
		when 16 to 23 => WB_PAGE_SELECT<="10";
		when 24 to 31 => WB_PAGE_SELECT<="11";
		when others => WB_PAGE_SELECT<="00";
		
	end case;
	

case(state_active)is
	when	wait_page	=>	if(PAGE_flag/=page)then	
									timer_counter<=0;
									--if(page_count>=180)then	--- 3 sec @ 60 fps
									if(page_count>=60)then	--- 1 sec @ 60 fps
										state_active<=page_active;
										page_count<=0;
									else
										page_count<=page_count+1;
										state_active<=wait_page;
									end if;
								else
									if(timer_counter>=25000000)then -------- time out = 200 ms @ 125mhz clk
										page_count<=0;
										timer_counter<=0;
									else
										timer_counter<=timer_counter+1;
									end if;
									state_active<=wait_page;
								end if;	
								display_EN<='0';
								
	when	page_active =>	if(PAGE_flag/=page)then	
									timer_counter<=0;
									state_active<=page_active;
								else
									if(timer_counter>=25000000)then -------- time out = 200 ms @ 125mhz clk
										state_active<=wait_page;	
										timer_counter<=0;
									else
										timer_counter<=timer_counter+1;
										state_active<=page_active;
									end if;
								end if;
								display_EN<='1';
	when others	=>			state_active<=wait_page;	
end case;	
-------------------  MAIN State mechine  ---------------------------------


case LED_MODULE_SELECT is
	when (P16C_V1) | (P16C_V2) | (P16C_V3)	=>	MODE_PWM<='0';	---------------- LATCH Display

									if(ROW="111")then
										ROW<="000";
											if(ADD=x"3FF")then
													ADD<=x"000";	
													if(MODE_flag='0')then
														if(DATA_counter=x"07")then
															DATA_counter<=x"00";
															MODE_flag<='1';
														else
															DATA_counter<=DATA_counter+1;
														end if;							
													else
														if(DATA_counter=x"1E")then
															DATA_counter<=x"00";
															MODE_flag<='0';
														else
															DATA_counter<=DATA_counter+1;
														end if;	
													end if;		
												else
													ADD<=ADD+1;
												end if;	
									else
										ROW<=ROW+1;
									end if;		
		when  (P10C_V1) | (P10C_V2)	=> MODE_PWM<='0';			---------------- SCAN 1/4
			
								if(ROW="111")then
										ROW<="000";										
											if(ADD=x"0FF")then
													COL_B<=COL;
													ADD<=x"000";	
													if(MODE_flag='0')then
														if(DATA_counter=x"07")then
															DATA_counter<=x"00";
															MODE_flag<='1';
														else
															DATA_counter<=DATA_counter+1;
														end if;							
													else
														if(DATA_counter=x"1E")then
															DATA_counter<=x"00";
															MODE_flag<='0';
															
															if(COL="0011")then
																COL<="0000";
															else
																COL<=COL+1;
															end if;
														else
															DATA_counter<=DATA_counter+1;
														end if;	
													end if;		
												else
													ADD<=ADD+1;
												end if;	
									else
										ROW<=ROW+1;
									end if;	
									
									
		when  (P12C_V1) 	=> 	MODE_PWM<='0';		---------------- P12C_V1  SCAN 1/4  

			
								if(ROW="111")then
										ROW<="000";
											if(ADD=x"1FF")then
													COL_B<=COL;
													ADD<=x"000";	
													if(MODE_flag='0')then
														if(DATA_counter=x"07")then
															DATA_counter<=x"00";
															MODE_flag<='1';
														else
															DATA_counter<=DATA_counter+1;
														end if;							
													else
														if(DATA_counter=x"1E")then
															DATA_counter<=x"00";
															MODE_flag<='0';
															
															if(COL="0011")then
																COL<="0000";
															else
																COL<=COL+1;
															end if;
														else
															DATA_counter<=DATA_counter+1;
														end if;	
													end if;		
												else
													ADD<=ADD+1;
												end if;	
									else
										ROW<=ROW+1;
									end if;	
									
				when   (P12C_V2)	=> MODE_PWM<='0';			---------------- ---- P12C_V2  SCAN 1/2
			
								if(ROW="111")then
										ROW<="000";
											if(ADD=x"1FF")then
													COL_B<=COL;
													ADD<=x"000";	
													if(MODE_flag='0')then
														if(DATA_counter=x"07")then
															DATA_counter<=x"00";
															MODE_flag<='1';
														else
															DATA_counter<=DATA_counter+1;
														end if;							
													else
														if(DATA_counter=x"1E")then
															DATA_counter<=x"00";
															MODE_flag<='0';
															
															if(COL="0001")then
																COL<="0000";
															else
																COL<=COL+1;
															end if;
														else
															DATA_counter<=DATA_counter+1;
														end if;	
													end if;		
												else
													ADD<=ADD+1;
												end if;	
									else
										ROW<=ROW+1;
									end if;								
	
			when   (P16C_PWM_V1)  =>  MODE_PWM<='1'; ----------------  P16C_PWM_V1  MBI5041 driver code A
											 -------------------  MAIN State mechine  ---------------------------------
											 MODE_flag<='0';
											case(state)is
												--------------------------send ALL video data ----------------------- 
												when	state_send_data =>  SEND_WB_BUSY<='0';
														if(ROW="111")then
															ROW<="000";	
															if(bit_counter=x"F")then
																bit_counter<=x"0";
																	if(IC_BOARD_counter=x"3")then
																		IC_BOARD_counter<=x"0";	
																	---	if(BOARD_counter=x"F")then --
																		if(BOARD_counter=x"7")then --
																			BOARD_counter<=x"0";
																			if(IC_ADD_counter=x"F")then
																				IC_ADD_counter<=x"0";
--																			
																					state<=state_send_config_enable;
							
																			else
																				IC_ADD_counter<=IC_ADD_counter+1;						
																			end if;								
																		else							
																			BOARD_counter<=BOARD_counter+1;
																		end if;
																	else						
																		IC_BOARD_counter<=IC_BOARD_counter+1;
																	end if;			
															else			
																bit_counter<=bit_counter+1;
															end if;	
														else			
															ROW<=ROW+1;
														end if;
														
												when	state_send_config_enable => SEND_WB_BUSY<='1';MODE_flag<='0';
														if(ROW="111")then
															ROW<="000";		
															if(bit_counter=x"F")then
																bit_counter<=x"0";		
																state<=state_send_config;											
															else
																state<=state_send_config_enable;
																bit_counter<=bit_counter+1;
															end if;	
														else
															state<=state_send_config_enable;
															ROW<=ROW+1;
														end if;								
												
												when	state_send_config => SEND_WB_BUSY<='1';		MODE_flag<='0';										
														if(ROW="111")then
															ROW<="000";		
															if(bit_counter=x"F")then
																bit_counter<=x"0";		
																	if(IC_BOARD_counter=x"3")then
																		IC_BOARD_counter<=x"0";							
																	--	if(BOARD_counter=x"F")then
																	if(BOARD_counter=x"7")then
																			BOARD_counter<=x"0";								
																			state<=state_send_data;								
																		else
																			state<=state_send_config;
																			BOARD_counter<=BOARD_counter+1;
																		end if;										
																	else
																		state<=state_send_config;
																		IC_BOARD_counter<=IC_BOARD_counter+1;
																	end if;												
															else
																state<=state_send_config;
																bit_counter<=bit_counter+1;
															end if;	
														else
															state<=state_send_config;
															ROW<=ROW+1;
														end if;	
												when others =>	state<=state_send_data;
										end case;		
										
				when   (P16C_PWM_V2) =>  MODE_PWM<='1'; ----------------  P16C_PWM_V2  MBI5041 driver code B
											 -------------------  MAIN State mechine  ---------------------------------
											 MODE_flag<='0';
											case(state)is
												--------------------------send ALL video data ----------------------- 
												when	state_send_data =>  SEND_WB_BUSY<='0';
														if(ROW="111")then
															ROW<="000";	
															if(bit_counter=x"F")then
																bit_counter<=x"0";
																	if(IC_BOARD_counter=x"3")then
																		IC_BOARD_counter<=x"0";	
																	---	if(BOARD_counter=x"F")then --
																		if(BOARD_counter=x"7")then --
																			BOARD_counter<=x"0";
																			if(IC_ADD_counter=x"F")then
																				IC_ADD_counter<=x"0";--																			
																					state<=state_send_str_all;							
																			else
																				IC_ADD_counter<=IC_ADD_counter+1;						
																			end if;								
																		else							
																			BOARD_counter<=BOARD_counter+1;
																		end if;
																	else						
																		IC_BOARD_counter<=IC_BOARD_counter+1;
																	end if;			
															else			
																bit_counter<=bit_counter+1;
															end if;	
														else			
															ROW<=ROW+1;
														end if;
														
														
												when	state_send_str_all => SEND_WB_BUSY<='0';MODE_flag<='0';
														if(ROW="111")then
															ROW<="000";		
															if(bit_counter=x"F")then
																bit_counter<=x"0";		
																state<=state_send_config_enable;											
															else
																state<=state_send_str_all;
																bit_counter<=bit_counter+1;
															end if;	
														else
															state<=state_send_str_all;
															ROW<=ROW+1;
														end if;															
														
														
														
												when	state_send_config_enable => SEND_WB_BUSY<='1';MODE_flag<='0';
														if(ROW="111")then
															ROW<="000";		
															if(bit_counter=x"F")then
																bit_counter<=x"0";		
																state<=state_send_config;											
															else
																state<=state_send_config_enable;
																bit_counter<=bit_counter+1;
															end if;	
														else
															state<=state_send_config_enable;
															ROW<=ROW+1;
														end if;								
												
												when	state_send_config => SEND_WB_BUSY<='1';		MODE_flag<='0';										
														if(ROW="111")then
															ROW<="000";		
															if(bit_counter=x"F")then
																bit_counter<=x"0";		
																	if(IC_BOARD_counter=x"3")then
																		IC_BOARD_counter<=x"0";							
																	--	if(BOARD_counter=x"F")then
																	if(BOARD_counter=x"7")then
																			BOARD_counter<=x"0";								
																			state<=state_send_data;								
																		else
																			state<=state_send_config;
																			BOARD_counter<=BOARD_counter+1;
																		end if;										
																	else
																		state<=state_send_config;
																		IC_BOARD_counter<=IC_BOARD_counter+1;
																	end if;												
															else
																state<=state_send_config;
																bit_counter<=bit_counter+1;
															end if;	
														else
															state<=state_send_config;
															ROW<=ROW+1;
														end if;	
												when others =>	state<=state_send_data;
										end case;								

			when   (P12C_PWM_V1)	=>  MODE_PWM<='1'; ----------------  P12C scan4  MBI5041 driver
											 -------------------  MAIN State mechine  ---------------------------------
											 MODE_flag<='0';
											case(state)is
												--------------------------send ALL video data ----------------------- 
												when	state_send_data =>  SEND_WB_BUSY<='0';
														if(ROW="111")then
															ROW<="000";	
															if(bit_counter=x"F")then
																bit_counter<=x"0";
																	if(IC_BOARD_counter=x"3")then
																		IC_BOARD_counter<=x"0";	
																		if(BOARD_counter=x"7")then --
																			BOARD_counter<=x"0";
																			if(IC_ADD_counter=x"F")then
																				IC_ADD_counter<=x"0";
																				COL_B<=COL;
																				if(COL=x"3")then
																					COL<=x"0";
																					if(counter_send_config_delay>=63)then
																						state<=state_send_config_enable;
																						counter_send_config_delay<=0;
																					else
																						counter_send_config_delay<=counter_send_config_delay+1;
																					end if;																						
																				else
																					COL<=COL+1;
																					state<=state_send_data;
																				end if;
							
																			else
																				IC_ADD_counter<=IC_ADD_counter+1;						
																			end if;								
																		else							
																			BOARD_counter<=BOARD_counter+1;
																		end if;
																	else						
																		IC_BOARD_counter<=IC_BOARD_counter+1;
																	end if;			
															else			
																bit_counter<=bit_counter+1;
															end if;	
														else			
															ROW<=ROW+1;
														end if;
														
												when	state_send_config_enable => SEND_WB_BUSY<='1';MODE_flag<='0';
														if(ROW="111")then
															ROW<="000";		
															if(bit_counter=x"F")then
																bit_counter<=x"0";		
																state<=state_send_config;											
															else
																state<=state_send_config_enable;
																bit_counter<=bit_counter+1;
															end if;	
														else
															state<=state_send_config_enable;
															ROW<=ROW+1;
														end if;								
												
												when	state_send_config => SEND_WB_BUSY<='1';		MODE_flag<='0';										
														if(ROW="111")then
															ROW<="000";		
															if(bit_counter=x"F")then
																bit_counter<=x"0";		
																	if(IC_BOARD_counter=x"3")then
																		IC_BOARD_counter<=x"0";							
																		if(BOARD_counter=x"7")then
																			BOARD_counter<=x"0";								
																			state<=state_send_data;								
																		else
																			state<=state_send_config;
																			BOARD_counter<=BOARD_counter+1;
																		end if;										
																	else
																		state<=state_send_config;
																		IC_BOARD_counter<=IC_BOARD_counter+1;
																	end if;												
															else
																state<=state_send_config;
																bit_counter<=bit_counter+1;
															end if;	
														else
															state<=state_send_config;
															ROW<=ROW+1;
														end if;	
												when others =>	state<=state_send_data;
										end case;		
	
			when   (P10C_PWM_V1)	=>  MODE_PWM<='1'; ----------------  P10C scan4  MBI5041 driver
											 -------------------  MAIN State mechine  ---------------------------------
											 MODE_flag<='0';
											case(state)is
												--------------------------send ALL video data ----------------------- 
												when	state_send_data =>  SEND_WB_BUSY<='0';
														if(ROW="111")then
															ROW<="000";	
															if(bit_counter=x"F")then
																bit_counter<=x"0";
																	if(IC_BOARD_counter=x"1")then
																		IC_BOARD_counter<=x"0";	
																		if(BOARD_counter=x"7")then --
																			BOARD_counter<=x"0";
																			if(IC_ADD_counter=x"F")then
																				IC_ADD_counter<=x"0";
																				COL_B<=COL;
																				if(COL=x"3")then
																					COL<=x"0";
																					state<=state_send_config_enable;
																				else
																					COL<=COL+1;
																					state<=state_send_data;
																				end if;
							
																			else
																				IC_ADD_counter<=IC_ADD_counter+1;						
																			end if;								
																		else							
																			BOARD_counter<=BOARD_counter+1;
																		end if;
																	else						
																		IC_BOARD_counter<=IC_BOARD_counter+1;
																	end if;			
															else			
																bit_counter<=bit_counter+1;
															end if;	
														else			
															ROW<=ROW+1;
														end if;
														
												when	state_send_config_enable => SEND_WB_BUSY<='1';MODE_flag<='0';
														if(ROW="111")then
															ROW<="000";		
															if(bit_counter=x"F")then
																bit_counter<=x"0";		
																state<=state_send_config;											
															else
																state<=state_send_config_enable;
																bit_counter<=bit_counter+1;
															end if;	
														else
															state<=state_send_config_enable;
															ROW<=ROW+1;
														end if;								
												
												when	state_send_config => SEND_WB_BUSY<='1';		MODE_flag<='0';										
														if(ROW="111")then
															ROW<="000";		
															if(bit_counter=x"F")then
																bit_counter<=x"0";		
																	if(IC_BOARD_counter=x"1")then
																		IC_BOARD_counter<=x"0";							
																	--	if(BOARD_counter=x"F")then
																	if(BOARD_counter=x"7")then
																			BOARD_counter<=x"0";								
																			state<=state_send_data;								
																		else
																			state<=state_send_config;
																			BOARD_counter<=BOARD_counter+1;
																		end if;										
																	else
																		state<=state_send_config;
																		IC_BOARD_counter<=IC_BOARD_counter+1;
																	end if;												
															else
																state<=state_send_config;
																bit_counter<=bit_counter+1;
															end if;	
														else
															state<=state_send_config;
															ROW<=ROW+1;
														end if;	
												when others =>	state<=state_send_data;
										end case;	

		when  (P762C_V1)	=> MODE_PWM<='0';			---------------- SCAN 1/8
			
								if(ROW="111")then
										ROW<="000";										
											if(ADD=x"0FF")then
													COL_B<=COL;
													ADD<=x"000";	
													if(MODE_flag='0')then
														if(DATA_counter=x"07")then
															DATA_counter<=x"00";
															MODE_flag<='1';
														else
															DATA_counter<=DATA_counter+1;
														end if;							
													else
														if(DATA_counter=x"1E")then
															DATA_counter<=x"00";
															MODE_flag<='0';
															
															if(COL="0111")then
																COL<="0000";
															else
																COL<=COL+1;
															end if;
														else
															DATA_counter<=DATA_counter+1;
														end if;	
													end if;		
												else
													ADD<=ADD+1;
												end if;	
									else
										ROW<=ROW+1;
									end if;	
																			
		when  (P4C_V1)	=> MODE_PWM<='0';			---------------- SCAN 1/16
			
								if(ROW="111")then			
										ROW<="000";										
											if(ADD=x"07F")then
												COL_B<=COL;
												ADD<=x"000";	
													if(MODE_flag='0')then
														if(DATA_counter=x"07")then
															DATA_counter<=x"00";
															MODE_flag<='1';
														else
															DATA_counter<=DATA_counter+1;
														end if;							
													else
														if(DATA_counter=x"1E")then
															DATA_counter<=x"00";
															MODE_flag<='0';
															
															if(COL="1111")then
																COL<="0000";
															else
																COL<=COL+1;
															end if;
														else
															DATA_counter<=DATA_counter+1;
														end if;	
													end if;		
											else
												ADD<=ADD+1;
											end if;	
									else
										ROW<=ROW+1;
									end if;	
									
		when   (P4C_PWM_V1)	=>  MODE_PWM<='1'; ----------------  P12C scan4  MBI5041 driver
											 -------------------  MAIN State mechine  ---------------------------------
											 MODE_flag<='0';
											case(state)is
												--------------------------send ALL video data ----------------------- 
												when	state_send_data =>  SEND_WB_BUSY<='0';
														if(ROW="111")then
															ROW<="000";	
															if(bit_counter=x"F")then
																bit_counter<=x"0";
																	if(IC_BOARD_counter=x"7")then
																		IC_BOARD_counter<=x"0";	
																		if(BOARD_counter=x"1")then --
																			BOARD_counter<=x"0";
																			if(IC_ADD_counter=x"F")then
																				IC_ADD_counter<=x"0";
																				COL_B<=COL;
																				if(COL=x"F")then
																					COL<=x"0";
																					if(counter_send_config_delay>=63)then
																						state<=state_send_config_enable;
																						counter_send_config_delay<=0;
																					else
																						counter_send_config_delay<=counter_send_config_delay+1;
																					end if;																						
																				else
																					COL<=COL+1;
																					state<=state_send_data;
																				end if;
							
																			else
																				IC_ADD_counter<=IC_ADD_counter+1;						
																			end if;								
																		else							
																			BOARD_counter<=BOARD_counter+1;
																		end if;
																	else						
																		IC_BOARD_counter<=IC_BOARD_counter+1;
																	end if;			
															else			
																bit_counter<=bit_counter+1;
															end if;	
														else			
															ROW<=ROW+1;
														end if;
														
												when	state_send_config_enable => SEND_WB_BUSY<='1';MODE_flag<='0';
														if(ROW="111")then
															ROW<="000";		
															if(bit_counter=x"F")then
																bit_counter<=x"0";		
																state<=state_send_config;											
															else
																state<=state_send_config_enable;
																bit_counter<=bit_counter+1;
															end if;	
														else
															state<=state_send_config_enable;
															ROW<=ROW+1;
														end if;								
												
												when	state_send_config => SEND_WB_BUSY<='1';		MODE_flag<='0';										
														if(ROW="111")then
															ROW<="000";		
															if(bit_counter=x"F")then
																bit_counter<=x"0";		
																	if(IC_BOARD_counter=x"7")then
																		IC_BOARD_counter<=x"0";							
																		if(BOARD_counter=x"1")then
																			BOARD_counter<=x"0";								
																			state<=state_send_data;								
																		else
																			state<=state_send_config;
																			BOARD_counter<=BOARD_counter+1;
																		end if;										
																	else
																		state<=state_send_config;
																		IC_BOARD_counter<=IC_BOARD_counter+1;
																	end if;												
															else
																state<=state_send_config;
																bit_counter<=bit_counter+1;
															end if;	
														else
															state<=state_send_config;
															ROW<=ROW+1;
														end if;	
												when others =>	state<=state_send_data;
										end case;		
							
		when others	=>		ROW<="000"; ADD<=x"000"; MODE_flag<='0'; 	COL<="0000"; DATA_counter<=x"00";
										
end case;
			
		
------------------------------  SERIAL CLK for drive LED MODULE ---------------------------------------
			if( ROW="000" or  ROW="001" or ROW="010" or ROW="011"   )then			
				CLK_OUT_buff<='0';
			else
				CLK_OUT_buff<='1';
			end if;

------------------------------ enable config data  ------------------------------------			
			if(state=state_send_config or state=state_send_config_WB or state=state_str_config_WB or state=state_str_config or state=state_send_config_enable )then
				config_enable<='1';
			else
				config_enable<='0';
			end if;
			
---------------decode strobe signal --------------------------------------------------------			
			case LED_MODULE_SELECT is
					when (P16C_PWM_V1) | (P12C_PWM_V1) 	=>	 ---------------  PWM driver MBI5041
													if((state=state_send_data and bit_counter=x"F" and IC_BOARD_counter=x"3" and BOARD_counter=x"7"  ) or -------- Strobe for send video data
														(state=state_send_data and bit_counter=x"E" and IC_BOARD_counter=x"3" and BOARD_counter=x"7" and IC_ADD_counter=x"F" ) 	or	-------- Strobe for send video data ALL
														(state=state_send_config and bit_counter>x"4" and IC_BOARD_counter=x"3" and BOARD_counter=x"7" ) or
														(state=state_send_config_enable and bit_counter>x"0")
													  )then				
														STROBE<='1';
													else
														STROBE<='0';
													end if;
				when (P16C_PWM_V2)	=>	 ---------------  PWM driver MBI5041 code B
													if((state=state_send_data and bit_counter=x"F" and IC_BOARD_counter=x"3" and BOARD_counter=x"7"  ) or -------- Strobe for send video data
														(state=state_send_str_all and bit_counter>=x"D" ) 	or	-------- Strobe for send video data ALL
														(state=state_send_config and bit_counter>x"4" and IC_BOARD_counter=x"3" and BOARD_counter=x"7" ) or
														(state=state_send_config_enable and bit_counter>x"0")
													  )then				
														STROBE<='1';
													else
														STROBE<='0';
													end if;
													
					when (P10C_PWM_V1)	=>	 ---------------  PWM driver MBI5041
													if((state=state_send_data and bit_counter=x"F" and IC_BOARD_counter=x"1" and BOARD_counter=x"7"  ) or -------- Strobe for send video data
														(state=state_send_data and bit_counter=x"E" and IC_BOARD_counter=x"1" and BOARD_counter=x"7" and IC_ADD_counter=x"F" ) 	or	-------- Strobe for send video data ALL
														(state=state_send_config and bit_counter>x"4" and IC_BOARD_counter=x"1" and BOARD_counter=x"7" ) or
														(state=state_send_config_enable and bit_counter>x"0")
													  )then				
														STROBE<='1';
													else
														STROBE<='0';
													end if;													
													
						when (P4C_PWM_V1) 	=>	 ---------------  PWM driver MBI5041
													if((state=state_send_data and bit_counter=x"F" and IC_BOARD_counter=x"7" and BOARD_counter=x"1"  ) or -------- Strobe for send video data
														(state=state_send_data and bit_counter=x"E" and IC_BOARD_counter=x"7" and BOARD_counter=x"1" and IC_ADD_counter=x"F" ) 	or	-------- Strobe for send video data ALL
														(state=state_send_config and bit_counter>x"4" and IC_BOARD_counter=x"7" and BOARD_counter=x"1" ) or
														(state=state_send_config_enable and bit_counter>x"0")
													  )then				
														STROBE<='1';
													else
														STROBE<='0';
													end if;
					when others	=>				---------------  shift register driver
													if(ADD= x"000" and ( ROW="000" or  ROW="001" or ROW="010" or ROW="011"  )) then   -------- Strobe for send video data
														STROBE<='1';			
													else
														STROBE<='0';
													end if; 
			end case;		
			
----------------------------------------- OE signal -----------------------------------
		
		case(LED_MODULE_SELECT)is
			when  (P4C_V1) => 		
											
											if(CONV_INTEGER(DIMMER)>25)then
												dimx<=  7;									-- MAX Current 
												DIMMER_o <= DIMMER and "11000";
											elsif(CONV_INTEGER(DIMMER)<16)then
												dimx<= 15;
												DIMMER_o <= DIMMER;
											else
												dimx<=  31 - CONV_INTEGER(DIMMER);  
												DIMMER_o <= DIMMER;
											end if;
											
			when others		=>			DIMMER_o <= DIMMER;
											if(CONV_INTEGER(DIMMER)<7)then
												dimx<= 24;
											else
												dimx<=  31 - CONV_INTEGER(DIMMER); 
											end if;
		end case;
		

			
			if(MODE_flag = '0' ) then
				case(DATA_counter)is
					when x"00" =>  if(counter2>=0   + dimx*8  and counter2 <=255)then OE_BUFF <='0'; else OE_BUFF <='1'; end if;
					when x"01" =>  if(counter2>=128 + dimx/16 and counter2 <=129)then OE_BUFF <='0'; else OE_BUFF <='1'; end if;
					when x"02" =>	if(counter2>=127 + dimx/16  and counter2 <=129)then OE_BUFF <='0'; else OE_BUFF <='1'; end if;
					when x"03" =>	if(counter2>=126 + dimx/8  and counter2 <=130)then OE_BUFF <='0'; else OE_BUFF <='1'; end if;
					when x"04" =>	if(counter2>=124 + dimx/4  and counter2 <=132)then OE_BUFF <='0'; else OE_BUFF <='1'; end if;
					when x"05" =>	if(counter2>=120 + dimx/2    and counter2 <=136)then OE_BUFF <='0'; else OE_BUFF <='1'; end if;
					when x"06" =>	if(counter2>=112 + dimx  and counter2 <=144)then OE_BUFF <='0'; else OE_BUFF <='1'; end if;
					when x"07" =>	if(counter2>=96  + dimx*2  and counter2 <=160)then OE_BUFF <='0'; else OE_BUFF <='1'; end if;
					when others => OE_BUFF <='0';
				end case;
			else
				case(DATA_counter)is
					when x"00"	=>	if(counter2>=64  + dimx*4 and counter2 	<=192)then OE_BUFF <='0'; else OE_BUFF <='1'; end if;
					when others => if(counter2>=0   + dimx*8 and counter2   <=255)then OE_BUFF <='0'; else OE_BUFF <='1'; end if;
				end case;
			end if; 					
			

end if;	

end process;



end Behavioral;

