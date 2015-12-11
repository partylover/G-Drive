----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:00:00 01/16/2014 
-- Design Name: 
-- Module Name:    clk_select - Behavioral 
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

entity clk_select is
    Port ( config_register : in  STD_LOGIC_VECTOR (31 downto 0);
           select_out_GD_CLK : out  STD_LOGIC;
			  select_out_PWM_CLK : out  STD_LOGIC
			  );
end clk_select;

architecture Behavioral of clk_select is
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


begin


LED_MODULE_SELECT<=DIP_SW(7 downto 5) & DIP_SW2(0) ;

DIP_SW<=Config_register(15 downto 8);
DIP_SW2<=Config_register(26 downto 24);



process(LED_MODULE_SELECT)
begin


	case LED_MODULE_SELECT is
	--	when (P12C_PWM_V1) =>	select_out_GD_CLK<= '1'; ------ 66.66 mhz								
		--when (P10C_V2) =>	select_out_GD_CLK<= '1'; ------ 66.66 mhz							
		when others 		=>	select_out_GD_CLK<= '0'; ------ 100 mhz									
	end case;
	
		case LED_MODULE_SELECT is
	--	when (P12C_PWM_V1) =>	select_out_PWM_CLK<= '1'; ------ 20 mhz								
									
		when others 		=>	select_out_PWM_CLK<= '0'; ------ 25 mhz									
	end case;
									

end process;



end Behavioral;

