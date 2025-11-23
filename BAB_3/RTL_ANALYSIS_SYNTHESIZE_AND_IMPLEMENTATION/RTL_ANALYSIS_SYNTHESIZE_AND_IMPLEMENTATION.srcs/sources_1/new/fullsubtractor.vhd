----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2025 10:44:36 AM
-- Design Name: 
-- Module Name: fullsubtractor - Behavioral
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

entity fullsubtractor is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           bin : in STD_LOGIC;
           diff : out STD_LOGIC;
           bout : out STD_LOGIC);
end fullsubtractor;

architecture Behavioral of fullsubtractor is
component halfsubtractor
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           diff : out STD_LOGIC;
           bout : out STD_LOGIC);
end component;
signal d1, b1, b2:std_logic;

begin
hs1 : halfsubtractor port map(a,b,d1,b1);
hs2 : halfsubtractor port map(d1,bin,diff,b2);
bout <= b1 or b2;

end Behavioral;
