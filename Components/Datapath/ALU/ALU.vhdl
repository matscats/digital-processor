LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ALU IS
GENERIC(
	SIZE : INTEGER := 8;
	UNSIGNopt : BOOLEAN := false
);
PORT(
	A, B : in std_logic_vector(SIZE-1 DOWNTO 0);
	x, y : in std_logic;
   S : out std_logic_vector(SIZE-1 DOWNTO 0);
	gt, eq : out std_logic
);
END;

ARCHITECTURE main OF ALU IS
COMPONENT somador IS
GENERIC(
	SIZE : INTEGER :=6
);
PORT(
	A, B : in std_logic_vector(SIZE-1 DOWNTO 0);
	C : out std_logic_vector(SIZE-1 DOWNTO 0);
	ci : in std_logic
);
END COMPONENT;

COMPONENT compNbit IS
GENERIC(
	SIZE : INTEGER := 4;
	UNSIGNopt : BOOLEAN := false
);
PORT(
  A, B : in std_logic_vector(SIZE-1 DOWNTO 0);
  --in_lt, in_eq, in_gt : in std_logic; in case you ever want to use it for some reason
  s_lt, s_eq, s_gt    : out std_logic
);
END COMPONENT;

COMPONENT abext IS
PORT(
	a, b, x, y : in std_logic;
	sa, sb : out std_logic
);
END COMPONENT;

COMPONENT cinext IS
PORT(
	x, y : in std_logic;
	cin : out std_logic
);
END COMPONENT;

SIGNAL Aaux, Baux : std_logic_vector(SIZE-1 DOWNTO 0);
SIGNAL cinaux : std_logic;

BEGIN
	extensorAB : for i in 0 to SIZE-1 generate
		AB : abext PORT MAP (a => A(i), b => B(i), x => x, y => y, sa => Aaux(i), sb => Baux(i));
	end generate extensorAB;
	
	extensorCin : cinext PORT MAP (x => x, y => y, cin => cinaux);
	soma : somador GENERIC MAP (SIZE => SIZE) PORT MAP (A => Aaux, B => Baux, C => S, ci => cinaux);
	comp : compNbit GENERIC MAP (SIZE => SIZE, UNSIGNopt => UNSIGNopt) PORT MAP (A => A, B => B, s_gt => gt, s_eq => eq);
	
END;
