module Mux2 #(parameter N = 32) (input logic[N-1:0] result0, result1,
											input logic Sel,
											output logic[N-1:0] Out);
	always_comb
		case(Sel)
			1'd0 : Out = result0;
			1'd1 : Out = result1;
			default : Out = 'z;
		endcase		
endmodule 