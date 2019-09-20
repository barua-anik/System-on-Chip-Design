# ####################################################################

#  Created by Encounter(R) RTL Compiler RC9.1.203 - v09.10-s242_1 on Tue Apr 12 11:17:07 EEST 2016

# ####################################################################

set sdc_version 1.7

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

# Set the current design
current_design counter

create_clock -name "clk" -period 4.75 -waveform {0.0 2.375} 
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {cin[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {cin[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {cin[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {cin[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {cin[4]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {cin[5]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {cin[6]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {cin[7]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports up]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports load]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports rst]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports clk]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {cout[0]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {cout[1]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {cout[2]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {cout[3]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {cout[4]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {cout[5]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {cout[6]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {cout[7]}]
set_wire_load_mode "enclosed"
set_wire_load_selection_group "DEFAULT" -library "fsd0a_a_generic_core_1d2vtc"
set_dont_use [get_lib_cells fsd0a_a_generic_core_1d2vtc/BHD1]
set_dont_use [get_lib_cells fsd0a_a_generic_core_1d2vtc/CKLD]
set_clock_latency -max 0.45 [get_ports clk]
set_clock_latency -source -min 0.4 [get_ports clk]
set_clock_uncertainty -setup 0.475 [get_ports clk]
set_clock_uncertainty -hold 0.27 [get_ports clk]
