----------------------------------------------------------------------------------
-- Company: 		 ITESM - Campus Qro.
-- Engineer: 		 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    BrEq - Behavioral 
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

-- Commonly used libraries
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity BrEq is
    port (	InA	: in std_logic;
				InB	: in std_logic;
				Sel 	: in std_logic;
				M 		: out std_logic);
end BrEq;

architecture Behavioral of BrEq is
begin
	with Sel select M <=									
			InA when '0',
			InB when '1',
			InB when others;
end Behavioral;
