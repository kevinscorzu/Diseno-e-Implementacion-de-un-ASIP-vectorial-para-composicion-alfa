module PipelineWB(input clk, rst,
						input wreg2,
						input[127:0]ResRV,
						input[3:0]R_V_dest2,
						input VF2,
						output logic wreg3,
						output logic[127:0]ResRV2,
						output logic[3:0]R_V_dest3,
						output logic VF3);
	always_ff@(posedge clk or posedge rst)
		if(rst) begin
		wreg3 = 1'h0;
		ResRV2 = 128'h0;
		R_V_dest3 = 4'h0;
		VF3 = 1'h0;
		end
		else begin
		wreg3 = wreg2;
		ResRV2 = ResRV;
		R_V_dest3 = R_V_dest2;
		VF3 = VF2;
		end
endmodule 