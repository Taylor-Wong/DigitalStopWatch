library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_lap_register is
end tb_lap_register;

architecture Behavioral of tb_lap_register is

    component lap_register
    port(
            CLK : in STD_LOGIC;
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
    end component;
    
    constant clock_period : time := 10ns;
    --Inputs
    signal CLK   : STD_LOGIC := '0';
    signal NOT_LAP_TIME : STD_LOGIC := '0';
    signal load  : STD_LOGIC := '0';
    signal seconds      : STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
    signal tens_seconds : STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
    signal minutes      : STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
    signal tens_minutes : STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
    --Outputs
    signal L_seconds      : STD_LOGIC_VECTOR (3 downto 0);
    signal L_tens_seconds : STD_LOGIC_VECTOR (3 downto 0);
    signal L_minutes      : STD_LOGIC_VECTOR (3 downto 0);
    signal L_tens_minutes : STD_LOGIC_VECTOR (3 downto 0);
    
   

begin
    uut: lap_register
    PORT MAP(   CLK     => CLK,
                RESET   => NOT_LAP_TIME,
                load    => load,
                seconds      => seconds,
                tens_seconds => tens_seconds,
                minutes      => minutes,
                tens_minutes => tens_minutes,
                L_seconds      => L_seconds,
                L_tens_seconds => L_tens_seconds,
                L_minutes      => L_minutes,
                L_tens_minutes => L_tens_minutes
             );
    --CLK stimulus
    stim_proc_CLK: process
    begin
        wait for clock_period/2;
        CLK <= '1';
        wait for clock_period/2;
        CLK <= '0';
    end process;
    
    --RESET stimulus
    stim_proc_RESET: process
    begin
        wait for clock_period * 2;
        NOT_LAP_TIME <= '1';
        wait for clock_period * 15;
        NOT_LAP_TIME <= '0';
        wait for clock_period * 50;
    end process;
    
    --load stimulus
    stim_proc_load: process
    begin
        wait for clock_period * 2;
        load <= '0';
        wait for clock_period * 15;
        load <= '1';
        wait for clock_period;
        load <= '0';
        wait for clock_period *49;
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

end Behavioral;
