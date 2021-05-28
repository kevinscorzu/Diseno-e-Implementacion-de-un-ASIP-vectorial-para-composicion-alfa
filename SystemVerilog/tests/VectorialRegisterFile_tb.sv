module VectorialRegisterFile_tb();

	logic clk, we3;
	logic[3:0] ra1, ra2, wa3;
	logic[127:0] wd3, rd1, rd2;

	VectorialRegisterFile DUT(clk, we3, ra1, ra2, wa3, wd3, rd1, rd2);
	
	initial begin
	
		clk = 1'd1;
		we3 = 1'd1;
		wa3 = 4'd0;
		wd3[31:0] = 32'd1;
		wd3[63:32] = 32'd2;
		wd3[95:64] = 32'd3;
		wd3[127:96] = 32'd4;
		
		#10;
		
		clk = 1'd0;
		
		#10;
		
		clk = 1'd1;
		ra1 = 4'd0;
		
		#10;
		
		assert(rd1[31:0] === 32'd1) $display("Register Block 0 Check"); else $display("Register Block 0 Fail");
		assert(rd1[63:32] === 32'd2) $display("Register Block 1 Check"); else $display("Register Block 1 Fail");
		assert(rd1[95:64] === 32'd3) $display("Register Block 2 Check"); else $display("Register Block 2 Fail");
		assert(rd1[127:96] === 32'd4) $display("Register Block 3 Check"); else $display("Register Block 3 Fail");
	
	end

endmodule 