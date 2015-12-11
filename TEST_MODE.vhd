
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:35:53 01/28/2010 
-- Design Name: 
-- Module Name:    TEST_MODE - Behavioral 
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

entity TEST_MODE is
    Port ( DATA_IN : in  STD_LOGIC_VECTOR (23 downto 0);
           DATA_OUT : out  STD_LOGIC_VECTOR (23 downto 0);
           ADD_IN : in  STD_LOGIC_VECTOR (13 downto 0);
           ADD_OUT : out  STD_LOGIC_VECTOR (13 downto 0);
           DIM_IN : in  STD_LOGIC_VECTOR (4 downto 0);
			  DIM_O : out  STD_LOGIC_VECTOR (4 downto 0);
			  ACTIVE_IN : in  STD_LOGIC;
			  ACTIVE_OUT : out  STD_LOGIC;
			  WE_IN : in  STD_LOGIC;
           WE_OUT : out  STD_LOGIC_VECTOR (0 downto 0);
           CLK : in  STD_LOGIC;  
				select_clk : out  STD_LOGIC;  			  
           Config_register : in  STD_LOGIC_VECTOR (31 downto 0)
			  
			  );
end TEST_MODE;

architecture Behavioral of TEST_MODE is

signal ADD : STD_LOGIC_VECTOR (13 downto 0):=(others =>'0');
signal WE : STD_LOGIC:='0';
signal page_flag : STD_LOGIC:='0';
signal page_flag2 : STD_LOGIC:='0';
signal countdown_enable : std_logic:='1';

signal test_enable : std_logic:='0';
signal test_enable_b : std_logic:='0';

signal counter_x : integer range 0 to 1023 :=0 ;
signal counter_y : integer range 0 to 511 :=0 ;
signal counter : integer range 0 to 23 :=0;
signal counter2 : integer range 0 to 63000 :=0;
signal counter3 : integer range 0 to 63000 :=0;
signal counter4 : integer range 0 to 63000 :=0;
signal cc : integer range 0 to 48000000 :=0;
signal tt : integer range 0 to 48000000 :=0;
signal DATA_BUFF : std_logic_vector ( 23 downto 0) :=x"000000";
signal DATA_BUFF2 : std_logic_vector ( 23 downto 0) :=x"000000";
signal DIP_ID1_c :  STD_LOGIC_VECTOR (3 downto 0) :=x"0";
signal DIP_ID1_b :  STD_LOGIC_VECTOR (3 downto 0) :=x"0";
signal DIP_ID1 :  STD_LOGIC_VECTOR (3 downto 0) :=x"0";
signal DIP_ID2 :  STD_LOGIC_VECTOR (3 downto 0) :=x"0";
signal DIP_ID3 :  STD_LOGIC_VECTOR (3 downto 0) :=x"0";
signal DIP_SW :  STD_LOGIC_VECTOR (7 downto 0) :=x"00";
signal DIMMER :  STD_LOGIC_VECTOR (4 downto 0) :="11111";
--signal DIM_test_BUFF : std_logic:='0';

type mystate is (waiting,ID,DATAx,ID2,ID3,DATAx2,DATAx3,EOF,EOF2,EOF3);
type mystate2 is (A,B,C,D,E,F,G,H,I);
type mystate3 is (waiting,blink,counting_down,blink_end);
signal statetest : mystate2 :=A;
signal test_mode :mystate2 :=A;
signal state : mystate := waiting;
signal state_countdown : mystate3 := waiting;


constant size_x : integer := 127;
constant size_y : integer := 127;

begin





select_clk<=test_enable;

process(test_enable,DATA_IN,ADD_IN,WE_IN,ACTIVE_IN,DATA_BUFF,ADD,WE,page_flag)
begin
	
		if(test_enable='0')then
			DATA_OUT<=DATA_IN;
			ADD_OUT<=ADD_IN;
			WE_OUT(0)<=WE_IN;
			ACTIVE_OUT<=ACTIVE_IN;
			DIM_O<=DIM_IN;
		else
			DATA_OUT<= DATA_BUFF2;
			ADD_OUT<=ADD;
			WE_OUT(0)<=WE;
			ACTIVE_OUT<=page_flag;
			DIM_O<=DIMMER;
		end if;
		


end process;

process(CLK)
variable count_y : std_logic_vector(6 downto 0);
variable count_x : std_logic_vector(6 downto 0);
variable eiei : std_logic_vector (7 downto 0);
variable eiei2 : std_logic_vector (7 downto 0);
begin

if(rising_edge(CLK))then

test_enable<=DIP_SW(0);

test_enable_b<=test_enable;


DIP_ID1_b<=Config_register(3 downto 0);


if(test_enable='1' and test_enable_b='0')then ----- set default test pattern when teat mode on
	DIP_ID1<=x"8";
elsif(DIP_ID1_b/=DIP_ID1_c)then ----- set test pattern to dip rotary switch 2
	DIP_ID1<=DIP_ID1_b;
	DIP_ID1_c<=DIP_ID1_b;
end if;

DIP_SW<=Config_register(15 downto 8);

DIP_ID2<=Config_register(7 downto 4);

case(DIP_ID2) is
	when x"0" =>	DIMMER 	<=	"11111";		--31
	when x"1" =>	DIMMER 	<=	"11100";		--27
	when x"2" =>	DIMMER 	<=	"11000";		--23
	when x"3" =>	DIMMER 	<=	"10100";		--19
	when x"4" =>	DIMMER 	<=	"10000";		--15	
	when x"5" =>	DIMMER 	<=	"01100";		--12
	when x"6" =>	DIMMER 	<=	"01000";		--8
	when x"7" =>	DIMMER 	<=	"00110";		--6
	when x"8" =>	DIMMER 	<=	"00001";		--1
	when x"9" =>	DIMMER 	<=	"00000";		--0
	when others => DIMMER 	<=	"00000";
end case;

		count_y:=CONV_STD_LOGIC_VECTOR(counter_y,7);
		count_x:=CONV_STD_LOGIC_VECTOR(counter_x,7);
		ADD<=count_y & count_x;		
		DATA_BUFF2<=DATA_BUFF;

	
WE<='1';

				if(counter_x=size_x)then
					counter_x<=0;
					if(counter_y=size_y)then
						counter_y<=0;	
						page_flag<= not page_flag;
					else
						counter_y<=counter_y+1;
					end if;
				else
					counter_x<=counter_x+1;
				end if;
		
		
		
		if(cc=40000000)then
			cc<=0;
			
			if(counter4=63)then
				counter4<=0;
			else
				counter4<=counter4+1;
			end if;
			
			if(DIP_ID1 = x"6")then
				case(test_mode)is
					when A =>	if(counter3=10)then
										counter3<=0;
										test_mode<=B;
									else
										counter3 <= counter3+1;
									end if;
									
					when B =>	if(counter3=10)then
										counter3<=0;
										test_mode<=C;		
									else
										counter3 <= counter3+1;
									end if;
									
					when C =>	if(counter3=10)then
										counter3<=0;
										test_mode<=D;		
									else
										counter3 <= counter3 +1;
									end if;
									
					when D =>	if(counter3=10)then
										counter3<=0;
										test_mode<=E;
									else
										counter3 <= counter3+1;
									end if;
									
					when E =>	if(counter3=31)then
										counter3<=0;
										test_mode<=F;
									else
										counter3<=counter3+1;
									end if;
									
					when F =>	if(counter3=31)then
										counter3<=0;
										test_mode<=A;
									else
										counter3<=counter3+1;
									end if;
					when others => test_mode<=A;
				end case;
			else
				test_mode <= A;
				counter3 <= 0;
			end if;
				
				
			case(statetest)is

				when A =>if(counter2=31)then
								counter2<=0;
								statetest<=B;
							else
								counter2<=counter2+1;
							end if;
				when B =>if(counter2=31)then
								counter2<=0; 		
								statetest<=C;		
							else
								counter2<=counter2+1;
							end if;
				when C =>if(counter2=15)then
								counter2<=0;	 					
								statetest<=D;	 						
							else
								counter2<=counter2+1;
							end if;
				when D=>	if(counter2=15)then
								counter2<=0;						
									statetest<=E;					
							else
								counter2<=counter2+1;
							end if;
				when E=>	if(counter2=10)then
								counter2<=0;
								statetest<=F;
							else
								counter2<=counter2+1;
							end if;
				when F=>	if(counter2=15)then
								counter2<=0;
								statetest<=A;
							else
								counter2<=counter2+1;
							end if;
				when others => statetest<=A;
			end case;

		else
			cc<=cc+1;
		end if;
		
		
		case(DIP_ID1)is
		
		when x"8"   =>		
				
				case(statetest)is
					when A =>		
									if	(counter2 mod 16 = counter_x mod 16)then	
										if(DIP_ID1=x"6")then
											DATA_BUFF<=x"FF0000";
										elsif(DIP_ID1=x"7")then	
											DATA_BUFF<=x"00FF00";
										elsif(DIP_ID1=x"8")then	
											DATA_BUFF<=x"0000FF";
										else
											DATA_BUFF<=x"FFFFFF";
										end if;
									else 							
										DATA_BUFF<=x"000000";
									end if;

					when B =>
									if	(counter2 mod 16 = counter_y mod 16)then	
										if(DIP_ID1=x"6")then
											DATA_BUFF<=x"FF0000";
										elsif(DIP_ID1=x"7")then	
											DATA_BUFF<=x"00FF00";
										elsif(DIP_ID1=x"8")then	
											DATA_BUFF<=x"0000FF";
										else
											DATA_BUFF<=x"FFFFFF";
										end if;
									else 	
										DATA_BUFF<=x"000000";
									end if;

					when C =>	if	((counter2 mod 8)=counter_X mod 8)then
										DATA_BUFF<=x"FF0000";
									elsif	((counter2  mod 8)=(counter_X +2) mod 8)then
										DATA_BUFF<=x"00FF00";
									elsif	((counter2 mod 8)=(counter_X + 4) mod 8)then			 		
										DATA_BUFF<=x"0000FF";
									elsif	((counter2 mod 8)=(counter_X + 6) mod 8)then			 		
										DATA_BUFF<=x"FFFFFF";
									else 		
										 DATA_BUFF<=x"000000";
									end if;
					when D =>	if	((counter2 mod 8)=counter_y mod 8)then
										DATA_BUFF<=x"FF0000";
									elsif	((counter2  mod 8)=(counter_y +2) mod 8)then
										DATA_BUFF<=x"00FF00";
									elsif	((counter2 mod 8)=(counter_y + 4) mod 8)then			 		
										DATA_BUFF<=x"0000FF";
									elsif	((counter2 mod 8)=(counter_y + 6) mod 8)then			 		
										DATA_BUFF<=x"FFFFFF";
									else 		
										 DATA_BUFF<=x"000000";
									end if;
					when E =>	case(counter_x) is												
																
											when 0=> DATA_BUFF<=x"010101";													
											when 1=> DATA_BUFF<=x"050505";												
											when 2=> DATA_BUFF<=x"090909";
											when 3=> DATA_BUFF<=x"0D0D0D";
											when 4=> DATA_BUFF<=x"111111";
											when 5=> DATA_BUFF<=x"151515";
											when 6=> DATA_BUFF<=x"191919";
											when 7=> DATA_BUFF<=x"1D1D1D";
											when 8=> DATA_BUFF<=x"212121";
											when 9=> DATA_BUFF<=x"252525";
											when 10=> DATA_BUFF<=x"292929";
											when 11=> DATA_BUFF<=x"2D2D2D";
											when 12=> DATA_BUFF<=x"313131";
											when 13=> DATA_BUFF<=x"353535";
											when 14=> DATA_BUFF<=x"393939";
											when 15=> DATA_BUFF<=x"3D3D3D";
											when 16=> DATA_BUFF<=x"414141";
											when 17=> DATA_BUFF<=x"454545";
											when 18=> DATA_BUFF<=x"494949";
											when 19=> DATA_BUFF<=x"4D4D4D";
											when 20=> DATA_BUFF<=x"515151";
											when 21=> DATA_BUFF<=x"555555";
											when 22=> DATA_BUFF<=x"595959";
											when 23=> DATA_BUFF<=x"5D5D5D";
											when 24=> DATA_BUFF<=x"616161";
											when 25=> DATA_BUFF<=x"656565";
											when 26=> DATA_BUFF<=x"696969";
											when 27=> DATA_BUFF<=x"6D6D6D";
											when 28=> DATA_BUFF<=x"717171";
											when 29=> DATA_BUFF<=x"757575";
											when 30=> DATA_BUFF<=x"797979";
											when 31=> DATA_BUFF<=x"7D7D7D";
											when 32=> DATA_BUFF<=x"818181";
											when 33=> DATA_BUFF<=x"858585";
											when 34=> DATA_BUFF<=x"898989";
											when 35=> DATA_BUFF<=x"8D8D8D";
											when 36=> DATA_BUFF<=x"919191";
											when 37=> DATA_BUFF<=x"959595";
											when 38=> DATA_BUFF<=x"999999";
											when 39=> DATA_BUFF<=x"9D9D9D";
											when 40=> DATA_BUFF<=x"A1A1A1";
											when 41=> DATA_BUFF<=x"A5A5A5";
											when 42=> DATA_BUFF<=x"A9A9A9";
											when 43=> DATA_BUFF<=x"ADADAD";
											when 44=> DATA_BUFF<=x"B1B1B1";
											when 45=> DATA_BUFF<=x"B5B5B5";
											when 46=> DATA_BUFF<=x"B9B9B9";
											when 47=> DATA_BUFF<=x"BDBDBD";
											when 48=> DATA_BUFF<=x"C1C1C1";
											when 49=> DATA_BUFF<=x"C5C5C5";
											when 50=> DATA_BUFF<=x"C9C9C9";
											when 51=> DATA_BUFF<=x"CDCDCD";
											when 52=> DATA_BUFF<=x"D1D1D1";
											when 53=> DATA_BUFF<=x"D5D5D5";
											when 54=> DATA_BUFF<=x"D9D9D9";
											when 55=> DATA_BUFF<=x"DDDDDD";
											when 56=> DATA_BUFF<=x"E1E1E1";
											when 57=> DATA_BUFF<=x"E5E5E5";
											when 58=> DATA_BUFF<=x"E9E9E9";
											when 59=> DATA_BUFF<=x"EDEDED";
											when 60=> DATA_BUFF<=x"F1F1F1";
											when 61=> DATA_BUFF<=x"F5F5F5";
											when 62=> DATA_BUFF<=x"F9F9F9";
											when 63=> DATA_BUFF<=x"FDFDFD";																		
											when others => DATA_BUFF<=x"000000";
									end case;
					when F =>	eiei:=CONV_STD_LOGIC_VECTOR(counter2 * 16,8);
									DATA_BUFF<= eiei & eiei & eiei;
			 
					when others =>	   DATA_BUFF<=x"000000";
				end case;	
		
		when x"0"  =>
				
				DATA_BUFF<= x"FF0000";
		when x"1"  =>
				DATA_BUFF<= x"00FF00";
		when x"2"  =>
				DATA_BUFF<= x"0000FF";
		when x"3"  =>
				DATA_BUFF<= x"FFFFFF";			
		 
		when x"4"  =>	
			if	((counter4 mod 16)=(counter_x mod 16))then	
				DATA_BUFF<=x"FFFFFF";
			else 							
				DATA_BUFF<=x"000000";
			end if;

		
	
		when x"5"  =>	
			if	((counter4 mod 16)=(counter_y mod 16))then	
				DATA_BUFF<=x"FFFFFF";
			else 							
				DATA_BUFF<=x"000000";
			end if;
		
		when x"6" =>
			case(test_mode)is
				when A =>		DATA_BUFF<= x"FF0000";

				when B =>		DATA_BUFF<= x"00FF00";

				when C =>		DATA_BUFF<= x"0000FF";
				
				when D =>		DATA_BUFF<= x"FFFFFF";
				
				when E =>		if	((counter3 mod 16)=(counter_x mod 16) and (counter3 mod 16)=(counter_x mod 16))then	
										DATA_BUFF<=x"FFFFFF";
									else 							
										DATA_BUFF<=x"000000";
									end if;
				when F =>		if	((counter3 mod 16)=(counter_y mod 16))then	
										DATA_BUFF<=x"FFFFFF";
									else 							
										DATA_BUFF<=x"000000";
									end if;
									
				when others =>	   DATA_BUFF<=x"000000";
			end case;	
		
		when x"7" =>			if(((counter4 mod 8)=(counter_x mod 8)) or ((counter4 mod 8)=(counter_y mod 8)))then
										DATA_BUFF<=x"FFFFFF";
									else 							
										DATA_BUFF<=x"000000";
									end if;
			
			
			
			
			
			
--			
--		when x"C"  =>	
--			if(((counter3 mod 8)=(counter_x mod 8)) or ((counter3 mod 8)=(counter_y mod 8)))then
--				DATA_BUFF<=x"FFFFFF";
--			else 							
--				DATA_BUFF<=x"000000";
--			end if;
--		when x"A"  =>
--				if((counter_x mod 2)=0)then
--					DATA_BUFF<= x"FFFFFF";
--				else
--					DATA_BUFF<= x"000000";
--				end if;
--		when x"B"  =>
--				if((counter_x mod 2)=0)then
--					DATA_BUFF<= x"000000";
--				else
--					DATA_BUFF<= x"FFFFFF";
--				end if;
--				
		when others  =>	 DATA_BUFF<=x"000000";
			
		 end case;
	
end if;

end process;


end Behavioral;


