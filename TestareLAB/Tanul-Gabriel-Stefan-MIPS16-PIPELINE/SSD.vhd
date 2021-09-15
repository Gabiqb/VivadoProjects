----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2021 08:08:48 PM
-- Design Name: 
-- Module Name: SSD - Behavioral
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

entity SSD is
  Port ( cifre : in std_logic_vector(15 downto 0);
         clk: in std_logic;
         anode: out std_logic_vector(3 downto 0);
         led: out std_logic_vector(6 downto 0)
         );
        
end SSD;

architecture Behavioral of SSD is

signal counter:std_logic_vector(15 downto 0):=x"0000";
signal hex:std_logic_vector(3 downto 0):=x"0";
 
begin
       process(hex)
       begin
        case hex is 
          when "0001" => led<= "1111001";
          when "0010" => led<= "0100100";  
          when "0011" => led<= "0110000"; --3
          when "0100" => led<= "0011001";  --4
          when "0101" => led<= "0010010"; --5
          when "0110" => led<= "0000010";  --6
          when "0111" => led<= "1111000"; --7
          when "1000" => led<= "0000000"; --8
          when "1001" => led<= "0010000";--9
          when "1010" => led<= "0001000";--A
          when "1011" => led<= "0000011"; --b
          when "1100" => led<= "1000110";--C
          when "1101" => led<= "0100001"; --d
          when "1110" => led<=  "0000110";--E
          when "1111" => led<=  "0001110";--F
          when others => led<= "1000000";--0
         end case;
       end process;
       
       process(clk)
       begin
            if(clk='1' and clk'event) then
               counter<=counter +1;
            end if;    
       
       end process;
       
       process(counter(15 downto 14),cifre)
       begin
            case counter(15 downto 14) is
                when "00" => hex<=cifre(3 downto 0);
                when "01" => hex<=cifre(7 downto 4);
                when "10" => hex<=cifre(11 downto 8);
                when others => hex<=cifre(15 downto 12);

        end case;
   end process;
       
       process(counter(15 downto 14))
       begin
            case counter(15 downto 14) is
                when "00" => anode<="1110";
                when "01" => anode<="1101";
                when "10" => anode<="1011";
                when others => anode<="0111";
            
            
            end case;
       end process;

end Behavioral;
