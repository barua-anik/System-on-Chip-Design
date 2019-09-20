# ####################################################################

#  Created by Encounter(R) RTL Compiler RC9.1.203 - v09.10-s242_1 on Thu Nov 03 18:49:20 EET 2016

# ####################################################################

set sdc_version 1.7

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

# Set the current design
current_design ShiftReg

create_clock -name "clk" -period 4.75 -waveform {0.0 2.375} 
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {abcd[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {abcd[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {abcd[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {abcd[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports sl_ser]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports sr_ser]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports s1]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports s0]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports n_clr]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports clk]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {q[0]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {q[1]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {q[2]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {q[3]}]
set_wire_load_mode "enclosed"
set_wire_load_selection_group "DEFAULT" -library "fsd0a_a_generic_core_1d2vtc"
set_dont_use [get_lib_cells fsd0a_a_generic_core_1d2vtc/BHD1]
set_dont_use [get_lib_cells fsd0a_a_generic_core_1d2vtc/CKLD]
set_clock_latency -max 0.45 [get_ports clk]
set_clock_latency -source -min 0.4 [get_ports clk]
set_clock_uncertainty -setup 0.475 [get_ports clk]
set_clock_uncertainty -hold 0.27 [get_ports clk]
