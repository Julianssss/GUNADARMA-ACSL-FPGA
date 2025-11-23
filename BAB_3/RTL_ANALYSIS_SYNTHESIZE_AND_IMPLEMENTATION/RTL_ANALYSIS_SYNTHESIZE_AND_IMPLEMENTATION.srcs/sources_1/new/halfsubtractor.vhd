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

entity halfsubtractor is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           diff : out STD_LOGIC;
           bout : out STD_LOGIC);
end halfsubtractor;

architecture Behavioral of halfsubtractor is

begin
diff <= a xor b;
bout <= not a and b;

end Behavioral;
