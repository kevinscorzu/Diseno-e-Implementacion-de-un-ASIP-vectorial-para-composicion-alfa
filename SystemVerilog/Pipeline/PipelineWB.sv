module PipelineWB(input clk, rst,
						input wregi,input[31:0]Resi,input [3:0]DestRi,
						output logic wrego,output logic[31:0]Reso,output logic[3:0]DestRo);
	always_ff@(posedge clk or posedge rst)
		if(rst) begin
		Reso = 32'h00;
		DestRo = 4'h0;
		wrego = 1'b0;
		end
		else begin
		Reso = Resi;
		DestRo =DestRi;
		wrego = wregi;
		end
endmodule 