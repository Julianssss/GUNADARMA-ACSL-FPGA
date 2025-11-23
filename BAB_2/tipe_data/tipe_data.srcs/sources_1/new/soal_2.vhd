----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2025 02:16:41 PM
-- Design Name: 
-- Module Name: soal_2 - Behavioral
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

entity soal_2 is
    Port ( a : in std_logic_vector(3 downto 0);
           b : in std_logic_vector(1 downto 0);
           c : in STD_LOGIC;
           d : out STD_LOGIC);
end soal_2;

architecture Behavioral of soal_2 is

begin

d <= ((a(0) and a(1)) or (a(2) and a(3)) or c) xor (not (b(0) and b(1)));

end Behavioral;
