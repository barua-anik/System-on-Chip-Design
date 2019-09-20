LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY test_bench IS
END test_bench;
ARCHITECTURE test_fixture OF test_bench IS
COMPONENT ShiftReg
PORT(clk, n_clr, s0, s1, sr_ser, sl_ser : IN std_logic;
abcd : IN std_logic_vector(3 DOWNTO 0);
q : OUT std_logic_vector(3 DOWNTO 0));
END COMPONENT;
FOR all: ShiftReg USE ENTITY work.ShiftReg; -- configuration
-- define internal signals for connecting ShiftReg to driver
SIGNAL clk, s0, s1, n_clr, sr_ser, sl_ser : std_logic := '0';
SIGNAL abcd, q : std_logic_vector(3 DOWNTO 0);
BEGIN
-- instantiate ShiftReg shift register component
shift_reg:
ShiftReg PORT MAP(clk, n_clr, s0, s1, sr_ser, sl_ser, abcd, q);
clk <= NOT clk AFTER 50 ns; -- create system clock
PROCESS
BEGIN
WAIT FOR 10 ns;
ASSERT q = "0000"
REPORT "ERROR: clear failed"
SEVERITY error;
WAIT FOR 20 ns;
n_clr <= '1';
-- check synchronous load
s0 <= '1';
s1 <= '1';
abcd <= "0010";
WAIT UNTIl clk = '0'; -- first falling edge
ASSERT q = "0010"
REPORT "ERROR: load failed"
SEVERITY error;
-- now check shift left
s0 <= '0';
WAIT UNTIL clk = '0'; -- next falling clock edge
ASSERT q = "0011"
REPORT "ERROR: shift left failed"
SEVERITY error;
FOR i IN 0 TO 2 LOOP -- three more shift lefts
IF i = 1 THEN
sl_ser <= '1';
ELSE
sl_ser <= '0';
END IF;
WAIT UNTIL clk = '0';
END LOOP;
ASSERT q = "1010"
REPORT "ERROR: serial shift left failed"
SEVERITY error;
WAIT; -- suspend
END PROCESS;
END test_fixture;
