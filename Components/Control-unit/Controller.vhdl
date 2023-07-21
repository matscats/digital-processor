library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.utils.all;

entity Controller is
port(
	clk, reset : in std_logic;
	IR03, IR47, IR811, OPCODE : in std_logic_vector(3 DOWNTO 0);
	RF_RP_zero, cmp_gt : in std_logic;
	PC_ld, PC_clr, PC_inc, i_rd, IR_ld, D_rd, D_wr, RF_W_wr, RF_s1,
	RF_s0, RF_Rp_rd, RF_Rq_rd, alu_s1, alu_s0, PC_sel
	: out std_logic;
	D_addr03, D_addr47, RF_W_data03, RF_W_data47, RF_W_addr, RF_Rp_addr,
	RF_Rq_addr : out std_logic_vector(3 DOWNTO 0)
);
end entity Controller;

architecture main of Controller is
	type states is (Init, Fetch, Decode, Load, Store, Add, LoadConst,
		Subtract, JumpIfZero, JumpIfZeroJmp, JumpIfGt, JumpIfGtJmp);
    signal stateReg, nextState : states;
begin
	process(clk, reset)
	begin
		if (reset = '1') then
			stateReg <= Init;
		elsif rising_edge(clk) then
			stateReg <= nextState;
		end if;
	end process;

	process (OPCODE, IR03, IR47, IR811, RF_RP_zero, cmp_gt, stateReg)
	begin
		case stateReg is
			when Init =>
				PC_ld <= '0';
				PC_clr <= '1';
				PC_inc <= '0';
				i_rd <= '0';
				IR_ld <= '0';
				D_addr03 <= "0000";
				D_addr47 <= "0000";
				D_rd <= '0';
				D_wr <= '0';
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_wr <= '0';
				RF_W_addr <= "0000";
				RF_s1 <= '0';
				RF_s0 <= '0';
				RF_Rp_addr <= "0000";
				RF_Rp_rd <= '0';
				RF_Rq_addr <= "0000";
				RF_Rq_rd <= '0';
				alu_s1 <= '0';
				alu_s0 <= '0';
				PC_sel <= '0';
				nextState <= Fetch;
			when Fetch =>
				PC_ld <= '0';
				PC_clr <= '0';
				PC_inc <= '1';
				i_rd <= '1';
				IR_ld <= '1';
				D_addr03 <= "0000";
				D_addr47 <= "0000";
				D_rd <= '0';
				D_wr <= '0';
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_wr <= '0';
				RF_W_addr <= "0000";
				RF_s1 <= '0';
				RF_s0 <= '0';
				RF_Rp_addr <= "0000";
				RF_Rp_rd <= '0';
				RF_Rq_addr <= "0000";
				RF_Rq_rd <= '0';
				alu_s1 <= '0';
				alu_s0 <= '0';
				PC_sel <= '0';
				nextState <= Decode;
			when Decode =>
				PC_ld <= '0';
				PC_clr <= '0';
				PC_inc <= '0';
				i_rd <= '0';
				IR_ld <= '0';
				D_addr03 <= "0000";
				D_addr47 <= "0000";
				D_rd <= '0';
				D_wr <= '0';
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_wr <= '0';
				RF_W_addr <= "0000";
				RF_s1 <= '0';
				RF_s0 <= '0';
				RF_Rp_addr <= "0000";
				RF_Rp_rd <= '0';
				RF_Rq_addr <= "0000";
				RF_Rq_rd <= '0';
				alu_s1 <= '0';
				alu_s0 <= '0';
				PC_sel <= '0';
				if (OPCODE = "0000") then
					nextState <= Load;
				elsif (OPCODE = "0001") then
					nextState <= Store;
				elsif (OPCODE = "0010") then
					nextState <= Add;
				elsif (OPCODE = "0011") then
					nextState <= LoadConst;
				elsif (OPCODE = "0100") then
					nextState <= Subtract;
				elsif (OPCODE = "0101") then
					nextState <= JumpIfZero;
				elsif (OPCODE = "0110") then
					nextState <= JumpIfGt;
				else
					nextState <= Fetch;
				end if;
			when Load =>
				PC_ld <= '0';
				PC_clr <= '0';
				PC_inc <= '0';
				i_rd <= '0';
				IR_ld <= '0';
				D_addr03 <= IR03;
				D_addr47 <= IR47;
				D_rd <= '1';
				D_wr <= '0';
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_wr <= '1';
				RF_W_addr <= IR811;
				RF_s1 <= '0';
				RF_s0 <= '1';
				RF_Rp_addr <= "0000";
				RF_Rp_rd <= '0';
				RF_Rq_addr <= "0000";
				RF_Rq_rd <= '0';
				alu_s1 <= '0';
				alu_s0 <= '0';
				PC_sel <= '0';
				nextState <= Fetch;
			when Store =>
				PC_ld <= '0';
				PC_clr <= '0';
				PC_inc <= '0';
				i_rd <= '0';
				IR_ld <= '0';
				D_addr03 <= IR03;
				D_addr47 <= IR47;
				D_rd <= '0';
				D_wr <= '1';
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_wr <= '0';
				RF_W_addr <= "0000";
				RF_s1 <= '0';
				RF_s0 <= '0';
				RF_Rp_addr <= IR811;
				RF_Rp_rd <= '1';
				RF_Rq_addr <= "0000";
				RF_Rq_rd <= '0';
				alu_s1 <= '0';
				alu_s0 <= '0';
				PC_sel <= '0';
				nextState <= Fetch;
			when Add =>
				PC_ld <= '0';
				PC_clr <= '0';
				PC_inc <= '0';
				i_rd <= '0';
				IR_ld <= '0';
				D_addr03 <= "0000";
				D_addr47 <= "0000";
				D_rd <= '0';
				D_wr <= '0';
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_wr <= '1';
				RF_W_addr <= IR811;
				RF_s1 <= '0';
				RF_s0 <= '0';
				RF_Rp_addr <= IR47;
				RF_Rp_rd <= '1';
				RF_Rq_addr <= IR03;
				RF_Rq_rd <= '1';
				alu_s1 <= '0';
				alu_s0 <= '0';
				PC_sel <= '0';
				nextState <= Fetch;
			when LoadConst =>
				PC_ld <= '0';
				PC_clr <= '0';
				PC_inc <= '0';
				i_rd <= '0';
				IR_ld <= '0';
				D_addr03 <= "0000";
				D_addr47 <= "0000";
				D_rd <= '0';
				D_wr <= '0';
				RF_W_data03 <= IR03;
				RF_W_data47 <= IR47;
				RF_W_wr <= '1';
				RF_W_addr <= IR811;
				RF_s1 <= '1';
				RF_s0 <= '0';
				RF_Rp_addr <= "0000";
				RF_Rp_rd <= '0';
				RF_Rq_addr <= "0000";
				RF_Rq_rd <= '0';
				alu_s1 <= '0';
				alu_s0 <= '0';
				PC_sel <= '0';
				nextState <= Fetch;
			when Subtract =>
				PC_ld <= '0';
				PC_clr <= '0';
				PC_inc <= '0';
				i_rd <= '0';
				IR_ld <= '0';
				D_addr03 <= "0000";
				D_addr47 <= "0000";
				D_rd <= '0';
				D_wr <= '0';
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_wr <= '1';
				RF_W_addr <= IR811;
				RF_s1 <= '0';
				RF_s0 <= '0';
				RF_Rp_addr <= IR47;
				RF_Rp_rd <= '1';
				RF_Rq_addr <= IR03;
				RF_Rq_rd <= '1';
				alu_s1 <= '1';
				alu_s0 <= '0';
				PC_sel <= '0';
				nextState <= Fetch;
			when JumpIfZero =>
				PC_ld <= '0';
				PC_clr <= '0';
				PC_inc <= '0';
				i_rd <= '0';
				IR_ld <= '0';
				D_addr03 <= "0000";
				D_addr47 <= "0000";
				D_rd <= '0';
				D_wr <= '0';
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_wr <= '0';
				RF_W_addr <= "0000";
				RF_s1 <= '0';
				RF_s0 <= '0';
				RF_Rp_addr <= IR811;
				RF_Rp_rd <= '1';
				RF_Rq_addr <= "0000";
				RF_Rq_rd <= '0';
				alu_s1 <= '0';
				alu_s0 <= '0';
				PC_sel <= '0';
				if (RF_RP_zero = '0') then
					nextState <= Fetch;
				else
					nextState <= JumpIfZeroJmp;
				end if;
			when JumpIfZeroJmp =>
				PC_ld <= '1';
				PC_clr <= '0';
				PC_inc <= '0';
				i_rd <= '0';
				IR_ld <= '0';
				D_addr03 <= "0000";
				D_addr47 <= "0000";
				D_rd <= '0';
				D_wr <= '0';
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_wr <= '0';
				RF_W_addr <= "0000";
				RF_s1 <= '0';
				RF_s0 <= '0';
				RF_Rp_addr <= "0000";
				RF_Rp_rd <= '0';
				RF_Rq_addr <= "0000";
				RF_Rq_rd <= '0';
				alu_s1 <= '0';
				alu_s0 <= '0';
				PC_sel <= '0';
				nextState <= Fetch;
			when JumpIfGt =>
				PC_ld <= '0';
				PC_clr <= '0';
				PC_inc <= '0';
				i_rd <= '0';
				IR_ld <= '0';
				D_addr03 <= "0000";
				D_addr47 <= "0000";
				D_rd <= '0';
				D_wr <= '0';
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_wr <= '0';
				RF_W_addr <= "0000";
				RF_s1 <= '0';
				RF_s0 <= '0';
				RF_Rp_addr <= IR811;
				RF_Rp_rd <= '1';
				RF_Rq_addr <= IR47;
				RF_Rq_rd <= '1';
				alu_s1 <= '0';
				alu_s0 <= '0';
				PC_sel <= '0';
				if (cmp_gt = '0') then
					nextState <= Fetch;
				else
					nextState <= JumpIfGtJmp;
				end if;
			when JumpIfGtJmp =>
				PC_ld <= '1';
				PC_clr <= '0';
				PC_inc <= '0';
				i_rd <= '0';
				IR_ld <= '0';
				D_addr03 <= "0000";
				D_addr47 <= "0000";
				D_rd <= '0';
				D_wr <= '0';
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_wr <= '0';
				RF_W_addr <= "0000";
				RF_s1 <= '0';
				RF_s0 <= '0';
				RF_Rp_addr <= IR03;
				RF_Rp_rd <= '1';
				RF_Rq_addr <= "0000";
				RF_Rq_rd <= '0';
				alu_s1 <= '0';
				alu_s0 <= '0';
				PC_sel <= '1';
				nextState <= Fetch;
		end case;
	end process;
end architecture main;
