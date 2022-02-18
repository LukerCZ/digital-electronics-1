# Lab 2: Lukas Kudrna

### 2-bit comparator

1. Karnaugh maps for other two functions:

   Greater than:

   ![image](https://user-images.githubusercontent.com/99397107/154455870-1a0b7d63-8771-4f04-aabe-9774e071eee7.png)

   Less than:

   ![image](https://user-images.githubusercontent.com/99397107/154456206-af943f14-550e-4b0f-aaaf-65684986ccf0.png)

2. Equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.
    #### SoP and PoS of "greater than" function (B>A)
    
   ![image](https://user-images.githubusercontent.com/99397107/154459690-c2d73232-dc48-4a7f-8c63-8fb51373cd1f.png)
   ![image](https://user-images.githubusercontent.com/99397107/154529594-8027641a-6f5f-4fd4-907d-72e5863b95c6.png)

   
   #### SoP and PoS of "less than" function (B<A)
       
   ![image](https://user-images.githubusercontent.com/99397107/154465891-98a3c896-09b6-4463-a2d2-83ba95540e35.png)
   ![image](https://user-images.githubusercontent.com/99397107/154469872-a26abbec-6939-4af2-aefb-74a2a6730aee.png)


### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   Last two digits of my student ID: **xxxx79**

```vhdl
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

        -- First test case
        s_b <= "0111"; -- Such as "0111" if ID = xxxx79
        s_a <= "1001";        -- Such as "1001" if ID = xxxx79
        wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and
                (s_B_equals_A  = '0') and
                (s_B_less_A    = '1'))
        -- If false, then report an error
        report "Input combination 0111, 1001 FAILED" severity error;

        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

2. Text console screenshot during your simulation, including reports.

![image](https://user-images.githubusercontent.com/99397107/154682239-34977271-e272-4f5a-b37a-4a25979b7fb3.png)

3. Link to your public EDA Playground example:

[https://www.edaplayground.com/x/jMNg](https://www.edaplayground.com/x/jMNg)

