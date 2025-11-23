----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2025 10:44:36 AM
-- Design Name: 
-- Module Name: multiplier_3bit - Behavioral
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

entity multiplier_3bit is
    Port ( a : in std_logic_vector (2 downto 0);
           b : in std_logic_vector (2 downto 0);
           p : out std_logic_vector (5 downto 0));
end multiplier_3bit;

architecture Behavioral of multiplier_3bit is
component fulladder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in std_logic;
           s : out STD_LOGIC;
           cout : out STD_LOGIC);
end component;
component halfadder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           s : out STD_LOGIC;
           cout : out STD_LOGIC);
end component;

signal f0,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,s1,s2: std_logic;
begin
ha1: halfadder port map (f0,f1,p(1),f2);
fa1: fulladder port map (f2,f3,f4,s1,f5);
ha2: halfadder port map (f5,f6,s2,f7);
ha3: halfadder port map (s1,f8,p(2),f9);
fa2: fulladder port map (f9,s2,f10,p(3),f11);
fa3: fulladder port map (f11,f7,f12,p(4),p(5));
f0 <= a(0) and b(1);
f1 <= a(1) and b(0);
f3 <= a(0) and b(2);
f4 <= a(1) and b(1);
f6 <= a(1) and b(2);
f8 <= a(2) and b(0);
f10<= a(2) and b(1);
f12<= a(2) and b(2);
p(0)<= a(0) and b(0);

end Behavioral;
