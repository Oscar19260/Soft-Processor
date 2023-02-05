----------------------------------------------------------------------------------
-- Company:        ITESM - CQ
-- Engineer:       Equipo GR
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    Reg8 - Behavioral 
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

Entity Reg8 is
  port (	Inrs	: in std_logic_vector(7 downto 0);
			Clk	: in std_logic;
			Cen	: in std_logic;
			Rst	: in std_logic;
			En		: in std_logic;
			OutD	: out std_logic_vector(7 downto 0));
end Reg8;
  
Architecture a of Reg8 is
Begin
	RegClk: process(Inrs, Rst, En)
	Begin
		if (Rst = '0') then
			OutD <= "00000000";
		elsif (falling_edge(Clk)) then
			if (Cen = '1') then
				if (En = '1') then
					OutD <= Inrs;
				end if;
			end if;
		end if;
	end process RegClk;	
end a;
	