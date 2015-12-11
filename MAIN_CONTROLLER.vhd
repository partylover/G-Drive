----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:49:20 08/19/2011 
-- Design Name: 
-- Module Name:    MAIN_CONTROLLER - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;




-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MAIN_CONTROLLER is
    Port ( CLK : in  STD_LOGIC;
			  RESET : in  STD_LOGIC;
			  DIP_SW1 : in  STD_LOGIC_VECTOR (2 downto 0);
           DIP_SW2 : in  STD_LOGIC_VECTOR (7 downto 0);
           DIP_SW3 : in  STD_LOGIC_VECTOR (7 downto 0);
			  PAGE : in  STD_LOGIC;
           LED_OS : out  STD_LOGIC;
           LED_FM : out  STD_LOGIC;
			  FAN_OUT : out  STD_LOGIC;
			  ONOFF_OUT : out  STD_LOGIC;
  			  TEMPIN : in  STD_LOGIC_VECTOR (7 downto 0);
           CONFIG1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CONFIG2 : out  STD_LOGIC_VECTOR (31 downto 0);
				DOUT : out  STD_LOGIC_VECTOR (7 downto 0);
           DIGIT : out  STD_LOGIC_VECTOR (2 downto 0);
			  
			  Watchdog_trig_o : out  STD_LOGIC

			  );
			  
end MAIN_CONTROLLER;

architecture Behavioral of MAIN_CONTROLLER is
signal LED : std_logic :='0';
signal LED_FIBER_COUNT : integer range 0 to 100000000 :=0;
signal SEG7_COUNT : integer range 0 to 100000000 :=0;
signal SEG7_1 : integer range 0 to 15 :=0;
signal SEG7_2 : integer range 0 to 15 :=0;
signal SEG7_3 : integer range 0 to 15 :=0;
signal Temp_buf : integer :=0;
signal BDIP_SW2 : std_logic_vector (7 downto 0) := "00000000";
signal BDIP_SW3 : std_logic_vector (7 downto 0) := "00000000";
signal state_count:bit := '0';
signal digi99:integer range 0 to 99;
signal watch_dog_counter : integer range 0 to 100000000 :=0;
signal BOUNT_FAN : integer range 0 to 100000000 :=0;
signal FRAME_flag: std_logic :='0';
signal Watchdog_trig: std_logic :='0';


signal D1_SEG :   STD_LOGIC_VECTOR (7 downto 0);
signal D2_SEG :   STD_LOGIC_VECTOR (7 downto 0);
signal D3_SEG :   STD_LOGIC_VECTOR (7 downto 0);

signal delay : integer range 0 to 10000000 :=0;
signal SCAN:  STD_LOGIC_VECTOR (1 downto 0) :="00";
signal DATA_BUFOUT: std_logic_vector ( 7 downto 0) :=x"00";
signal DATA_BUFF1 : std_logic_vector ( 7 downto 0) :=x"00";
signal DATA_BUFF2 : std_logic_vector ( 7 downto 0) :=x"00";
signal DATA_BUFF3 : std_logic_vector ( 7 downto 0) :=x"00";

begin



D1_SEG<=CONV_STD_LOGIC_VECTOR(SEG7_1,8);
D2_SEG<=CONV_STD_LOGIC_VECTOR(SEG7_2,8);
D3_SEG<=CONV_STD_LOGIC_VECTOR(SEG7_3,8);





process(CLK)
variable digixx:integer range 0 to 9 ;
variable digimax:integer range 0 to 99;

begin
if(rising_edge(CLK))then

Temp_buf<=CONV_INTEGER(TEMPIN(7 downto 1));


LED_OS<=LED;
LED_FM<=FRAME_flag;

Watchdog_trig_o<=Watchdog_trig;

BDIP_SW2<=DIP_SW2;	-- Dip 		8
BDIP_SW3<=DIP_SW3;	-- Selector 4x2

CONFIG2<= "00000"  & not DIP_SW1(2 downto 0) & TEMPIN(7 downto 0) & not DIP_SW2 & not DIP_SW3;	--Temperater and ID For ETH
CONFIG1<=x"0000" & not DIP_SW2 & not DIP_SW3;	--Temperater and ID For ETH


	if(watch_dog_counter>=3000)then
		watch_dog_counter<=0;
		Watchdog_trig<=not Watchdog_trig;	
	else
		watch_dog_counter<=watch_dog_counter+1;
	end if;
	----------------------- Temp to FAN -------------------------------
	
	if(TEMPIN(7 downto 0)>=x"82")then --> 65 C
		if(BOUNT_FAN>=10000000)then
			BOUNT_FAN<=0;
			FAN_OUT<='0';
			ONOFF_OUT<='1';
		else
			BOUNT_FAN<=BOUNT_FAN+1;
		end if;
	elsif(TEMPIN(7 downto 0)>=x"50")then --> 40 C
		if(BOUNT_FAN>=10000000)then
			BOUNT_FAN<=0;
			FAN_OUT<='0';
			ONOFF_OUT<='0';
		else
			BOUNT_FAN<=BOUNT_FAN+1;
		end if;
	elsif(TEMPIN(7 downto 0)<x"4C")then --> 38 C
		if(BOUNT_FAN>=10000000)then
			BOUNT_FAN<=0;
			FAN_OUT<='1';
			ONOFF_OUT<='0';
		else
			BOUNT_FAN<=BOUNT_FAN+1;
		end if;
	end if;
	----------------------- Temp to 7-SEG------------------------------
	if(Temp_buf>=100)then
		digi99<=(Temp_buf -100);	
	else
		digi99<=(Temp_buf);	
	end if;
	if state_count = '0' then
			digixx := 0;
			digimax := 9;	
			state_count <= '1';
	else 
			if digi99 > digimax then
				digixx := digixx + 1;
				digimax := digimax + 10;
			else
				SEG7_3 <= digixx;
				SEG7_2 <= digi99 + 9 - digimax;
				state_count <= '0';
			end if;
		end if;	
	if(TEMPIN(0)='1')then
		SEG7_1<=5;--CONV_INTEGER(TEMPIN(7 downto 0)) mod 10;
	else
		SEG7_1<=0;
	end if;
	if(LED_FIBER_COUNT = 50000000)then
		LED<= not LED;
		LED_FIBER_COUNT<=0;
	else
	 LED_FIBER_COUNT<=LED_FIBER_COUNT+1;
	end if;
end if;
--if (DIP_SW2(7)='0')then
--	CONFIG1<="00" & not DIP_SW2(6 downto 1) & x"00000" & not DIP_SW3(7 downto 4);
--else
--	CONFIG1<="00" & not DIP_SW2(6 downto 1) & x"00001F";
--end if;

end process;

DOUT<=DATA_BUFOUT;

process(CLK)
begin
if(rising_edge(CLK))then
	case(D1_SEG) is
		when x"00" => DATA_BUFF1<=x"C0";
		when x"01" => DATA_BUFF1<=x"F9";
		when x"02" => DATA_BUFF1<=x"A4";
		when x"03" => DATA_BUFF1<=x"B0";
		when x"04" => DATA_BUFF1<=x"99";
		when x"05" => DATA_BUFF1<=x"92";
		when x"06" => DATA_BUFF1<=x"82";
		when x"07" => DATA_BUFF1<=x"F8";
		when x"08" => DATA_BUFF1<=x"80";
		when x"09" => DATA_BUFF1<=x"90";
		when x"0A" => DATA_BUFF1<=x"88";
		when x"0B" => DATA_BUFF1<=x"83";
		when x"0C" => DATA_BUFF1<=x"C6";
		when x"0D" => DATA_BUFF1<=x"A1";
		when x"0E" => DATA_BUFF1<=x"86";
		when x"0F" => DATA_BUFF1<=x"8E";
		
		when x"80" => DATA_BUFF1<=x"40";
		when x"81" => DATA_BUFF1<=x"79";
		when x"82" => DATA_BUFF1<=x"24";
		when x"83" => DATA_BUFF1<=x"30";
		when x"84" => DATA_BUFF1<=x"19";
		when x"85" => DATA_BUFF1<=x"12";
		when x"86" => DATA_BUFF1<=x"02";
		when x"87" => DATA_BUFF1<=x"78";
		when x"88" => DATA_BUFF1<=x"00";
		when x"89" => DATA_BUFF1<=x"10";
		when x"8A" => DATA_BUFF1<=x"08";
		when x"8B" => DATA_BUFF1<=x"03";
		when x"8C" => DATA_BUFF1<=x"46";
		when x"8D" => DATA_BUFF1<=x"21";
		when x"8E" => DATA_BUFF1<=x"06";
		when x"8F" => DATA_BUFF1<=x"0E";
		when others =>DATA_BUFF1<=x"C0";
	end case;
	
	case(D2_SEG)is
		when x"00" => DATA_BUFF2<=x"40";
		when x"01" => DATA_BUFF2<=x"79";
		when x"02" => DATA_BUFF2<=x"24";
		when x"03" => DATA_BUFF2<=x"30";
		when x"04" => DATA_BUFF2<=x"19";
		when x"05" => DATA_BUFF2<=x"12";
		when x"06" => DATA_BUFF2<=x"02";
		when x"07" => DATA_BUFF2<=x"78";
		when x"08" => DATA_BUFF2<=x"00";
		when x"09" => DATA_BUFF2<=x"10";
		when x"0A" => DATA_BUFF2<=x"08";
		when x"0B" => DATA_BUFF2<=x"03";
		when x"0C" => DATA_BUFF2<=x"46";
		when x"0D" => DATA_BUFF2<=x"21";
		when x"0E" => DATA_BUFF2<=x"06";
		when x"0F" => DATA_BUFF2<=x"0E";
		when others =>DATA_BUFF2<=x"40";
	end case;
	
	case(D3_SEG)is
		when x"00" => DATA_BUFF3<=x"C0";
		when x"01" => DATA_BUFF3<=x"F9";
		when x"02" => DATA_BUFF3<=x"A4";
		when x"03" => DATA_BUFF3<=x"B0";
		when x"04" => DATA_BUFF3<=x"99";
		when x"05" => DATA_BUFF3<=x"92";
		when x"06" => DATA_BUFF3<=x"82";
		when x"07" => DATA_BUFF3<=x"F8";
		when x"08" => DATA_BUFF3<=x"80";
		when x"09" => DATA_BUFF3<=x"90";
		when x"0A" => DATA_BUFF3<=x"88";
		when x"0B" => DATA_BUFF3<=x"83";
		when x"0C" => DATA_BUFF3<=x"C6";
		when x"0D" => DATA_BUFF3<=x"A1";
		when x"0E" => DATA_BUFF3<=x"86";
		when x"0F" => DATA_BUFF3<=x"8E";
		
		when x"80" => DATA_BUFF3<=x"40";
		when x"81" => DATA_BUFF3<=x"79";
		when x"82" => DATA_BUFF3<=x"24";
		when x"83" => DATA_BUFF3<=x"30";
		when x"84" => DATA_BUFF3<=x"19";
		when x"85" => DATA_BUFF3<=x"12";
		when x"86" => DATA_BUFF3<=x"02";
		when x"87" => DATA_BUFF3<=x"78";
		when x"88" => DATA_BUFF3<=x"00";
		when x"89" => DATA_BUFF3<=x"10";
		when x"8A" => DATA_BUFF3<=x"08";
		when x"8B" => DATA_BUFF3<=x"03";
		when x"8C" => DATA_BUFF3<=x"46";
		when x"8D" => DATA_BUFF3<=x"21";
		when x"8E" => DATA_BUFF3<=x"06";
		when x"8F" => DATA_BUFF3<=x"0E";
		when others =>DATA_BUFF3<=x"C0";
	end case;
		
	if(delay=30000)then
		delay<=0;
		case(SCAN)is
			when "00" => SCAN<="01";
			when "01" => SCAN<="10";
			when "10" => SCAN<="00";
			when others =>SCAN<="00";
		end case;
	else
		delay<=delay+1;
	end if;
	
	case(SCAN)is
		when "00" => DIGIT<="011";
						 DATA_BUFOUT<=DATA_BUFF1;
		when "01" => DIGIT<="101";
						 DATA_BUFOUT<=DATA_BUFF2;
		when "10" => DIGIT<="110";
						 DATA_BUFOUT<=DATA_BUFF3;
		when others => DIGIT<="011";
						 DATA_BUFOUT<=DATA_BUFF1;
	end case;

end if;

end process;

end Behavioral;

