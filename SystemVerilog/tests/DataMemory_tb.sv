module DataMemory_tb();

	logic clk, we, vf, GPIOEnR, GPIOEnG, GPIOEnB;
	logic[31:0] GPIO;
	logic[127:0] addr, wd, rd;

	DataMemory DUT(clk, we, vf, addr, wd, rd, GPIO, GPIOEnR, GPIOEnG, GPIOEnB);
	
	initial begin
		
		clk = 1'b1;
		we = 1'b1;
		vf = 1'b1;
		addr = 128'd120000;
		//wd = 128'd131;
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
		
		#10;
		
		//addr = 128'd0;
		//clk = 1'b1;
	
		#10;
		
		//clk = 1'b0;
	
	end

endmodule 