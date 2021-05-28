module ControlUnit_tb();
	logic[1:0]op,inst;
	logic flagV;
	logic wmem,rmem,wreg,CondEn,jmpSel,VF;
	logic[1:0]jmpF,RMuxSel;
	logic[2:0]ALUins;
	logic[1:0]ExtndSel;
	ControlUnit CUnit(op,inst,flagV,wmem,rmem,wreg,CondEn,jmpSel,VF,jmpF,RMuxSel,ALUins,ExtndSel);
	
	initial begin
		flagV=1'b0;
		#2//STR
		op = 2'b01;
		inst = 2'b00;
		#1
		assert( RMuxSel === 2'h0) $display("STR check");
		else $display("STR  fail");
		#2//LDR
		op = 2'b11;
		inst = 2'b01;
		#1
		assert( RMuxSel === 2'b00) $display("LDR check");
		else $display("LDR  fail");
		#2//MOVR
		op = 2'b11;
		inst = 2'b10;
		#1
		assert( RMuxSel === 2'b00) $display("MOVR check");
		else $display("MOVR  fail");
		#2//MOVI
		op = 2'b11;
		inst = 2'b11;
		#1
		assert( RMuxSel === 2'b00) $display("MOVI check");
		else $display("MOVI  fail");
		#2//ADD
		op = 2'b10;
		inst = 2'b00;
		#1
		assert( RMuxSel === 2'b00) $display("ADD check");
		else $display("ADD  fail");
		#2//SUB
		op = 2'b10;
		inst = 2'b01;
		#1
		assert( RMuxSel === 2'b00) $display("SUB check");
		else $display("SUB  fail");
		#2//MUL
		op = 2'b10;
		inst = 2'b10;
		#1
		assert( RMuxSel === 2'b00) $display("MUL check");
		else $display("MUL  fail");
		#2//DIV
		op = 2'b10;
		inst = 2'b11;
		#1
		assert( RMuxSel === 2'b00) $display("DIV check");
		else $display("DIV  fail");
		#2//CMPR
		op = 2'b01;
		inst = 2'b01;
		#1
		assert(RMuxSel === 2'b00) $display("CMPR check");
		else $display("CMPR  fail");
		#2//CMPI
		op = 2'b01;
		inst = 2'b10;
		#1
		assert( RMuxSel === 2'b00) $display("CMPI check");
		else $display("CMPI  fail");
		#2//JMP
		op = 2'b00;
		inst = 2'b00;
		#1
		assert( RMuxSel === 2'b00) $display("JMP check");
		else $display("JMP  fail");
		#2//JEQ
		op = 2'b00;
		inst = 2'b01;
		#1
		assert( RMuxSel === 2'b00) $display("JEQ check");
		else $display("JEQ  fail");
		#2//STL
		op = 2'b00;
		inst = 2'b10;
		#1
		assert( RMuxSel === 2'b00) $display("STL check");
		else $display("STL  fail");
		
		
		#2//STRV
		flagV = 1'b1;
		VF=1'b1;
		op = 2'b01;
		inst = 2'b00;
		#1
		assert( RMuxSel === 2'b01) $display("STRV check");
		else $display("STRV  fail");
		#2//LDRV
		op = 2'b11;
		inst = 2'b01;
		#1
		assert( RMuxSel === 2'b01) $display("LDRV check");
		else $display("LDRV  fail");
		#2//ADDVV
		op = 2'b10;
		inst = 2'b00;
		#1
		assert( RMuxSel === 2'b11) $display("ADDVV check");
		else $display("ADDVV  fail");
		#2//SUBVV
		op = 2'b10;
		inst = 2'b01;
		#1
		assert( RMuxSel === 2'b11) $display("SUBVV check");
		else $display("SUBVV  fail");
		#2//MULVE
		op = 2'b10;
		inst = 2'b10;
		#1
		assert( RMuxSel === 2'b10) $display("MULVE check");
		else $display("MULVE  fail");
		#2//DIVVE
		op = 2'b10;
		inst = 2'b11;
		#1
		assert( RMuxSel === 2'b10) $display("DIVVE check");
		else $display("DIVVE  fail");
	end
endmodule