module ZeroFlag #(parameter N = 32) (input logic [N-1:0] C,
											output logic Res);
													
	assign Res = (C == '0);
	
endmodule 