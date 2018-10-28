library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity digit_multiplexer_CD is
  PORT ( 
          m_sec   : in  STD_LOGIC_VECTOR(3 downto 0);
          m_tensec   : in  STD_LOGIC_VECTOR(3 downto 0);
          m_min   : in  STD_LOGIC_VECTOR(3 downto 0);
          m_tenmin   : in  STD_LOGIC_VECTOR(3 downto 0);
          selector   : in  STD_LOGIC_VECTOR(3 downto 0);
          time_digit : out STD_LOGIC_VECTOR(3 downto 0)
        );
end digit_multiplexer_CD;

architecture Behavioral of digit_multiplexer_CD is

BEGIN
--==============================================
with selector select        
        time_digit <= m_sec when "0001",
                      m_tensec when "0010",
                      m_min when "0100",
                      m_tenmin when others ;
                      
--============================================== 

END Behavioral;
