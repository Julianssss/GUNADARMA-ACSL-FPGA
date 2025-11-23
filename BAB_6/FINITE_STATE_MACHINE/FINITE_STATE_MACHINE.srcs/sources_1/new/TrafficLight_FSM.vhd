----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2025 01:37:36 AM
-- Design Name: 
-- Module Name: TrafficLightFSM - Behavioral
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TrafficLightFSM is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           green : out STD_LOGIC;
           yellow : out STD_LOGIC;
           red : out STD_LOGIC);
end TrafficLightFSM;

architecture Behavioral of TrafficLightFSM is
    type state_type is (S_YELLOW, S_RED, S_GREEN);
    signal state, next_state : state_type;
    signal counter : integer range 0 to 100000000 := 0;

begin
    process (clk, reset)
    begin 
        if reset = '1' then
            state <= S_YELLOW;
            counter <= 0;
        elsif rising_edge(clk) then
            if counter = 50000000 then
                state <= next_state;
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
     end process;
     
     
     process (state, counter)
     begin
        case state is
            when S_YELLOW => 
            red <= '0';
            green <= '0';
            yellow <= '1';
            if counter = 50000000 then -- 5 detik
                next_state <= S_RED;
            else
                next_state <= S_YELLOW;
            end if;
            
            when S_RED => 
            red <= '1';
            green <= '0';
            yellow <= '0';
            if counter = 50000000 then -- 5 detik
                next_state <= S_GREEN;
            else
                next_state <= S_RED;
            end if;
            
            when S_GREEN => 
            red <= '0';
            green <= '1';
            yellow <= '0';
            if counter = 50000000 then -- 5 detik
                next_state <= S_YELLOW;
            else
                next_state <= S_GREEN;
            end if;
       end case;
    end process;          
end Behavioral;
