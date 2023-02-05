----------------------------------------------------------------------------------
-- Company:        ITESM - CQ
-- Engineer:       Equipo GR
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    DispOff - Behavioral 
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

Entity DispOff is
  port ( Turnoff	: out std_logic_vector(31 downto 0));
end DispOff;
  
Architecture a of DispOff is
Begin
	Turnoff <= (others => '1');
end a;