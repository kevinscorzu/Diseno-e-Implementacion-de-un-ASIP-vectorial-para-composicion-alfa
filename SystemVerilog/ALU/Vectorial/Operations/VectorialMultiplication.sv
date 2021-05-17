module VectorialMultiplication #(parameter N = 32) (input logic [N-1:0] A, B,
																	 output logic [N-1:0] C);
															 
	assign C[31:0] = A[31:0] * B[31:0];
	assign C[63:32] = A[63:32] * B[31:0];
	assign C[95:64] = A[95:64] * B[31:0];
	assign C[127:96] = A[127:96] * B[31:0];
	
endmodule 