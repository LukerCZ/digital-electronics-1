# Lab 5: Lukáš Kudrna

### Flip-flops

1. Listing of VHDL architecture for T-type flip-flop. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
architecture Behavioral of t_ff_rst is
    signal s_q : std_logic;
begin
    p_t_ff_rst : process(clk)
    begin
        if rising_edge(clk) then  -- Synchronous process
            -- USE HIGH-ACTIVE RESET HERE
            if (rst = '1') then
                -- reset
                  s_q <= '0';
            elsif (t = '0') then 
                s_q <= s_q;
            else 
                s_q <= not s_q;
            end if;
        end if;
    end process p_t_ff_rst;
    
    q     <= s_q;
    q_bar <= not s_q;
end architecture Behavioral;
```

2. Screenshot with simulated time waveforms. Try to simulate both flip-flops in a single testbench with a maximum duration of 200 ns, including reset. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![image](https://user-images.githubusercontent.com/99397107/158603451-842a9a0f-0fea-41b9-befa-7a16b27476b4.png)


### Shift register

1. Image of the shift register `top` level schematic. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components and internal signals!

   ![image](https://user-images.githubusercontent.com/99397107/158635585-4cae20d1-56fc-447c-8743-3151e5ff4469.png)

