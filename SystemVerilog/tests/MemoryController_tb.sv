module MemoryController_tb();

	logic clk, we, vf, swInicio, swInR0, swInR25, swInR75, swInR100, swInG0, swInG25, swInG75, swInG100, swInB0, swInB25, swInB75, swInB100, swTD0, swTD25, swTD75, swTD100, swH, swV, swD, swP, GPIOEnR, GPIOEnG, GPIOEnB, GPIOEn;
	logic[127:0] GPIO, addr, wd, rd;

	MemoryController DUT(clk, we, vf, swInicio, swInR0, swInR25, swInR75, swInR100, swInG0, swInG25, swInG75, swInG100, swInB0, swInB25, swInB75, swInB100, swTD0, swTD25, swTD75, swTD100, swH, swV, swD, swP, addr, wd, rd, GPIO, GPIOEnR, GPIOEnG, GPIOEnB, GPIOEn);
	
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
		
		addr = 128'd120000;
		we = 1'b1;
		clk = 1'b1;
		vf = 1'b1;
		wd[31:0] = 32'd1;
		wd[63:32] = 32'd2;
		wd[95:64] = 32'd3;
		wd[127:96] = 32'd4;
	
		#10;
		
		clk = 1'b0;
		
		#10;
		
		we = 1'b0;
		vf = 1'b0;
		clk = 1'b1;
		
		#10;
		
		clk = 1'b0;
		
		#5;
		
		assert(rd[31:0] === 32'd1) $display("Block 0 Write Check"); else $display("Block 0 Write Fail");
		assert(rd[63:32] === 32'd2) $display("Block 1 Write Check"); else $display("Block 1 Write Fail");
		assert(rd[95:64] === 32'd3) $display("Block 2 Write Check"); else $display("Block 2 Write Fail");
		assert(rd[127:96] === 32'd4) $display("Block 3 Write Check"); else $display("Block 3 Write Fail");
		
		#10;
		
		swInicio = 1'd1;
		addr = 128'd241000;
		
		#5;
		
		assert(rd === 128'd1) $display("Read Check"); else $display("Read Fail");
	
	end

endmodule 