module ControlUnit(input[1:0] op, input[1:0] inst, input VF,input memF,
						output wmemE, rmemE, wregE,CondEn,output[1:0] jmpF,
						output[2:0] ALUins, output[1:0] ExtndSel);
	logic[4:0] ALUinstE,ALUinstV;
	assign ALUinstE = {op,inst};
	assign wmemE = memF&~VF;
	assign rmemE = op[0]&op[1]&inst[0]&~inst[1]&~VF;
	assign wregE = (inst[1]&inst[0] | ~op[1]&op[0] | op[0]&inst[0] + op[0]&inst[1] + op[1]&~op[0])&~VF;
	assign jmpF[0] = ~op[0]&~op[1]&~inst[1];
	assign jmpF[1] = inst[0];
	assign CondEn = op[1]&op[0]&inst[1]&inst[0] | ~op[1]&op[0]&~inst[1]&inst[0];
	ExtendDeco ExtDeco(op, ExtndSel);
	InstDeco InstDecoO(ALUinstE, ALUinst);
endmodule