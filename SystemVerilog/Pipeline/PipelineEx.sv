module PipelineEx( input clk, rst,
						input wmemi,rmemi,wregi,input[31:0]ALUResi,R3i,input[3:0]destRegi,
						output logic wrego,rmemo,wmemo,output logic[31:0]ALUReso,R3o,
						output logic[3:0] destRego);
	always_ff@(posedge clk or posedge rst)
		if(rst) begin
		ALUReso = 32'h00;
		R3o = 32'h00;
		destRego = 4'b0000;
		wrego = 1'b0;
		wmemo = 1'b0;
		rmemo = 1'b0;
		end
		else begin
		ALUReso = ALUResi;
		R3o = R3i;
		destRego = destRegi;
		wrego = wregi;
		wmemo = wmemi;
		rmemo = rmemi;
		end
endmodule 