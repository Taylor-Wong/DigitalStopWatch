library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--REMEMBER YOU MUST FLASH THE DIGIT BEING PROGRAMMED IMPLMENT LATER
entity min_sec_setter is
    Port ( 
           PUSH_UP : in STD_LOGIC;
           NOT_SW_START : in STD_LOGIC;
           clk : in STD_LOGIC;
           PUSH_L : in STD_LOGIC;
           PUSH_R : in STD_LOGIC;
           tens_min_set : out STD_LOGIC;
           single_min_set : out STD_LOGIC;
           tens_sec_set : out STD_LOGIC;
           single_sec_set : out STD_LOGIC);
end min_sec_setter;

architecture Behavioral of min_sec_setter is

constant zero : STD_LOGIC := '0';
signal selector : integer := 0;
signal tens_min_s, single_min_s, tens_sec_s, single_sec_s : STD_LOGIC := '0';
signal push_left_s, push_right_s : STD_LOGIC;

component min_sec_setter_debounce is
PORT(  
       PUSH_UP : in STD_LOGIC;
       enable : in STD_LOGIC;
       clk : in STD_LOGIC;
       PUSH_L : in STD_LOGIC;
       PUSH_R : in STD_LOGIC;
       tens_min_s : out STD_LOGIC;
       single_min_s : out STD_LOGIC;
       tens_sec_s : out STD_LOGIC;
       single_sec_s : out STD_LOGIC;
       push_left_s: out STD_LOGIC;
       push_right_s: out STD_LOGIC
        );
 end component;       

begin
setter_db: min_sec_setter_debounce
port map(  
           PUSH_UP   => PUSH_UP,
           enable    => NOT_SW_START,
           clk       => clk,
           PUSH_L    => PUSH_L,
           PUSH_R    => PUSH_R,
           tens_min_s => tens_min_s,
           single_min_s => single_min_s,
           tens_sec_s => tens_sec_s,
           single_sec_s => single_sec_s,
           push_left_s => push_left_s,
           push_right_s => push_right_s
        );




 --selects what digit is being updated based on L and R push buttons and also checks for enable
proc_select_dig: process(push_left_s, push_right_s,NOT_SW_START)
begin
  if(NOT_SW_START = '1')then
    if(push_left_s = '1')then
        if(selector >= 3)then
           selector <= 0;
        else
           selector <= selector + 1;
        end if;
    end if;
    if(push_right_s = '1')then
       if(selector = 0)then
           selector <= 3;
       else
           selector <= (selector - 1);
       end if;
    end if;
  elsif( NOT_SW_START = '0')then
   --4 is the zero signal state
    selector <= 4;
  end if;
end process;   


    

   
    
    --only sends the button signals to the digit selected

    with selector select
        tens_min_set <= tens_min_s when 3,
                        zero when others;
    with selector select
        single_min_set <= single_min_s when 2,
                        zero when others;                
    with selector select
        tens_sec_set <= tens_sec_s when 1,
                        zero when others;                          
    with selector select
        single_sec_set <= single_sec_s when 0,
                        zero when others;    
                        
  
end Behavioral;
