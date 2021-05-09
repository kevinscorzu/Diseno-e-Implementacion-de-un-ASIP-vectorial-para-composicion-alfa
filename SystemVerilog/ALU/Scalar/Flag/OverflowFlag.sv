module OverflowFlag (input logic MSBA, MSBB, MSBC,
					  input logic [2:0] Sel, 
					  output logic Res);


	logic Operation, OpSigns, SignChange;

	assign Operation = Sel[2:1] == 2'b01; //verifica que el codigo de la operacion sea de suma o resta y guarda el resultado como un bool
	assign OpSigns = !(MSBA ^ Sel[0] ^ MSBB); // verifica si ambos signos son iguales 
	assign SignChange = (MSBA ^ MSBC); // verifica que el signo no cambiara en el resultado
	assign Res = Operation & OpSigns & SignChange;

endmodule 