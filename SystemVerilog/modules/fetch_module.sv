module fetch_module(input clk,rst,jmpSel,input[31:0]ALURes,
							output[31:0]curr_pc,ACIns);
	logic[31:0] next_PC;
	FlipFlop #(32)PC(clk,rst,next_PC,curr_pc);
	logic [31:0]pc_p1;
	Mux2 #(32)PCmux(pc_p1,ALURes,jmpSel,next_PC);
	logic none;
	Addition #(32)PC_1(curr_pc,32'h1,pc_p1,none);	
	InstructionMemory instMem(clk,curr_pc,ACIns);
endmodule 