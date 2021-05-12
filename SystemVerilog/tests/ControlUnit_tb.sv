module ControlUnit_tb();
	logic[1:0]op,inst;
	logic flagV;
	logic wmem,rmem,wreg,CondEn,jmpSel,VF;
	logic[1:0]jmpF;
	logic[2:0]ALUins;
	logic[1:0]ExtndSel;
	ControlUnit CUnit(op,inst,flagV,wmem,rmem,wreg,CondEn,jmpSel,VF,jmpF,ALUins,ExtndSel);
	initial begin
		flagV=1'b0;
		#2//STR
		op = 2'b01;
		inst = 2'b00;
		#2//LDR
		op = 2'b11;
		inst = 2'b01;
		#2//MOVR
		op = 2'b11;
		inst = 2'b10;
		#2//MOVI
		op = 2'b11;
		inst = 2'b11;
		#2//ADD
		op = 2'b10;
		inst = 2'b00;
		#2//SUB
		op = 2'b10;
		inst = 2'b01;
		#2//MUL
		op = 2'b10;
		inst = 2'b10;
		#2//DIV
		op = 2'b10;
		inst = 2'b11;
		#2//CMPR
		op = 2'b01;
		inst = 2'b01;
		#2//CMPI
		op = 2'b01;
		inst = 2'b10;
		#2//JMP
		op = 2'b00;
		inst = 2'b00;
		#2//JEQ
		op = 2'b00;
		inst = 2'b01;
		#2//STL
		op = 2'b00;
		inst = 2'b10;
		
		
		#2//STRV
		VF=1'b1;
		op = 2'b01;
		inst = 2'b00;
		#2//LDRV
		op = 2'b11;
		inst = 2'b01;
		#2//ADDVV
		op = 2'b10;
		inst = 2'b00;
		#2//SUBVV
		op = 2'b10;
		inst = 2'b01;
		#2//MULVE
		op = 2'b10;
		inst = 2'b10;
		#2//DIVVE
		op = 2'b10;
		inst = 2'b11;
	end
endmodule