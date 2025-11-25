library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity blinky is
    Port (
        clk : in  STD_LOGIC;
        leds : out STD_LOGIC_VECTOR(15 downto 0)
    );
end blinky;

architecture Behavioral of blinky is
    signal counter : unsigned(25 downto 0) := (others => '0');
begin

    process(clk)
    begin
        if rising_edge(clk) then
            counter <= counter + 1;
        end if;
    end process;

    -- All LEDs blink together using MSB of counter (~1 Hz)
    leds <= (others => std_logic(counter(25)));

end Behavioral;
