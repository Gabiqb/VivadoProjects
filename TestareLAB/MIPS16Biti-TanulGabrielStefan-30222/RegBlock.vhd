----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2021 07:22:46 PM
-- Design Name: 
-- Module Name: RegBlock - Behavioral
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
use IEEE.STD_LOGIC_UNsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegBlock is
  Port (
        enablewr:in std_logic;
        regwr:in std_logic;
        clk: in std_logic;
        ra1: in std_logic_vector(2 downto 0); --rs
        ra2: in std_logic_vector(2 downto 0); --rt
        wa: in std_logic_vector(2 downto 0); --rd
        wd: in std_logic_vector(15 downto 0);    
        rd1: out std_logic_vector(15 downto 0);
        rd2: out std_logic_vector(15 downto 0));
end RegBlock;

architecture Behavioral of RegBlock is
signal counter:std_logic_vector(3 downto 0):=x"0";
type REG is array (0 to 7) of std_logic_vector(15 downto 0);
signal regi: REG:=(x"0000",
others=> x"0000");

begin
     process(clk,regwr,wa,wd)
     begin
          if(clk='1' and clk'event) then
             if(regwr='1') then
               if(enablewr='1')then
                regi(conv_integer(wa))<=wd;      
               end if;
             end if;
          end if;
     end process;
     
     rd1<=regi(conv_integer(ra1));
     rd2<=regi(conv_integer(ra2));
     
end Behavioral;
