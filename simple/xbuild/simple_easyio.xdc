create_clock -period 5.000 -name clk -waveform {0.000 2.500} [get_ports clk]
set_input_delay -clock [get_clocks clk] -min -add_delay 1.500 [get_ports {in[*]}]
set_input_delay -clock [get_clocks clk] -max -add_delay 2.000 [get_ports {in[*]}]
set_input_delay -clock [get_clocks clk] -min -add_delay 1.500 [get_ports load]
set_input_delay -clock [get_clocks clk] -max -add_delay 2.000 [get_ports load]
set_output_delay -clock [get_clocks clk] -min -add_delay 0.000 [get_ports {out[*]}]
set_output_delay -clock [get_clocks clk] -max -add_delay 0.100 [get_ports {out[*]}]

set_input_delay -clock [get_clocks clk] -min -add_delay 2.000 [get_ports reset_in]
set_input_delay -clock [get_clocks clk] -max -add_delay 2.000 [get_ports reset_in]

set_multicycle_path -setup -to [get_ports *out*] 2
set_multicycle_path -hold -to [get_ports *out*] 1
