----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/26/2025 10:53:52 PM
-- Design Name: 
-- Module Name: sevseg2 - Behavioral
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

entity sevseg2 is
    Port ( bcd_input : in std_logic_vector(3 downto 0);
           seg_output : out STD_LOGIC_vector(6 downto 0);
           display_sel : out STD_LOGIC_vector(7 downto 0));
end sevseg2;

architecture Behavioral of sevseg2 is

begin
    process(bcd_input)
    begin
        case bcd_input is
            when "0001" => seg_output <= "1111001";
            when "0010" => seg_output <= "0100100";
            when "0011" => seg_output <= "0110000";
            when "0100" => seg_output <= "0011001";
            when "0101" => seg_output <= "0010010";
            when "0110" => seg_output <= "0000010";
            when "0111" => seg_output <= "1111000";
            when "1000" => seg_output <= "0000000";
            when others => seg_output <= "1111111";
        end case;
        
        case bcd_input is
            when "0001" => display_sel <= "11111110";
            when "0010" => display_sel <= "11111101";
            when "0011" => display_sel <= "11111011";
            when "0100" => display_sel <= "11110111";
            when "0101" => display_sel <= "11101111";
            when "0110" => display_sel <= "11011111";
            when "0111" => display_sel <= "10111111";
            when "1000" => display_sel <= "01111111";
            when others => display_sel <= "11111111";
        end case;           
    end process;
end Behavioral;
