vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/proc_sys_reset_v5_0_17

vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap proc_sys_reset_v5_0_17 questa_lib/msim/proc_sys_reset_v5_0_17

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" \
"C:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm  -93  \
"C:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" \
"../../../bd/design_1/ip/design_1_UART_0_2/sim/design_1_UART_0_2.v" \

vcom -work proc_sys_reset_v5_0_17  -93  \
"../../../../man_bram.gen/sources_1/bd/design_1/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/design_1/ip/design_1_proc_sys_reset_0_0/sim/design_1_proc_sys_reset_0_0.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" \
"../../../bd/design_1/ip/design_1_to_ram_0_0/sim/design_1_to_ram_0_0.v" \
"../../../bd/design_1/ip/design_1_ToUART_0_1/sim/design_1_ToUART_0_1.v" \
"../../../bd/design_1/ip/design_1_RAM64_0_0/sim/design_1_RAM64_0_0.v" \
"../../../bd/design_1/ip/design_1_RAM128_0_0/sim/design_1_RAM128_0_0.v" \
"../../../bd/design_1/ip/design_1_DummyFFT_0_0/sim/design_1_DummyFFT_0_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

