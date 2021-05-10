module decode_module(input clk,input [1:0] op,inst, input flagV, input [3:0]R2_V2_D,R3_V3_D,R1_V1,
		input [26:0] Imme,input [31:0] curr_pc1,input[127:0]ResRV2,input[3:0]R_V_dest3,input VF3,
		output VF,wmem,rmem,wreg,CondEn,output[1:0]jmpF,output[2:0]ALUins,output[1:0]ExtndSel,
		output [127:0]R2_V2,R3_V3,output [3:0]R_V_dest);
		logic jmpSel;
		ControlUnit ctrlUnit(op,inst,flagV,
		wmem,rmem,wreg,CondEn,jmpSel,VF,jmpF,
		ALUins,ExtndSel);
		logic[31:0]R2r,R3r;
		RegisterFile regfile(clk,EnReg,R2_V2_D,R3_V3_D,R_V_dest3,ResRV2[31:0],R2r,R3r);
		logic[127:0]V2r,V3r;
		//VectorRegisterFile(clk,EnReg,R2_V2_D,R3_V3_D,R_V_dest3,ResRV2,R2r,R3r);
		//selectRegFile
		logic ExtndRes;
		//Extend extnd(Imme,ExtndSel,ExtndRes);
		logic EnReg,EnVec;
		//SelectRegFile(Wreg_3,VF3,EnReg,EnVec)
//		logic ;
		Mux2 #(32)MuxRDest(R1_V1,{4'h0},ExtndSel,R_V_dest);
		logic [31:0] PC_R2;
		Mux2 #(32)PCmux(curr_pc1,R2r,jmpSel,PC_R2);
		logic [31:0]R3_Im;
		Mux2 #(32)ExtndMux(R3r,ExtndRes,ExtndSel,R3_Im);
		Mux2 #(128)V2_R2Mux({PC_R2,96'h0},V2r,VF,R2_V2);
		Mux2 #(128)V3_R3Mux({R3_Im,96'h0},V3r,VF,R3_V3);
endmodule