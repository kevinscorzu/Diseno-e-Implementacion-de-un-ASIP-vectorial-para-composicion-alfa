module ForwardUnit(input [31:0]R2res1,R3res1,input [3:0]R2_2,R3_2,input[1:0]ExtndSel1,
							input VF,
											input [3:0]DestR_3,input [31:0]Res,
											input [3:0]DestR_4,input [31:0]Res1,
											output logic [31:0]R2res2,R3res2);
	logic [31:0]Wbres2; //Writeback for 2, used for DT and DI
	Mux2 #(32)WbR2(R2res1,Res1,(R2_2  != 4'h00)&(R2_2  == DestR_4)&ExtndSel1[1],Wbres2);
	Mux2 #(32)ExR2(Wbres2,Res,(R2_2  != 4'h00)&(R2_2 == DestR_3)&ExtndSel1[1],R2res2);

	logic [31:0]Wbres3; //Writeback for 3, only used for DT instructions
	Mux2 #(32)WbR3(R3res1,Res1,(R3_2  != 4'h00)&(R3_2  == DestR_4 )&(ExtndSel1[1]&~ExtndSel1[0]),Wbres3);
	Mux2 #(32)ExR3(Wbres3,Res,(R3_2  != 4'h00)&(R3_2 == DestR_3)&(ExtndSel1[1]&~ExtndSel1[0]),R3res2);
endmodule 