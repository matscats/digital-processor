library ieee;
USE ieee.std_logic_1164.all ;

ENTITY abext IS
PORT(
  a, b, x, y, z : in std_logic;
  sa, sb    : out std_logic
);
END abext;

ARCHITECTURE main of abext is
BEGIN
	sa <= ((NOT x) AND a) OR
		(x AND (NOT y) AND b AND (z XOR a)) OR
		(x AND (NOT y) AND z AND a) OR
		(x AND y AND (NOT z) AND (a XOR b)) OR
		(x AND y AND z AND (NOT a));
	sb <= (x NOR y) AND (z XOR b);
END main;