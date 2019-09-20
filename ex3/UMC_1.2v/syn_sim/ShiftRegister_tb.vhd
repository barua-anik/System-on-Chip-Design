LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY ls194_driver IS
PORT(clk : BUFFER std_logic := '0'; -- notice buffer
n_clr, s0, s1, sr_ser, sl_ser : OUT std_logic := '0';
abcd : OUT std_logic_vector(3 DOWNTO 0);
q : IN std_logic_vector(3 DOWNTO 0));
END ls194_driver;
ARCHITECTURE behav OF ls194_driver IS
BEGIN
clk <= NOT clk AFTER 50 ns; -- create system clock
PROCESS
BEGIN
WAIT FOR 10 ns;
ASSERT q = "0000"
ENTITY test_bench2 IS
END test_bench2;
ARCHITECTURE test_fixture OF test_bench2 IS
COMPONENT ls194
PORT(clk, n_clr, s0, s1, sr_ser, sl_ser : IN std_logic;
abcd : IN std_logic_vector(3 DOWNTO 0);
q : OUT std_logic_vector(3 DOWNTO 0));
END COMPONENT;
COMPONENT ls194_driver
PORT(clk : BUFFER std_logic;
n_clr, s0, s1, sr_ser, sl_ser : OUT std_logic;
abcd : OUT std_logic_vector(3 DOWNTO 0);
q : IN std_logic_vector(3 DOWNTO 0));
END COMPONENT;
FOR all: ls194 USE ENTITY work.ls194; -- configuration
FOR all: ls194_driver USE ENTITY work.ls194_driver;
-- define internal signals for connecting ls194 to driver
SIGNAL clk, s0, s1, n_clr, sr_ser, sl_ser : std_logic;
SIGNAL abcd, q : std_logic_vector(3 DOWNTO 0);
BEGIN
-- instantiate ls194 shift register component
shift_reg: ls194 PORT MAP(clk, n_clr, s0, s1, sr_ser, sl_ser, abcd, q);
driver: ls194_driver PORT MAP(clk, n_clr, s0, s1, sr_ser, sl_ser, abcd, q);
END test_fixture;