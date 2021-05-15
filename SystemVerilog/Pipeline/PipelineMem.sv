module PipelineMem(input clk, rst,//rst is jmpenable
						input VF,wmem,rmem,wreg,CondEn,input[1:0]jmpF,input[2:0]ALUIns,
						input[1:0]ExtnSel,input[127:0]R2_V2,R3_V3,
						input [3:0] R_V_dest,R2_V2_D0,R3_V3_D0,
						output logic rmem1,wmem1,wreg1,CondEn1,
						output logic[1:0]jmpF1,output logic[2:0]ALUIns1,
						output logic[1:0]ExtenSel1,
						output logic[3:0]R2_V2_D1,R3_V3_D1,R_V_dest1,
						output logic[127:0]R2_V2_1,R2_V3_1,
						output logic VF1);
		always_ff@(posedge clk or posedge rst)
		if(rst) begin
			rmem1 = 1'b0;
			wmem1 = 1'b0;
			wreg1 = 1'b0;
			CondEn1 = 1'b0;
			jmpF1 = 2'h0;
			ALUIns1 = 3'h0;
			ExtenSel1 = 2'h0;
			R2_V2_D1 = 4'h0;
			R3_V3_D1 = 4'h0;
			R_V_dest1 = 4'h0;
			R2_V2_1 = 128'h0;
			R2_V3_1 = 128'h0;
			VF1 = 1'b0;
		end
		else begin
			rmem1 = rmem;
			wmem1 = wmem;
			wreg1 = wreg;
			CondEn1 = CondEn;
			jmpF1 = jmpF;
			ALUIns1 = ALUIns;
			ExtenSel1 = ExtnSel;
			R2_V2_D1 = R2_V2_D0;
			R3_V3_D1 = R3_V3_D0;
			R_V_dest1 = R_V_dest;
			R2_V2_1 = R2_V2;
			R2_V3_1 = R3_V3;
			VF1 = VF;
		end
endmodule