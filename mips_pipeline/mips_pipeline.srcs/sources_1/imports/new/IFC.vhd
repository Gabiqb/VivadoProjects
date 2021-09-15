----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2021 08:51:12 AM
-- Design Name: 
-- Module Name: IFC - Behavioral
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

entity IFC is
  Port (clk:in std_logic;
        bradr:in std_logic_vector(15 downto 0);
        jadr: in std_logic_vector(15 downto 0);
        j:in std_logic;
        PCSrc: in std_logic;
        b1:in std_logic;
        b2:in std_logic;
        Pcounter:out std_logic_vector(15 downto 0);
        instr:out std_logic_vector(15 downto 0));
end IFC;

architecture Behavioral of IFC is
signal sig: std_logic_vector(15 downto 0):=x"0000";
signal psig: std_logic_vector(15 downto 0):=x"0000";
signal m1: std_logic_vector(15 downto 0):=x"0000";
signal m2: std_logic_vector(15 downto 0):=x"0000";
signal pc: std_logic_vector(15 downto 0):=x"0000";
type ROM_T is array (0 to 17) of std_logic_vector(15 downto 0);
signal ROM: ROM_T:=(B"001_000_101_0000011",-- 0 lw $5, 0 (mem(0) ----- 2283 
       B"001_000_001_0000001", --1 lw $1,21 (mem(1) --deimpartitul -------2081 
       B"001_000_010_0000010",  --2 lw $2,5 (mem(2) --impartitorul ------2102 
       B"000_000_000_000_0001", --3 no op
       B"000_000_000_000_0001", --4 no op
       B"000_000_000_000_0001", --5 no op
       B"011_010_001_0000111",  --6 beq $2,$1 , jmp(14)---------------- 6884
       B"000_000_000_000_0001", --7 no op
       B"000_000_000_000_0001", --8 no op
       B"000_001_010_001_0_010", --9 sub $1,$1,$2 ( scadere repetata) bucla-eticheta ---0512
       B"110_101_101_0000001", --10 addi $5,%5, 1 (incrementare cat)  ------------------D681
       B"000_000_000_000_0001", --11 no op
       B"000_000_000_000_0001", --12 no op   
       B"100_001_010_1111011", --13 bgt $1,$2,5 ( daca e mai mare inseamna ca trebuie facut branch inapoi la scadere ---------857D
       B"010_001_000_0001010",     --14 sw memorie(10), %1 --restul -------4280
       B"010_101_000_0001001",  --15 sw memorie(9), $5 --catul ------------4089
       B"111_0100000000000",   --16 jmp pentru blocare  
       B"111_0100000000001", --17 jmp pentru blocare
     others=>"0000000000000000");
       
 
begin

       process(j,jadr,m1)
      begin
            if(j='1')then
               m2<=jadr;
            else
               m2<=m1;
            end if;
         
      end process;
      process(PCSrc,bradr,sig,bradr,psig)
      begin
      if(PCSrc='1')Then
           m1<=bradr;
      else
           m1<=psig;
      end if;
      end process;
      process(clk,b1,b2,sig,bradr)
      begin
       if(clk='1' and clk'event)then
           if(b2='1')then
               sig<=x"0000";
           elsif(b1='1')then
                  sig<=m2;
           
           end if;
         
      end if;
      end process;
      Pcounter<=sig+1;
      psig<=sig+1;
      instr<=ROM(conv_integer(sig));  
end Behavioral;
