----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2025 01:56:56 AM
-- Design Name: 
-- Module Name: Structural - Behavioral
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

entity Structural is
    Port ( a : in bit;
           b : in bit;
           c : out bit;
           s : out bit);
end Structural;

architecture Behavioral of Structural is

    component XOR1
    port(p, q : in bit; r : out bit);
    end component;
    
    component AND1
    port(x,y : in bit; z : out bit);
    end component;

begin
X1 : XOR1 port map (a,b,s);
A1 : AND1 port map (a,b,c);

end Behavioral;
