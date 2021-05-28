module MemoryController_tb();

	logic clk, we, vf, swInicio, swInR0, swInR25, swInR75, swInR100, swInG0, swInG25, swInG75, swInG100, swInB0, swInB25, swInB75, swInB100, swTD0, swTD25, swTD75, swTD100, swH, swV, swD, swP, GPIOEnR, GPIOEnG, GPIOEnB;
	logic[31:0] GPIO;
	logic[127:0] addr, wd, rd;

	MemoryController DUT(clk, we, vf, swInicio, swInR0, swInR25, swInR75, swInR100, swInG0, swInG25, swInG75, swInG100, swInB0, swInB25, swInB75, swInB100, swTD0, swTD25, swTD75, swTD100, swH, swV, swD, swP, addr, wd, rd, GPIO, GPIOEnR, GPIOEnG, GPIOEnB);
	
	initial begin
		
		clk = 1'b1;
		we = 1'b1;
		vf = 1'b1;
		addr = 128'd120000;
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