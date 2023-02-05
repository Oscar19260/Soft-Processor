----------------------------------------------------------------------------------
-- Company: 		 ITESM - Campus Qro.
-- Engineer: 		 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    Mux4to1 - Behavioral 
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

Entity Mux4to1 is 
  port (	InA	: in std_logic_vector(7 downto 0);
			InB	: in std_logic_vector(7 downto 0);
			InC	: in std_logic_vector(7 downto 0);
			InD	: in std_logic_vector(7 downto 0);
			Sel 	: in std_logic_vector(1 downto 0);
			M 		: out std_logic_vector(7 downto 0));
end Mux4to1;

Architecture a of Mux4to1 is
Begin
	with Sel select M <=									
			InA when "00",
			InB when "01",
			InC when "10",
			InD when others;
end a;