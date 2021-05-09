module MemoryController (input logic clk, we, swInicio, swInR0, swInR25, swInR75, swInR100, swInG0, swInG25, swInG75, swInG100, swInB0, swInB25, swInB75, swInB100, swTD0, swTD25, swTD75, swTD100, swH, swV, swD, swP, 
								 input logic [127:0] addr, wd,
								 output logic [31:0] rd, output logic [7:0] GPIO, output logic GPIOEn);
						 
//	logic [31:0] trueAddr, ROMRd, RAMRd;
//						 
//	DataMemory RAM(clk, we, trueAddr, wd, RAMRd, GPIO,GPIOEn);
//	ImageROM ROM(trueAddr, ROMRd);
//	
//	always_comb
//		begin
//			if (addr >= 'd0 && addr <= 'd39999)
//				begin
//					trueAddr = addr;
//					rd = ROMRd;
//				end
//			else if (addr >= 'd0 && addr <= 'd39999)
//				begin
//					trueAddr = addr;
//					rd = ROMRd;
//				end
//			else if (addr >= 'd0 && addr <= 'd39999)
//				begin
//					trueAddr = addr;
//					rd = ROMRd;
//				end
//			else if (addr >= 'd152100 && addr <= 'd305735)
//				begin
//					trueAddr = addr - 'd152100;
//					rd = RAMRd;
//				end
//			else if (addr == 'd305736)
//				begin
//					trueAddr = 32'b0;
//					rd = {31'b0, switch};
//				end
//			else
//				begin
//					trueAddr = 32'b0;
//					rd = 32'b0;
//				end
//		end
						 
endmodule 