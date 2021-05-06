module ForwardUnitReg(input [31:0]R2res,R3res,input [3:0]R2,R3,
								input [3:0]DestR_2,input [31:0]ALURes,
								input [3:0]DestR_3,input [31:0]Res,
								input [3:0]DestR_4,input [31:0]Res1,
								output logic [31:0]R2res2,R3res2);
	logic [31:0]Wbres2;
	Mux2 #(32)WbR2(R2res,Res1,R2&DestR_4,Wbres2);
	logic [31:0]Exres2;
	Mux2 #(32)ExR2(Wbres2,Res,R2&DestR_3,Exres2);
	Mux2 #(32)MemR2(Exres2,ALURes,R2&DestR_2,R2res2);
	
	logic [31:0]Wbres3;
	Mux2 #(32)WbR3(R3res,Res1,R3&DestR_4,Wbres3);
	logic [31:0]Exres3;
	Mux2 #(32)ExR3(Wbres3,Res,R3&DestR_3,Exres3);
	Mux2 #(32)MemR3(Exres3,ALURes,R3&DestR_2,R3res2);
endmodule