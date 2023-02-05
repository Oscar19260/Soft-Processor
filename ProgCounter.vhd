----------------------------------------------------------------------------------
-- Company:        ITESM - CQ
-- Engineer:       Equipo GR
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    Program Counter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    CPU
--
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
Library ieee;
Use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

Entity ProgCounter is
  port (	PCin	: in std_logic_vector(7 downto 0);
			Clk	: in std_logic;
			Cen	: in std_logic;
			Rst	: in std_logic;
			PCout	: out std_logic_vector(7 downto 0));
  end ProgCounter;
  
Architecture a of ProgCounter is
Begin
	ProgClk: process(PCin, Rst)
	Begin
		if (Rst = '0') then
			PCout <= "00000000";
		elsif (rising_edge(Clk)) then
			if (Cen = '1') then
				PCout <= PCin;
			end if;
		end if;
	end process ProgClk;
end a;
	