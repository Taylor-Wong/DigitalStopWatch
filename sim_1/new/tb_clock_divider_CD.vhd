library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_clock_divider_CD is
end tb_clock_divider_CD;

architecture Behavior of tb_clock_divider_CD is
component clock_divider_CD 
    PORT(  ten_min_set : in STD_LOGIC;
           single_min_set : in STD_LOGIC;
           ten_sec_set : in STD_LOGIC;
           single_sec_set : in STD_LOGIC;
           all_zeros : in STD_LOGIC;
           SW_START  : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           a_sec : out STD_LOGIC_VECTOR (3 downto 0);
           a_tens_sec : out STD_LOGIC_VECTOR (3 downto 0);
           a_minutes : out STD_LOGIC_VECTOR (3 downto 0);
           a_tens_minutes : out STD_LOGIC_VECTOR (3 downto 0)
           );
end component;
   --Inputs
   signal ten_min_set :  STD_LOGIC;
   signal single_min_set :  STD_LOGIC;
   signal ten_sec_set : STD_LOGIC;
   signal single_sec_set :  STD_LOGIC;
   signal all_zeros :  STD_LOGIC;
   signal SW_START  :  STD_LOGIC;
   signal reset :  STD_LOGIC;
   signal clk :  STD_LOGIC;
   --Outputs
   signal a_sec :  STD_LOGIC_VECTOR (3 downto 0);
   signal a_tens_sec :  STD_LOGIC_VECTOR (3 downto 0);
   signal a_minutes :  STD_LOGIC_VECTOR (3 downto 0);
   signal a_tens_minutes :  STD_LOGIC_VECTOR (3 downto 0);

   
begin

uut: clock_divider_CD
  PORT MAP(ten_min_set => ten_min_set,
           single_min_set => single_min_set,
           ten_sec_set => ten_sec_set,
           single_sec_set => single_sec_set,
           all_zeros => all_zeros,
           SW_START  => SW_START,
           reset => reset,
           clk => clk,
           a_sec => a_sec,
           a_tens_sec => a_tens_sec,
           a_minutes => a_minutes,
           a_tens_minutes => a_tens_minutes
           );
stim_proc_CLK: process
begin
      clk <= '0';
      wait for 5 ns;
      clk <= '1';
      wait for 5 ns;
end process;

stim_proc_ten_min_set: process
begin
    ten_min_set <= '1';
    wait for 10 ns;
    ten_min_set <= '0';
    wait for 50 ns;
    ten_min_set <= '1';
    wait for 10 ns;
    ten_min_set <= '0';
    wait for 40 ns;
    wait;
end process;

stim_proc_single_min_set: process
begin
    single_min_set <= '0';
    wait for 60 ns;
    single_min_set <= '1';
    wait for 10 ns;
    single_min_set <= '0';
    wait for 50 ns;
    single_min_set <= '1';
    wait for 10 ns;
    single_min_set <= '0';
    wait for 40 ns;
    wait;
end process;

stim_proc_ten_sec_set: process
begin
    ten_sec_set <= '0';
    wait for 10 ns;
    ten_sec_set <= '1';
    wait for 10 ns;
    ten_sec_set <= '0';
    wait for 50 ns;
    ten_sec_set <= '1';
    wait for 10 ns;
    ten_sec_set <= '0';
    wait for 40 ns;
    wait;
end process;

stim_proc_single_sec_set: process
begin
    single_sec_set <= '0';
    wait for 10 ns;
    single_sec_set <= '1';
    wait for 10 ns;
    single_sec_set <= '0';
    wait for 10 ns;
    single_sec_set <= '1';
    wait for 10 ns;
    single_sec_set <= '0';
    wait for 10 ns;
    single_sec_set <= '1';
   wait for 10 ns;
   single_sec_set <= '0';
   wait for 10 ns;
   single_sec_set <= '1';
   wait for 10 ns;
      single_sec_set <= '0';
   wait for 10 ns;

    wait;
end process;



stim_proc_enable: process
begin
    all_zeros <= '0';
    SW_START  <= '0';
    wait for 80 ns;
    all_zeros <= '0';
    SW_START  <= '1';
    wait for 300 ns;
    all_zeros <= '1';
    SW_START  <= '1';
    wait for 30 ns;
end process;

stim_proc_reset: process
begin
    reset <= '1';
    wait for 30 ns;
    reset <= '0';
    wait;
end process;



end Behavior;
