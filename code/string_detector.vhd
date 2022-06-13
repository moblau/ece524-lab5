library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity string_detector is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           x : in character;
           y : out STD_LOGIC);
end string_detector;

architecture Behavioral of string_detector is

type state is (idle, char1, char2, char3);
signal cur_state, next_state : state;

begin
process(clk, rst)
begin
    if(rising_edge(clk)) then
        if(rst = '1') then
            cur_state <= idle;
        else
            cur_state <= next_state;
        end if;
    end if;
end process;

process(x)
begin
    case cur_state is
        when idle => 
            if (x = 'a') then
                next_state <= char1;
            else
                next_state <= idle;
            end if;
        when char1 =>
            if (x = 'b') then
                next_state <= char2;
            else
                next_state <= idle;
            end if;
        when char2 =>
            if (x = 'c') then
                next_state <= char3;
             else
                next_state <= idle;
             end if;
         when char3 =>
            if (x = 'a') then
                next_state <= char1;
            else
                next_state <= idle;
            end if; 
    end case; 
end process;

process(x)
begin
    case cur_state is
        when idle => 
                y <= '0';
        when char1 =>
                y <= '0';
        when char2 =>
                y <= '0';
         when char3 =>
                y <= '1';
    end case; 
end process;

end Behavioral;
