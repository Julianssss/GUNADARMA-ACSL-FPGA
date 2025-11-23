----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2025 10:44:36 AM
-- Design Name: 
-- Module Name: adder_3bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder_3bit is
    Port ( a : in std_logic_vector (2 downto 0);
           b : in std_logic_vector (2 downto 0);
           cin : in STD_LOGIC;
           sum : out std_logic_vector (2 downto 0);
           cout : out STD_LOGIC);
end adder_3bit;

architecture Behavioral of adder_3bit is
component fulladder
port ( a : in std_logic;
       b : in std_logic;
       cin : in std_logic;
       s : out std_logic;
       cout : out std_logic);
end component;
signal c1,c2:std_logic;
begin
fa1:fulladder port map(a(0),b(0),cin,sum(0),c1);
fa2:fulladder port map(a(1),b(1),c1,sum(1),c2);
fa3:fulladder port map(a(2),b(2),c2,sum(2),cout);

end Behavioral;
