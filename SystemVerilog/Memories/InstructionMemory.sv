module InstructionMemory (input clk,
								  input logic [31:0] addr,
								  output logic [31:0] rd);
	
	logic [31:0] ROM[255:0];
	
	initial
		$readmemh("instructions.txt", ROM);
	
	always_ff @(negedge clk)
		rd <= ROM[addr[31:0]];
	
endmodule 