module DataMemory_tb();

	logic clk, we, vf, GPIOEnR, GPIOEnG, GPIOEnB;
	logic[127:0] addr, wd, rd;
	logic[31:0] GPIO;

	DataMemory DUT(clk, we, vf, addr, wd, rd, GPIO, GPIOEnR, GPIOEnG, GPIOEnB);
	
	initial begin
		
		clk = 1'b1;
		we = 1'b0;
		vf = 1'b0;
		addr = 128'd0;
		wd = 128'd0;
		
		#10;
		
		wd = 128'd131;
		we = 1'b1;
		clk = 1'b0;
		
		#10;
		
		clk = 1'b1;
		we = 1'b0;
		addr = 128'd10000;
		wd = 128'd65;
		
		#10;
		
		clk = 1'b0;
		
		#10;
		
		addr = 128'd0;
		clk = 1'b1;
	
		#10;
		
		clk = 1'b0;
	
	end

endmodule 