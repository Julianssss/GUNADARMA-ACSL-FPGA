----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/26/2025 10:31:30 PM
-- Design Name: 
-- Module Name: sevseg - Behavioral
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
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevseg is
    Port ( clk : in STD_LOGIC;
           pos_seg : out std_logic_vector (7 downto 0);
           led_seg : out STD_LOGIC_vector (7 downto 0));
end sevseg;

architecture Behavioral of sevseg is
signal delay : natural range 0 to 1000 := 0;
signal number : natural range 0 to 7 := 0;
begin
process (clk)
begin
if rising_edge(clk) then
    delay <= delay + 1;
    if delay >= 1000 then
        delay <= 0;
        
        number <= number + 1;
        if number >= 7 then
            number <= 0;
        end if;
    end if;
end if;
end process;

process (number)
    begin
        case number is
        when 0 => pos_seg <="01111111";
        when 1 => pos_seg <="10111111";
        when 2 => pos_seg <="11011111";
        when 3 => pos_seg <="11101111";
        when 4 => pos_seg <="11110111";
        when 5 => pos_seg <="11111011";
        when 6 => pos_seg <="11111101";
        when 7 => pos_seg <="11111110";
        end case;
end process;

process (number)
    begin
        case number is
        when 0 => led_seg <="11111001";
        when 1 => led_seg <="10100100";
        when 2 => led_seg <="10110000";
        when 3 => led_seg <="10011001";
        when 4 => led_seg <="10010010";
        when 5 => led_seg <="00000010";
        when 6 => led_seg <="11111000";
        when 7 => led_seg <="00000000";
        end case;
end process;
end Behavioral;
