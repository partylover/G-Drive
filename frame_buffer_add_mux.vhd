----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:54:46 09/25/2013 
-- Design Name: 
-- Module Name:    frame_buffer_add_mux - Behavioral 
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

entity frame_buffer_add_mux is
    Port ( CLK : in  STD_LOGIC; 
				ADD_IN : in  STD_LOGIC_VECTOR (13 downto 0);
           ADD_OUT_1 : out  STD_LOGIC_VECTOR (12 downto 0);
           ADD_OUT_2 : out  STD_LOGIC_VECTOR (12 downto 0);
           WR_IN : in  STD_LOGIC;
           WR_OUT_1 : out  STD_LOGIC;
           WR_OUT_2 : out  STD_LOGIC;
			  Config_register : in  STD_LOGIC_VECTOR (31 downto 0)
			  );
end frame_buffer_add_mux;

architecture Behavioral of frame_buffer_add_mux is

signal DIP_ID1 :  STD_LOGIC_VECTOR (3 downto 0) :=x"0";
signal DIP_ID2 :  STD_LOGIC_VECTOR (3 downto 0) :=x"0";
signal DIP_SW :  STD_LOGIC_VECTOR (7 downto 0) :=x"00";
signal DIP_SW2 :  STD_LOGIC_VECTOR (2 downto 0) :="000";
signal LED_MODULE_SELECT : std_logic_vector (3 downto 0) := "0000";			-------- LED module select



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

begin

DIP_SW2<=Config_register(26 downto 24);
DIP_SW<=Config_register(15 downto 8);
DIP_ID1<=Config_register(3 downto 0);
DIP_ID2<=Config_register(7 downto 4);


process(CLK)
begin
if(rising_edge(CLK))then

LED_MODULE_SELECT<=DIP_SW(7 downto 5) & DIP_SW2(0) ;


	case LED_MODULE_SELECT is
		
		when (P16C_PWM_V1) | (P16C_PWM_V2) =>	
									ADD_OUT_1<=ADD_IN(13) & ADD_IN(11 downto 0);
									ADD_OUT_2<=ADD_IN(13) & ADD_IN(11 downto 0);
									WR_OUT_1<=WR_IN and not ADD_IN(12);
									WR_OUT_2<=WR_IN and ADD_IN(12);
	--------------------------------------------------							
		when others =>		ADD_OUT_1<=ADD_IN(12 downto 0);
								ADD_OUT_2<=ADD_IN(12 downto 0);
								WR_OUT_1<=WR_IN and not ADD_IN(13);
								WR_OUT_2<=WR_IN and ADD_IN(13);

	end case;

end if;
end process;

end Behavioral;

