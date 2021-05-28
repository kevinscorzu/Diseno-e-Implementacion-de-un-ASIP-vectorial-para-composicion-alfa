module PipelineFetch(input clk, rst, //rst is jmpenable
						input logic[31:0] curr_pc,ACIns,
						output logic[1:0]op,inst,output logic flagV,
						output logic[31:0]curr_pc1,output logic[3:0]R2_V2_D,R3_V3_D,R1_V1,
						output logic[26:0]Imme);
		always_ff@(posedge clk or posedge rst)
		if(rst) begin
			op = 2'h0;
			inst = 2'b10;
			flagV=1'b0;
			curr_pc1 = 32'b0;
			R2_V2_D = 4'h0;
			R3_V3_D = 4'h0;
			R1_V1 = 4'h0;
			Imme = 27'h0;
		end
		else begin
			op = ACIns[31:30];
			inst = ACIns[29:28];
			flagV = ACIns[27];
			curr_pc1 = curr_pc;
			R2_V2_D = ACIns[7:4];
			R3_V3_D = ACIns[11:8];
			R1_V1 = ACIns[3:0];
			Imme = ACIns[26:0];
		end
endmodule 