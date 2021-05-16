module ControlUnit(input[1:0] op, input[1:0] inst, input flagV,
                        output wmem, rmem, wreg,CondEn,jmpSel,VF,output[1:0] jmpF, RMuxSel,
                        output[2:0] ALUins, output[1:0] ExtndSel,muxR);
    assign wmem = ~op[1]&op[0]&~inst[1]&~inst[0];
    assign rmem = op[1]&op[0]&~inst[1]&inst[0];
    assign wreg = op[1]&op[0]|op[1]&~op[0];
    assign jmpF[0] = ~op[0]&~op[1]&~inst[1]; //AnyJmp
    assign jmpF[1] = ~op[0]&~op[1]&~inst[1]&inst[0];//JempEq
    assign jmpSel = jmpF[1]|jmpF[0];
    assign CondEn = (~op[1]&op[0])&(inst[1]|inst[0]);
    assign VF = flagV;
    ExtendDeco ExtDeco({op,inst}, ExtndSel);
    InstDeco InstDecoO({op,inst}, ALUins);
	 muxRDeco MDECO({OP,INST,vf},muxR);
endmodule 