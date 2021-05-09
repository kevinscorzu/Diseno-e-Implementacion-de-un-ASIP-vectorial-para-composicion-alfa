module Addition #(parameter N = 32) (input logic [N-1:0] A, B,
												 output logic [N-1:0] C,
												 output logic Cout);
												 
	assign {Cout, C} = A + B;

endmodule

