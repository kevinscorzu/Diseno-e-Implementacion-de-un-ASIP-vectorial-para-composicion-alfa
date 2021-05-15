module execute_module(input clk,rst,CondEn1,input[1:0]jmpF1,input[2:0]ALUIns1,
							input[1:0]ExtndSel1,input[3:0]R2_V2_D1,R3_V3_D1,
							input[127:0]R2_V2_1,R3_V3_1,input VF1,
							input VF2, input[3:0]R_V_dest2,input[127:0]ALURES2,
							input VF3, input[3:0]R_V_dest3,input[127:0]ResRV,
							output logic[127:0]R3_V3_2,
							output JmpSel,output[31:0]ALURES,output[127:0]ALURES1);
	logic[127:0] R2_V2_2;
	ForwardUnit frwunit(R2_V2_1,R3_V3_1,R2_V2_D1,R3_V3_D1,ExtndSel1,
								VF1,
								VF2,R_V_dest2,ALURES2,
								VF3,R_V_dest3,ResRV,
								R2_V2_2,R3_V3_2);
	logic[3:0]flags;
	ALUScalar ALUS(R2_V2_2[31:0],R3_V3_2[31:0],ALUIns1,ALURES,flags);
	logic[127:0]ALUVRES;
	ALUVectorial ALUV(R2_V2_2[31:0],R3_V3_2[31:0],ALUIns1,ALUVRES);
	Mux2 #(128)ALUMux({96'h0,ALURES},ALUVRES,VF1,ALURES1);
	CondUnit cond_Unit(clk,rst,CondEn1,jmpF1,flags,JmpSel);
endmodule