----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2025 01:37:36 AM
-- Design Name: 
-- Module Name: sevseg_fsm - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevseg_fsm is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           an : out std_logic_vector(7 downto 0);
           seg : out std_logic_vector(6 downto 0));
end sevseg_fsm;

architecture Behavioral of sevseg_fsm is
    signal state    : integer range 0 to 7 := 0;
    signal clkdiv   : unsigned(23 downto 0) := (others => '0');
    signal tick     : std_logic := '0';
    signal digitval : integer range 0 to 9 := 0;

begin

    process (clk, reset)
    begin
        if reset = '1' then
            clkdiv <= (others => '0');
            tick   <= '0';
        elsif rising_edge(clk) then
            clkdiv <= clkdiv + 1;
            if clkdiv = 0 then
                tick <= '1';
            else
                tick <= '0';
            end if;
        end if;
     end process;
     
        -- FSM : pindah ke digit berikutnya
     process(clk, reset)
     begin
        if reset = '1' then
            state <= 0;
        elsif rising_edge(clk) then
            if tick = '1' then
                if state = 7 then
                    state <= 0;
                else
                    state <= state + 1;
                end if;
            end if;
        end if;
     end process;
     
     process(state)
     begin
        an <= (others => '1');
        an(state) <= '0';
     end process;
     
     process(state)
     begin
        case state is
            when 0 => digitval <= 1;
            when 1 => digitval <= 2;
            when 2 => digitval <= 3;
            when 3 => digitval <= 4;
            when 4 => digitval <= 5;
            when 5 => digitval <= 6;
            when 6 => digitval <= 7;
            when 7 => digitval <= 8;
            when others => digitval <= 0;
        end case;
     end process;
     
     process(digitval)
     begin
        case digitval is         --gfedcba
            when      0 => seg <= "1000000"; --0
            when      1 => seg <= "1111001"; --1
            when      2 => seg <= "0100100"; --2
            when      3 => seg <= "0110000"; --3
            when      4 => seg <= "0011001"; --4
            when      5 => seg <= "0010010"; --5
            when      6 => seg <= "0000010"; --6
            when      7 => seg <= "1111000"; --7
            when      8 => seg <= "0000000"; --8
            when      9 => seg <= "0010000"; --9
            when others => seg <= "1111111"; -- blank
        end case;
     end process;

end Behavioral;
