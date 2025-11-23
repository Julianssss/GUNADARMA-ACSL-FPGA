
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LDR_UART is
  Port (
        clk       : in std_logic;
        reset     : in std_logic;
        ldr_input : in std_logic;
        tx        : out std_logic 
        );
end LDR_UART;

architecture Behavioral of LDR_UART is
    constant clk_freq     : integer := 100_000_000; -- frekuensi 100 Mhz
    constant baud_rate    : integer := 9600; -- UART baud rate
    constant baud_div     : integer := clk_freq / baud_rate;
    constant delay_cycles : integer := clk_freq * 5; -- 5 detik
    
    type state_type is (IDLE, DELAY, SEND);
    signal state : state_type := IDLE;
    
    signal tx_data : std_logic_vector(7 downto 0);
    signal tx_busy : std_logic := '0';
    signal bit_cnt : integer range 0 to 9 := 0;
    signal shift_reg : std_logic_vector(9 downto 0);
    signal baud_counter : integer range 0 to delay_cycles := 0;
    signal delay_counter : integer range 0 to delay_cycles := 0;
    
    type string_array is array (0 to 7) of std_logic_vector(7 downto 0);
    
    signal message_terang : string_array := (
        X"54", X"65", X"72", X"61", X"6E", X"67", X"0D", X"0A" -- Terang\r\n
    );
    
    signal message_gelap : string_array := (
        X"47", X"65", X"6C", X"61", X"70", X"0D", X"0A", X"0A" -- Gelap\r\n
    );
    
        signal char_index : integer range 0 to 7 := 0;
        signal current_message : string_array;

begin
    process(clk, reset)
    begin
        if reset = '1' then
            state <= IDLE;
            tx_busy <= '0';
            char_index <= 0;
            tx <= '1';
            delay_counter <= 0;
        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    tx <= '1'; -- idle state of uart tx line
                    if ldr_input = '1' then
                        current_message <= message_gelap;
                    else
                        current_message <= message_terang;
                    end if;
                    char_index <= 0;
                    state <= SEND;
                when SEND =>
                    if tx_busy = '0' then
                        tx_data <= current_message(char_index);
                        shift_reg <= '1' & tx_data & '0'; -- start bit, data, stop bit
                        bit_cnt <= 0;
                        tx_busy <= '1';
                    end if;
                    
                    if tx_busy = '1' then
                        if baud_counter = baud_div then
                        baud_counter <= 0;
                        tx <= shift_reg(0);
                        shift_reg <= '1' & shift_reg(9 downto 1);
                        bit_cnt <= bit_cnt + 1;
                        if bit_cnt = 9 then
                            tx_busy <= '0';
                            if char_index = 7 then
                                state <= DELAY; --Delay before next reading
                                delay_counter <= 0;
                            else
                                char_index <= char_index + 1;
                            end if;
                        end if;
                     else
                        baud_counter <= baud_counter + 1;
                     end if;
                 end if;
                 
             when DELAY =>
                if delay_counter < delay_cycles then
                    delay_counter <= delay_counter + 1;
                else
                    state <= IDLE; -- Restart cycle after delay
                end if;
           end case;
      end if;
   end process;
end Behavioral;
