----------------------------------------------------------------------------------
-- Company: 		 ITESM - Campus Qro.
-- Engineer: 		 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    ClkDiv - Behavioral 
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

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity ClkDiv is
  port ( Clkin   	: in  STD_LOGIC;
			Rst   	: in  STD_LOGIC;
			Clkout	: out STD_LOGIC);
end ClkDiv;

architecture rtl of ClkDiv is
  -- Signal and constants used by the Frequency Divider
  -- Embedded signals declaration
  -- Used by Frequency Divider (ClkDiv)
  -- Define a value that contains the desired Frequency
  constant DesiredFreq : natural := 10;  -- Once per second changes in the FSM
  -- Frequency for a DE2-Lite board is 50MHz
  constant BoardFreq   : natural := 50_000_000;
  -- Calculate the value the counter should reach to obtain desired Freq.
  constant MaxOscCount : natural := BoardFreq / DesiredFreq;
  -- Pulse counter for the oscillator
  signal OscCount      : natural range 0 to MaxOscCount;  

  begin
    Freq_Div: process(Rst,Clkin)
	 begin
	   if (Rst = '0') then
        OscCount <= 0;
		elsif (rising_edge(Clkin)) then
        if (OscCount = 	MaxOscCount) then
		     Clkout    <= '1';
			  OscCount <= 0;
		  else
		     Clkout    <= '0';
			  OscCount <= OscCount + 1;
		  end if;
		end if;
	 end process Freq_Div;
end rtl;



