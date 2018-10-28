library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity lap_register is
    
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           load : in STD_LOGIC;
           seconds : in STD_LOGIC_VECTOR ( 3 downto 0);
           tens_seconds : in STD_LOGIC_VECTOR (3 downto 0);
           minutes : in STD_LOGIC_VECTOR (3 downto 0);
           tens_minutes : in STD_LOGIC_VECTOR (3 downto 0);
           L_seconds : out STD_LOGIC_VECTOR (3 downto 0);
           L_tens_seconds : out STD_LOGIC_VECTOR (3 downto 0);
           L_minutes : out STD_LOGIC_VECTOR (3 downto 0);
           L_tens_minutes : out STD_LOGIC_VECTOR (3 downto 0)
           );
           
end lap_register;

architecture Behavioral of lap_register is
    constant zeros  : STD_LOGIC_VECTOR(3 downto 0)  := (others => '0');
    
    signal    L_seconds_i         : STD_LOGIC_VECTOR (3 downto 0) := zeros ;
    signal    L_tens_seconds_i    : STD_LOGIC_VECTOR (3 downto 0) := zeros ;
    signal    L_minutes_i         : STD_LOGIC_VECTOR (3 downto 0) := zeros ;
    signal    L_tens_minutes_i    : STD_LOGIC_VECTOR (3 downto 0) := zeros ;
           
    
begin

process(CLK, RESET)
begin
    if(RESET = '1') then
        L_seconds_i         <= zeros;
        L_tens_seconds_i    <= zeros;
        L_minutes_i           <= zeros;
        L_tens_minutes_i      <= zeros;
    elsif(rising_edge(CLK))then
        if(load = '1')then
            L_seconds_i          <= seconds;
            L_tens_seconds_i     <= tens_seconds;
            L_minutes_i          <= minutes;
            L_tens_minutes_i     <= tens_minutes; 
        end if;
    end if;

end process;
    L_seconds       <=  L_seconds_i;
    L_tens_seconds  <=  L_tens_seconds_i;
    L_minutes       <=  L_minutes_i;
    L_tens_minutes  <=  L_tens_minutes_i;
    
end Behavioral;
