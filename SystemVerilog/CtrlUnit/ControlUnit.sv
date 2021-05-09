module ControlUnit(input[1:0] op, input[1:0] inst, input flagV,
						output wmemE, rmemE, wregE,CondEn,jmpSel,VF,output[1:0] jmpF,
						output[2:0] ALUins, output[1:0] ExtndSel);
	assign wmem = op[0]&op[1]&~inst[0]&~inst[1];
	assign rmemE = op[0]&op[1]&inst[0]&~inst[1];
	assign wregE = (inst[1]&inst[0] | ~op[1]&op[0] | op[0]&inst[0] + op[0]&inst[1] + op[1]&~op[0]);
	assign jmpF[0] = ~op[0]&~op[1]&~inst[1];
	assign jmpF[1] = ~op[0]&~op[1]&inst[0];
	assign jmpSel = jmpF[1]|jmpF[0];
	assign CondEn = op[1]&op[0]&inst[1]&inst[0] | ~op[1]&op[0]&~inst[1]&inst[0];
	assign VF = flagV;
	ExtendDeco ExtDeco(op, ExtndSel);
	InstDeco InstDecoO({op,inst}, ALUins);
endmodule