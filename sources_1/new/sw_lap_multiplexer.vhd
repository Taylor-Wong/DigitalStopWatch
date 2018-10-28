library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sw_lap_multiplexer is
    Port ( 
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
end sw_lap_multiplexer;

architecture Behavioral of sw_lap_multiplexer is

begin

with selector select
    m_seconds <= seconds   when '0',
                 L_seconds when others;
                 
with selector select
    m_tens_seconds <= tens_seconds   when '0',
                      L_tens_seconds when others; 
                         
with selector select
    m_minutes <= minutes   when '0',
                 L_minutes when others;

with selector select
    m_tens_minutes <= tens_minutes   when '0',
                      L_tens_minutes when others;

end Behavioral;
