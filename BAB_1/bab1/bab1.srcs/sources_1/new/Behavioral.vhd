----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2025 01:56:56 AM
-- Design Name: 
-- Module Name: Behavioral - Behavioral
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

entity Behavioral is
    Port ( a : in bit;
           b : in bit;
           c : out bit;
           s : out bit);
end Behavioral;

architecture Behavioral of Behavioral is

begin
    process (a, b)
    begin
        if a&b = "00" then
        s <= '0';
        c <= '0';
        
        elsif a&b = "10" or a&b = "01" then
        s <= '1';
        c <= '0';
        
        else
        s <= '0';
        c <= '1';
        
        end if;
    end process;


end Behavioral;
