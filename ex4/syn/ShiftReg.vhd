LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY ShiftReg IS
PORT(clk, n_clr, s0, s1, sr_ser, sl_ser : IN std_logic;
abcd : IN std_logic_vector(3 DOWNTO 0);
q : OUT std_logic_vector(3 DOWNTO 0));
END ShiftReg;
ARCHITECTURE behav OF ShiftReg IS
SIGNAL temp : std_logic_vector(3 DOWNTO 0);
BEGIN
PROCESS(clk, n_clr)
BEGIN
If n_clr = '0' THEN -- asynchronous clear
temp <= "0000";
ELSIF clk'EVENT AND clk = '1' THEN
IF s0 = '1' AND s1 = '1' THEN -- synch load
temp <= abcd;
ELSIF s0 = '1' AND s1 = '0' THEN -- shift right
temp <= sr_ser & temp(3 DOWNTO 1);
ELSIF s0 = '0' AND s1 = '1' THEN -- shift left;
temp <= temp(2 DOWNTO 0) & sl_ser;
ELSE -- inhibit mode
temp <= temp;
END IF;
END IF;
END PROCESS;
q <= temp;
END behav;