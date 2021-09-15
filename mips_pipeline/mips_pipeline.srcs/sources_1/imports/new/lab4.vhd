----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/17/2021 05:22:15 PM
-- Design Name: 
-- Module Name: lab4 - Behavioral
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

entity lab4 is
Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC_VECTOR (4 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0);
           sw : in STD_LOGIC_VECTOR (15 downto 0));
end lab4;

architecture Behavioral of lab4 is
 
signal enablepc: std_logic;
signal regwr: std_logic;
signal reset: std_logic;
signal regdst: std_logic;
signal extop: std_logic;
signal alusrc: std_logic;
signal memwr: std_logic;
signal memtoreg:std_logic;
signal zero: std_logic; --zero iesire de la ALU
signal PCsrc: std_logic; --branch 
signal br:std_logic; --br on equal
signal bgt: std_logic; --br on greater
signal blt: std_logic; --br on less
signal jump: std_logic; 
signal aluop:std_logic_vector(2 downto 0);
signal rd1:std_logic_vector(15 downto 0);
signal rd2:std_logic_vector(15 downto 0);
signal extimm:std_logic_vector(15 downto 0);
signal wd:std_logic_vector(15 downto 0);
signal alures:std_logic_vector(15 downto 0);
signal aluresout:std_logic_vector(15 downto 0);
signal memdata:std_logic_vector(15 downto 0);
signal bradr:std_logic_vector(15 downto 0);
signal jadr:std_logic_vector(15 downto 0);
signal func:std_logic_vector(2 downto 0);
signal sa:std_logic;
 --------------------------------------ROM
 
signal Pcounter: std_logic_vector(15 downto 0):=x"0000";
signal instr: std_logic_vector(15 downto 0):=x"0000";
signal digits: std_logic_vector(15 downto 0):=x"0000";
 -------------------------------------ROM
 
 ---------------------pipeline-----------
 signal REG_IF_ID_pc: std_logic_vector(15 downto 0);
 signal REG_IF_ID_instr:std_logic_vector(15 downto 0);
 
 signal REG_ID_EX_rd1:std_logic_vector(15 downto 0);
 signal REG_ID_EX_rd2:std_logic_vector(15 downto 0);
 signal REG_ID_EX_extimm:std_logic_vector(15 downto 0);
 signal REG_ID_EX_pc:std_logic_vector(15 downto 0);
 signal REG_ID_EX_rt:std_logic_vector(2 downto 0);
 signal REG_ID_EX_rd:std_logic_vector(2 downto 0);
 signal REG_ID_EX_branch:std_logic;
 signal REG_ID_EX_blt:std_logic;
 signal REG_ID_EX_bgt:std_logic;
 signal REG_ID_EX_jump:std_logic;
 signal REG_ID_EX_memtoreg:std_logic;
 signal REG_ID_EX_regwr:std_logic;
 signal REG_ID_EX_memwr:std_logic;
 signal REG_ID_EX_aluop:std_logic_vector(2 downto 0);
 signal REG_ID_EX_func: std_logic_vector(2 downto 0);
 signal REG_ID_EX_alusrc:std_logic;
 signal REG_ID_EX_regdst:std_logic;
 
 
                                                      
 signal REG_EX_MEM_extimm: std_logic_vector(15 downto 0);
 signal REG_EX_MEM_pc: std_logic_vector(15 downto 0);
 signal REG_EX_MEM_wra: std_logic_vector(2 downto 0);
 signal REG_EX_MEM_alures: std_logic_vector(15 downto 0);
 signal REG_EX_MEM_zero: std_logic;
 signal REG_EX_MEM_branch:std_logic;
 signal REG_EX_MEM_regwr:std_logic;
 signal REG_EX_MEM_memtoreg:std_logic;
 signal REG_EX_MEM_memwr:std_logic;
 signal REG_EX_MEM_blt:std_logic;
 signal REG_EX_MEM_bgt:std_logic;
 signal REG_EX_MEM_jump:std_logic;
 
 
                                                       
signal REG_MEM_WB_aluresout: std_logic_vector(15 downto 0);
signal REG_MEM_WB_memdata: std_logic_vector(15 downto 0);
signal REG_MEM_WB_wra: std_logic_vector(2 downto 0);
signal REG_MEM_WB_regwr:std_logic;
signal REG_MEM_WB_memtoreg:std_logic;
 
component MPG is
   Port (btn: in std_logic;
         clk: in std_logic;
         enable: out std_logic);
end component;
component SSD is
  Port ( cifre : in std_logic_vector(15 downto 0);
         clk: in std_logic;
         anode: out std_logic_vector(3 downto 0);
         led: out std_logic_vector(6 downto 0)
         );
        
end component;
 
component IFC is
  Port (clk:in std_logic;
        bradr:in std_logic_vector(15 downto 0);
        jadr: in std_logic_vector(15 downto 0);
        j:in std_logic;
        PCSrc: in std_logic;
        b1:in std_logic;
        b2:in std_logic;
        Pcounter:out std_logic_vector(15 downto 0);
        instr:out std_logic_vector(15 downto 0));
end component;

component IDecode is

  Port (
        enablewr:in std_logic;
        regwr: in std_logic;
        extop: in std_logic;
        clk:in std_logic;
        wra:in std_logic_vector(2 downto 0);
        instr: in std_logic_vector(15 downto 0);
        rd1: out std_logic_vector(15 downto 0);
        rd2: out std_logic_vector(15 downto 0);
        wd: in std_logic_vector(15 downto 0);
        extimm: out std_logic_vector(15 downto 0);
        func: out std_logic_vector(2 downto 0);
        sa: out std_logic     
        );
end component;

component RAM is
   Port (
         btn: in std_logic;
         mem_wr:in std_logic;
         alu_res: in std_logic_vector(15 downto 0);
         rd2: in std_logic_vector(15 downto 0);
         memdata: out std_logic_vector(15 downto 0);
         clk: in std_logic;
         alu_resout: out std_logic_vector(15 downto 0));
end component;

component ALU is
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
end component;
begin
      
      AFISROM: SSD port map(digits,clk,an,cat);
      MPG_1: MPG port map(btn(0),clk,enablepc); --enable counter IFetch
      MPG_2: MPG port map(btn(1),clk,reset); --reset counter IFetch
    --  MPG_3: MPG port map(btn(2),clk,regdst); --enable de regdst pentru ID
    --  MPG_4: MPG port map(btn(3),clk,extop); --enable de extop pentru ID
     -- MPG_5: MPG port map(btn(4),clk,regwr); --enable de extop pentru ID
      IFC_1: IFC port map(clk,bradr,jadr,jump,PCsrc,enablepc,reset,Pcounter,instr);
      IDC_1: IDecode port map(enablepc,REG_MEM_WB_regwr,extop,clk,REG_MEM_WB_wra,REG_IF_ID_instr,rd1,rd2,wd,extimm,func,sa);
      ALU_1: ALU port map(REG_ID_EX_rd1,REG_ID_EX_rd2,REG_ID_EX_extimm,REG_ID_EX_alusrc,REG_ID_EX_aluop,'1',REG_ID_EX_func,zero,alures);
      RAM_1: RAM port map(enablepc,REG_EX_MEM_memwr,REG_EX_MEM_alures,REG_ID_EX_rd2,memdata,clk,aluresout);
      
      --if/id
      process(clk,Pcounter,instr)
      begin
            if(clk='1' and clk'event)then
                REG_IF_ID_pc<=pcounter;
                REG_IF_ID_instr<=instr;
            end if;
      
      end process;
     
     --id/ex
       process(clk)
           begin
                 if(clk='1' and clk'event) then
                     REG_ID_EX_regdst<=regdst;
                     REG_ID_EX_regwr<=regwr;
                     REG_ID_EX_memtoreg<=memtoreg;
                     REG_ID_EX_memwr<=memwr;
                     REG_ID_EX_branch<=br;
                     REG_ID_EX_blt<=blt;
                     REG_ID_EX_bgt<=bgt;
                     REG_ID_EX_extimm<=extimm;
                     REG_ID_EX_jump<=jump;
                     REG_ID_EX_pc<=REG_IF_ID_pc;
                     REG_ID_EX_rd1<=rd1;
                     REG_ID_EX_rd2<=rd2;
                     REG_ID_EX_rt<=REG_IF_ID_instr(9 downto 7);
                     REG_ID_EX_rd<=REG_IF_ID_instr(6 downto 4);
                     REG_ID_EX_aluop<=aluop;
                     REG_ID_EX_alusrc<=alusrc;
                     REG_ID_EX_func<=func;
                 end if;
           
           end process;
           
           --ex/mem
        process(clk)
                    begin
                          if(clk='1' and clk'event) then
                              REG_EX_MEM_pc<=REG_ID_EX_pc+REG_ID_EX_extimm;
                              if(REG_ID_EX_regdst='1')then
                                  REG_EX_MEM_wra<=REG_ID_EX_rd;
                              else
                                  REG_EX_MEM_wra<=REG_ID_EX_rt;
                              end if;
                              REG_EX_MEM_memwr<=REG_ID_EX_memwr;
                              REG_EX_MEM_regwr<=REG_ID_EX_regwr;
                              REG_EX_MEM_alures<=alures;
                              REG_EX_MEM_memtoreg<=REG_ID_EX_memtoreg;
                              REG_EX_MEM_branch<=REG_ID_EX_branch;
                              REG_EX_MEM_blt<=REG_ID_EX_blt;
                              REG_EX_MEM_bgt<=REG_ID_EX_bgt;
                              REG_EX_MEM_extimm<=REG_ID_EX_extimm;
                              REG_EX_MEM_jump<=REG_ID_EX_jump;
                              REG_EX_MEM_zero<=zero;
                            
                          end if;
                    
                    end process;
       --mem/wb             
       process(clk)
                 begin
                       if(clk='1' and clk'event)then
                             REG_MEM_WB_aluresout<=aluresout; 
                             REG_MEM_WB_memdata<=memdata;          
                             REG_MEM_WB_wra<=REG_EX_MEM_wra;
                             REG_MEM_WB_regwr<=REG_EX_MEM_regwr;
                             REG_MEM_WB_memtoreg<=REG_EX_MEM_memtoreg;
                    
                       end if;
                                       
       end process;
      process(clk,enablepc)
      begin
      if(clk='1' and clk'event)then
        if(enablepc='1')then
             PCsrc<=(REG_EX_MEM_branch and REG_EX_MEM_zero) or (REG_EX_MEM_bgt and REG_EX_MEM_zero) or (REG_EX_MEM_blt and REG_EX_MEM_zero);   
             bradr<= REG_IF_ID_pc + REG_EX_MEM_extimm;
             jadr<= REG_IF_ID_pc(15 downto 13 ) & REG_IF_ID_instr(12 downto 0);
        end if;
      end if;
      end process;
      
       process(REG_MEM_WB_memtoreg)
       begin
       if(REG_MEM_WB_memtoreg='1')then
          wd<=REG_MEM_WB_memdata; --wd pentru reg
       else
          wd<=REG_MEM_WB_aluresout;
       end if;
       end process;
       
       process(REG_IF_ID_instr(15 downto 13),func)
       begin
       case REG_IF_ID_instr(15 downto 13) is
       when "000" =>
                case func is
                        when "001" => 
                                      regdst<='1';  
                                      regwr<='1';   
                                      alusrc<='0';  
                                      extop<='0';  
                                      func<="001";  
                                      aluop<="000";               
                                      memwr<='0';  
                                      memtoreg<='0';  
                                      br<='0';  
                                      bgt<='0';  
                                      blt<='0';  
                                      jump<='0';  
                                     
                        when "010"=>  
                                     regdst<='1';  
                                      regwr<='1'; 
                                     alusrc<='0';
                                     extop<='0'; 
                                     func<="010"; 
                                     aluop<="000";    
                                      memwr<='0'; 
                                      memtoreg<='0'; 
                                      br<='0'; 
                                      bgt<='0';  
                                      blt<='0'; 
                                      jump<='0'; 
                                    
                        when "011" => 
                                     regdst<='0'; 
                                      regwr<='1'; 
                                      alusrc<='1'; 
                                     extop<='1'; 
                                     func<="011"; 
                                      aluop<="000";              
                                       memwr<='0'; 
                                      memtoreg<='0';  
                                      br<='0'; 
                                      bgt<='0'; 
                                      blt<='0';
                                     jump<='0'; 
                                     
                        when "100" => 
                                     regdst<='0'; 
                                      regwr<='1'; 
                                     alusrc<='1'; 
                                     extop<='1';
                                     func<="100"; 
                                     aluop<="000";   
                                     memwr<='0'; 
                                     memtoreg<='0'; 
                                     br<='0'; 
                                     bgt<='0'; 
                                     blt<='0';  
                                     jump<='0'; 
                                      
                        when "101" =>
                                     regdst<='1';  
                                     regwr<='1'; 
                                     alusrc<='0'; 
                                     extop<='1'; 
                                     func<="101"; 
                                      aluop<="000";   
                                      memwr<='0'; 
                                      memtoreg<='0'; 
                                      br<='0';
                                      bgt<='0'; 
                                      blt<='0'; 
                                      jump<='0';   
                        when "110" =>
                                      regdst<='1'; 
                                      regwr<='1'; 
                                      alusrc<='0'; 
                                      extop<='0'; 
                                      func<="110"; 
                                     aluop<="000";              
                                      memwr<='0'; 
                                      memtoreg<='0'; 
                                      br<='0'; 
                                      bgt<='0';
                                      blt<='0'; 
                                      jump<='0'; 
                                     
                        when "111" => 
                                      regdst<='1'; 
                                      regwr<='1'; 
                                      alusrc<='0'; 
                                      extop<='0'; 
                                      func<="111";  
                                     aluop<="000";                  
                                      memwr<='0'; 
                                      memtoreg<='0'; 
                                      br<='0'; 
                                      bgt<='0'; 
                                      blt<='0'; 
                                      jump<='0'; 
                                       
                        when others => 
                                     regdst<='1';
                                     regwr<='1'; 
                                     alusrc<='0'; 
                                     extop<='0'; 
                                     func<="000"; 
                                     aluop<="000";   
                                     memwr<='0';  
                                     memtoreg<='0'; 
                                     br<='0'; 
                                     bgt<='0'; 
                                     blt<='0'; 
                                     jump<='0'; 
      
                        end case;
             when "001" =>         
                                   regdst<='0';   
                                    regwr<='1';   
                                    alusrc<='1';  
                                   extop<='1';   
                                    aluop <="001";  
                                     memwr<='0';    
                                    memtoreg<='1';  
                                     br<='0';   
                                     bgt<='0';  
                                    blt<='0'; 
                                     jump<='0'; 
                                  led(0)<='1';   
              when "010" =>
                                  regdst<='0';    
                                   regwr<='0';   
                                  alusrc<='1';   
                                    extop<='1';    
                                   aluop <="010";   
                                  memwr<='1';     
                                  memtoreg<='0';     
                                  br<='0';     
                                 bgt<='0';     
                                   blt<='0';    
                                   jump<='0';   
                                 led(0)<='1';    
              when "011" =>         
                               regdst<='0';      
                                 regwr<='0';      
                                 alusrc<='0';      
                                 extop<='1';    
                                aluop <="011";     
                               memwr<='0';      
                                memtoreg<='0';      
                                  br<='1';     
                                   bgt<='0';     
                                 blt<='0';    
                                  jump<='0';      
                                 led(0)<='1';  
              when "100" =>
                                 regdst<='0';     
                                 regwr<='0';     
                                  alusrc<='0';     
                                  extop<='1';     
                                  aluop <="100";    
                                 memwr<='0';     
                                 memtoreg<='0';    
                                   br<='0';    
                                   bgt<='1';    
                                  blt<='0';    
                                  jump<='0';    
                                 led(0)<='1';    
                when "101" => 
                                regdst<='0';     
                                regwr<='0';      
                                alusrc<='0';      
                               extop<='1';        
                                aluop <="101";      
                                memwr<='0';       
                                memtoreg<='0';      
                                br<='0';       
                                 bgt<='0';      
                                blt<='1';       
                                jump<='0';       
                                 led(0)<='1';       
                 when "110" => 
                              regdst<='0';       
                               regwr<='1';       
                              alusrc<='1';        
                              extop<='1';      
                               aluop <="110";       
                               memwr<='0';         
                                memtoreg<='0';     
                                br<='0';       
                               bgt<='0';       
                               blt<='0';         
                                jump<='0';     
                                 led(0)<='1';     
                 when "111" => 
                             regdst<='0';         
                              regwr<='0';         
                              alusrc<='0';        
                              extop<='0';         
                              aluop <="111";        
                               memwr<='0';        
                               memtoreg<='0';      
                                br<='0';      
                                bgt<='0';        
                                blt<='0';       
                               jump<='1';     
                                led(0)<='1';
                when others=> null;                
                end case;
            end process;
      
      process(sw(7 downto 5),instr,Pcounter,rd1,rd2,extimm,alures,memdata,wd)
      begin
         case sw(7 downto 5) is
         when "000" => digits<=instr;
         when "001" => digits<=Pcounter;
         when "010" => digits<=rd1;
         when "011" => digits<=rd2;
         when "100" => digits<=extimm;
         when "101" => digits<=alures;
         when "110" => digits<= memdata;
         when "111" => digits<=wd;
         when others => digits<=x"ffff";
         end case;
      end process;
      
      
      
      
   led(15)<=regdst;
   led(14)<=regwr;
   led(13)<=alusrc;
   led(12)<=extop;
   led(11)<=aluop(2);
   led(10)<=aluop(1);
   led(9)<=aluop(0);
   led(8)<=memwr;
   led(7)<=memtoreg;
   led(6)<=br;
   led(5)<=bgt;
   led(4)<=blt;
   led(3)<=jump;
     
end Behavioral;