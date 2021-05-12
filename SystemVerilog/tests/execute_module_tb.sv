module execute_module_tb();
	logic clk, rst,CondEn1;
	logic[1:0]jmpF1;
	logic [2:0]ALUIns1;
	logic [1:0]ExtndSel1;
	logic[3:0]R2_V2_D1,R3_V3_D1;
	logic [127:0]R2_V2_1,R3_V3_1;
	logic VF1,VF2,VF3;
	logic[3:0]R_V_dest2,R_V_dest3;
	logic[127:0]ALURES2,ResRV;
	logic JmpSel;
	logic[127:0]ALURES1;
	execute_module exmod(clk,rst,CondEn1,jmpF1,ALUIns1,
							ExtndSel1,R2_V2_D1,R3_V3_D1,
							R2_V2_1,R3_V3_1,VF1,
							VF2,R_V_dest2,ALURES2,
							VF3,R_V_dest3,ResRV,
							JmpSel,ALURES1);
	initial begin
		clk = 1'b1;
		rst = 1'b0;
		#1
		rst = 1'b1;
		#1
		rst = 1'b0;
		
		
		CondEn1 = 1'b0;
		jmpF1 = 1'b0;
		ALUIns1 = 3'b010;
		ExtndSel1 = 2'b00;
		R2_V2_D1 = 4'h2;
		R3_V3_D1 = 4'h3;
		R2_V2_1 = 128'hA;
		R3_V3_1 = 128'h2;
		VF1 = 1'b0;
		VF2 = 1'b0;
		R_V_dest2 = 4'h4;
		ALURES2 = 128'h0;
		VF3 = 1'b0;
		R_V_dest3 = 4'h4;
		ResRV = 128'h0;
		
		
		
	end
	always begin
		#1
		clk = ~clk;
	end
	
endmodule