module MemoryController (input logic clk, we, vf, swInicio, swInR0, swInR25, swInR75, swInR100, swInG0, swInG25, swInG75, swInG100, swInB0, swInB25, swInB75, swInB100, swTD0, swTD25, swTD75, swTD100, swH, swV, swD, swP, 
								 input logic [127:0] addr, wd,
								 output logic [127:0] rd,
								 output logic [31:0] GPIO,
								 output logic GPIOEnR, GPIOEnG, GPIOEnB);
						 
	logic [127:0] trueAddr, ROMRd, RAMRd;
						 
	DataMemory RAM(clk, we, vf, trueAddr, wd, RAMRd, GPIO, GPIOEnR, GPIOEnG, GPIOEnB);
	ImageROM ROM(trueAddr, ROMRd);
	
	always_comb
		begin
			if (addr >= 'd0 && addr <= 'd119999)
				begin
					trueAddr = addr;
					rd = ROMRd;
				end
			else if (addr >= 'd120000 && addr <= 'd240999)
				begin
					trueAddr = addr - 'd120000;
					rd = RAMRd;
				end
			else if (addr == 'd241000)
				begin
					trueAddr = 128'b0;
					rd = {127'b0, swInicio};
				end
			else if (addr == 'd241001)
				begin
					trueAddr = 128'b0;
					rd = {127'b0, swInR0};
				end
			else if (addr == 'd241002)
				begin
					trueAddr = 128'b0;
					rd = {127'b0, swInR25};
				end
			else if (addr == 'd241003)
				begin
					trueAddr = 128'b0;
					rd = {127'b0, swInR75};
				end
			else if (addr == 'd241004)
				begin
					trueAddr = 128'b0;
					rd = {127'b0, swInR100};
				end
			else if (addr == 'd241005)
				begin
					trueAddr = 128'b0;
					rd = {127'b0, swInG0};
				end
			else if (addr == 'd241006)
				begin
					trueAddr = 128'b0;
					rd = {127'b0, swInG25};
				end
			else if (addr == 'd241007)
				begin
					trueAddr = 128'b0;
					rd = {127'b0, swInG75};
				end
			else if (addr == 'd241008)
				begin
					trueAddr = 128'b0;
					rd = {127'b0, swInG100};
				end
			else if (addr == 'd241009)
				begin
					trueAddr = 128'b0;
					rd = {127'b0, swInB0};
				end
			else if (addr == 'd241010)
				begin
					trueAddr = 128'b0;
					rd = {127'b0, swInB25};
				end
			else if (addr == 'd241011)
				begin
					trueAddr = 128'b0;
					rd = {127'b0, swInB75};
				end
			else if (addr == 'd241012)
				begin
					trueAddr = 128'b0;
					rd = {127'b0, swInB100};
				end
			else if (addr == 'd241013)
				begin
					trueAddr = 128'b0;
					rd = {127'b0, swTD0};
				end
			else if (addr == 'd241014)
				begin
					trueAddr = 128'b0;
					rd = {127'b0, swTD25};
				end
			else if (addr == 'd241015)
				begin
					trueAddr = 128'b0;
					rd = {127'b0, swTD75};
				end
			else if (addr == 'd241016)
				begin
					trueAddr = 128'b0;
					rd = {127'b0, swTD100};
				end
			else if (addr == 'd241017)
				begin
					trueAddr = 128'b0;
					rd = {127'b0, swH};
				end
			else if (addr == 'd241018)
				begin
					trueAddr = 128'b0;
					rd = {127'b0, swV};
				end
			else if (addr == 'd241019)
				begin
					trueAddr = 128'b0;
					rd = {127'b0, swD};
				end
			else if (addr == 'd241020)
				begin
					trueAddr = 128'b0;
					rd = {127'b0, swP};
				end
			else
				begin
					trueAddr = 128'b0;
					rd = 128'b0;
				end
		end
						 
endmodule 