library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

entity sevseg3 is
    Port ( clk : in STD_LOGIC;
           count_up : in STD_LOGIC;
           count_down : in STD_LOGIC;
           seg : out std_logic_vector(6 downto 0));
end sevseg3;

architecture Behavioral of sevseg3 is
signal temp_count : std_logic_vector(3 downto 0) :="0000";
signal up_edge : std_logic_vector(1 downto 0);
signal down_edge : std_logic_vector(1 downto 0);

begin

process(clk, temp_count)
begin
if rising_edge(clk) then
    up_edge <= up_edge(0) & count_up;
    down_edge <= down_edge(0) & count_down;
    if (up_edge = "01") then
        if temp_count <9 then
            temp_count <= temp_count + 1;
        else
            temp_count <= "0000";
        end if;
else
    if (down_edge = "10") then
        if temp_count >0 then
           temp_count <= temp_count - 1;
        else
           temp_count <= "1001";
        end if;
    end if;
  end if;
end if;
end process;

process (temp_count)
begin
    case temp_count is
        when "0000" => seg <= "1000000";
        when "0001" => seg <= "1111001";
        when "0010" => seg <= "0100100";
        when "0011" => seg <= "0110000";
        when "0100" => seg <= "0011001";
        when "0101" => seg <= "0010010";
        when "0110" => seg <= "0000010";
        when "0111" => seg <= "1111000";
        when "1000" => seg <= "0000000";
        when "1001" => seg <= "0010000";
        when others => seg <= "1111111";
   end case;
end process;

end Behavioral;
