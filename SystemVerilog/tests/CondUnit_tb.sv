module CondUnit_tb();
	logic clk,rst,CondEn1;
	logic [1:0]jmpF;
	logic [3:0]flags;
	logic JmpSel;
	CondUnit condtest(clk,rst,CondEn1,jmpF,flags,JmpSel);
	initial begin
		clk = 1'b1;
		rst = 1'b0;
		#1
		rst = 1'b1;
		#1
		rst = 1'b0;
		
		//check flipflop
		CondEn1 = 1'b1;
		jmpF = 2'b01;
		flags = 4'b1110;
		#10
		//check flipflop doesnt reset
		CondEn1 = 1'b0;
		#1
		jmpF = 2'b00;
		flags = 4'b0000;
		#2
		assert( JmpSel=== 1'h0) $display("Flipflop check");
		else $display("Flipflop  fail");
		#10
		rst = 1'b0;
		#1
		rst = 1'b1;
		#1
		rst = 1'b0;
		//check reset flipflop
		CondEn1 = 1'b1;
		jmpF = 2'b00;
		flags = 4'b0000;
		#2
		assert( JmpSel=== 1'h0) $display("Flipflop reset check");
		else $display("Flipflop reset fail");
		#10
		//Set Zero flag
		CondEn1 = 1'b1;
		jmpF = 2'b11;
		flags = 4'b0100;
		#2
		assert( JmpSel=== 1'h1) $display("Zero flag check");
		else $display("Zero flag fail");
		#10
		//Check cond jump
		CondEn1 = 1'b0;
		jmpF = 2'b01;
		flags = 4'b0000;
		assert( JmpSel=== 1'h1) $display("Jmp check");
		else $display("Jmp fail");
		#10
		//reset
		rst = 1'b1;
		#1
		rst = 1'b0;
		#10
		CondEn1 = 1'b0;
		jmpF = 2'b10;
		flags = 4'b0000;
	end
	always begin
		#1
		clk = ~clk;
	end
endmodule