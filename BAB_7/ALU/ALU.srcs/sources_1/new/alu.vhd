----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2025 10:44:36 AM
-- Design Name: 
-- Module Name: alu - Behavioral
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

entity alu is
    Port ( a : in std_logic_vector (2 downto 0);
           b : in std_logic_vector (2 downto 0);
           c : in STD_LOGIC;
           sel : in std_logic_vector (1 downto 0);
           result : out std_logic_vector (5 downto 0));
end alu;

architecture Behavioral of alu is
component comparator_3bit
    Port ( a : in std_logic_vector (2 downto 0);
           b : in std_logic_vector (2 downto 0);
           less : out STD_LOGIC;
           equal : out STD_LOGIC;
           greater : out STD_LOGIC);
end component;
component multiplier_3bit
    Port ( a : in std_logic_vector (2 downto 0);
           b : in std_logic_vector (2 downto 0);
           p : out std_logic_vector (5 downto 0));
end component;
component subtractor_3bit
    Port ( a : in std_logic_vector (2 downto 0);
           b : in std_logic_vector (2 downto 0);
           bin : in STD_LOGIC;
           diff : out std_logic_vector (2 downto 0);
           bout : out STD_LOGIC);
end component;
component adder_3bit
    Port ( a : in std_logic_vector (2 downto 0);
           b : in std_logic_vector (2 downto 0);
           cin : in STD_LOGIC;
           sum : out std_logic_vector (2 downto 0);
           cout : out STD_LOGIC);
end component;
signal t_comp, t_multi, t_sub, t_adder : std_logic_vector (5 downto 0) := (others => '0');
begin
alu1 : adder_3bit port map (a=>a,b=>b,cin=>c,sum=>t_adder(2 downto 0),cout=>t_adder(3));
alu2 : subtractor_3bit port map (a=>a,b=>b,bin=>c,diff=>t_sub(2 downto 0),bout=>t_sub(3));
alu3 : multiplier_3bit port map(a=>a,b=>b,p=>t_multi);
alu4 : comparator_3bit port map(a=>a,b=>b,less=>t_comp(0),equal=>t_comp(1),greater=>t_comp(2));

process (sel,t_comp,t_multi,t_sub, t_adder)
begin
case sel is
when "00"=>
     result<=t_adder; when "01"=>
     result<=t_sub; when "10"=>
     result<=t_multi; when "11"=>
     result<=t_comp; when others=>
     result<="000000";
end case;
end process;
end Behavioral;
