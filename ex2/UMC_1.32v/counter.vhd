library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity counter is
  
   port (
    clk  : in  std_logic;               	--clock signal
    rst  : in  std_logic;               	--reset      
    load : in  std_logic;               	--load data in      
    up   : in  std_logic;               	--direction
    cin  : in  std_logic_vector(7 downto 0);  	-- counter data in
    cout : out std_logic_vector(7 downto 0)); 	-- counter data out

end counter;

architecture arch of counter is
  signal cout_x : std_logic_vector(7 downto 0);
begin

-- arch
-- purpose: defines the counter
-- type   : sequential
-- inputs : clk, rst, load,up,cin
-- outputs: cout

  cout <= cout_x;
  
  S1: process (clk, rst)
  begin  
    if rst = '0' then                   
      cout_x <= (others => '0');
    elsif clk'event and clk = '1' then  
      if load = '1' then
        cout_x <= cin;
      elsif up = '1' then
        cout_x <= cout_x + 1;
      else
        cout_x <= cout_x - 1;
      end if;
    else
      null;
    end if;
  end process S1;
 
end arch;
