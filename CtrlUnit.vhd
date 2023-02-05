----------------------------------------------------------------------------------
-- Company: 		 ITESM - Campus Qro.
-- Engineer: 		 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    CtrlUnit - Behavioral 
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

Entity CtrlUnit is
  port (	Oper				: in std_logic_vector(3 downto 0);
			RegSrc_Op		: out std_logic_vector(1 downto 0);
			ALU_Op			: out std_logic_vector(2 downto 0);
			RegWrite_Op		: out std_logic;
			Write7Seg_Op	: out std_logic;
			WriteLEDs_Op	: out std_logic;
			PCInc_Op			: out std_logic;
			Beq_Op			: out std_logic;
			JiJr_Op			: out std_logic_vector(1 downto 0));
end CtrlUnit;

Architecture a of CtrlUnit is
Begin
	ctrlU: process (Oper)
	Begin
		-- Operation Add
		if (Oper = "0000") then		-- 0
			RegSrc_Op		<= "10";
			ALU_Op			<= "000";
			RegWrite_Op		<= '1';
			Write7Seg_Op	<= '0';
			WriteLEDs_Op	<= '0';
			PCInc_Op			<= '0';
			Beq_Op			<= '0';
			JiJr_Op			<= "00";
		-- Operation Subtract (Sub)
		elsif (Oper = "0001") then -- 1
			RegSrc_Op		<= "10";
			ALU_Op			<= "001";
			RegWrite_Op		<= '1';
			Write7Seg_Op	<= '0';
			WriteLEDs_Op	<= '0';
			PCInc_Op			<= '0';
			Beq_Op			<= '0';
			JiJr_Op			<= "00";
		-- Operation AND 
		elsif (Oper = "0010") then -- 2
			RegSrc_Op		<= "10";
			ALU_Op			<= "010";
			RegWrite_Op		<= '1';
			Write7Seg_Op	<= '0';
			WriteLEDs_Op	<= '0';
			PCInc_Op			<= '0';
			Beq_Op			<= '0';
			JiJr_Op			<= "00";
		-- Operation OR
		elsif (Oper = "0011") then -- 3
			RegSrc_Op		<= "10";
			ALU_Op			<= "011";
			RegWrite_Op		<= '1';
			Write7Seg_Op	<= '0';
			WriteLEDs_Op	<= '0';
			PCInc_Op			<= '0';
			Beq_Op			<= '0';
			JiJr_Op			<= "00";
		-- Operation XOR 
		elsif (Oper = "0100") then -- 4
			RegSrc_Op		<= "10";
			ALU_Op			<= "100";
			RegWrite_Op		<= '1';
			Write7Seg_Op	<= '0';
			WriteLEDs_Op	<= '0';
			PCInc_Op			<= '0';
			Beq_Op			<= '0';
			JiJr_Op			<= "00";
		-- Operation NOT 
		elsif (Oper = "0101") then -- 5
			RegSrc_Op		<= "10";
			ALU_Op			<= "101";
			RegWrite_Op		<= '1';
			Write7Seg_Op	<= '0';
			WriteLEDs_Op	<= '0';
			PCInc_Op			<= '0';
			Beq_Op			<= '0';
			JiJr_Op			<= "00";
		-- Operation Shift Left (SHL)
		elsif (Oper = "0110") then -- 6
			RegSrc_Op		<= "10";
			ALU_Op			<= "110";
			RegWrite_Op		<= '1';
			Write7Seg_Op	<= '0';
			WriteLEDs_Op	<= '0';
			PCInc_Op			<= '0';
			Beq_Op			<= '0';
			JiJr_Op			<= "00";
		-- Operation Shift Right (SHR)
		elsif (Oper = "0111") then -- 7
			RegSrc_Op		<= "10";
			ALU_Op			<= "111";
			RegWrite_Op		<= '1';
			Write7Seg_Op	<= '0';
			WriteLEDs_Op	<= '0';
			PCInc_Op			<= '0';
			Beq_Op			<= '0';
			JiJr_Op			<= "00";
		-- Operation Load (lD)
		elsif (Oper = "1000") then -- 8
			RegSrc_Op		<= "00";
			ALU_Op			<= "001";
			RegWrite_Op		<= '1';
			Write7Seg_Op	<= '0';
			WriteLEDs_Op	<= '0';
			PCInc_Op			<= '0';
			Beq_Op			<= '0';
			JiJr_Op			<= "00";
		-- Operation Store (SPC)
		elsif (Oper = "1001") then -- 9
			RegSrc_Op		<= "01";
			ALU_Op			<= "001";
			RegWrite_Op		<= '1';
			Write7Seg_Op	<= '0';
			WriteLEDs_Op	<= '0';
			PCInc_Op			<= '0';
			Beq_Op			<= '0';
			JiJr_Op			<= "00";
		-- Operation isequal (BEQ)
		elsif (Oper = "1010") then -- 10
			RegSrc_Op		<= "10";
			ALU_Op			<= "100"; --Puede ser ese o 001
			RegWrite_Op		<= '0';
			Write7Seg_Op	<= '0';
			WriteLEDs_Op	<= '0';
			PCInc_Op			<= '0';
			Beq_Op			<= '1';
			JiJr_Op			<= "00";
		-- Operation Jump i (JI)
		elsif (Oper = "1011") then -- 11
			RegSrc_Op		<= "10";
			ALU_Op			<= "001";
			RegWrite_Op		<= '0';
			Write7Seg_Op	<= '0';
			WriteLEDs_Op	<= '0';
			PCInc_Op			<= '0';
			Beq_Op			<= '0';
			JiJr_Op			<= "10";
		-- Operation Jump r (JR)
		elsif (Oper = "1100") then -- 12
			RegSrc_Op		<= "10";
			ALU_Op			<= "001";
			RegWrite_Op		<= '0';
			Write7Seg_Op	<= '0';
			WriteLEDs_Op	<= '0';
			PCInc_Op			<= '0';
			Beq_Op			<= '0';
			JiJr_Op			<= "01";
		-- Operation Write 7 Segments (W7SEG)
		elsif (Oper = "1101") then -- 13
			RegSrc_Op		<= "10";
			ALU_Op			<= "001";
			RegWrite_Op		<= '0';
			Write7Seg_Op	<= '1';
			WriteLEDs_Op	<= '0';
			PCInc_Op			<= '0';
			Beq_Op			<= '0';
			JiJr_Op			<= "00";
		-- Operation Write Leds (WLEDS)
		elsif (Oper = "1110") then -- 14
			RegSrc_Op		<= "10";
			ALU_Op			<= "001";
			RegWrite_Op		<= '0';
			Write7Seg_Op	<= '0';
			WriteLEDs_Op	<= '1';
			PCInc_Op			<= '0';
			Beq_Op			<= '0';
			JiJr_Op			<= "00";
		-- Operation Read Switches (RSW)
		elsif (Oper = "1111") then -- 15
			RegSrc_Op		<= "11";
			ALU_Op			<= "001";
			RegWrite_Op		<= '1';
			Write7Seg_Op	<= '0';
			WriteLEDs_Op	<= '0';
			PCInc_Op			<= '0';
			Beq_Op			<= '0';
			JiJr_Op			<= "00";
		else 
			RegSrc_Op		<= "00";
			ALU_Op			<= "000";
			RegWrite_Op		<= '0';
			Write7Seg_Op	<= '0';
			WriteLEDs_Op	<= '0';
			PCInc_Op			<= '0';
			Beq_Op			<= '0';
			JiJr_Op			<= "00";
		end if;
	end process ctrlU;
end a;


--	RegSrc_Op		<= "10";
--	ALU_Op			<= "000";
--	RegWrite_Op		<= '1';
--	Write7Seg_Op	<= '0';
--	WriteLEDs_Op	<= '0';
--	PCInc_Op			<= '0';
--	Beq_Op			<= '0';
--	JiJr_Op			<= "00";

--		elsif (Oper = "0001") then --1
--			ALU_Op		<= "001";
--		elsif (Oper = "0010") then --2
--			ALU_Op		<= "010";
--		elsif (Oper = "0011") then --3
--			ALU_Op		<= "011";
--		elsif (Oper = "0100") then --4
--			ALU_Op		<= "100";
--		elsif (Oper = "0101") then --5
--			ALU_Op		<= "101";
--		elsif (Oper = "0110") then --6
--			ALU_Op		<= "110";
--		elsif (Oper = "0111") then --7
--			ALU_Op		<= "111";
--		elsif (Oper = "1000") then --8
--			RegSrc_Op	<= "00";
--		elsif (Oper = "1001") then --9
--			RegSrc_Op	<= "01";
--		elsif (Oper = "1010") then --10
--			ALU_Op		<= "100";
--			RegWrite_Op	<= '0';
--			Beq_Op		<= '1';
--		elsif (Oper = "1011") then --11
--			RegWrite_Op	<= '0';
--			JiJr_Op		<= "10";
--		elsif (Oper = "1100") then --12
--			RegWrite_Op	<= '0';
--			JiJr_Op		<= "01";
--		elsif (Oper = "1101") then --13
--			RegWrite_Op	<= '0';
--			Write7Seg_Op<= '1';
--		elsif (Oper = "1110") then --14
--			RegWrite_Op	<= '0';
--			WriteLEDs_Op<= '1';
--		elsif (Oper = "1111") then --15
--			RegSrc_Op	<= "11";
--		else 
--			RegSrc_Op		<= "00";
--			ALU_Op			<= "000";
--			RegWrite_Op		<= '0';
--			Write7Seg_Op	<= '0';
--			WriteLEDs_Op	<= '0';
--			PCInc_Op			<= '0';
--			Beq_Op			<= '0';
--			JiJr_Op			<= "00";
--		end if;
