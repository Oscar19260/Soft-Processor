----------------------------------------------------------------------------------
-- Company:        ITESM - CQ
-- Engineer:       Equipo GR
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    Registers - Behavioral 
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

Entity Registers is
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
end Registers;
  
Architecture a of Registers is
	signal r0 : std_logic_vector(7 downto 0);
	signal r1 : std_logic_vector(7 downto 0);
	signal r2 : std_logic_vector(7 downto 0);
	signal r3 : std_logic_vector(7 downto 0);
	signal r4 : std_logic_vector(7 downto 0);
	signal r5 : std_logic_vector(7 downto 0);
	signal r6 : std_logic_vector(7 downto 0);
	signal r7 : std_logic_vector(7 downto 0);
	
	signal A : std_logic_vector(7 downto 0);
	signal B : std_logic_vector(7 downto 0);

Begin
	WriteReg: process(Rst, Clk)
	begin
		if (Rst = '0') then
			r0 <= (others => '0');
			r1 <= (others => '0');
			r2 <= (others => '0');
			r3 <= (others => '0');
			r4 <= (others => '0');
			r5 <= (others => '0');
			r6 <= (others => '0');
			r7 <= (others => '0');
			
		elsif(falling_edge(Clk)) then
			if(Cen = '1') then
				if(WE = '1') then
					case SelWR is
						when "000" => r0 <= Data;
						when "001" => r1 <= Data;
						when "010" => r2 <= Data;
						when "011" => r3 <= Data;
						when "100" => r4 <= Data;
						when "101" => r5 <= Data;
						when "110" => r6 <= Data;
						when "111" => r7 <= Data;
					end case;
				end if;
			end if;
		end if;
	end process WriteReg;
	
	ReadReg: process(SelA, SelB)
	begin
		case SelA is
			when "000" => OutA <= r0;
			when "001" => OutA <= r1;
			when "010" => OutA <= r2;
			when "011" => OutA <= r3;
			when "100" => OutA <= r4;
			when "101" => OutA <= r5;
			when "110" => OutA <= r6;
			when "111" => OutA <= r7;
		end case;
		
		case SelB is
			when "000" => OutB <= r0;
			when "001" => OutB <= r1;
			when "010" => OutB <= r2;
			when "011" => OutB <= r3;
			when "100" => OutB <= r4;
			when "101" => OutB <= r5;
			when "110" => OutB <= r6;
			when "111" => OutB <= r7;
		end case;
	end process ReadReg;	
end a;
	