module PipelineEx( input clk, rst,
						input logic rmem1,wmem1,wreg1,
						input logic[127:0]ALURES1,
						input logic VF1,
						input logic[3:0]R_V_dest1,
						input logic[127:0]R3_V3_2,
						output logic rmem2,wmem2,wreg2,
						output logic[127:0]ALURES2,R3_V3_3,
						output logic[3:0]R_V_dest2,
						output logic VF2);
	always_ff@(posedge clk or posedge rst)
		if(rst) begin
		rmem2 = 1'h0;
		wmem2 = 1'h0;
		wreg2 = 1'h0;
		ALURES2 = 128'h0;
		R3_V3_3 = 128'h0;
		R_V_dest2 = 4'h0;
		VF2 = 1'h0;
		end
		else begin
		rmem2 = rmem1;
		wmem2 = wmem1;
		wreg2 = wreg1;
		ALURES2 = ALURES1;
		R3_V3_3 = R3_V3_2;
		R_V_dest2 = R_V_dest1;
		VF2 = VF1;
		end
endmodule 