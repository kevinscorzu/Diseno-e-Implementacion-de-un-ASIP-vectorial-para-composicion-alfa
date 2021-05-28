module RegisterFile (input logic clk,
							input logic we3,
							input logic [3:0] ra1, ra2, wa3,
							input logic [31:0] wd3,
							output logic [31:0] rd1, rd2);
					
	logic [31:0] regs[15:0];

	always_ff @(negedge clk)
		if (we3) regs[wa3] <= wd3;
			
	assign rd1 = regs[ra1];
	assign rd2 = regs[ra2];

endmodule 