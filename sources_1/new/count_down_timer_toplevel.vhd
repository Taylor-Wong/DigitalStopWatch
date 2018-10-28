library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity count_down_timer_toplevel is
    PORT ( clk      : in  STD_LOGIC;
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
end count_down_timer_toplevel;

architecture Behavioral of count_down_timer_toplevel is
-- Internal signals 
signal in_DP, out_DP : STD_LOGIC;
signal an_i : STD_LOGIC_VECTOR(3 downto 0);
signal digit_to_display : STD_LOGIC_VECTOR(3 downto 0);
signal sec_dig1_i, sec_dig2_i, min_dig1_i, min_dig2_i, digit_select_i : STD_LOGIC_VECTOR(3 downto 0);
signal CA_i, CB_i, CC_i, CD_i, CE_i, CF_i, CG_i : STD_LOGIC;
--signal m_sec_dig1_i, m_sec_dig2_i, m_min_dig1_i, m_min_dig2_i : STD_LOGIC_VECTOR(3 downto 0);
signal NOT_SW_START :   STD_LOGIC;
signal tens_min_set,single_min_set,tens_sec_set,single_sec_set : STD_LOGIC;
signal a_tens_minutes,a_minutes,a_tens_sec,a_sec : STD_LOGIC_VECTOR(3 downto 0);
signal all_zeros : STD_LOGIC;
signal clock_div_enable : STD_LOGIC;
signal m_sec,m_tensec,m_min,m_tenmin : STD_LOGIC_VECTOR(3 downto 0);



--components
component seven_seg_digit_selector_CD is
    PORT ( clk          : in  STD_LOGIC;
           digit_select : out  STD_LOGIC_VECTOR (3 downto 0);
           an_outputs : out  STD_LOGIC_VECTOR (3 downto 0);
           reset        : in  STD_LOGIC
          );
end component;

component min_sec_setter is
    PORT (    PUSH_UP : in STD_LOGIC;
              NOT_SW_START : in STD_LOGIC;
              clk : in STD_LOGIC;
              PUSH_L : in STD_LOGIC;
              PUSH_R : in STD_LOGIC;
              tens_min_set : out STD_LOGIC;
              single_min_set : out STD_LOGIC;
              tens_sec_set : out STD_LOGIC;
              single_sec_set : out STD_LOGIC);
    
end component;

component clock_divider_CD is
    PORT ( ten_min_set : in STD_LOGIC;
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

end component;

component alarm_check is
    PORT(  a_sec : in STD_LOGIC_VECTOR (3 downto 0);
           a_tensec : in STD_LOGIC_VECTOR (3 downto 0);
           a_min : in STD_LOGIC_VECTOR (3 downto 0);
           a_tenmin : in STD_LOGIC_VECTOR (3 downto 0);
           all_zeros : out STD_LOGIC;
           m_sec : out STD_LOGIC_VECTOR (3 downto 0);
           m_tensec : out STD_LOGIC_VECTOR (3 downto 0);
           m_min : out STD_LOGIC_VECTOR (3 downto 0);
           m_tenmin : out STD_LOGIC_VECTOR (3 downto 0)
           );
    
end component;

component seven_segment_decoder_CD is
    PORT ( CA    : out STD_LOGIC;
           CB    : out STD_LOGIC;
           CC    : out STD_LOGIC;
           CD    : out STD_LOGIC;
           CE    : out STD_LOGIC;
           CF    : out STD_LOGIC;
           CG    : out STD_LOGIC;
           DP    : out STD_LOGIC;
           dp_in : in  STD_LOGIC;
           data  : in  STD_LOGIC_VECTOR (3 downto 0)
         );
         
end component;

component digit_multiplexer_CD is
    PORT (
            m_sec   : in  STD_LOGIC_VECTOR(3 downto 0);
            m_tensec   : in  STD_LOGIC_VECTOR(3 downto 0);
            m_min   : in  STD_LOGIC_VECTOR(3 downto 0);
            m_tenmin   : in  STD_LOGIC_VECTOR(3 downto 0);
            selector   : in  STD_LOGIC_VECTOR(3 downto 0);
            time_digit : out STD_LOGIC_VECTOR(3 downto 0)
         );
         
end component;
           

BEGIN
   SELECTOR : seven_seg_digit_selector_CD
    PORT MAP( clk          => clk,
              digit_select => digit_select_i, 
              an_outputs   => an_i,
              reset        => reset
            );
   SETTER: min_sec_setter
    PORT MAP(    PUSH_UP => PUSH_UP,
                 NOT_SW_START => NOT_SW_START,
                 clk => clk,
                 PUSH_L => PUSH_L,
                 PUSH_R => PUSH_R,
                 tens_min_set => tens_min_set,
                 single_min_set => single_min_set,
                 tens_sec_set => tens_sec_set,
                 single_sec_set => single_sec_set
                 );
  CLKDIV : clock_divider_CD
    PORT MAP( ten_min_set => tens_min_set,
              single_min_set => single_min_set,
              ten_sec_set => tens_sec_set,
              single_sec_set =>  single_sec_set,
              all_zeros => all_zeros,
              SW_START  => SW_START,
              reset => clock_div_enable,
              clk => clk,
              a_sec => a_sec,
              a_tens_sec => a_tens_sec,
              a_minutes => a_minutes,
              a_tens_minutes => a_tens_minutes
          );    
                     
   ALARM: alarm_check
    PORT MAP(   a_sec => a_sec,
                a_tensec => a_tens_sec,
                a_min => a_minutes,
                a_tenmin => a_tens_minutes,
                all_zeros => all_zeros,
                m_sec => m_sec,
                m_tensec => m_tensec,
                m_min => m_min,
                m_tenmin => m_tenmin
                ); 
                
   DECODER : seven_segment_decoder_CD
       PORT MAP( CA    => CA_i,
                 CB    => CB_i,
                 CC    => CC_i,
                 CD    => CD_i,
                 CE    => CE_i,
                 CF    => CF_i,
                 CG    => CG_i,
                 DP    => out_dp,
                 dp_in => in_dp,
                 data  => digit_to_display 
               );             
                
       DIGIT_MUX : digit_multiplexer_CD
       PORT MAP( 
                 m_sec   => m_sec, 
                 m_tensec   => m_tensec,
                 m_min   => m_min,  
                 m_tenmin   => m_tenmin,  
                 selector   => digit_select_i,  
                 time_digit => digit_to_display
                 );








--============================================== 

   -- Connect internal signals to outputs here:
   DP <= out_dp;
   CA <= CA_i;
   CB <= CB_i;
   CC <= CC_i;
   CD <= CD_i;
   CE <= CE_i;
   CF <= CF_i;
   CG <= CG_i;
   
   in_dp <= an_i(2); -- have the decimal point light up in the third digit of the 7-segment display (i.e. minutes digit)
 
   AN1 <= an_i(0); -- seconds digit
   AN2 <= an_i(1); -- tens of seconds digit
   AN3 <= an_i(2); -- minutes digit
   AN4 <= an_i(3); -- tens of minutes digit
   
   NOT_SW_START <= not SW_START;
  end Behavioral;
