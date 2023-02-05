----------------------------------------------------------------------------------
-- Company: 		 ITESM - Campus Qro.
-- Engineer: 		 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;

-- ALU de 4 bits --
Entity ALU is
Port (InA	: in std_logic_vector(7 downto 0);
		InB	: in std_logic_vector(7 downto 0);
		Sel	: in std_logic_vector(2 downto 0);
		Zero 	: out std_logic;
		Oper	: out std_logic_vector(7 downto 0));
End ALU;

architecture a of ALU is
	signal B_Aux 		: std_logic_vector(7 downto 0);
	signal Oper_Aux	: std_logic_vector(7 downto 0);	
Begin	
	Process(InA,InB,Sel)
	Begin
		Case Sel is 
			---------------------------------------------------------
			-- Arithmetic operations
			-- Add
			when "000" =>
				Oper_Aux <= InA + InB;
			-- Subtract	
			when "001" =>
            B_Aux 	<= (not(InB)+1);
				Oper_Aux <= InA + B_Aux;
			---------------------------------------------------------	
			-- Logic operations
			-- AND
			when "010" =>
				Oper_Aux <= InA and InB;
			-- OR
			when "011" =>
				Oper_Aux <= InA or InB;
			-- XOR	
			when "100" =>
				Oper_Aux <= InA xor InB;
			-- NOT	
			when "101" =>
				Oper_Aux <= not InA;
			---------------------------------------------------------
			-- Shift left and right
			-- SHL
			when "110" =>
				Oper_Aux <= InA(6 downto 0) & '0';
			-- SHR
			when "111" =>
				Oper_Aux <= '0' & InA(7 downto 1);
		End case;
		-- Oper = (others <= '0')
		if (Oper_Aux = "00000000") then
			zero <= '1';
		else 
		   zero <= '0';
		End if;
	End Process;
	Oper <= Oper_Aux;
End a;
