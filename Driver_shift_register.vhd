library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Driver_shift_register is
    Port ( CLK : in std_logic; 
	 
--    		 R_o : out std_logic_vector(7 downto 0);			 
--          G_o : out std_logic_vector(7 downto 0);
--          B_o : out std_logic_vector(7 downto 0);		

    		 R_o : out std_logic_vector(15 downto 0);			 
          G_o : out std_logic_vector(15 downto 0);
          B_o : out std_logic_vector(15 downto 0);					 
			 		  
		     RGB : in std_logic_vector(47 downto 0);	
			  RGB_B : in std_logic_vector(47 downto 0);	
           DATA : in std_logic_vector(7 downto 0);
			--  ROW : in std_logic_vector(2 downto 0);
				ROW : in std_logic_vector(3 downto 0);
           MODE : in std_logic;
			  MODE_PWM : in std_logic;
			   DIMMER : in std_logic_vector(4 downto 0);
			    DATA_CONFIG : in std_logic_vector(47 downto 0);
				CONFIG_EN : in std_logic;
		      display_enable : in std_logic;
				display_enable1 : in std_logic;
				display_enable2 : in std_logic;
				Config_register : in  STD_LOGIC_VECTOR (31 downto 0)
			  );
			  
end Driver_shift_register;

architecture Behavioral of Driver_shift_register is
signal R :  std_logic_vector(15 downto 0);
signal G :  std_logic_vector(15 downto 0);
signal B :  std_logic_vector(15 downto 0); 

signal R_2 :  std_logic_vector(15 downto 0);
signal G_2 :  std_logic_vector(15 downto 0);
signal B_2 :  std_logic_vector(15 downto 0); 

signal R_16 :  std_logic_vector(15 downto 0);
signal G_16 :  std_logic_vector(15 downto 0);
signal B_16 :  std_logic_vector(15 downto 0); 

signal R_2_16 :  std_logic_vector(15 downto 0);
signal G_2_16 :  std_logic_vector(15 downto 0);
signal B_2_16 :  std_logic_vector(15 downto 0); 

signal Rc :  std_logic_vector(15 downto 0);
signal Gc :  std_logic_vector(15 downto 0);
signal Bc :  std_logic_vector(15 downto 0); 



signal xR : std_logic_vector(7 downto 0);
signal xG : std_logic_vector(7 downto 0);
signal xB : std_logic_vector(7 downto 0);

signal xR2 : std_logic_vector(7 downto 0);
signal xG2 : std_logic_vector(7 downto 0);
signal xB2 : std_logic_vector(7 downto 0);

signal yR : std_logic_vector(15 downto 0);
signal yG : std_logic_vector(15 downto 0);
signal yB : std_logic_vector(15 downto 0);

signal ROW_8 :  integer range 0 to 7 :=0; 
signal DATA_16 :  integer range 0 to 15 :=0; 
signal DATA_16_R :  integer range 0 to 15 :=0; 




signal DIP_ID1 :  STD_LOGIC_VECTOR (3 downto 0) :=x"0";
signal DIP_ID2 :  STD_LOGIC_VECTOR (3 downto 0) :=x"0";
signal DIP_SW :  STD_LOGIC_VECTOR (7 downto 0) :=x"00";
signal DIP_SW2 :  STD_LOGIC_VECTOR (2 downto 0) :="000";
signal LED_MODULE_SELECT : std_logic_vector (3 downto 0) := "0000";			-------- LED module select

constant P4C_PWM_V1  : std_logic_vector (3 downto 0) := "1011";  ---- P4 SCAN 16 MBI5041 

begin 
LED_MODULE_SELECT<=DIP_SW(7 downto 5) & DIP_SW2(0) ;

DIP_SW<=Config_register(15 downto 8);
DIP_SW2<=Config_register(26 downto 24);




R<= "000" & RGB(47 downto 35);  --- 13 bit use for shift register driver
G<= "000" & RGB(31 downto 19);  --- 13 bit use for shift register driver
B<= "000" & RGB(15 downto 3);   --- 13 bit use for shift register driver

R_2<= "000" & RGB_B(47 downto 35);  --- 13 bit use for shift register driver
G_2<= "000" & RGB_B(31 downto 19);  --- 13 bit use for shift register driver
B_2<= "000" & RGB_B(15 downto 3);   --- 13 bit use for shift register driver


process(DIMMER,RGB,RGB_B)
variable dim : integer range 0 to 31 ;
begin
dim:= conv_integer(DIMMER);

case(dim)is
	when 16 to 31 =>
		R_16<=  RGB(47 downto 32);  --- 16 bit use for PWM driver
		G_16<=  RGB(31 downto 16);  --- 16 bit use for PWM driver
		B_16<=  RGB(15 downto 0);   --- 16 bit use for PWM driver

		R_2_16<=  RGB_B(47 downto 32);  --- 16 bit use for PWM driver
		G_2_16<=  RGB_B(31 downto 16);  --- 16 bit use for PWM driver
		B_2_16<=  RGB_B(15 downto 0);   --- 16 bit use for PWM driver


	when 8 to 15 =>
	
		R_16<=  '0' & RGB(47 downto 33);  --- 15 bit use for PWM driver  = 50% dim
		G_16<=  '0' & RGB(31 downto 17);  --- 15 bit use for PWM driver
		B_16<=  '0' & RGB(15 downto 1);   --- 15 bit use for PWM driver

		R_2_16<=  '0' & RGB_B(47 downto 33);  --- 15 bit use for PWM driver
		G_2_16<=  '0' & RGB_B(31 downto 17);  --- 15 bit use for PWM driver
		B_2_16<=  '0' & RGB_B(15 downto 1);   --- 15 bit use for PWM driver
		
	when 0 to 7 =>
	
		R_16<=  "00" & RGB(47 downto 34);  --- 16 bit use for PWM driver = 25% dim
		G_16<=  "00" & RGB(31 downto 18);  --- 16 bit use for PWM driver
		B_16<=  "00" & RGB(15 downto 2);   --- 16 bit use for PWM driver

		R_2_16<=  "00" & RGB_B(47 downto 34);  --- 16 bit use for PWM driver
		G_2_16<=  "00" & RGB_B(31 downto 18);  --- 16 bit use for PWM driver
		B_2_16<=  "00" & RGB_B(15 downto 2);   --- 16 bit use for PWM driver
		
end case;

end process;


Rc<=	DATA_CONFIG(15 downto 0);	----- 16 bit config data
Gc<= DATA_CONFIG(31 downto 16);	----- 16 bit config data
Bc<= DATA_CONFIG(47 downto 32);	----- 16 bit config data

DATA_16_R<=15 - conv_integer(DATA(3 downto 0));
DATA_16<= conv_integer(DATA(3 downto 0));
ROW_8<= conv_integer(ROW(2 downto 0));

process(CLK)
begin		  
--
--
--if(falling_edge(CLK))then	
--R_o<=yR;
--G_o<=yG;
--B_o<=yB;
--end if;

if(rising_edge(CLK))then	

case LED_MODULE_SELECT is
	when P4C_PWM_V1 =>
								R_o<=yB;
								G_o<=yR;
								B_o<=yG;
								
								
	when others	=>			R_o<=yR;
								G_o<=yG;
								B_o<=yB;
end case;

	if(ROW="0000")then	
	yR<=xR2 & xR; yG<=xG2 & xG;  yB<=xB2 & xB; ------------------------------------  16 output
	
	end if;		 

	if(CONFIG_EN='1')then
			xR(ROW_8)<=Rc(DATA_16_R);
			xG(ROW_8)<=Gc(DATA_16_R);
			xB(ROW_8)<=Bc(DATA_16_R);	
			
			xR2(ROW_8)<=Rc(DATA_16_R);
			xG2(ROW_8)<=Gc(DATA_16_R);
			xB2(ROW_8)<=Bc(DATA_16_R);
		
	elsif(display_enable='0' or display_enable1='0' or display_enable2='0'   )then
			xR<=(others=>'0');
			xG<=(others=>'0');
			xB<=(others=>'0');
			
			xR2<=(others=>'0');
			xG2<=(others=>'0');
			xB2<=(others=>'0');			
	elsif(MODE='0')then	
	
		if(MODE_PWM='0')then
			xR(ROW_8)<=R(DATA_16);
			xG(ROW_8)<=G(DATA_16);
			xB(ROW_8)<=B(DATA_16);
			
			xR2(ROW_8)<=R_2(DATA_16);
			xG2(ROW_8)<=G_2(DATA_16);
			xB2(ROW_8)<=B_2(DATA_16);
		else
			xR(ROW_8)<=R_16(DATA_16_R);
			xG(ROW_8)<=G_16(DATA_16_R);
			xB(ROW_8)<=B_16(DATA_16_R);
			
			xR2(ROW_8)<=R_2_16(DATA_16_R);
			xG2(ROW_8)<=G_2_16(DATA_16_R);
			xB2(ROW_8)<=B_2_16(DATA_16_R);
		end if;
			
	else		
			if(R (12 downto 8)<=DATA)then 	xR(ROW_8)  <= '0'; else 	xR(ROW_8) <= '1';	end if; 
			if(G (12 downto 8)<=DATA)then 	xG(ROW_8)  <= '0'; else 	xG(ROW_8) <= '1';	end if; 
			if(B (12 downto 8)<=DATA)then 	xB(ROW_8)  <= '0'; else 	xB(ROW_8) <= '1';	end if; 		
			
			if(R_2 (12 downto 8)<=DATA)then 	xR2(ROW_8)  <= '0'; else 	xR2(ROW_8) <= '1';	end if; 
			if(G_2 (12 downto 8)<=DATA)then 	xG2(ROW_8)  <= '0'; else 	xG2(ROW_8) <= '1';	end if; 
			if(B_2 (12 downto 8)<=DATA)then 	xB2(ROW_8)  <= '0'; else 	xB2(ROW_8) <= '1';	end if; 		
		 	
	end if;

end if;
  
  
end process;

end Behavioral;
