module memory_module(input clk, wmem2, rmem2, VF2, swInicio, swInR0, swInR25, swInR75, swInR100, swInG0, swInG25, swInG75, swInG100, swInB0, swInB25, swInB75, swInB100, swTD0, swTD25, swTD75, swTD100, swH, swV, swD, swP,
							input[127:0]ALURES2,R3_V3_3,
							output[127:0]ResRV,
							output[31:0]GPIO,
							output GPIOEnR, GPIOEnG, GPIOEnB, GPIOEn);
	logic[127:0]CS;
	MemoryController mc(clk, wmem2, VF2, swInicio, swInR0, swInR25, swInR75, swInR100, swInG0, swInG25, swInG75, swInG100, swInB0, swInB25, swInB75, swInB100, swTD0, swTD25, swTD75, swTD100, swH, swV, swD, swP, ALURES2, R3_V3_3, CS, GPIO, GPIOEnR, GPIOEnG, GPIOEnB, GPIOEn);
	Mux2 #(128)Memmux(ALURES2,CS,rmem2,ResRV); 
endmodule