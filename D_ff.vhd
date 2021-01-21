library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.math_real.ALL;
---------------------------------------------------------------------------------
entity D_flip_flop is
  generic (
    clk_period:   time;
    setup_time:   time;
    hold_time:    time;
    clock_to_output_delay: time;
    resolution_time:  time;
    random_seed:  positive
  );
  port (
    clk : in std_logic;
    d : in std_logic;
    q : out std_logic;
    setup_time_violation_flag: out std_logic := '0';
    hold_time_violation_flag: out std_logic := '0'
    );
  end entity D_flip_flop;
  
---------------------------------------------------------------------------------

architecture ideal of D_flip_flop is
  begin
    process(clk)
      begin
        if(rising_edge(clk)) then
            q <= d;
        end if;
    end process;
    
    setup_time_violation_flag <= '0';
    hold_time_violation_flag <= '0';
    
  end architecture ideal;

---------------------------------------------------------------------------------

architecture metastable of D_flip_flop is
  begin
    assert (setup_time < clk_period / 10) report "setup_time shall be less than clk_period / 10" severity failure;
    assert (hold_time < clk_period/10) report "hold_time shall be less than clk_perdio / 10" severity failure;
    assert (clock_to_output_delay < clk_period / 10) report "clock_to_output_delay shall be less than clk_period/10" severity failure;
    assert (resolution_time > clk_period / 2) report "resolution time shall be greater than clk_period / 2" severity failure;
    assert (resolution_time > 1 ns) report "resoltuion_time shall be greater than 1 ns" severity failure;
    
    process 
    variable sample_d:    std_logic;
    variable clk_rose_at: time := 0 ns;
    variable d_changed_at: time := 0 ns;
    
    
    
        
  end architecture metastable;
---------------------------------------------------------------------------------

