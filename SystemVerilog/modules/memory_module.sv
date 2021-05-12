module memory_module(input clk,wmem2,rmem2,GPI,input[127:0]ALURES2,R3_V3_3,
							output[127:0]ResRV,output GPO);
	logic[127:0]CS;
//	MemoryController();
	Mux2 #(128)Memmux(R3_V3_3,CS,rmem2,ResRV); 
endmodule