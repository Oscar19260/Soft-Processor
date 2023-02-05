----------------------------------------------------------------------------------
-- Company: 		 ITESM - Campus Qro.
-- Engineer: 		 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    Top - Behavioral 
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

entity Top is
    Port ( Clk50MHz  : in  STD_LOGIC;
           Clr   		: in  STD_LOGIC;
			  Switches	: in  STD_LOGIC_VECTOR(7 downto 0);
			  SegH		: out STD_LOGIC_VECTOR(7 downto 0);
			  SegL		: out STD_LOGIC_VECTOR(7 downto 0);
			  LEDs		: out STD_LOGIC_VECTOR(7 downto 0);
			  Turnoff   : out STD_LOGIC_VECTOR(31 downto 0);
			  LEDsoff	: out STD_LOGIC_VECTOR(1 downto 0));
end Top;

architecture Behavioral of Top is
  -- Component declarations
  
  -- Component for Program Counter
  component ProgCounter
  port (	PCin	: in std_logic_vector(7 downto 0);
			Clk	: in std_logic;
			Cen	: in std_logic;
			Rst	: in std_logic;
			PCout	: out std_logic_vector(7 downto 0));
  end component;

  -- Component for Memory
  component Mem
  port (	Addr		: in std_logic_vector(7 downto 0);
			Datars	: out std_logic_vector(2 downto 0);
			Datart	: out std_logic_vector(2 downto 0);
			Datard	: out std_logic_vector(2 downto 0);
			Datai		: out std_logic_vector(7 downto 0);
			DataOp	: out std_logic_vector(3 downto 0));
  end component;
  
  -- Component for Control Unit
  component CtrlUnit
  port (	Oper				: in std_logic_vector(3 downto 0);
			RegSrc_Op		: out std_logic_vector(1 downto 0);
			ALU_Op			: out std_logic_vector(2 downto 0);
			RegWrite_Op		: out std_logic;
			Write7Seg_Op	: out std_logic;
			WriteLEDs_Op	: out std_logic;
			PCInc_Op			: out std_logic;
			Beq_Op			: out std_logic;
			JiJr_Op			: out std_logic_vector(1 downto 0));
  end component;

   -- Component for Registers
  component Registers
  port ( SelA	: in std_logic_vector(2 downto 0);
			SelB	: in std_logic_vector(2 downto 0);
			SelWR	: in std_logic_vector(2 downto 0);
			Data	: in std_logic_vector(7 downto 0);
			Clk	: in std_logic;
			Cen	: in std_logic;
			Rst	: in std_logic;
			WE		: in std_logic;
			OutA	: out std_logic_vector(7 downto 0);
			OutB	: out std_logic_vector(7 downto 0));
  end component;
  
  -- Component for ALU
  component ALU
  port ( InA	: in std_logic_vector(7 downto 0);
			InB	: in std_logic_vector(7 downto 0);
			Sel	: in std_logic_vector(2 downto 0);
			Zero 	: out std_logic;
			Oper	: out std_logic_vector(7 downto 0));
  end component;
  
  -- Component for Full Adder
  component FullAdder
  port (	InA	: in std_logic_vector(7 downto 0);
			InB	: in std_logic_vector(7 downto 0);
			S		: out std_logic_vector(7 downto 0));
  end component;
  
  -- Component for Increm
  component Increm
  port (	InA	: in std_logic_vector(7 downto 0);
			InB	: in std_logic_vector(7 downto 0);
			Sel	: in std_logic;
			M		: out std_logic_vector(7 downto 0));
  end component;
  
  -- Component for BrEq
  component BrEq
  port (	InA	: in std_logic;
			InB	: in std_logic;
			Sel 	: in std_logic;
			M 		: out std_logic);
  end component;
  
  -- Component for Mux4to1
  component Mux4to1
  port (	InA	: in std_logic_vector(7 downto 0);
			InB	: in std_logic_vector(7 downto 0);
			InC	: in std_logic_vector(7 downto 0);
			InD	: in std_logic_vector(7 downto 0);
			Sel 	: in std_logic_vector(1 downto 0);
			M 		: out std_logic_vector(7 downto 0));
  end component;
  
  -- Component for Reg8
  component Reg8
  port (	Inrs	: in std_logic_vector(7 downto 0);
			Clk	: in std_logic;
			Cen	: in std_logic;
			Rst	: in std_logic;
			En		: in std_logic;
			OutD	: out std_logic_vector(7 downto 0));
  end component;

  -- Component for Dec7Seg
  component Dec7Seg
  port (	InR	: in std_logic_vector(3 downto 0);
			Seg	: out std_logic_vector(7 downto 0));
  end component;
  
  -- Component for ClkDiv
  component ClkDiv
  port (	Clkin		: in std_logic;
			Rst		: in std_logic;
			Clkout	: out std_logic);
  end component;
 
  -- Component for DispOff
  component DispOff
  port ( Turnoff	: out std_logic_vector(31 downto 0));
  end component;
  
  -- Embedded signals to interconnect components
	signal opcode		: STD_LOGIC_VECTOR(3 downto 0);
	signal rs			: STD_LOGIC_VECTOR(2 downto 0);
	signal rt			: STD_LOGIC_VECTOR(2 downto 0);
	signal rd			: STD_LOGIC_VECTOR(2 downto 0);
	signal imm			: STD_LOGIC_VECTOR(7 downto 0);
	
	signal AdderS		: STD_LOGIC_VECTOR(7 downto 0);
	
	signal IncremM		: STD_LOGIC_VECTOR(7 downto 0);
	signal PC			: STD_LOGIC_VECTOR(7 downto 0);
	
	signal RegScr		: STD_LOGIC_VECTOR(1 downto 0);
	signal ALUOp		: STD_LOGIC_VECTOR(2 downto 0);
	signal RegWrite	: STD_LOGIC;
	signal Write7Seg	: STD_LOGIC;
	signal WriteLEDs	: STD_LOGIC;
	signal PCinc		: STD_LOGIC;
	signal Beq			: STD_LOGIC;
	signal JiJr			: STD_LOGIC_VECTOR(1 downto 0);
	
	signal DataM		: STD_LOGIC_VECTOR(7 downto 0);
	
	signal rsd			: STD_LOGIC_VECTOR(7 downto 0);
	signal rtd			: STD_LOGIC_VECTOR(7 downto 0);
	
	signal D				: STD_LOGIC_VECTOR(7 downto 0);
	
	signal ClkEn		: STD_LOGIC;
	
	signal ALUZero		: STD_LOGIC;
	signal ALUOper		: STD_LOGIC_VECTOR(7 downto 0);

	signal BrEqM		: STD_LOGIC;
	
	signal BrJiJrM		: STD_LOGIC_VECTOR(7 downto 0);

begin
  -- Component instantiation (component connecting)
  
  C01 : ProgCounter
  port map ( PCin		=> BrJiJrM, 
				 Clk		=> Clk50MHz,
				 Cen		=> ClkEn,
				 Rst		=> Clr,
				 PCout	=>	PC);
  
  -- Classic style of instantiation
  C02 : Mem
  port map ( Addr		=>	PC,
				 Datars	=>	rs,
				 Datart	=>	rt,
				 Datard	=>	rd,
				 Datai	=>	imm,
				 DataOp	=> opcode);
  
  C03 : CtrlUnit
  port map ( Oper				=> opcode,
				 RegSrc_Op		=> RegScr,
				 ALU_Op			=> ALUOp,
				 RegWrite_Op	=> RegWrite,
				 Write7Seg_Op	=> Write7Seg,
				 WriteLEDs_Op	=> WriteLEDs,	
				 PCInc_Op		=> PCinc,			
				 Beq_Op			=> Beq,			
				 JiJr_Op			=> JiJr);
  
  C04 : Registers
  port map ( SelA		=> rs,
				 SelB		=> rt,
				 SelWR	=> rd,
				 Data		=>	DataM,
				 Clk		=> Clk50MHz,
				 Cen		=> ClkEn,
				 Rst		=> Clr,
				 WE		=> RegWrite,
				 OutA		=>	rsd,
				 OutB		=> rtd);
  
  C05 : ALU
  port map ( InA  => rsd,
				 InB  => rtd,
				 Sel  => ALUOp,
				 Zero => ALUZero,
				 Oper => ALUOper);
  
  C06 : FullAdder
  port map ( InA => PC,
				 InB => IncremM,
				 S   => AdderS);
  
  C07 : Increm
  port map ( InA => "00000001",
				 InB => imm,
				 Sel => BrEqM,
				 M   => IncremM);
  
  C08 : BrEq
  port map ( InA => PCInc,
				 InB => ALUZero,
				 Sel => Beq,
				 M   => BrEqM);
  
  C09 : Mux4to1
  port map ( InA => imm,
				 InB => PC,
				 InC => ALUOper,
				 InD => Switches,
				 Sel => RegScr,
				 M   => DataM);
  
  C10 : Mux4to1
  port map ( InA => AdderS,
				 InB => rsd,
				 InC => imm,
				 InD => "00000000",
				 Sel => JiJr,
				 M   => BrJiJrM);
  
  C11 : Reg8
  port map ( Inrs	=> rsd,
				 Clk	=> Clk50MHz,
				 Cen	=> ClkEn,
				 Rst	=> Clr,
				 En	=> Write7Seg,
				 OutD	=> D);
  
  C12 : Reg8
  port map ( Inrs	=> rsd,
				 Clk	=> Clk50MHz,
				 Cen	=> ClkEn,
				 Rst	=> Clr,
				 En	=> WriteLEDs,
				 OutD	=> LEDs);
  
  C13 : Dec7Seg
  port map ( InR => D(7 downto 4),
				 Seg => SegL);
  
  C14 : Dec7Seg
  port map ( InR => D(3 downto 0),
				 Seg => SegH);
  
  C15 : ClkDiv
  port map ( Clkin	=> Clk50MHz,
				 Rst		=>	Clr,
				 Clkout	=> ClkEn);

  C16 : DispOff
  port map ( Turnoff => Turnoff);
	
  LEDsoff <= (others => '0');
end Behavioral;
