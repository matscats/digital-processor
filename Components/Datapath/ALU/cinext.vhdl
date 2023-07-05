library ieee;
USE ieee.std_logic_1164.all ;

ENTITY cinext IS
PORT(
  x, y, z : in std_logic;
  cin    : out std_logic
);
END cinext;

ARCHITECTURE main of cinext is
BEGIN
	cin <= (NOT x) AND (y XOR z);
END main;