----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2025 10:44:36 AM
-- Design Name: 
-- Module Name: comparator_3bit - Behavioral
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

entity comparator_3bit is
    Port ( a : in std_logic_vector (2 downto 0);
           b : in std_logic_vector (2 downto 0);
           less : out STD_LOGIC;
           equal : out STD_LOGIC;
           greater : out STD_LOGIC);
end comparator_3bit;

architecture Behavioral of comparator_3bit is
begin
    process (a,b)
    begin
        if (a > b) then
            less <= '0';
            equal <= '0';
            greater <= '1';
        elsif (a < b) then
            less <= '1';
            equal <= '0';
            greater <= '0';
        else 
            less <= '0';
            equal <= '1';
            greater <= '0';
        end if;
    end process;
end Behavioral;
