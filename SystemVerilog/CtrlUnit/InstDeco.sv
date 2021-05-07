module InstDeco(input [3:0]in,output [2:0]out);
	always @(in) begin
		case(in)
			4'b1100 : out = 3'b001; //Pass OP1
			4'b1101 : out = 3'b001; //Pass OP1
			4'b1110 : out = 3'b001; //Pass OP1
			4'b0100 : out = 3'b001; //Pass OP1
			4'b1000 : out = 3'b010; //ADD
			4'b1001 : out = 3'b011; //SUB
			4'b1010 : out = 3'b100; //MUL
			4'b1011 : out = 3'b101; //DIV
			4'b1111 : out = 3'b011; //SUB
			4'b0101 : out = 3'b011; //SUB
			4'b0000 : out = 3'b001; //PASS OP1
			4'b0001 : out = 3'b001; //PASS OP1
			default  : out= 3'b000; //Dont do anything
		endcase
	end
endmodule