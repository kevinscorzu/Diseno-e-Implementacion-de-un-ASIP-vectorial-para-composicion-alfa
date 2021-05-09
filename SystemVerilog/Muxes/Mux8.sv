module Mux8 #(parameter N = 32) (input logic [N-1:0] Input0, Input1, Input2, Input3, Input4, Input5, Input6, Input7,
											input logic [2:0] Sel,
											output logic [N-1:0] Out);
	
	always_comb
		case(Sel)
			3'd0 : Out = Input0;
			3'd1 : Out = Input1;
			3'd2 : Out = Input2;
			3'd3 : Out = Input3;
			3'd4 : Out = Input4;
			3'd5 : Out = Input5;
			3'd6 : Out = Input6;
			3'd7 : Out = Input7;
			default : Out = '0;
		endcase
		
endmodule 