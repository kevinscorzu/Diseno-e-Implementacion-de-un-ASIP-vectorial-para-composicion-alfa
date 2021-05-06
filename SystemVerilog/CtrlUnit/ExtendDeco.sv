module ExtendDeco(input[1:0] in, output [1:0] out);
	always @(in) begin
		case(in)
			2'b01 : out = 2'b01; //22 bits
			2'b00 : out = 2'b11; //26 bits
			default  : out= 2'b00; //NO immediate
		endcase
	end
endmodule