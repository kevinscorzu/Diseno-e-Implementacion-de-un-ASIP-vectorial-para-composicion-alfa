module ImageROM_tb();

	logic clk;
	logic[127:0] addr, rd;

	ImageROM DUT(clk, addr, rd);
	
	initial begin
		
		clk = 1'b1;
		addr = 128'd0;
 		
		#10;

		clk = 1'b0;
		
		#10;
		
		clk = 1'b1;
		addr = 128'd10000;
		
		#10;
		
		clk = 1'b0;
		
		#10;
		
		clk = 1'b1;
		addr = 128'd20000;
	
		#10;
		
		clk = 1'b0;
	
	end

endmodule 