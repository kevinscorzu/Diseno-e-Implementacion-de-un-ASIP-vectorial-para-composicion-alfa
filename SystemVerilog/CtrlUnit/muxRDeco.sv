module muxRDeco(input[4:0] in,output logic [1:0] out);
    always @(in) begin
        case(in)
            5'b10001 : out = 2'b11; //No R
            5'b10011 : out = 2'b11; //No R
            5'b10101 : out = 2'b10; //R3
            5'b10111 : out = 2'b10; //R3
				5'b01001 : out = 2'b01; //R2
				5'b11011 : out = 2'b01; //R2
            default  : out= 2'b00; //Both R
        endcase
    end
endmodule 