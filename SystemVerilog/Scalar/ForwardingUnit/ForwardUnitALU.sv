module ForwardUnitALU(input [31:0]R2res3,R3res3,input [3:0]R2_2,R3_2,input[1:0]ExtndSel1,input immF,
											input [3:0]DestR_3,input [31:0]Res,
											input [3:0]DestR_4,input [31:0]Res1,
											output logic [31:0]R2res4,R3res4);
	logic [31:0]Wbres2;
	Mux2 #(32)WbR2(R2res3,Res1,(R2_2  != 4'h00)&(R2_2  == DestR_4)&~(immF&ExtndSel1[1]),Wbres2);
	Mux2 #(32)ExR2(Wbres2,Res,(R2_2  != 4'h00)&(R2_2 == DestR_3)&~(immF&ExtndSel1[1]),R2res4);
	
	logic [31:0]Wbres3;
	Mux2 #(32)WbR3(R3res3,Res1,(R3_2  != 4'h00)&(R3_2  == DestR_4 )&(~immF|(~ExtndSel1[1]&~ExtndSel1[0])),Wbres3);
	Mux2 #(32)ExR3(Wbres3,Res,(R3_2  != 4'h00)&(R3_2 == DestR_3)&(~immF|(~ExtndSel1[1]&~ExtndSel1[0])),R3res4);
endmodule 