library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity min_sec_setter_debounce is
    Port ( PUSH_UP : in STD_LOGIC;
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
end min_sec_setter_debounce;

architecture Behavioral of min_sec_setter_debounce is


constant zero : STD_LOGIC := '0';
signal push_left, push_right : STD_LOGIC ;
signal push_left_load, push_right_load : STD_LOGIC ;
signal tens_min_i, single_min_i, tens_sec_i, single_sec_i : STD_LOGIC := '0';
signal tens_min_load, single_min_load , tens_sec_load , single_sec_load : STD_LOGIC;
signal selector : integer := 0;

component debounce is
GENERIC(
    counter_size  :  INTEGER := 2--20 --counter size (20 bits gives 10.4ms with 100MHz clock)
        );
  PORT(
    clk     : IN  STD_LOGIC;  --input clock
    button  : IN  STD_LOGIC;  --input signal to be debounced
    result  : OUT STD_LOGIC  --debounced signal
        );
end component;



begin
    tens_min_signal_db: debounce
generic map( counter_size => 2)--20 )
port map(   clk     => clk,  --input clock
            button  => PUSH_UP,  --input signal to be debounced
            result  => tens_min_i
            );
            
single_min_signal_db: debounce
generic map( counter_size => 2)--20 )
port map(   clk     => clk,  --input clock
            button  => PUSH_UP,  --input signal to be debounced
            result  => single_min_i
            );

tens_sec_signal_db: debounce
generic map( counter_size => 2)--20 )
port map(   clk     => clk,  --input clock
            button  => PUSH_UP,  --input signal to be debounced
            result  => tens_sec_i
            );
single_sec_signal_db: debounce
generic map( counter_size => 2)--20 )
port map(   clk     => clk,  --input clock
            button  => PUSH_UP,  --input signal to be debounced
            result  => single_sec_i
            );   

PUSH_L_db: debounce
generic map( counter_size => 2)--20 )
port map(   clk     => clk,  --input clock
            button  => PUSH_L,  --input signal to be debounced
            result  => push_left
            );

PUSH_R_db: debounce
generic map( counter_size => 2)--20 )
port map(   clk     => clk,  --input clock
            button  => PUSH_R,  --input signal to be debounced
            result  => push_right
            );


--processes for having a 'load' signal for the push button 
--makes it so there's only one clk period with a high signal
 proc_load: process (CLK)
 begin
      if rising_edge(CLK) then
        if( enable = '1') then
          tens_min_load <= tens_min_i;
          single_min_load <= single_min_i;
          tens_sec_load <= tens_sec_i;
          single_sec_load <= single_sec_i;
          push_left_load <= push_left;
          push_right_load <= push_right;
        end if;
      end if;
 end process;
 

   
   
-- logic equations for set signals
tens_min_s <= ((not tens_min_load) and tens_min_i);
single_min_s <= ((not single_min_load) and single_min_i);
tens_sec_s <=  ((not tens_sec_load) and tens_sec_i);
single_sec_s <= ((not single_sec_load) and single_sec_i);
push_left_s <= ((not push_left_load) and push_left);
push_right_s <= ((not push_right_load) and push_right); 


end Behavioral;
