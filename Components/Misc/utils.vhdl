LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

package utils is
	constant BSIZE : INTEGER := 4;
	constant SSIZE : INTEGER := 2;
	
	type vecArray is array (natural range <>) of STD_LOGIC_VECTOR(BSIZE-1 DOWNTO 0);
end package utils;