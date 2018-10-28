library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity clock_divider_CD is
    Port ( ten_min_set : in STD_LOGIC;
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
           a_tens_minutes : out STD_LOGIC_VECTOR (3 downto 0));
end clock_divider_CD;

architecture Behavioral of clock_divider_CD is
-- Signals:
signal enable : STD_LOGIC;
signal hundredhertz : STD_LOGIC;
signal onehertz, tensseconds, onesminutes, singlesec : STD_LOGIC;

--Component declarations
component upcounter is
    Generic ( period : integer:= 4;
             WIDTH  : integer:= 3
            );
       PORT (  clk    : in  STD_LOGIC;
              reset  : in  STD_LOGIC;
              enable : in  STD_LOGIC;
              zero   : out STD_LOGIC;
              value  : out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
           );
end component;
component downcounter is
   Generic ( period : integer:= 4;
             WIDTH  : integer:= 3
            );
   PORT (  clk    : in  STD_LOGIC;
           reset  : in  STD_LOGIC;
           set    : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           zero   : out STD_LOGIC;
           value  : out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
        );    
    
end component;
begin
oneHzClock: upcounter
   generic map(
               period => 10,--(100000000),   -- divide by 100_000_000 to divide 100 MHz down to 1 Hz 
               WIDTH  => 28             -- 28 bits are required to hold the binary value of 101111101011110000100000000
              )
   PORT MAP (
               clk    => clk,
               reset  => reset,
               enable => enable,
               zero   => onehertz, -- this is a 1 Hz clock signal
               value  => open  -- Leave open since we won't display this value
            );
   singleSecondsClock: downcounter
            generic map(
                        period => (10),   -- Counts numbers between 0 and 9 -> that's 10 values!
                        WIDTH  => 4
                       )
            PORT MAP (
                        clk    => clk,
                        reset  => reset,
                        set    => single_sec_set,
                        enable => onehertz,
                        zero   => singlesec,
                        value  => a_sec -- binary value of seconds we decode to drive the 7-segment display        
                     );
  tenSecondsClock: downcounter
    generic map(
                period => (6),   -- Counts numbers between 0 and 5 -> that's 6 values!
                WIDTH  => 4
                 )
    PORT MAP (
                clk    => clk,
                reset  => reset,
                set    => ten_sec_set,
                enable => singlesec,
                zero   => tensseconds,
                value  => a_tens_sec -- binary value of ten seconds we decode to drive the 7-segment display        
               );
                              
    singleMinutesClock: downcounter
    generic map(
                period => (10),   -- Counts numbers between 0 and 9 -> that's 10 values!
                WIDTH  => 4
                  )
    PORT MAP (
                clk    => clk,
                reset  => reset,
                set    => single_min_set,
                enable => tensseconds,
                zero   => onesminutes,
                value  => a_minutes -- binary value of single miutes we decode to drive the 7-segment display        
                );
    tensMinutesClock: downcounter
    generic map(
                period => (6),   -- Counts numbers between 0 and 5 -> that's 6 values!
                WIDTH  => 4
                )
    PORT MAP (
                clk    => clk,
                reset  => reset,
                set    => ten_min_set,
                enable => onesminutes,
                zero   => open,       --Value not needed
                value  => a_tens_minutes -- binary value of single miutes we decode to drive the 7-segment display        
                );
    
    enable <= (not(all_zeros) and SW_START);
end Behavioral;
