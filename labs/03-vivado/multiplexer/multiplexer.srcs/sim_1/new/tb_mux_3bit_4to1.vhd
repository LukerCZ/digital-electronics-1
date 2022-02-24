----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2022 12:28:41 PM
-- Design Name: 
-- Module Name: tb_mux_3bit_4to1 - Behavioral
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

entity tb_mux_3bit_4to1 is
--  Port ( );
end tb_mux_3bit_4to1;

architecture Behavioral of tb_mux_3bit_4to1 is
    
    signal s_d           : std_logic_vector(3 - 1 downto 0);
    signal s_c           : std_logic_vector(3 - 1 downto 0);
    signal s_b           : std_logic_vector(3 - 1 downto 0);
    signal s_a           : std_logic_vector(3 - 1 downto 0);
    signal s_sel         : std_logic;
    signal s_f           : std_logic;  
begin

    port map(
            a_i           => s_a,
            b_i           => s_b,
            c_i           => s_c,
            d_i           => s_d,
               
            B_greater_A_o => s_B_greater_A,
            B_equals_A_o  => s_B_equals_A,
            B_less_A_o    => s_B_less_A
        );
    

end Behavioral;
