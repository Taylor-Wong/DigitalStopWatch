library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_count_down_timer_toplevel is
end tb_count_down_timer_toplevel;

architecture Behavioral of tb_count_down_timer_toplevel is
component count_down_timer_toplevel
    PORT(  clk      : in  STD_LOGIC;
           reset    : in  STD_LOGIC;
           SW_START : in  STD_LOGIC;
           PUSH_UP  : in  STD_LOGIC;
           PUSH_L   : in  STD_LOGIC;
           PUSH_R   : in  STD_LOGIC;
           CA       : out STD_LOGIC;
           CB       : out STD_LOGIC;
           CC       : out STD_LOGIC;
           CD       : out STD_LOGIC;
           CE       : out STD_LOGIC;
           CF       : out STD_LOGIC;
           CG       : out STD_LOGIC;
           DP       : out STD_LOGIC;
           AN1      : out STD_LOGIC;
           AN2      : out STD_LOGIC;
           AN3      : out STD_LOGIC;
           AN4      : out STD_LOGIC
           );
end component;
    --INPUTS
    signal clk      :  STD_LOGIC;
    signal reset    :  STD_LOGIC;
    signal SW_START :  STD_LOGIC;
    signal PUSH_UP  :  STD_LOGIC;
    signal PUSH_L   :  STD_LOGIC;
    signal PUSH_R   :  STD_LOGIC;
    --OUTPUTS
    signal CA       :  STD_LOGIC;
    signal CB       :  STD_LOGIC;
    signal CC       :  STD_LOGIC;
    signal CD       :  STD_LOGIC;
    signal CE       :  STD_LOGIC;
    signal CF       :  STD_LOGIC;
    signal CG       :  STD_LOGIC;
    signal DP       :  STD_LOGIC;
    signal AN1      :  STD_LOGIC;
    signal AN2      :  STD_LOGIC;
    signal AN3      :  STD_LOGIC;
    signal AN4      :  STD_LOGIC;
begin
UUT: count_down_timer_toplevel
PORT MAP(  clk      => clk,
           reset    => reset,
           SW_START => SW_START,
           PUSH_UP  => PUSH_UP,
           PUSH_L   => PUSH_L,
           PUSH_R   => PUSH_R,
           CA       => CA,
           CB       => CB,
           CC       => CC,
           CD       => CD,
           CE       => CE,
           CF       => CF,
           CG       => CG,
           DP       => DP,
           AN1      => AN1,
           AN2      => AN2,
           AN3      => AN3,
           AN4      => AN4
           );
           
stim_proc_clk: process
begin
    clk <= '0';
    wait for  ns;
    clk <= '1';
    wait for 5 ns;
end process;

stim_proc_reset: process
begin
    reset <= '1'; 
    wait for 10 ns;
    reset <= '0';
    wait;
    
end process;

stim_proc_SW_START: process
begin
    SW_START  <= '0';
    wait;
--    wait for 80 ns;
--    SW_START  <= '1';
--    wait for 300 ns;
--    SW_START  <= '1';
--    wait for 30 ns;
end process;

stim_proc_PUSH_UP: process
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

stim_proc_PUSH_L_R: process
begin
    PUSH_L <= '0';
    PUSH_R <= '0';
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
