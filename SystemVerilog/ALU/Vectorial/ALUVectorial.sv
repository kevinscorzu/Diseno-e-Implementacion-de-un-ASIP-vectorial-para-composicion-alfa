module ALUVectorial #(parameter N = 128) (input logic [N-1:0] A, B,
													   input logic [2:0] Sel,
													   output logic [N-1:0] C);

			
	logic [N-1:0] resultAdd, resultSubtract, resultMultiply, resultDivide;
			
	VectorialAddition #(N) VAd(A, B, resultAdd);
	VectorialSubtraction #(N) VSu(A, B, resultSubtract);
	VectorialMultiplication #(N) VMu(A, B, resultMultiply);
	VectorialDivision #(N) VDi(A, B, resultDivide);
	
	Mux8 #(N) VM8('b0, A, resultAdd, resultSubtract, resultMultiply, resultDivide, 'b0, 'b0, Sel, C);
					
endmodule 