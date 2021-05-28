module ImageROM_tb();

	logic clk;
	logic[127:0] addr, rd;

	ImageROM DUT(clk, addr, rd);
	
	initial begin
		
		clk = 1'b1;
		addr = 128'd0;
 		
		#10;

		clk = 1'b0;
		
		#5;
		
		assert(rd[31:0] === 32'd106) $display("Block 0 Write Check"); else $display("Block 0 Write Fail");
		assert(rd[63:32] === 32'd108) $display("Block 1 Write Check"); else $display("Block 1 Write Fail");
		assert(rd[95:64] === 32'd114) $display("Block 2 Write Check"); else $display("Block 2 Write Fail");
		assert(rd[127:96] === 32'd118) $display("Block 3 Write Check"); else $display("Block 3 Write Fail");
		
		#10;
		
		clk = 1'b1;
		addr = 128'd40000;
		
		#10;
		
		clk = 1'b0;
		
		#5;
		
		assert(rd[31:0] === 32'd159) $display("Block 0 Write Check"); else $display("Block 0 Write Fail");
		assert(rd[63:32] === 32'd161) $display("Block 1 Write Check"); else $display("Block 1 Write Fail");
		assert(rd[95:64] === 32'd166) $display("Block 2 Write Check"); else $display("Block 2 Write Fail");
		assert(rd[127:96] === 32'd170) $display("Block 3 Write Check"); else $display("Block 3 Write Fail");
		
		#10;
		
		clk = 1'b1;
		addr = 128'd80000;
	
		#10;
		
		clk = 1'b0;
		
		#5;
		
		assert(rd[31:0] === 32'd87) $display("Block 0 Write Check"); else $display("Block 0 Write Fail");
		assert(rd[63:32] === 32'd89) $display("Block 1 Write Check"); else $display("Block 1 Write Fail");
		assert(rd[95:64] === 32'd94) $display("Block 2 Write Check"); else $display("Block 2 Write Fail");
		assert(rd[127:96] === 32'd98) $display("Block 3 Write Check"); else $display("Block 3 Write Fail");
	
	end

endmodule 