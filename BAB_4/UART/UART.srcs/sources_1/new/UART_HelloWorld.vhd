library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity UART_HelloWorld is
    Port (
        clk   : in  std_logic;  -- System clock (100 MHz)
        tx    : out std_logic;  -- UART Transmit
        start : in  std_logic   -- Start signal
    );
end UART_HelloWorld;

architecture Behavioral of UART_HelloWorld is

    constant clk_freq  : integer := 100_000_000; -- 100 MHz
    constant baud_rate : integer := 9600;
    constant baud_div  : integer := clk_freq / baud_rate;

    type state_type is (IDLE, SEND);
    signal state        : state_type := IDLE;

    signal tx_data      : std_logic_vector(7 downto 0);
    signal tx_busy      : std_logic := '0';
    signal bit_cnt      : integer range 0 to 9 := 0;
    signal shift_reg    : std_logic_vector(9 downto 0);
    signal baud_counter : integer range 0 to baud_div := 0;

    -- "dandi fpga\r\n"
type string_array is array (0 to 12) of std_logic_vector(7 downto 0);
signal message : string_array := (
    X"48", -- H
    X"45", -- E
    X"4C", -- L
    X"4C", -- L
    X"4F", -- O
    X"20", -- (spasi)
    X"57", -- W
    X"4F", -- O
    X"52", -- R
    X"4C", -- L
    X"44", -- D
    X"0D", -- \r (Carriage return)
    X"0A"  -- \n (Line feed)
);

    signal char_index : integer range 0 to 12 := 0;

begin

    process (clk)
    begin
        if rising_edge(clk) then
            case state is
                when IDLE =>
                    tx <= '1';  -- idle line
                    if start = '1' then
                        char_index <= 0;
                        state <= SEND;
                    end if;

                when SEND =>
                    if tx_busy = '0' then
                        tx_data   <= message(char_index);
                        -- UART frame: start(0) + data(8bit LSB first) + stop(1)
                        shift_reg <= '1' & tx_data & '0';
                        bit_cnt   <= 0;
                        tx_busy   <= '1';
                    end if;

                    if tx_busy = '1' then
                        if baud_counter = baud_div then
                            baud_counter <= 0;
                            tx <= shift_reg(0); -- kirim LSB
                            shift_reg <= '1' & shift_reg(9 downto 1);
                            bit_cnt <= bit_cnt + 1;
                            if bit_cnt = 9 then
                                tx_busy <= '0';
                                if char_index = 12 then
                                    state <= IDLE;  -- selesai
                                else
                                    char_index <= char_index + 1;
                                end if;
                            end if;
                        else
                            baud_counter <= baud_counter + 1;
                        end if;
                    end if;
            end case;
        end if;
    end process;

end Behavioral;