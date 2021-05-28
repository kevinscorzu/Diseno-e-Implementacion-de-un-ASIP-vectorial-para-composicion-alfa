module InstructionMemory_tb();

	logic clk;
	logic[31:0] addr, rd;
	
	InstructionMemory DUT(clk, addr, rd);
	
	initial begin
	
		clk = 1'd1;
		addr = 32'd0;
		
		#10;
		
		clk = 1'd0;
		
		#10;
		
		assert(rd === 32'hf03ad68a) $display("Instruction Check"); else $display("Instruction Fail");
	
	end

endmodule 