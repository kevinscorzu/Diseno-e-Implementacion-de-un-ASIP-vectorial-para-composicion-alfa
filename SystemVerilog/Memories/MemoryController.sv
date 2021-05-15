module MemoryController (input logic clk, we, vf, swInicio, swInR0, swInR25, swInR75, swInR100, swInG0, swInG25, swInG75, swInG100, swInB0, swInB25, swInB75, swInB100, swTD0, swTD25, swTD75, swTD100, swH, swV, swD, swP, 
								 input logic [127:0] addr, wd,
								 output logic [127:0] rd,
								 output logic [31:0] GPIO,
								 output logic GPIOEnR, GPIOEnG, GPIOEnB, GPIOEn);
						 
	logic [127:0] trueAddr, ROMRd, RAMRd;
						 
	DataMemory RAM(clk, we, vf, trueAddr, wd, RAMRd, GPIO, GPIOEnR, GPIOEnG, GPIOEnB);
	ImageROM ROM(clk, trueAddr, ROMRd);
	
	always_comb
		begin
			if (addr >= 'd0 && addr <= 'd119999)
				begin
					GPIOEn = 1'd0;
					trueAddr = addr;
					rd = ROMRd;
				end
			else if (addr >= 'd120000 && addr <= 'd240999)
				begin
					GPIOEn = 1'd0;
					trueAddr = addr - 'd120000;
					rd = RAMRd;
				end
			else if (addr == 'd241000)
				begin
					GPIOEn = 1'd0;
					trueAddr = 128'b0;
					rd = {127'b0, swInicio};
				end
			else if (addr == 'd241001)
				begin
					GPIOEn = 1'd0;
					trueAddr = 128'b0;
					rd = {127'b0, swInR0};
				end
			else if (addr == 'd241002)
				begin
					GPIOEn = 1'd0;
					trueAddr = 128'b0;
					rd = {127'b0, swInR25};
				end
			else if (addr == 'd241003)
				begin
					GPIOEn = 1'd0;
					trueAddr = 128'b0;
					rd = {127'b0, swInR75};
				end
			else if (addr == 'd241004)
				begin
					GPIOEn = 1'd0;
					trueAddr = 128'b0;
					rd = {127'b0, swInR100};
				end
			else if (addr == 'd241005)
				begin
					GPIOEn = 1'd0;
					trueAddr = 128'b0;
					rd = {127'b0, swInG0};
				end
			else if (addr == 'd241006)
				begin
					GPIOEn = 1'd0;
					trueAddr = 128'b0;
					rd = {127'b0, swInG25};
				end
			else if (addr == 'd241007)
				begin
					GPIOEn = 1'd0;
					trueAddr = 128'b0;
					rd = {127'b0, swInG75};
				end
			else if (addr == 'd241008)
				begin
					GPIOEn = 1'd0;
					trueAddr = 128'b0;
					rd = {127'b0, swInG100};
				end
			else if (addr == 'd241009)
				begin
					GPIOEn = 1'd0;
					trueAddr = 128'b0;
					rd = {127'b0, swInB0};
				end
			else if (addr == 'd241010)
				begin
					GPIOEn = 1'd0;
					trueAddr = 128'b0;
					rd = {127'b0, swInB25};
				end
			else if (addr == 'd241011)
				begin
					GPIOEn = 1'd0;
					trueAddr = 128'b0;
					rd = {127'b0, swInB75};
				end
			else if (addr == 'd241012)
				begin
					GPIOEn = 1'd0;
					trueAddr = 128'b0;
					rd = {127'b0, swInB100};
				end
			else if (addr == 'd241013)
				begin
					GPIOEn = 1'd0;
					trueAddr = 128'b0;
					rd = {127'b0, swTD0};
				end
			else if (addr == 'd241014)
				begin
					GPIOEn = 1'd0;
					trueAddr = 128'b0;
					rd = {127'b0, swTD25};
				end
			else if (addr == 'd241015)
				begin
					GPIOEn = 1'd0;
					trueAddr = 128'b0;
					rd = {127'b0, swTD75};
				end
			else if (addr == 'd241016)
				begin
					GPIOEn = 1'd0;
					trueAddr = 128'b0;
					rd = {127'b0, swTD100};
				end
			else if (addr == 'd241017)
				begin
					GPIOEn = 1'd0;
					trueAddr = 128'b0;
					rd = {127'b0, swH};
				end
			else if (addr == 'd241018)
				begin
					GPIOEn = 1'd0;
					trueAddr = 128'b0;
					rd = {127'b0, swV};
				end
			else if (addr == 'd241019)
				begin
					GPIOEn = 1'd0;
					trueAddr = 128'b0;
					rd = {127'b0, swD};
				end
			else if (addr == 'd241020)
				begin
					GPIOEn = 1'd0;
					trueAddr = 128'b0;
					rd = {127'b0, swP};
				end
			else if (addr == 'd241021)
				begin
					GPIOEn = 1'd1;
					trueAddr = 128'b0;
					rd = 128'b0;
				end
			else
				begin
					GPIOEn = 1'd0;
					trueAddr = 128'b0;
					rd = 128'b0;
				end
		end
						 
endmodule 