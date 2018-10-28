library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_min_sec_setter_debounce is
end tb_min_sec_setter_debounce;

architecture Behavioral of tb_min_sec_setter_debounce is
component min_sec_setter_debounce is
port(  PUSH_DOWN : in STD_LOGIC;
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

constant clock_period : time : 10 ns;
--inputs
   signal PUSH_DOWN :  STD_LOGIC := '0';
   signal PUSH_UP :  STD_LOGIC := '0';
   signal enable :  STD_LOGIC := '0';
   signal PUSH_L :  STD_LOGIC := '0';
   signal PUSH_R :  STD_LOGIC := '0';
   signal clk :  STD_LOGIC;
--outputs
    signal tens_min_s :  STD_LOGIC;
    signal single_min_s : STD_LOGIC;
    signal tens_sec_s :  STD_LOGIC;
    signal single_sec_s :  STD_LOGIC;
    signal push_left_s:  STD_LOGIC;
    signal push_right_s:  STD_LOGIC

begin
uut: min_sec_setter_debounce
    PORT MAP(  PUSH_DOWN => PUSH_DOWN,
               PUSH_UP => PUSH_UP,
               enable => enable,
               clk => clk,
               PUSH_L => PUSH_L,
               PUSH_R => PUSH_R,
               tens_min_s => tens_min_s,
               single_min_s => single_min_s,
               tens_sec_s => tens_sec_s,
               single_sec_s =>single_sec_s,
               push_left_s => push_left_s,
               push_right_s => push_right_s
               );
      --CLK stimulus
                stim_proc_CLK: process
                begin
                    wait for clock_period/2;
                    CLK <= '1';
                    wait for clock_period/2;
                    CLK <= '0';
                end process;
               
              --enable stimulus
              stim_proc_NOT_SW_START: process
              begin
                  enable <= '1';
                  wait for 1000 ns;
                  enable <= '0';
                  wait;
              end process;
                  
                
              --UP DOWN button stimulus  
              stim_proc_push_U_D: process
              begin
                  PUSH_UP <= '1';
                  wait for 50 ns;
                  PUSH_UP <= '0';
                  wait for 50 ns;
                  PUSH_UP <= '1';
                  wait for 50 ns;
                  PUSH_UP <= '0';
                  wait for 50 ns;
                  PUSH_UP <= '1';
                  wait for 50 ns;
                  PUSH_UP <= '0';
                  wait for 50 ns;
                  PUSH_UP <= '1';
                  wait for 50 ns;
                  PUSH_UP <= '0';
                  wait for 50 ns;
                  PUSH_UP <= '1';
                  wait for 50 ns;
                  PUSH_UP <= '0';
                  wait for 50 ns;
                  PUSH_UP <= '1';
                  wait for 50 ns;
                  PUSH_UP <= '0';
                  wait for 50 ns;
                  PUSH_UP <= '1';
                  wait for 50 ns;
                  PUSH_UP <= '0';
                  wait for 50 ns;
                  PUSH_UP <= '1';
                  wait for 50 ns;
                  PUSH_UP <= '0';
                  wait for 50 ns;
                  PUSH_UP <= '1';
                  wait for 50 ns;
                  PUSH_UP <= '0';
                  wait for 50 ns;
                  PUSH_UP <= '1';
                  wait for 50 ns;
                  PUSH_UP <= '0';
                  wait for 50 ns;
                  PUSH_UP <= '1';
                  wait for 50 ns;
                  PUSH_UP <= '0';
                  wait for 50 ns; 
                  wait;
               end process;
               
               --LEFT RIGHT button stimulus  
               stim_proc_push_L_R: process
               begin
                  wait for 150 ns;
                  PUSH_L <= '1';
                  wait for 50 ns;
                  PUSH_L <= '0';
                  wait for 200 ns;
                  PUSH_L <= '1';
                  wait for 50 ns;
                  PUSH_L <= '0';
                  wait for 150 ns;
                  PUSH_R <= '1';
                  wait for 50 ns;
                  PUSH_R <= '0';
                  wait for 200 ns;
                  PUSH_R <= '1';
                  wait for 50 ns;
                  wait;
               end process;
               
                                     

end Behavioral;

