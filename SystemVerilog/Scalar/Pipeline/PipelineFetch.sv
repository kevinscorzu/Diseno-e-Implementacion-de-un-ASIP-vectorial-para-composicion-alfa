module PipelineFetch(input clk, rst,
						input logic[31:0] insti, curr_pci,
						output logic[31:0] insto, curr_pco);
		always_ff@(posedge clk or posedge rst)
		if(rst) begin
			insto = 32'b0;
			curr_pco = 32'b0;
		end
		else begin
			insto = insti;
			curr_pco = curr_pci;
		end
endmodule 