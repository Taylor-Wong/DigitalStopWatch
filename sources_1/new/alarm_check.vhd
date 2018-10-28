library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity alarm_check is
    Port ( a_sec : in STD_LOGIC_VECTOR (3 downto 0);
           a_tensec : in STD_LOGIC_VECTOR (3 downto 0);
           a_min : in STD_LOGIC_VECTOR (3 downto 0);
           a_tenmin : in STD_LOGIC_VECTOR (3 downto 0);
           all_zeros : out STD_LOGIC;
           m_sec : out STD_LOGIC_VECTOR (3 downto 0);
           m_tensec : out STD_LOGIC_VECTOR (3 downto 0);
           m_min : out STD_LOGIC_VECTOR (3 downto 0);
           m_tenmin : out STD_LOGIC_VECTOR (3 downto 0)
           );
end alarm_check;

architecture Behavioral of alarm_check is
    constant zeros : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    constant m_sec_alarm : STD_LOGIC_VECTOR (3 downto 0) := "1011"; --B
    constant m_tensec_alarm : STD_LOGIC_VECTOR (3 downto 0) := "1110"; --E
    constant m_min_alarm : STD_LOGIC_VECTOR (3 downto 0):= "1110"; --E
    constant m_tenmin_alarm : STD_LOGIC_VECTOR (3 downto 0):= "1111"; --P
begin
   process(a_sec, a_tensec, a_min,a_tenmin)
   begin
    if(a_sec = "0000" and a_tensec = "0000" and a_min = "0000" and a_tenmin = "0000")then
       all_zeros <= '1';
       m_sec <= m_sec_alarm;
       m_tensec <= m_tensec_alarm ;
       m_min <= m_min_alarm;
       m_tenmin <= m_tenmin_alarm;
    else
       all_zeros <= '0';
       m_sec <= a_sec;
       m_tensec <= a_tensec;
       m_min <= a_min;
       m_tenmin <= a_tenmin; 
    end if;
    end process;

end Behavioral;
