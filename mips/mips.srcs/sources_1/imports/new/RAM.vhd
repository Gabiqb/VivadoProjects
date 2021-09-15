----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2021 07:52:14 PM
-- Design Name: 
-- Module Name: RAM - Behavioral
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

entity RAM is
   Port (
         btn: in std_logic;
         mem_wr:in std_logic;
         alu_res: in std_logic_vector(15 downto 0);
         rd2: in std_logic_vector(15 downto 0);
         memdata: out std_logic_vector(15 downto 0);
         clk: in std_logic;
         alu_resout: out std_logic_vector(15 downto 0));
end entity;

architecture Behavioral of RAM is
signal counter:std_logic_vector(3 downto 0):=x"0";
type RAM_T is array (0 to 31) of std_logic_vector(15 downto 0);
signal RAM: RAM_T:=("0000000000000000",
                    "0000000000010101",
                    "0000000000000101",
                    "0000000000000001",
             others=> "1111111111111111");
 
begin
	memdata<=RAM(conv_integer(alu_res));
	process(btn,clk,mem_wr)
	begin
		if(clk='1' and clk'event)then
			if(btn='1')then
				if(mem_wr='1')then
					RAM(conv_integer(alu_res))<=rd2;
				end if;
			end if;
			alu_resout<=alu_res;
		end if;
	end process;
     
        

end Behavioral;