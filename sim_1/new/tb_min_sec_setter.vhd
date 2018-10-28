library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_min_sec_setter is
end tb_min_sec_setter;

architecture Behavioral of tb_min_sec_setter is
component min_sec_setter
PORT(  
       PUSH_UP : in STD_LOGIC;
       NOT_SW_START : in STD_LOGIC;
       clk : in STD_LOGIC;
       PUSH_L : in STD_LOGIC;
       PUSH_R : in STD_LOGIC;
       tens_min_set : out STD_LOGIC;
       single_min_set : out STD_LOGIC;
       tens_sec_set : out STD_LOGIC;
       single_sec_set : out STD_LOGIC
       );
end component;
    --Inputs
    signal PUSH_UP :  STD_LOGIC := '0';
    signal NOT_SW_START :  STD_LOGIC := '0';
    signal PUSH_L :  STD_LOGIC := '0';
    signal PUSH_R :  STD_LOGIC := '0';
    signal clk :  STD_LOGIC;

    --Outputs
    signal tens_min_set :  STD_LOGIC;
    signal single_min_set : STD_LOGIC;
    signal tens_sec_set :  STD_LOGIC;
    signal single_sec_set :  STD_LOGIC;
    
    constant clock_period : time := 10ns;
begin
    uut: min_sec_setter
    PORT MAP(  
               PUSH_UP => PUSH_UP,
               NOT_SW_START => NOT_SW_START,
               clk => clk,
               PUSH_L => PUSH_L,
               PUSH_R => PUSH_R,
               tens_min_set => tens_min_set,
               single_min_set => single_min_set,
               tens_sec_set => tens_sec_set,
               single_sec_set =>single_sec_set
               );
               
     --CLK stimulus
      stim_proc_CLK: process
      begin
          wait for clock_period/2;
          CLK <= '1';
          wait for clock_period/2;
          CLK <= '0';
      end process;
     
    --NOT SW_START stimulus
    stim_proc_NOT_SW_START: process
    begin
        NOT_SW_START <= '1';
        wait;
    end process;
        
      
    --UP DOWN button stimulus  
    stim_proc_push_U_D: process
    begin
        PUSH_UP <= '1';
        wait for 100 ns;
        PUSH_UP <= '0';
        wait for 100 ns;
        PUSH_UP <= '1';
        wait for 100 ns;
        PUSH_UP <= '0';
        wait for 100 ns;
        PUSH_UP <= '1';
        wait for 100 ns;
        PUSH_UP <= '0';
        wait for 100 ns;
        PUSH_UP <= '1';
        wait for 100 ns;
        PUSH_UP <= '0';
        wait for 100 ns;
        PUSH_UP <= '1';
        wait for 100 ns;
        PUSH_UP <= '0';
        wait for 100 ns;
        PUSH_UP <= '1';
        wait for 100 ns;
        PUSH_UP <= '0';
        wait for 100 ns;
        PUSH_UP <= '1';
        wait for 100 ns;
        PUSH_UP <= '0';
        wait for 100 ns;
        PUSH_UP <= '1';
        wait for 100 ns;
        PUSH_UP <= '0';
        wait for 100 ns;
        PUSH_UP <= '1';
        wait for 100 ns;
        PUSH_UP <= '0';
        wait for 100 ns;
        PUSH_UP <= '1';
        wait for 100 ns;
        PUSH_UP <= '0';
        wait for 100 ns;
        PUSH_UP <= '1';
        wait for 100 ns;
        PUSH_UP <= '0';
        wait for 100 ns; 
        wait;
     end process;
     
     --LEFT RIGHT button stimulus  
     stim_proc_push_L_R: process
     begin
        wait for 150 ns;
        PUSH_L <= '1';
        wait for 100 ns;
        PUSH_L <= '0';
        wait for 200 ns;
        PUSH_L <= '1';
        wait for 100 ns;
        PUSH_L <= '0';
        wait for 150 ns;
        PUSH_R <= '1';
        wait for 100 ns;
        PUSH_R <= '0';
        wait for 200 ns;
        PUSH_R <= '1';
        wait for 100 ns;
        PUSH_R <= '1';
        wait for 100 ns;
        PUSH_R <= '0';
        wait for 200 ns;
        PUSH_R <= '1';
        wait for 100 ns;
        wait;
     end process;
     
                           
end Behavioral;
