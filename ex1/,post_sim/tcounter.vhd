library ieee;
use ieee.std_logic_1164.all;


entity tcounter is
  
end tcounter;

architecture test of tcounter is

  component counter
    port (
      clk  : in  std_logic;
      rst  : in  std_logic;
      load : in  std_logic;
      up   : in  std_logic;
      cin  : in  std_logic_vector(7 downto 0);
      cout : out std_logic_vector(7 downto 0));
  end component;

  signal clk : std_logic:='0';
  signal rst : std_logic:='0';
  signal load  : std_logic:='0';
  signal up : std_logic:='0';
  signal cin : std_logic_vector(7 downto 0);
  signal cout : std_logic_vector(7 downto 0);
  signal simulation: std_logic:='1';
  
  constant half_period  : time := 2 ns;
  constant period  : time  := 2*half_period;
  
begin  

  dut:counter
    port map (
      clk  => clk,
      rst  => rst,
      load => load,
      up   => up,
      cin  => cin,
      cout => cout);

  clk <= not clk after half_period when simulation='1' else '0';

  stimulus: process
  begin  
      simulation<='1'; 
      rst<='0';
      up<='0';
      load<='0';
      cin<=(others=>'0');
      wait for (20*period);
      rst<='1';
      load<='1';
      cin<=(others=>'1');
      wait for 20*period;      
      load<='0';      
      up<='1';
      wait for 20*period;
      up<='0';
      cin<=(others=>'0');
      wait for 20*period;      
      rst<='0';
      wait for 20*period;
      simulation<='0'; 
      wait;      
  end process stimulus;  
end test;
