----------------------------------------------------------------------------------
-- Company: 		 ITESM - Campus Qro.
-- Engineer: 		 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    FullAdder - Behavioral 
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


Entity FullAdder is 
Port (	InA	: in std_logic_vector(7 downto 0);
			InB	: in std_logic_vector(7 downto 0);
			S		: out std_logic_vector(7 downto 0));
End FullAdder;

Architecture a of FullAdder is
Begin
	S	<= InA + InB;									-- Implementamos función suma full adder
End a;