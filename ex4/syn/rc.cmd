# Cadence Encounter(R) RTL Compiler
#   version RC9.1.203 - v09.10-s242_1 (32-bit) built Jul 14 2010
#


set_attribute lib_search_path /tech/umc/faraday/Core/fsd0a_a/2007Q1v1.7
set_attribute lib_search_path /tech/umc/faraday/Core/fsd0a_a/2007Q1v1.7/GENERIC_CORE_1D2V/FrontEnd/synopsys/ /
set_attribute library fsd0a_a_generic_core_1d2vtc.lib
set_attribute hdl_vhdl_environment common
set_attribute hdl_vhdl_read_version 1993
set_attribute hdl_language vhdl
read_hdl ShiftReg.vhd
set_attribute hdl_vhdl_preferred_architecture "ShiftReg"
elaborate
define_clock -period 2000 -name clk [clock_ports]
define_clock -period 4750 -name clk
set_attribute clock_network_late_latency 450 clk
set_attribute clock_source_early_latency 400 clk
set_attribute clock_setup_uncertainty 475 clk
set_attribute clock_hold_uncertainty 270 clk
external_delay -clock clk -input 100 [find /des* -port ports_in/*]
external_delay -clock clk -output 400 [find /des* -port ports_out/*]
synthesize -to_mapped
write_hdl > netlist_syn.v
write_sdc > syn.sdc
write_sdf > syn.sdf
Exit
quit
