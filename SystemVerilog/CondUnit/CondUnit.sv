module CondUnit(input clk,rst,CondEn1,input[1:0]jmpF,input[3:0]flags,
						output logic JmpSel);
	logic[3:0] flagso;
	always_comb begin
		if(jmpF == 2'b10)
			JmpSel = 1'b1;
		else if((jmpF == 2'b11)&&(flagso[2] == 1'b1))
			JmpSel = 1'b1;
		else
			JmpSel = 1'b0;
		end
	FlipFlop #(4)flipiflopi(CondEn1&~clk,rst,flags,flagso);
endmodule