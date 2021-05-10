module PipelineMem(input clk, rst,//rst is jmpenable
						input wmemi,rmemi,wregi,wpci,CondEni,immFi,input[1:0] jmpi,input [2:0]ALUInsi,input [31:0]R2ri,R3ri,input [3:0] R2i,R3i,DestRi,input[1:0]ExtndSeli,
						output logic wmemo,rmemo,wrego,wpco,CondEno,immFo,output logic[1:0] jmpo,output logic[2:0]ALUInso,output logic[31:0]R2ro,R3ro,output logic[3:0] R2o,R3o,DestRo ,output logic [1:0]ExtndSelo);
		always_ff@(posedge clk or posedge rst)
		if(rst) begin
			R2ro = 32'h0;
			R3ro = 32'h0;
			ALUInso = 3'h0;
			R2o = 4'h0;
			R3o = 4'h0;
			DestRo =4'h0;
			wmemo = 1'b0;
			rmemo = 1'b0;
			wrego = 1'b0;
			jmpo = 1'b0;
			wpco = 1'b0;
			CondEno = 1'b0;
			immFo = 1'b0;
			ExtndSelo = 2'b00;
		end
		else begin
			R2ro = R2ri;
			R3ro = R3ri;
			ALUInso = ALUInsi;
			R2o = R2i;
			R3o = R3i;
			DestRo = DestRi;
			wmemo = wmemi;
			rmemo = rmemi;
			wrego = wregi;
			jmpo = jmpi;
			wpco = wpci;
			CondEno = CondEni;
			immFo = immFi;
			ExtndSelo=ExtndSeli;
		end
endmodule