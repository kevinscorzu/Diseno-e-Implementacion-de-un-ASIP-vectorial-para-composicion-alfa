module SelectRegisterFile (input logic wreg, vf,
									output logic enreg, envec);
			
	assign enreg = wreg && !vf;
	assign envec = wreg && vf;
			
endmodule 