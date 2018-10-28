library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_sw_lap_multiplexer is
end tb_sw_lap_multiplexer;

architecture Behavioral of tb_sw_lap_multiplexer is
component sw_lap_multiplexer
PORT( 
        seconds      : in STD_LOGIC_VECTOR (3 downto 0);
        tens_seconds : in STD_LOGIC_VECTOR (3 downto 0);
        minutes      : in STD_LOGIC_VECTOR (3 downto 0);
        tens_minutes : in STD_LOGIC_VECTOR (3 downto 0);
        L_seconds      : in STD_LOGIC_VECTOR (3 downto 0);
        L_tens_seconds : in STD_LOGIC_VECTOR (3 downto 0);
        L_minutes      : in STD_LOGIC_VECTOR (3 downto 0);
        L_tens_minutes : in STD_LOGIC_VECTOR (3 downto 0);
        selector : in STD_LOGIC;
        m_seconds      : out STD_LOGIC_VECTOR (3 downto 0);
        m_tens_seconds : out STD_LOGIC_VECTOR (3 downto 0);
        m_minutes      : out STD_LOGIC_VECTOR (3 downto 0);
        m_tens_minutes : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;
--Inputs
signal seconds      : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal tens_seconds : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal minutes      : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal tens_minutes : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal L_seconds      : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal L_tens_seconds : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal L_minutes      : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal L_tens_minutes : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal selector : STD_LOGIC;
--Outputs
signal m_seconds      : STD_LOGIC_VECTOR (3 downto 0);
signal m_tens_seconds : STD_LOGIC_VECTOR (3 downto 0);
signal m_minutes      : STD_LOGIC_VECTOR (3 downto 0);
signal m_tens_minutes : STD_LOGIC_VECTOR (3 downto 0);

constant clock_period: time := 10ns;

     
begin
    uut: sw_lap_multiplexer
    PORT MAP(  seconds      => seconds,
               tens_seconds => tens_seconds,
               minutes      => minutes,
               tens_minutes => tens_minutes,
               L_seconds      => L_seconds,
               L_tens_seconds => L_tens_seconds,
               L_minutes      => L_minutes,
               L_tens_minutes => L_tens_minutes,
               selector => selector,
               m_seconds      => m_seconds,
               m_tens_seconds => m_tens_seconds,
               m_minutes      => m_minutes,
               m_tens_minutes => m_tens_minutes
            );
    --Selector stimulus
    stim_proc_selector: process
    begin
        selector <= '1';
        wait for 300 ns;
        selector <= '0';
        wait for 300 ns;
        selector <= '1';
        wait for 300 ns;    
        selector <= '0';
        wait for 300 ns;
        wait;
    end process;

    --clock divider stimulus
    stim_proc_seconds: process
    begin
        seconds <= "0000";
        wait for clock_period/2;
        seconds <= "0001";
        wait for clock_period/2;
        seconds <= "0010";
        wait for clock_period/2;
        seconds <= "0011";
        wait for clock_period/2;
        seconds <= "0100";
        wait for clock_period/2;
        seconds <= "0101";
        wait for clock_period/2;
        seconds <= "0110";
        wait for clock_period/2;
        seconds <= "0111";
        wait for clock_period/2;
        seconds <= "1000";
        wait for clock_period/2;
        seconds <= "1001"; 
        wait for clock_period/2;
    end process;
    
    stim_proc_tens_seconds: process
    begin
        wait for clock_period*5;
        tens_seconds <= "0000";
        wait for clock_period;
        tens_seconds <= "0001";
        wait for clock_period;
        tens_seconds <= "0010";
        wait for clock_period;
        tens_seconds <= "0011";
        wait for clock_period;
        tens_seconds <= "0100";
        wait for clock_period;
        tens_seconds <= "0101";
        wait for clock_period;
    end process;
    
    stim_proc_minutes: process
    begin
        wait for clock_period;
       minutes <= "0000";
        wait for clock_period/2;
       minutes <= "0001";
        wait for clock_period/2;
       minutes <= "0010";
        wait for clock_period/2;
       minutes <= "0011";
        wait for clock_period/2;
       minutes <= "0100";
        wait for clock_period/2;
       minutes <= "0101";
        wait for clock_period/2;
       minutes <= "0110";
        wait for clock_period/2;
       minutes <= "0111";
        wait for clock_period/2;
       minutes <= "1000";
        wait for clock_period/2;
       minutes <= "1001"; 
        wait for clock_period/2;
    end process;
    
    stim_proc_tens_minutes: process
    begin
        wait for clock_period*6;
        tens_minutes <= "0000";
        wait for clock_period;
        tens_minutes <= "0001";
        wait for clock_period;
        tens_minutes <= "0010";
        wait for clock_period;
        tens_minutes <= "0011";
        wait for clock_period;
        tens_minutes <= "0100";
        wait for clock_period;
        tens_minutes <= "0101";
        wait for clock_period;        
    end process;
--lap register stimulus
stim_proc_L_seconds: process
    begin
        wait for clock_period/2;
        L_seconds <= "0000";
        wait for clock_period/2;
        L_seconds <= "0001";
        wait for clock_period/2;
        L_seconds <= "0010";
        wait for clock_period/2;
        L_seconds <= "0011";
        wait for clock_period/2;
        L_seconds <= "0100";
        wait for clock_period/2;
        L_seconds <= "0101";
        wait for clock_period/2;
        L_seconds <= "0110";
        wait for clock_period/2;
        L_seconds <= "0111";
        wait for clock_period/2;
        L_seconds <= "1000";
        wait for clock_period/2;
        L_seconds <= "1001"; 
        wait for clock_period/2;
    end process;
    
    stim_proc_L_tens_seconds: process
    begin
        wait for clock_period*7;
        L_tens_seconds <= "0000";
        wait for clock_period;
        L_tens_seconds <= "0001";
        wait for clock_period;
        L_tens_seconds <= "0010";
        wait for clock_period;
        L_tens_seconds <= "0011";
        wait for clock_period;
        L_tens_seconds <= "0100";
        wait for clock_period;
        L_tens_seconds <= "0101";
        wait for clock_period;
    end process;
    
    stim_proc_L_minutes: process
    begin
        wait for clock_period*2;
       L_minutes <= "0000";
        wait for clock_period/2;
       L_minutes <= "0001";
        wait for clock_period/2;
       L_minutes <= "0010";
        wait for clock_period/2;
       L_minutes <= "0011";
        wait for clock_period/2;
       L_minutes <= "0100";
        wait for clock_period/2;
       L_minutes <= "0101";
        wait for clock_period/2;
       L_minutes <= "0110";
        wait for clock_period/2;
       L_minutes <= "0111";
        wait for clock_period/2;
       L_minutes <= "1000";
        wait for clock_period/2;
       L_minutes <= "1001"; 
        wait for clock_period/2;
    end process;
    
    stim_proc_L_tens_minutes: process
    begin
        wait for clock_period*8;
        L_tens_minutes <= "0000";
        wait for clock_period;
        L_tens_minutes <= "0001";
        wait for clock_period;
        L_tens_minutes <= "0010";
        wait for clock_period;
        L_tens_minutes <= "0011";
        wait for clock_period;
        L_tens_minutes <= "0100";
        wait for clock_period;
        L_tens_minutes <= "0101";
        wait for clock_period;        
    end process;
    



end Behavioral;
