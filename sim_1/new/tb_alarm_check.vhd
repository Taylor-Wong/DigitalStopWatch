library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_alarm_check is
end tb_alarm_check;

architecture Behavioral of tb_alarm_check is
component alarm_check
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
   --INPUTS
   signal a_sec : STD_LOGIC_VECTOR (3 downto 0);
   signal a_tensec : STD_LOGIC_VECTOR (3 downto 0);
   signal a_min : STD_LOGIC_VECTOR (3 downto 0);
   signal a_tenmin : STD_LOGIC_VECTOR (3 downto 0);
   -- OUTPUTS
   signal all_zeros : STD_LOGIC;
   signal m_sec : STD_LOGIC_VECTOR (3 downto 0);
   signal m_tensec :  STD_LOGIC_VECTOR (3 downto 0);
   signal m_min : STD_LOGIC_VECTOR (3 downto 0);
   signal m_tenmin : STD_LOGIC_VECTOR (3 downto 0);
begin


uut: alarm_check
    PORT MAP(  a_sec => a_sec,
               a_tensec => a_tensec,
               a_min => a_min,
               a_tenmin => a_tenmin,
               all_zeros => all_zeros,
               m_sec => m_sec,
               m_tensec => m_tensec,
               m_min => m_min,
               m_tenmin => m_tenmin
               );
stim_proc_a_sec: process
begin
    a_sec <= "1001";
    wait for 10 ns;
    a_sec <= "1000";  
    wait for 10 ns;  
    a_sec <= "0111";
    wait for 10 ns;
    a_sec <= "0110";
    wait for 10 ns;
    a_sec <= "0101";
    wait for 10 ns;
    a_sec <= "0100";
    wait for 10 ns;
    a_sec <= "0011";
    wait for 10 ns;
    a_sec <= "0010";
    wait for 10 ns;
    a_sec <= "0001";
    wait for 10 ns;
    a_sec <= "0000";
    wait for 10 ns;
    wait;
             
end process;

stim_proc_a_tensec: process
begin
   a_tensec <= "0110";
    wait for 15 ns;
    a_tensec <= "0101";
    wait for 15 ns;
    a_tensec <= "0100";
    wait for 15 ns;
    a_tensec <= "0011";
    wait for 15 ns;
    a_tensec <= "0010";
    wait for 15 ns;
    a_tensec <= "0001";
    wait for 15 ns;
    a_tensec <= "0000";
    wait for 15 ns;
    wait;
end process;

stim_proc_a_min: process
begin
   a_min <= "1001";
    wait for 20 ns;
   a_min <= "1000";  
    wait for 20 ns;  
   a_min <= "0111";
    wait for 20 ns;
   a_min <= "0110";
    wait for 20 ns;
   a_min <= "0101";
    wait for 20 ns;
   a_min <= "0100";
    wait for 20 ns;
   a_min <= "0011";
    wait for 20 ns;
   a_min <= "0010";
    wait for 20 ns;
   a_min <= "0001";
    wait for 20 ns;
   a_min <= "0000";
    wait for 20 ns;
    wait;
end process;

stim_proc_a_tenmin:  process
begin
   a_tenmin <= "0110";
    wait for 25 ns;
    a_tenmin <= "0101";
    wait for 25 ns;
    a_tenmin <= "0100";
    wait for 25 ns;
    a_tenmin <= "0011";
    wait for 25 ns;
    a_tenmin <= "0010";
    wait for 25 ns;
    a_tenmin <= "0001";
    wait for 25 ns;
    a_tenmin <= "0000";
    wait for 25 ns;
    wait;
end process;

end Behavioral;
