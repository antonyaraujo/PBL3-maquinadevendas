onerror {exit -code 1}
vlib work
vlog -work work problema3.vo
vlog -work work Teste_circuitoPrincipal.vwf.vt
vsim -c -t 1ps -L maxii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.circuito_principal_vlg_vec_tst
vcd file -direction problema3.msim.vcd
vcd add -internal circuito_principal_vlg_vec_tst/*
vcd add -internal circuito_principal_vlg_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f























