----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2021 06:14:45 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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
 use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
  Port (
        rd1: in std_logic_vector(15 downto 0);
        rd2: in std_logic_vector(15 downto 0);
        ext_imm:in std_logic_vector(15 downto 0);
        alusrc:in std_logic;
        aluop:in std_logic_vector(2 downto 0);
        sa: in std_logic;
        func: in std_logic_vector(2 downto 0);
        zero: out std_logic;
        alures: out std_logic_vector(15 downto 0)
        );
end entity;
architecture Behavioral of ALU is
signal op1:std_logic_vector(15 downto 0):=rd1;
signal op2:std_logic_vector(15 downto 0);
signal op3:std_logic_vector(15 downto 0);
begin
       process(alusrc,rd2,ext_imm)
       begin
            if(alusrc='0')then
               op2<=rd2;
            else
               op2<=ext_imm;
            end if;
       end process;
       process(aluop,func,op1,op2,ext_imm)
       begin
        case aluop is
        when "000"=>
            case func is
                 when "001" =>  op3<=op1+op2;
                 when "010" =>  op3<=op1-op2;
                 when "011" =>  op3<=op1(14 downto 0) & '0';
                 when "100" =>  op3<= '0'& op1(15 downto 1);
                 when "101" =>  op3<=op1 and op2;
                 when "110" =>  op3<=op1 or op2;
                 when "111" =>  op3<=op1 xor op2;
                 when others=>  op3<=op1 xnor op2;
            end case;
       when "001" =>  op3<=op1+ext_imm;
       when "010" =>  op3<=op2;
       when "011" =>  if(op1=op2) then
                         zero<='1';
                      else
                         zero<='0';
                      end if;
       when "100" => if(op1>op2) then
                         zero<='1';
                      else
                         zero<='0';
                      end if;
       when "101" =>  if(op1<op2) then
                         zero<='1';
                      else
                         zero<='0';
                      end if;
       when "110" =>  op3<=op1 + ext_imm;
       when "111" =>  op3<=op1;
       end case;
       end process;
        alures<=op3;
end Behavioral;
