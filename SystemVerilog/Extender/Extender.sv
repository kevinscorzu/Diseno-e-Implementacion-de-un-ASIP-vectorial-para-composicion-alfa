module Extender (input logic [26:0] inmeIn,
				     input logic [1:0] Sel,
					  output logic [31:0] inmeOut);
	
	always_comb
		case(Sel)
		// 23 bits
		2'b01: inmeOut = {{9{inmeIn[26]}}, inmeIn[26:4]};
		// 27 bits
		2'b11: inmeOut = {{5{inmeIn[26]}}, inmeIn[26:0]};		
		default: inmeOut = 'b0;
		endcase
		
endmodule 