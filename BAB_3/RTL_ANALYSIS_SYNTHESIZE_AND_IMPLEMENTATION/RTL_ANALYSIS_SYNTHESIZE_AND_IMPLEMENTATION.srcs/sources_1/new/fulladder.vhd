----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2025 10:44:36 AM
-- Design Name: 
-- Module Name: fulladder - Behavioral
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

entity fulladder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in std_logic;
           s : out STD_LOGIC;
           cout : out STD_LOGIC);
end fulladder;

architecture Behavioral of fulladder is
component halfadder
port (a,b : in std_logic;
      s : out std_logic;
      cout : out std_logic);
end component;
signal s1,c1,c2:std_logic;
begin
ha1 : halfadder port map(a,b,s1,c1);
ha2 : halfadder port map(s1,cin,s,c2);
cout <= c1 or c2;

end Behavioral;
