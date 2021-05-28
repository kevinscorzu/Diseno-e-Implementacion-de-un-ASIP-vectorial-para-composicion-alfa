module RegisterFile_tb();

	logic clk, we3;
	logic[3:0] ra1, ra2, wa3;
	logic[31:0] wd3, rd1, rd2;

	RegisterFile DUT(clk, we3, ra1, ra2, wa3, wd3, rd1, rd2);
	
	initial begin
	
		clk = 1'd1;
		we3 = 1'd1;
		wa3 = 4'd0;
		wd3 = 32'd10;
		
		#10;
		
		clk = 1'd0;
		
		#10;
		
		clk = 1'd1;
		ra1 = 4'd0;
		
		#10;
		
		assert(rd1 === 32'd10) $display("Register Check"); else $display("Register Fail");
	
	end

endmodule 