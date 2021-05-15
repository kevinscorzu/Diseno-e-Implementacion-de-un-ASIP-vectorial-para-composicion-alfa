module decode_module(input clk,input [1:0] op,inst, input flagV, input [3:0]R2_V2_D,R3_V3_D,R1_V1,
		input [26:0] Imme,input [31:0] curr_pc1,input[127:0]ResRV2,input[3:0]R_V_dest3,input VF3,Wreg3,
		output VF,wmem,rmem,wreg,CondEn,output[1:0]jmpF,output[2:0]ALUins,output[1:0]ExtndSel,
		output [127:0]R2_V2,R3_V3,output [3:0]R2_V2_D0,R3_V3_D0,R_V_dest);
		
		logic EnReg,EnVec;
		
		logic jmpSel;
		ControlUnit ctrlUnit(op,inst,flagV,
		wmem,rmem,wreg,CondEn,jmpSel,VF,jmpF,
		ALUins,ExtndSel);
		logic[31:0]R2r,R3r;
		RegisterFile regfile(clk,EnReg,R2_V2_D,R3_V3_D,R_V_dest3,ResRV2[31:0],R2r,R3r);
		logic[127:0]V2r,V3r;
		VectorialRegisterFile VRegFile(clk,EnVec,R2_V2_D,R3_V3_D,R_V_dest3,ResRV2,V2r,V3r);
		
		SelectRegisterFile selRegFile(Wreg3,VF3,EnReg,EnVec);
		logic[31:0]ExtndRes;
		Extender extnd(Imme,ExtndSel,ExtndRes);
		//Mux2 #(4)MuxRDest(R1_V1,{4'h0},ExtndSel[1]|ExtndSel[0],R_V_dest);
		assign R_V_dest = R1_V1;
		logic [31:0] PC_R2;
		Mux2 #(32)PCR2(R2r,curr_pc1,jmpSel,PC_R2);
		logic [31:0]R3_Im;
		Mux2 #(32)ExtndMux(R3r,ExtndRes,ExtndSel[1]|ExtndSel[0],R3_Im);
		Mux2 #(128)V2_R2Mux({96'h0,PC_R2},V2r,VF,R2_V2);
		Mux2 #(128)V3_R3Mux({96'h0,R3_Im},V3r,VF,R3_V3);
		Mux2 #(4)MuxAddrR2(R2_V2_D,4'h0,ExtndSel[1],R2_V2_D0);
		Mux2 #(4)MuxAddrR3(R3_V3_D,4'h0,ExtndSel[1]|ExtndSel[0],R3_V3_D0);
endmodule