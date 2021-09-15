----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2021 08:01:50 AM
-- Design Name: 
-- Module Name: MPG - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MPG is
   Port (btn: in std_logic;
         clk: in std_logic;
         enable: out std_logic);
end MPG;

architecture Behavioral of MPG is
signal counter: std_logic_vector(15 downto 0):=x"0000";
signal q1,q2,q3:std_logic;

begin
      process(clk,btn)
      begin
           if( clk='1' and clk'event )then
              counter<=counter +1;
                if(counter="1111111111111111")then
                   q1<=btn;
                   counter<="0000000000000000";
                end if;
           q2<=q1;
           q3<=q2;
           end if;
  
      end process;
      enable<=q2 and (not q3);    
end Behavioral;
