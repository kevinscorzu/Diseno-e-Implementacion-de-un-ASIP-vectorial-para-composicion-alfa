module PipelineMem_tb();
	logic clk,rst,VF,wmem,rmem,wreg,CondEn;
	logic [1:0]jmpF;
	logic[2:0]ALUIns;
	logic[1:0]ExtnSel;
	logic[127:0]R2_V2,R3_V3;
	logic[3:0] R_V_dest,R2_V2_D0,R3_V3_D0;
	logic rmem1,wmem1,wreg1,CondEn1;
	logic[1:0]jmpF1;
	logic[2:0]ALUIns1;
	logic[1:0]ExtenSel1;
	logic[3:0]R2_V2_D1,R3_V3_D1,R_V_dest1;
	logic[127:0]R2_V2_1,R2_V3_1;
	logic VF1;
	PipelineMem tb(clk, rst,//rst is jmpenable
						VF,wmem,rmem,wreg,CondEn,jmpF,ALUIns,
						ExtnSel,R2_V2,R3_V3,
						R_V_dest,R2_V2_D0,R3_V3_D0,
						rmem1,wmem1,wreg1,CondEn1,
						jmpF1,ALUIns1,
						ExtenSel1,
						R2_V2_D1,R3_V3_D1,R_V_dest1,
						R2_V2_1,R2_V3_1,
						VF1);
	initial begin
		clk = 1'b1;
		rst = 1'b0;
		jmpF = 2'b00;
		#5
		jmpF = 2'b11;
		#5
		jmpF = 2'b10;
		#5
		jmpF = 2'b01;
	end
	always begin
		#1
		clk = ~clk;
	end
endmodule