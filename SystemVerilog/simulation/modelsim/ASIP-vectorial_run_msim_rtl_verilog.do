transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

<<<<<<< HEAD
vlog -sv -work work +incdir+C:/Users/skryf/Documents/Arquitectura\ de\ Computadores\ II/Proyecto\ 2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/Muxes {C:/Users/skryf/Documents/Arquitectura de Computadores II/Proyecto 2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/Muxes/Mux8.sv}
vlog -sv -work work +incdir+C:/Users/skryf/Documents/Arquitectura\ de\ Computadores\ II/Proyecto\ 2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/ALU/Vectorial {C:/Users/skryf/Documents/Arquitectura de Computadores II/Proyecto 2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/ALU/Vectorial/ALUVectorial.sv}
vlog -sv -work work +incdir+C:/Users/skryf/Documents/Arquitectura\ de\ Computadores\ II/Proyecto\ 2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/ALU/Vectorial/Operations {C:/Users/skryf/Documents/Arquitectura de Computadores II/Proyecto 2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/ALU/Vectorial/Operations/VectorialAddition.sv}
vlog -sv -work work +incdir+C:/Users/skryf/Documents/Arquitectura\ de\ Computadores\ II/Proyecto\ 2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/ALU/Vectorial/Operations {C:/Users/skryf/Documents/Arquitectura de Computadores II/Proyecto 2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/ALU/Vectorial/Operations/VectorialSubtraction.sv}
vlog -sv -work work +incdir+C:/Users/skryf/Documents/Arquitectura\ de\ Computadores\ II/Proyecto\ 2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/ALU/Vectorial/Operations {C:/Users/skryf/Documents/Arquitectura de Computadores II/Proyecto 2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/ALU/Vectorial/Operations/VectorialMultiplication.sv}
vlog -sv -work work +incdir+C:/Users/skryf/Documents/Arquitectura\ de\ Computadores\ II/Proyecto\ 2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/ALU/Vectorial/Operations {C:/Users/skryf/Documents/Arquitectura de Computadores II/Proyecto 2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/ALU/Vectorial/Operations/VectorialDivision.sv}
vlog -sv -work work +incdir+C:/Users/skryf/Documents/Arquitectura\ de\ Computadores\ II/Proyecto\ 2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/tests {C:/Users/skryf/Documents/Arquitectura de Computadores II/Proyecto 2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/tests/ALUVectorial_tb.sv}
=======
vlog -sv -work work +incdir+C:/Users/luisd/Documents/FPGA_Projects/Proyecto2-Arqui2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/CtrlUnit {C:/Users/luisd/Documents/FPGA_Projects/Proyecto2-Arqui2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/CtrlUnit/ControlUnit.sv}
vlog -sv -work work +incdir+C:/Users/luisd/Documents/FPGA_Projects/Proyecto2-Arqui2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/CtrlUnit {C:/Users/luisd/Documents/FPGA_Projects/Proyecto2-Arqui2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/CtrlUnit/ExtendDeco.sv}
vlog -sv -work work +incdir+C:/Users/luisd/Documents/FPGA_Projects/Proyecto2-Arqui2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/CtrlUnit {C:/Users/luisd/Documents/FPGA_Projects/Proyecto2-Arqui2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/CtrlUnit/InstDeco.sv}
vlog -sv -work work +incdir+C:/Users/luisd/Documents/FPGA_Projects/Proyecto2-Arqui2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/tests {C:/Users/luisd/Documents/FPGA_Projects/Proyecto2-Arqui2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/tests/ControlUnit_tb.sv}
vlog -sv -work work +incdir+C:/Users/luisd/Documents/FPGA_Projects/Proyecto2-Arqui2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/CtrlUnit {C:/Users/luisd/Documents/FPGA_Projects/Proyecto2-Arqui2/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/SystemVerilog/CtrlUnit/muxRDeco.sv}
>>>>>>> main

