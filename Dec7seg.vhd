----------------------------------------------------------------------------------
-- Company: 		 ITESM - Campus Qro.
-- Engineer: 		 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    Dec7Seg - Behavioral 
-- Project Name: 	 Final Challenge
-- Target Devices: Max LITE-10 FPGA Board
-- Tool versions:  Quartus Prime Lite 18.1
-- Description: 	 Design a CPU
--
-- Dependencies: 	 None
--
-- Revision: 		 V1.0
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------

Library ieee;
Use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

Entity Dec7Seg is 
  port (	InR	: in std_logic_vector(3 downto 0);
			Seg	: out std_logic_vector(7 downto 0));
end Dec7Seg;

Architecture a of Dec7Seg is
Begin
	--InR<= InR;
	--InR <= ((InR(3))&(InR(2))&(InR(1))&(InR(0)));
	
	process(InR)
	begin
		If (InR="0000") then
			Seg <= not("11111100"); --0
		Elsif (InR= "0001") then
			Seg <= not("01100000"); --1
		Elsif (InR="0010")then
			Seg <= not("11011010"); --2 
		Elsif (InR<="0011") then
			Seg <= not("11110010"); --3 
		Elsif (InR<="0100") then
			Seg <= not("01100110"); --4
		Elsif (InR<="0101") then
			Seg <= not("10110110"); --5 
		Elsif (InR<="0110") then
			Seg <= not("10111110"); --6 
		Elsif (InR<="0111") then
			Seg <= not("11100000"); --7 
		Elsif (InR<="1000") then
			Seg <= not("11111110"); --8
		Elsif (InR<="1001") then
			Seg <= not("11110110"); --9 
		Elsif (InR<="1010") then
			Seg <= not("11101110"); --A 
		Elsif (InR<="1011") then
			Seg <= not("10011110"); --b 
		Elsif (InR<="1100") then
			Seg <= not("10011100"); --C
		Elsif (InR<="1101") then
			Seg <= not("01111010"); --d	
		Elsif (InR<="1110") then
			Seg <= not("10011110"); --E
		Elsif (InR<="1111") then
			Seg <= not("10001110"); --F 
		Else
			Seg <= not("00000000"); --null 
		End if;
	end process;
end a;

 