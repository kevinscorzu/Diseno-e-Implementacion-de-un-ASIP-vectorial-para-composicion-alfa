module DataMemory_tb();

	logic clk, we, vf;
	logic[127:0] addr, wd, rd;

	DataMemory DUT(clk, we, vf, addr, wd, rd);
	
	initial begin
		
		clk = 1'b1;
		we = 1'b1;
		vf = 1'b1;
		addr = 128'd0;
		wd[31:0] = 32'd1;
		wd[63:32] = 32'd2;
		wd[95:64] = 32'd3;
		wd[127:96] = 32'd4;
 		
		#10;

		clk = 1'b0;
		
		#10;
		
		clk = 1'b1;
		we = 1'b0;
		
		#10;
		
		clk = 1'b0;
		
		#5;
		
		assert(rd[31:0] === 32'd1) $display("Block 0 Write Check"); else $display("Block 0 Write Fail");
		assert(rd[63:32] === 32'd2) $display("Block 0 Write Check"); else $display("Block 1 Write Fail");
		assert(rd[95:64] === 32'd3) $display("Block 0 Write Check"); else $display("Block 2 Write Fail");
		assert(rd[127:96] === 32'd4) $display("Block 0 Write Check"); else $display("Block 3 Write Fail");
		
		#10;
		
		clk = 1'b1;
		vf = 1'b0;
		we = 1'b1;
		addr = 128'd10000;
	
		#10;
		
		clk = 1'b0;
		
		#10;
		
		clk = 1'b1;
		we = 1'b0;
		
		#10;
		
		clk = 1'b0;
		
		#5;
		
		assert(rd[31:0] === 32'd1) $display("Block 0 Write Check"); else $display("Block 0 Write Fail");
	
	end

endmodule 