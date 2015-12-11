----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:42:19 09/02/2011 
-- Design Name: 
-- Module Name:    TEMP_1820_ - Behavioral 
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

entity TEMP_1820 is
    Port ( OW : inout  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  RESET : in  STD_LOGIC;
           DATA_OUT : out  STD_LOGIC_VECTOR (7 downto 0));
end TEMP_1820;

architecture Behavioral of TEMP_1820 is
signal OW_i : std_logic :='0';
signal cmd    : integer range 0 to 4 :=0;
signal CLK_DIV    : integer range 0 to 10000 :=0;
signal DELAY_READ : integer range 0 to 100000000 :=0;
signal COUNT_DELAY : integer range 0 to 100000000 :=0;
signal COUNT : integer range 0 to 10000 :=0;
type mystate is  (waiting,OW_RESET,OW_PRES,OW_PRES1,OW_RESET1,OW_PRES2,OW_PRES3,OW_WRCC,OW_WR44,OW_WRCC1,OW_WRBE,OW_READ);
signal STATE : mystate := waiting;
signal DAT : std_logic_vector(7 downto 0) :=x"00";

constant HEAD_CC : std_logic_vector(7 downto 0) :=x"CC";
constant HEAD_44 : std_logic_vector(7 downto 0) :=x"44";
constant HEAD_BE : std_logic_vector(7 downto 0) :=x"BE";
begin
process(CLK,RESET)

begin

if(RESET='1')then
	CLK_DIV<=0;
	DELAY_READ<=0;
	COUNT_DELAY<=0;
	COUNT<=0;
	DATA_OUT<=x"99";
elsif(rising_edge(CLK))then

OW_i<=OW;
	if(CLK_DIV>=125)then ----- 1 mhz ( 1 uS )
		CLK_DIV<=0;
		case(STATE)is
			when	waiting => 	if	(DELAY_READ >= 10000 )then -----  10ms  waiting
										DELAY_READ<=0;
										STATE<=OW_RESET;
									else
										DELAY_READ<=DELAY_READ+1;
										STATE<=waiting;
									end if;
									OW<='Z';
									COUNT_DELAY<=0;
			when	OW_RESET => if	(COUNT_DELAY = 800 )then
										COUNT_DELAY<=0;
										STATE<=OW_WRCC;
									else
										COUNT_DELAY<=COUNT_DELAY+1;
										if(COUNT_DELAY<600)then		------ 600 us reset
											OW<='0';
										else
											OW<='Z';
										end if;
										STATE<=OW_RESET;
									end if;
			when	OW_WRCC => if(COUNT=8 )then
										COUNT<=0;
										COUNT_DELAY<=0;
										if(cmd=0)then
											cmd<=1;
											STATE<=OW_WR44; 
										else
											STATE<=OW_WRBE;
											cmd<=0;
										end if;
									else
										if(COUNT_DELAY>=60)then
											COUNT_DELAY<=0;
											COUNT<=COUNT+1;
										else
											COUNT_DELAY<=COUNT_DELAY+1;
										end if;
										
										if(HEAD_CC(COUNT)='1')then
											if(COUNT_DELAY<5)then
												OW<='0';
											else
												OW<='Z';
											end if;
										else
											if(COUNT_DELAY<50)then
												OW<='0';
											else
												OW<='Z';
											end if;
										end if;
										STATE<=OW_WRCC;
									end if;						
			when	OW_WR44 => if	(COUNT=8 )then
										COUNT<=0;
										COUNT_DELAY<=0;
										STATE<=OW_READ;
									else
										if(COUNT_DELAY>=60)then
											COUNT_DELAY<=0;
											COUNT<=COUNT+1;
										else
											COUNT_DELAY<=COUNT_DELAY+1;
										end if;
										if(HEAD_44(COUNT)='1')then
											if(COUNT_DELAY<5)then
												OW<='0';
											else
												OW<='Z';
											end if;
										else
											if(COUNT_DELAY<54)then
												OW<='0';
											else
												OW<='Z';
											end if;
										end if;
										STATE<=OW_WR44;
									end if;
			
			when	OW_WRBE => if	(COUNT=8 )then
										COUNT<=0;
										COUNT_DELAY<=0;
										STATE<=OW_READ;
									else
										if(COUNT_DELAY>=60)then
											COUNT_DELAY<=0;
											COUNT<=COUNT+1;
										else
											COUNT_DELAY<=COUNT_DELAY+1;
										end if;
										if(HEAD_BE(COUNT)='1')then
											if(COUNT_DELAY<5)then
												OW<='0';
											else
												OW<='Z';
											end if;
										else
											if(COUNT_DELAY<54)then
												OW<='0';
											else
												OW<='Z';
											end if;
										end if;
										STATE<=OW_WRBE;
									end if;
			when	OW_READ => if	(COUNT=8 )then
										COUNT<=0;
										COUNT_DELAY<=0;
										--STATE<=OW_RESET1;
										STATE<=waiting;
										if(cmd=0)then
											DATA_OUT<= DAT;
										end if;
									else
										if(COUNT_DELAY=60)then
											COUNT_DELAY<=0;
											COUNT<=COUNT+1;
											
										else
											COUNT_DELAY<=COUNT_DELAY+1;
											if(COUNT_DELAY<5)then
												OW<='0';
											elsif(COUNT_DELAY<7)then
												OW<='Z';
											elsif(COUNT_DELAY<8)then
												OW<='Z';
											elsif(COUNT_DELAY<9)then
												DAT(COUNT)<=OW_i;
											else
												OW<='Z';
											end if;
										end if;
										STATE<=OW_READ;
									end if;
			when others =>			STATE<=waiting; 
			--							command <= '1';
		end case;
									
			
	else
		CLK_DIV<=CLK_DIV+1;
	end if;
end if;

end process;
end Behavioral;

