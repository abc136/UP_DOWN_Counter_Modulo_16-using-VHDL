----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:54:00 04/25/2012 
-- Design Name: 
-- Module Name:    
-- Project Name:    
-- Target Devices: 
-- Tool versions: 
-- Description: COMPTEUR/DECOMPTEUR SUR 4 BITS AVEC (CLOCK ENABLE) (RESET) (LOAD)(DATA-IN)(DATA-OUT)(DIRECTION)(CLOCK)()
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tp2 is
    Port ( H : in  STD_LOGIC;
           CE : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           DIR : in  STD_LOGIC;
           LOAD : in  STD_LOGIC;
           DIN : in  STD_LOGIC_VECTOR (3 downto 0);
           DOUT : inout  STD_LOGIC_VECTOR (3 downto 0));
end tp2;

architecture Behavioral of tp2 is

begin
-- Usage of Asynchronous resets may negatively impact FPGA resources 
-- and timing. In general faster and smaller FPGA designs will 
-- result from not using Asynchronous Resets. Please refer to 
-- the Synthesis and Simulation Design Guide for more information.
process (H, RESET) 
begin
   if RESET='0' then 
      DOUT <= (others => '0');
   elsif H='1' and H'event then
      if CE='1' then
         if LOAD='1' then
            DOUT <= DIN;
         else 
            if DIR='1' then   
               DOUT <= DOUT + 1;
            else
               DOUT <= DOUT - 1;
            end if;
         end if;
      end if;
   end if;
end process;

end Behavioral;

