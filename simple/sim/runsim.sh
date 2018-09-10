xvlog -sv ../rtl/simple.sv
xvlog -sv test_simple.sv
xelab -debug typical work.test_simple -s sim
xsim sim -g -wdb sim.wcfg # -runall
