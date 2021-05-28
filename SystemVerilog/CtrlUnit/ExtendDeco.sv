module ExtendDeco(input[3:0] in,output logic [1:0] out);
    always @(in) begin
        case(in)
            4'b0110 : out = 2'b01; //19 bits
            4'b1111 : out = 2'b10; //23 bits
            4'b0000 : out = 2'b11; //27 bits
            4'b0001 : out = 2'b11; //27 bits
            default  : out= 2'b00; //NO immediate
        endcase
    end
endmodule 