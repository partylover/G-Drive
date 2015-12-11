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

entity g_drive_controller is
    Port ( CLK : in  STD_LOGIC;  -------------  system clk
          RESET : in  STD_LOGIC; 
           PAGE : in  STD_LOGIC; ------------- Page togle bit in for check data in active

			 
		-----------------------------------------------------			  
           ADDRESS : out  STD_LOGIC_VECTOR (13 downto 0);  --------------  address out for frame buffer  128x128 pixel 
		----------------------------------------------------	  
           DATA : out  STD_LOGIC_VECTOR (7 downto 0);	-------------- data out for PWM compare / for bit counter 
		----------------------------------------------------	  
			  ADDRESS_WB : out  STD_LOGIC_VECTOR (7 downto 0); --------------  address out for whitebalance ram  8 row x 32 coloum
           DATA_WB : in  STD_LOGIC_VECTOR (23 downto 0);  -------------- data in for whitbalance  RGB (8 bit x 3)         
		------------------------------------------------------	  
			 ROW_select : out  STD_LOGIC_VECTOR (2 downto 0);  ------------ 8 row select ( 8 port output to drive LED module)  
			  display_enable  : out  STD_LOGIC;  ------------------  enable display  0 = blank picture , 1 = diplay from frame buffer
			  config_enable : out  STD_LOGIC;  --------------- enable config mode for config led driver
			  config_data :  out  STD_LOGIC_VECTOR (47 downto 0); -------------- data config for led driver RGB (16 bit x 3)
			  
			  ADD_BUS_WB_BUSY  : in  STD_LOGIC;
			  SEND_WB_BUSY :  out  STD_LOGIC;
			  
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
end g_drive_controller;

architecture Behavioral of g_drive_controller is

type TON_state is (waiting,state_str_all,state_str,state_send_data,state_send_config,state_str_config,state_send_config_WB,state_str_config_WB);
signal STATE : TON_state :=state_send_data;
signal timer_counter : integer range 0 to 270000000 :=0;  		------- timer for check page active
signal display_EN : std_logic  := '0';  								------- enable display when active

signal ADDx : std_logic_vector (9 downto 0):= "0000000000";    	-------- address mix
signal ROW : std_logic_vector (2 downto 0) := "000";				-------- ROW counter
signal ROW_B : std_logic_vector (2 downto 0) := "000";			-------- ROW counter 2
signal IC_ADD_counter : std_logic_vector (3 downto 0) := x"0";	-------- IC address counter 16 bit for 16 output
signal IC_BOARD_counter : std_logic_vector (3 downto 0):= x"0";-------- counter for number of led driver per 1 LED module
signal BOARD_counter : std_logic_vector (3 downto 0) := x"0";	-------- LED module counter per drive port
signal bit_counter : std_logic_vector (3 downto 0) := x"0";		-------- counter for send parallel data to serial ( 16 bit)
signal DATA_B : std_logic_vector (7 downto 0) := x"00";			-------- delay for data out

signal PAGE_flag : std_logic  := '0';
signal PAGE_flag2 : std_logic  := '0';
signal STROBE : std_logic  := '0';
signal STROBE_A : std_logic  := '0';
signal STROBE_B : std_logic  := '0';
signal STROBE_C : std_logic  := '0';
signal STROBE_D : std_logic  := '0';
signal STROBE_E : std_logic  := '0';
signal OE : std_logic  := '1';
signal CLK_OUT_buff : std_logic  := '1';

signal DIP_ID1 :  STD_LOGIC_VECTOR (3 downto 0) :=x"0";
signal DIP_ID2 :  STD_LOGIC_VECTOR (3 downto 0) :=x"0";
signal DIP_SW :  STD_LOGIC_VECTOR (7 downto 0) :=x"00";



constant TC62C772_register3 : std_logic_vector (15 downto 0) :=x"FFFF";  --- all port on
constant TC62C772_register2 : std_logic_vector (15 downto 0) :="0000110000000000";  --- division pwm / asynchronous mode
constant TC62C772_register_WB : std_logic_vector (7 downto 0) :="00000000";  --- 16 bit pwm / not initialization / not stanby


constant WB_RED  : std_logic_vector (7 downto 0) := x"55";
constant WB_GREEN  : std_logic_vector (7 downto 0) := x"55";
constant WB_BLUE  : std_logic_vector (7 downto 0) := x"55";

begin

HA<='0';
HB<='0';
HC<='0';
HD<='0';

DIP_SW<=Config_register(15 downto 8);
DIP_ID1<=Config_register(3 downto 0);
DIP_ID2<=Config_register(7 downto 4);


display_enable<= display_EN ;


OE1<=CLK;    	-------  PWM clk for  LED driver with PWM 
OE2<=CLK;		-------  PWM clk for  LED driver with PWM 

process(CLK)
begin
if(falling_edge(CLK))then	
	STROBE1<=STROBE_B;  ----- delay Strobe for 1/2 clk
	STROBE2<=STROBE_B;  ----- delay Strobe for 1/2 clk
end if;
end process;



process(CLK)
begin
if(rising_edge(CLK))then	

---------  DELAY for  CLK out   ---------------------	

	CLK_OUT1<=CLK_OUT_buff;
	CLK_OUT2<=CLK_OUT_buff;

---------  DELAY for ROW out   ---------------------	

	ROW_B<=ROW;
	ROW_select<=ROW_B;

---------  DELAY for dataout    ---------------------	

	DATA_B<=x"0" & bit_counter;
	DATA<=DATA_B;

---------  DELAY for strobe out ---------------------	
	
	STROBE_A<=STROBE;	
	STROBE_B<=STROBE_A;
	STROBE_C<=STROBE_B;
	STROBE_D<=STROBE_C;
	STROBE_E<=STROBE_D;
	
end if;
end process;

--------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------VIDEO ADDRESS MAP --------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------

ADDX<=  BOARD_counter(2 downto 0) & IC_BOARD_counter(2 downto 0) & IC_ADD_counter(3 downto 0)  ;  ----------  mix address for frame buffer
process(ROW,ADDX)  ---------------------   Address MAP of LED module
variable SW : std_logic_vector (1 downto 0); 
begin

SW:=  ADDX(3) & ADDX(6);
case(SW)is  -------------------------------   P16 1R1G1B toshiba PWM LED driver TC62D722 ----------------------------------------
	when "00" =>ADDRESS<= '0' & ROW & not ADDX(6) &   ADDX(3)  &   ADDX(2)  & ("111"-ADDX(9 downto 7)) & not ADDX(5 downto 4) & ADDX(1 downto 0) ;    						---- P16  
	when "01" =>ADDRESS<= '0' & ROW & not ADDX(6) &   ADDX(3)  &   ADDX(2)   & ("111"-ADDX(9 downto 7)) & not ADDX(5 downto 4) & ADDX(1 downto 0) ;    						---- P16/P20  real 1R1G1B
	when "10" =>ADDRESS<= '0' & ROW & not ADDX(6) &   ADDX(3)  &  not ADDX(2)  &  ("111"-ADDX(9 downto 7)) & not ADDX(5 downto 4) & not ADDX(1 downto 0) ;    				---- P16/P20  real 1R1G1B
	when "11" =>ADDRESS<= '0' & ROW & not ADDX(6) &   ADDX(3)  &  not ADDX(2)   &  ("111"-ADDX(9 downto 7)) & not ADDX(5 downto 4) & not ADDX(1 downto 0) ;  
	when others => ADDRESS<= (others =>'0');
end case;

end process;
--------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ CONFIG ADDRESS MAP --------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------

ADDRESS_WB<=ROW &  ("111" - BOARD_counter(2 downto 0)) & "00";  ------ mix address for whitbalance RAM
process(state,DATA_WB,DIP_SW)	--------------------   Address MAP of LED module
begin
---------  select config data  -------------------
			if(state=state_send_config or state=state_str_config)then		
				config_data(47 downto 32)<=TC62C772_register3;
				config_data(31 downto 16)<=TC62C772_register3;
				config_data(15 downto 0)<=TC62C772_register3;	
			else
				if(DIP_SW(1)='1')then
					config_data(15 downto 0)<=(not WB_RED(7))  & WB_RED(6 downto 0)  & TC62C772_register_WB;  ---- RED
					config_data(31 downto 16)<=(not WB_GREEN(7)) & WB_GREEN(6 downto 0)  & TC62C772_register_WB;  ---- GREEN
					config_data(47 downto 32)<=(not WB_BLUE(7)) & WB_BLUE(6 downto 0)  & TC62C772_register_WB; ---- BLUE
				else			
					config_data(15 downto 0)<=(not DATA_WB(7)) & DATA_WB(6 downto 0) & TC62C772_register_WB;  ---- RED
					config_data(31 downto 16)<=(not DATA_WB(15)) & DATA_WB(14 downto 8) & TC62C772_register_WB;  ---- GREEN
					config_data(47 downto 32)<=(not DATA_WB(23)) & DATA_WB(22 downto 16) & TC62C772_register_WB; ---- BLUE
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
	if(PAGE_flag/=page)then	
		timer_counter<=0;
		display_EN<='1';
	else
		if(timer_counter>=25000000)then -------- time out = 1 sec @ 25mhz clk
			display_EN<='0';
		else
			timer_counter<=timer_counter+1;
			display_EN<='1';
		end if;
	end if;
-------------------  MAIN State mechine  ---------------------------------
case(state)is
	--------------------------send ALL video data -----------------------
	when	state_send_data =>  SEND_WB_BUSY<='0';
			if(ROW="111")then
				ROW<="000";	
				if(bit_counter=x"F")then
					bit_counter<=x"0";
						if(IC_BOARD_counter=x"7")then
							IC_BOARD_counter<=x"0";	
							if(BOARD_counter=x"7")then
								BOARD_counter<=x"0";
								if(IC_ADD_counter=x"F")then
									IC_ADD_counter<=x"0";
									state<=state_str_all;
								else
									IC_ADD_counter<=IC_ADD_counter+1;
									state<=state_str;
								end if;								
							else
								state<=state_send_data;
								BOARD_counter<=BOARD_counter+1;
							end if;
						else
							state<=state_send_data;
							IC_BOARD_counter<=IC_BOARD_counter+1;
						end if;			
				else
					state<=state_send_data;
					bit_counter<=bit_counter+1;
				end if;	
			else
				state<=state_send_data;
				ROW<=ROW+1;
			end if;
	-------------------- send STROBE for video data (each 16 bit) ----------------------		
	when	state_str	=>	 SEND_WB_BUSY<='0';
			if(ROW="111")then
				ROW<="000";	
				if(bit_counter=x"F")then
					bit_counter<=x"0";
					state<=state_send_data;
				else
					state<=state_str;
					bit_counter<=bit_counter+1;
				end if;	
			else
				state<=state_str;
				ROW<=ROW+1;
			end if;

	----------------- send STROBE ALL  for video data	-------------------------
	when	state_str_all	=>  SEND_WB_BUSY<='0';
			if(ROW="111")then
				ROW<="000";	
				if(bit_counter=x"F")then
					bit_counter<=x"0";					
						state<=state_send_config;											
				else
					bit_counter<=bit_counter+1;
					state<=state_str_all;
				end if;
			else
				ROW<=ROW+1;
				state<=state_str_all;
			end if;

	------------------------- SEND DATA CONFIG ----------------------------
									
	when	state_send_config => SEND_WB_BUSY<='1';
	
			if(ROW="111")then
				ROW<="000";		
				if(bit_counter=x"F")then
					bit_counter<=x"0";		
						if(IC_BOARD_counter=x"7")then
							IC_BOARD_counter<=x"0";							
							if(BOARD_counter=x"7")then
								BOARD_counter<=x"0";								
								state<=state_str_config;								
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
	------------------------- SEND STROBE CONFIG ----------------------------			
		when	state_str_config	=>   SEND_WB_BUSY<='1';
									if(ROW="111")then
			ROW<="000";	
			if(bit_counter=x"F")then
				bit_counter<=x"0";
				if(ADD_BUS_WB_BUSY='0')then
					state<=state_send_config_WB;
				else
					state<=state_send_data;	
				end if;
			else
				bit_counter<=bit_counter+1;
				state<=state_str_config;
			end if;
		else
			ROW<=ROW+1;
			state<=state_str_config;
		end if;			
									
	------------------------- SEND DATA WHITE BALANCE --------------------------------------------								
			
	when	state_send_config_WB =>	  SEND_WB_BUSY<='1';
			if(ROW="111")then
				ROW<="000";		
				if(bit_counter=x"F")then
					bit_counter<=x"0";		
						if(IC_BOARD_counter=x"7")then
							IC_BOARD_counter<=x"0";							
							if(BOARD_counter=x"7")then
								BOARD_counter<=x"0";								
								state<=state_str_config_WB;								
							else
								state<=state_send_config_WB;
								BOARD_counter<=BOARD_counter+1;
							end if;										
						else
							state<=state_send_config_WB;
							IC_BOARD_counter<=IC_BOARD_counter+1;
						end if;												
				else
					state<=state_send_config_WB;
					bit_counter<=bit_counter+1;
				end if;	
			else
				state<=state_send_config_WB;
				ROW<=ROW+1;
			end if;	
	------------------ SEND STROBE WHITE BALANCE--------------------------------------
	when	state_str_config_WB	=>  SEND_WB_BUSY<='1';
										if(ROW="111")then
										ROW<="000";	
										if(bit_counter=x"F")then
											bit_counter<=x"0";
											state<=state_send_data;											
										else
											bit_counter<=bit_counter+1;
											state<=state_str_config_WB;
										end if;
									else
										ROW<=ROW+1;
										state<=state_str_config_WB;
									end if;	
	when others =>	state<=state_send_data;

end case;	
		
------------------------------  SERIAL CLK for drive LED MODULE ---------------------------------------
			if( ROW="000" or  ROW="001" or ROW="010" or ROW="011"   )then			
				CLK_OUT_buff<='0';
			else
				CLK_OUT_buff<='1';
			end if;

------------------------------ enable config data  ------------------------------------			
			if(state=state_send_config or state=state_send_config_WB or state=state_str_config_WB or state=state_str_config )then
				config_enable<='1';
			else
				config_enable<='0';
			end if;
			
---------------decode strobe signal --------------------------------------------------------			
			if((bit_counter=x"1" and state=state_str) or  										-------- Strobe for send video data
				(bit_counter>=x"1" and bit_counter<=x"2" and state=state_str_all ) or 	-------- Strobe for send video data ALL
				(bit_counter>=x"1" and bit_counter<=x"8" and state=state_str_config) or -------- Strobe for send config
				(bit_counter>=x"1" and bit_counter<=x"E" and state=state_str_config_WB) -------- Strobe for send Whitebalance  ( gain control )
			   )then				
				STROBE<='1';
			else
				STROBE<='0';
			end if;
			

end if;	

end process;



end Behavioral;

