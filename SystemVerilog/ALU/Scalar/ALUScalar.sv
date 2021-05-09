module ALUScalar #(parameter N = 32) (input logic [N-1:0] A, B,
												  input logic [2:0] Sel,
												  output logic [N-1:0] C,
												  output logic NFlag,
												  output logic ZFlag,
												  output logic VFlag,
												  output logic CFlag);

			
	logic [N-1:0] resultAdd, resultSubtract, resultMultiply, resultDivide;
	logic CarryOutAdd, CarryOutSubtract, CarryOutMultiply, CarryOutDivide;
			
	Addition #(N) Ad(A, B, resultAdd, CarryOutAdd);
	Subtraction #(N) Su(A, B, resultSubtract, CarryOutSubtract);
	Multiplication #(N) Mu(A, B, resultMultiply, CarryOutMultiply);
	Division #(N) Di(A, B, resultDivide, CarryOutDivide);
	
	Mux8 #(N) M8('b0, A, resultAdd, resultSubtract, resultMultiply, resultDivide, 'b0, 'b0, Sel, C);
			
	NegativeFlag Ne(C[N-1], NFlag);
	ZeroFlag #(N) Ze(C, ZFlag);
	OverflowFlag oV(A[N-1], B[N-1], C[N-1], Sel, VFlag);
	CarryFlag Ca(CarryOutAdd, CarryOutSubtract, CarryOutMultiply, CarryOutDivide, Sel, CFlag);
					
endmodule 