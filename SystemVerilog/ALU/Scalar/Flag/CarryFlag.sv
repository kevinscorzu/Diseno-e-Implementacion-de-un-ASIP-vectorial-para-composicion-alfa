module CarryFlag (input logic CarryAdd, CarrySubtract, CarryMultipy, CarryDivide,
				  input logic [2:0] Sel, 
				  output logic Result);
			
	assign Result = (CarryAdd & (Sel == 3'b010)) | (CarrySubtract & (Sel == 3'b011)) | (CarryMultipy & (Sel == 3'b100)) | (CarryDivide & (Sel == 3'b101));
													
endmodule 