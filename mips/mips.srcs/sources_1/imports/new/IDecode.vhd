----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2021 09:03:49 PM
-- Design Name: 
-- Module Name: IDecode - Behavioral
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

entity IDecode is
  Port (
        enablewr: in std_logic;
        regwr: in std_logic;
        regdst:in std_logic;
        extop: in std_logic;
        clk:in std_logic;
        instr: in std_logic_vector(15 downto 0);
        rd1: out std_logic_vector(15 downto 0);
        rd2: out std_logic_vector(15 downto 0);
        wd: in std_logic_vector(15 downto 0);
        extimm: out std_logic_vector(15 downto 0);
        func: out std_logic_vector(2 downto 0);
        sa: out std_logic     
        );
end IDecode;

architecture Behavioral of IDecode is
component RegBlock is
  Port (
        enablewr:in std_logic;
        regwr:in std_logic;
        clk: in std_logic;
        ra1: in std_logic_vector(2 downto 0);
        ra2: in std_logic_vector(2 downto 0);
        wa: in std_logic_vector(2 downto 0);
        wd: in std_logic_vector(15 downto 0);    
        rd1: out std_logic_vector(15 downto 0);
        rd2: out std_logic_vector(15 downto 0));
end component;

signal wra: std_logic_vector(2 downto 0):="000";
begin
     RB: RegBlock port map(enablewr,regwr,clk,instr(12 downto 10),instr(9 downto 7),wra,wd,rd1,rd2);
     sa<=instr(3);  
     func<=instr(2 downto 0);
     process(extop,instr(6 downto 0))
     begin
           if(extop='1')then
              extimm<= instr(6) & instr(6)& instr(6) & instr(6)& instr(6) & instr(6)& instr(6) & instr(6)& instr(6) & instr(6 downto 0);
           else
              extimm<="000000000" & instr(6 downto 0);
           end if;
     end process;
     
     process(regdst,instr)
     begin
          if(regdst='1')then
             wra<=instr(6 downto 4); --rd
          else
             wra<=instr(9 downto 7); --rt
          end if;
     end process;
end Behavioral;
