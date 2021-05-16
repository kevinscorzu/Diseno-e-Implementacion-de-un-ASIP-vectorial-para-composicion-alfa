module processors(input clk, rst, swInicio, swInR0, swInR25, swInR75, swInR100, swInG0, swInG25, swInG75, swInG100, swInB0, swInB25, swInB75, swInB100, swTD0, swTD25, swTD75, swTD100, swH, swV, swD, swP,
						output[31:0]GPIO,
						output GPIOEnR, GPIOEnG, GPIOEnB, GPIOEn);
	logic JmpSel1;
	logic[31:0]ALURES;
	logic[127:0]ALURES2;
	logic[3:0]R_V_dest2;
	logic VF2;
	logic [127:0]ResRV;
	logic wreg3;
	logic[127:0]ResRV2;
	logic[3:0]R_V_dest3;
	logic VF3;
	
	logic[31:0]curr_pc,ACIns;
	fetch_module fetch(clk,rst,JmpSel1,ALURES,
	curr_pc,ACIns);
	logic[1:0]op,inst;
	logic flagV;
	logic[31:0]curr_pc1;
	logic[3:0]R2_V2_D,R3_V3_D,R1_V1;
	logic[26:0]Imme;
	PipelineFetch pipeFetch(clk, rst|JmpSel1, //rst is jmpenable
	curr_pc,ACIns,
	op,inst,flagV,
	curr_pc1,R2_V2_D,R3_V3_D,R1_V1,
	Imme);
	logic VF,wmem,rmem,wreg,CondEn;
	logic[1:0]jmpF;
	logic[2:0]ALUIns;
	logic[1:0]ExtndSel;
	logic[127:0]R2_V2,R3_V3;
	logic[3:0]R2_V2_D0,R3_V3_D0,R_V_dest;
	decode_module decode(clk,op,inst,flagV,R2_V2_D,R3_V3_D,R1_V1,
	Imme,curr_pc1,ResRV2,R_V_dest3,VF3,wreg3,
	VF,wmem,rmem,wreg,CondEn,jmpF,ALUIns,ExtndSel,
	R2_V2,R3_V3,R2_V2_D0,R3_V3_D0,R_V_dest);
	logic rmem1,wmem1,wreg1,CondEn1;
	logic[1:0]jmpF1;
	logic[2:0]ALUIns1;
	logic[1:0]ExtenSel1;
	logic[3:0]R2_V2_D1,R3_V3_D1,R_V_dest1;
	logic[127:0]R2_V2_1,R3_V3_1;
	logic VF1;
	PipelineMem pipeMem(clk, rst,
						 VF,wmem,rmem,wreg,CondEn,jmpF,ALUIns,
						ExtndSel,R2_V2,R3_V3,
						R_V_dest,R2_V2_D0,R3_V3_D0,
						rmem1,wmem1,wreg1,CondEn1,
						jmpF1,ALUIns1,
						ExtenSel1,
						R2_V2_D1,R3_V3_D1,R_V_dest1,
						R2_V2_1,R3_V3_1,
						VF1);
	logic[127:0]R3_V3_2;

	
	logic[127:0]ALURES1;
	execute_module execute(clk,rst,CondEn1,jmpF1,ALUIns1,
							ExtenSel1,R2_V2_D1,R3_V3_D1,
							R2_V2_1,R3_V3_1,VF1,
							VF2,R_V_dest2,ResRV,
							VF3,R_V_dest3,ResRV2,
							R3_V3_2,
							JmpSel1,ALURES,ALURES1);
	logic rmem2,wmem2,wreg2;
	logic[127:0]R3_V3_3;
	
	
	PipelineEx pipeEx(clk, rst,
						rmem1,wmem1,wreg1,
						ALURES1,
						VF1,R_V_dest1,
						R3_V3_2,
						rmem2,wmem2,wreg2,
						ALURES2,R3_V3_3,
						R_V_dest2,
						VF2);
	
	memory_module memory(clk, wmem2, rmem2, VF2, swInicio, swInR0, swInR25, swInR75, swInR100, swInG0, swInG25, swInG75, swInG100, swInB0, swInB25, swInB75, swInB100, swTD0, swTD25, swTD75, swTD100, swH, swV, swD, swP, ALURES2, R3_V3_3, ResRV, GPIO, GPIOEnR, GPIOEnG, GPIOEnB, GPIOEn);
	
	
	
	
	PipelineWB pipewb(clk, rst,
						wreg2,
						ResRV,
						R_V_dest2,
						VF2,
						wreg3,
						ResRV2,
						R_V_dest3,
						VF3);
endmodule 