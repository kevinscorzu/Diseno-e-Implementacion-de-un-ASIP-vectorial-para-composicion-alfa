module ExtendDeco(input[1:0] in,output logic [1:0] out);
	always @(in) begin
		case(in)
			2'b01 : out = 2'b00; //19 bits
			2'b11 : out = 2'b01; //23 bits
			2'b00 : out = 2'b11; //27 bits
			default  : out= 2'b10; //NO immediate
		endcase
	end
endmodule