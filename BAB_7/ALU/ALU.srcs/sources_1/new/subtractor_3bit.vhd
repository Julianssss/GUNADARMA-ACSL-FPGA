----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2025 10:44:36 AM
-- Design Name: 
-- Module Name: subtractor_3bit - Behavioral
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

entity subtractor_3bit is
    Port ( a : in std_logic_vector (2 downto 0);
           b : in std_logic_vector (2 downto 0);
           bin : in STD_LOGIC;
           diff : out std_logic_vector (2 downto 0);
           bout : out STD_LOGIC);
end subtractor_3bit;

architecture Behavioral of subtractor_3bit is
component fullsubtractor is
port ( a : in std_logic;
       b : in std_logic;
       bin : in std_logic;
       diff : out std_logic;
       bout : out std_logic);
end component;
signal br0,br1: std_logic;
begin
fs1 : fullsubtractor port map (a(0),b(0),bin,diff(0),br0);
fs2 : fullsubtractor port map (a(1),b(1),br0,diff(1),br1);
fs3 : fullsubtractor port map (a(2),b(2),br1,diff(2),bout);
end Behavioral;
