----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:48:16 08/21/2013 
-- Design Name: 
-- Module Name:    ee_prom_control - Behavioral 
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

entity ee_prom_control is
    Port ( DATA_IN_WB_RAM : in  STD_LOGIC_VECTOR (23 downto 0);
           ADD_IN_WB_RAM : in  STD_LOGIC_VECTOR (7 downto 0);
           DATA_OUT_WB_RAM : out  STD_LOGIC_VECTOR (23 downto 0);
           ADD_OUT_WB_RAM : out  STD_LOGIC_VECTOR (7 downto 0);
           WR_RAM : out  STD_LOGIC;
           ADD_I2C_o : out  STD_LOGIC_VECTOR (6 downto 0);
           DATA_I2C_o : out  STD_LOGIC_VECTOR (7 downto 0);
           ENA_I2C_o : out  STD_LOGIC;
           RW_I2C_o : out  STD_LOGIC;
           DATA_I2C_i : in  STD_LOGIC_VECTOR (7 downto 0);
           BUSY_I2C_i : in  STD_LOGIC;
			  CLK : in  STD_LOGIC;
			  driver_busy : in  STD_LOGIC;
			  ADD_BUS_BUSY : out  STD_LOGIC;
			  reset  : in  STD_LOGIC;
			  WB_WR_TRIG  : in  STD_LOGIC ;
			  DB1 : out  STD_LOGIC;
			  DB2 : out  STD_LOGIC;
			  DB3 : out  STD_LOGIC;
			  DB4 : out  STD_LOGIC;
			  EEPROM_WP : out  STD_LOGIC;
			  BLINK_OUT :  out  STD_LOGIC;

			   Config_register : in  STD_LOGIC_VECTOR (31 downto 0)
			  
			  );
end ee_prom_control;

architecture Behavioral of ee_prom_control is

type my_state is  (waiting,WRITE_TO_EE,EE_SEND_ADDRESS_H_W,EE_SEND_ADDRESS_L_W,EE_SEND_DATA_W,wait_busy,WRITE_PAGE_COUNT,delay_5ms,EE_READ_DATA,EE_SEND_ADDRESS_L,EE_SEND_ADDRESS_H,EE_SEND_DATA_W_E);
signal state : my_state :=waiting;
signal next_state : my_state :=waiting;

signal ADDRESS_I2C: std_logic_vector(15 downto 0) :=x"0000";

signal ADDRESS_I2C_H : std_logic_vector(7 downto 0) :=x"00";
signal ADDRESS_I2C_L : std_logic_vector(7 downto 0) :=x"00";

signal ADDRESS_I2C_B : std_logic_vector(15 downto 0) :=x"0000";

signal ADD_RAM_COUNTER: std_logic_vector(15 downto 0) :=x"0000";
signal ADD_RAM_COUNTER_B: std_logic_vector(15 downto 0) :=x"0000";

signal DATA_WB_BUFF: std_logic_vector(15 downto 0) :=x"0000";

signal DIP_ID1 :  STD_LOGIC_VECTOR (3 downto 0) :=x"0";
signal DIP_ID2 :  STD_LOGIC_VECTOR (3 downto 0) :=x"0";
signal DIP_SW :  STD_LOGIC_VECTOR (7 downto 0) :=x"00";
signal DIP_SW2 :  STD_LOGIC_VECTOR (2 downto 0) :="000";


signal byte_counter : integer range 0 to 3 :=0;
signal byte_counter_b : integer range 0 to 3 :=0;
signal page_counter : integer range 0 to 255 :=0;
signal page_counter2 : integer range 0 to 255 :=0;

signal read_count : integer range 0 to 15 :=0;

signal Write_counter : integer range 0 to 15 :=0;
signal Write_counter_time_count : integer range 0 to 400000000 :=0;

signal BUSY_I2C_i_b : std_logic :='0';
signal WB_WR_TRIG_FLAG : std_logic :='0';
signal ena : std_logic :='0';
signal wb_read_trig_flag_1 : std_logic :='0';
signal wb_read_trig_1 : std_logic :='0';
signal wb_read_trig_flag_2 : std_logic :='0';
signal wb_read_trig_2 : std_logic :='0';

signal delay_counter : integer range 0 to 200000000 :=0;
signal start_up_counter : integer range 0 to 200000000 :=0;

signal blink_counter : integer range 0 to 200000000 :=0;	
signal blink_ena : std_logic :='0';		
signal blink_flag : std_logic :='0';	
constant blink_timeout : integer :=25000000; ----------  0.2 s @125mhz

constant start_up_time : integer  :=125000000; -------  1 sec @ 125mhz
constant time_delay_20ms : integer  :=2500000; -------  20 ms @ 125mhz
constant time_delay_10ms : integer  :=1250000; -------  10 ms @ 125mhz
constant time_delay_5ms : integer  :=625000; -------  5 ms @ 125mhz
constant EEPROM_I2C_ADD : std_logic_vector :="1010000";

constant Write_counter_timeout : integer  :=250000000; -------  2 s @ 125mhz

begin


ENA_I2C_o<=ena;


process(STATE,ADD_IN_WB_RAM,ADD_RAM_COUNTER_B)
begin
if(state=waiting )then
	ADD_OUT_WB_RAM<=ADD_IN_WB_RAM;
	ADD_BUS_BUSY<='0';
else
	ADD_OUT_WB_RAM<=ADD_RAM_COUNTER_B(7 downto 0);
	ADD_BUS_BUSY<='1';
end if;
end process;

process(CLK,reset)
begin
if(reset='1')then
	ADDRESS_I2C<=x"0000";
	byte_counter<=0;	
	ADD_RAM_COUNTER<=x"0000";
	state<=waiting;
elsif(rising_edge(CLK))then


DIP_SW<=Config_register(15 downto 8);
DIP_SW2<=Config_register(26 downto 24);
DIP_ID2<=Config_register(7 downto 4);
DIP_ID1<=Config_register(3 downto 0);



BUSY_I2C_i_b<=BUSY_I2C_i;

if(state=waiting)then
	DB1<='1';
else
	DB1<='0';
end if;

if(state=WRITE_TO_EE)then
	DB2<='1';
else
	DB2<='0';
end if;

if(state=EE_SEND_ADDRESS_H_W or state=EE_SEND_ADDRESS_L_W or state=EE_SEND_DATA_W or state=wait_busy or  state=WRITE_PAGE_COUNT )then
	DB3<='1';
else
	DB3<='0';
end if;
 
 --DB4<=ena;
 DB4<=BUSY_I2C_i;
 
 
	if(start_up_counter>=start_up_time)then
		wb_read_trig_1<='1';
	else
		wb_read_trig_1<='0';
		start_up_counter<=start_up_counter+1; 
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

	
--wb_read_trig_2<=DIP_SW(2);

case(state)is
	when	waiting	=>	--if((wb_read_trig_1/=wb_read_trig_flag_1 or wb_read_trig_2/=wb_read_trig_flag_2) and driver_busy='0' )then
							if((wb_read_trig_1/=wb_read_trig_flag_1) and driver_busy='0' )then
							--	wb_read_trig_flag_2<=wb_read_trig_2;
								wb_read_trig_flag_1<=wb_read_trig_1;
								read_count<=0;
								ADD_RAM_COUNTER<=x"0000";
								byte_counter<=0;	
								page_counter<=0;
								page_counter2<=0;
								state<=EE_SEND_ADDRESS_H;  ----- READ eeprom to ram
								EEPROM_WP<='1';
							elsif(WB_WR_TRIG_FLAG/=WB_WR_TRIG and driver_busy='0')then
								WB_WR_TRIG_FLAG<=WB_WR_TRIG;								
								ADDRESS_I2C<=x"0000";
								byte_counter<=0;	
								ADD_RAM_COUNTER<=x"0000";
								page_counter<=0;
								Write_counter_time_count<=0;
								
								if(DIP_SW2(1)='1' or Write_counter>2)then
									Write_counter<=0;
									EEPROM_WP<='0';
									state<=WRITE_TO_EE;
									blink_ena<=not blink_ena;
								else
									Write_counter<=Write_counter+1;
									EEPROM_WP<='1';
									state<=waiting;
								end if;
								
							else
							
								if(Write_counter_time_count>=Write_counter_timeout)then
									Write_counter<=0;
								else
									Write_counter_time_count<=Write_counter_time_count+1;
								end if;
								
								state<=waiting;	
								EEPROM_WP<='1';
							end if;			
								ena<='0';
								WR_RAM<='0';
	

	
	
	------------------------------  READ EE PROCESS -----------------------------------  
	
	when	EE_SEND_ADDRESS_H	=>	ADD_I2C_o<=EEPROM_I2C_ADD;  --------------  send address H
										DATA_I2C_o<=x"00";
										RW_I2C_o<='0';  --------- write
										ena<='1';
										state<=wait_busy;
										next_state<=EE_SEND_ADDRESS_L;
										WR_RAM<='0';
										
	when	EE_SEND_ADDRESS_L	=>	ADD_I2C_o<=EEPROM_I2C_ADD;   --------------  send address L
										DATA_I2C_o<= x"00";
										RW_I2C_o<='0';  --------- write
										ena<='1';
										
										state<=DELAY_5ms;	
										next_state<=EE_READ_DATA;
										
										WR_RAM<='0';
										
										
										
										
	when	EE_READ_DATA	=>	ADD_I2C_o<=EEPROM_I2C_ADD;   --------------  READ DATA
									DATA_I2C_o<= x"00";
									RW_I2C_o<='1';  --------- READ
									
	
	
									if(BUSY_I2C_i='0' and BUSY_I2C_i_b='1')then
								
													
										if(byte_counter>=3)then
											byte_counter<=0;		
											
											if(ADD_RAM_COUNTER>=x"00FF")then
												ADD_RAM_COUNTER<=x"0000";
													if(read_count>=3)then
														read_count<=0;
														state<=waiting;
													else
														read_count<=read_count+1;
														state<=EE_SEND_ADDRESS_H;  ----- READ eeprom to ram
													end if;
												ena<='0';
											else	
												ADD_RAM_COUNTER<=ADD_RAM_COUNTER+1;	
												state<=EE_READ_DATA;
												ena<='1';
											end if;
										else
											byte_counter<=byte_counter+1;
											state<=EE_READ_DATA;
											ena<='1';
										end if;	
									
										case(byte_counter)is
											when 0	=> DATA_WB_BUFF(7 downto 0)<=not DATA_I2C_i; WR_RAM<='0';
											when 1	=> DATA_WB_BUFF(15 downto 8)<=not DATA_I2C_i; WR_RAM<='0';
											when 2	=> DATA_OUT_WB_RAM<=  not DATA_I2C_i & DATA_WB_BUFF; WR_RAM<='1';
															ADD_RAM_COUNTER_B<=ADD_RAM_COUNTER;
														
											when others	=> WR_RAM<='0';
										end case;
										
								else
									WR_RAM<='0';
									state<=EE_READ_DATA;
									ena<='1';
								end if;
									
				
	
	
	
	
	------------------------------   WRITE EE PROCESS ----------------------------------- 
	
		when	WRITE_TO_EE	=>	state<=EE_SEND_ADDRESS_H_W;
									ADDRESS_I2C_L<=x"00";
									ADDRESS_I2C_H<=x"00";	
									ena<='0';
									WR_RAM<='0';
									
	
	when	EE_SEND_ADDRESS_H_W	=>	ADD_I2C_o<=EEPROM_I2C_ADD;  --------------  send address H
										DATA_I2C_o<='0' & ADDRESS_I2C_H(7 downto 1);
										RW_I2C_o<='0';  --------- write
										ena<='1';
										state<=wait_busy;
										next_state<=EE_SEND_ADDRESS_L_W;
										WR_RAM<='0';
										
	when	EE_SEND_ADDRESS_L_W	=>	ADD_I2C_o<=EEPROM_I2C_ADD;   --------------  send address L
										DATA_I2C_o<= ADDRESS_I2C_H(0) & ADDRESS_I2C_L(6 downto 0);
										RW_I2C_o<='0';  --------- write
										ena<='1';
										state<=WRITE_PAGE_COUNT;
										WR_RAM<='0';										

							
									
										
										
	when	WRITE_PAGE_COUNT	=>		if(BUSY_I2C_i='0' and BUSY_I2C_i_b='1')then	
													
												
												case(ADDRESS_I2C_L(1 downto 0))is
													when	("00") => DATA_I2C_o<= not DATA_IN_WB_RAM(7 downto 0);
													when	("01") => DATA_I2C_o<= not DATA_IN_WB_RAM(15 downto 8);
													when	others => DATA_I2C_o<=not  DATA_IN_WB_RAM(23 downto 16);
												end case;
												
												
												
												if(ADDRESS_I2C_L>=x"7F")then  ----- EE prom page = 128 byte		
													ADDRESS_I2C_L<=x"00";
													
													state<=DELAY_5ms;	
													
													if(ADDRESS_I2C_H>=x"07")then
														ADDRESS_I2C_H<=x"00";													
														next_state<=waiting;	
													else	
														ADDRESS_I2C_H<=ADDRESS_I2C_H+1;
														next_state<=EE_SEND_ADDRESS_H_W;
													end if;	
													
												else		
													ADDRESS_I2C_L<=ADDRESS_I2C_L+1;
													state<=WRITE_PAGE_COUNT;	
												end if;	
												
												
											else
												state<=WRITE_PAGE_COUNT;
											end if;	
											
									ADD_RAM_COUNTER_B(7 downto 0)<= ADDRESS_I2C_H(2 downto 0) & ADDRESS_I2C_L(6 downto 2);
									
									ena<='1';	
									WR_RAM<='0';
										
	------------------------------   WRITE EE PROCESS -----------------------------------	
	
	when wait_busy =>	if(BUSY_I2C_i='0' and BUSY_I2C_i_b='1')then
								state<=next_state;
							else
								state<=wait_busy;
							end if;							
							ena<='1';
							WR_RAM<='0';
							
	when DELAY_5ms =>	if(delay_counter>=time_delay_10ms)then ----- 10 ms @ 25mhz
								delay_counter<=0;
								state<=next_state;								
							else
								delay_counter<=delay_counter+1;
								state<=DELAY_5ms;
							end if;
										
							ena<='0';
							WR_RAM<='0';
			
							
							
	when others 	=>  state<=waiting;
							 ena<='0';
							 WR_RAM<='0';
							 
end case;
end if;
end process;

end Behavioral;

