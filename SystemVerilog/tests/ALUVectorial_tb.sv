module ALUVectorial_tb();

	logic[127:0] A, B, C;
	logic[2:0] Sel;

	ALUVectorial #(128) DUT(A, B, Sel, C);
	
	initial begin
	
		A[31:0] = 32'd10;
		A[63:32] = 32'd10;
		A[95:64] = 32'd10;
		A[127:96] = 32'd10;
		
		B[31:0] = 32'd2;
		B[63:32] = 32'd2;
		B[95:64] = 32'd2;
		B[127:96] = 32'd2;
		
		Sel = 3'd0;
		
		#10;
		
		assert(C[31:0] === 32'd0) $display("Op 0 Block 0 Check"); else $display("Op 0 Block 0 Fail");
		assert(C[63:32] === 32'd0) $display("Op 0 Block 0 Check"); else $display("Op 0 Block 0 Fail");
		assert(C[95:64] === 32'd0) $display("Op 0 Block 0 Check"); else $display("Op 0 Block 0 Fail");
		assert(C[127:96] === 32'd0) $display("Op 0 Block 0 Check"); else $display("Op 0 Block 0 Fail");
		
		#10;
		
		Sel = 3'd1;
		
		#10;
		
		assert(C[31:0] === 32'd10) $display("Op 1 Block 1 Check"); else $display("Op 1 Block 1 Fail");
		assert(C[63:32] === 32'd10) $display("Op 1 Block 1 Check"); else $display("Op 1 Block 1 Fail");
		assert(C[95:64] === 32'd10) $display("Op 1 Block 1 Check"); else $display("Op 1 Block 1 Fail");
		assert(C[127:96] === 32'd10) $display("Op 1 Block 1 Check"); else $display("Op 1 Block 1 Fail");
		
		#10;
		
		Sel = 3'd2;
		
		#10;
		
		assert(C[31:0] === 32'd12) $display("Op 2 Block 2 Check"); else $display("Op 2 Block 2 Fail");
		assert(C[63:32] === 32'd12) $display("Op 2 Block 2 Check"); else $display("Op 2 Block 2 Fail");
		assert(C[95:64] === 32'd12) $display("Op 2 Block 2 Check"); else $display("Op 2 Block 2 Fail");
		assert(C[127:96] === 32'd12) $display("Op 2 Block 2 Check"); else $display("Op 2 Block 2 Fail");
		
		#10;
		
		Sel = 3'd3;
		
		#10;
		
		assert(C[31:0] === 32'd8) $display("Op 3 Block 3 Check"); else $display("Op 3 Block 3 Fail");
		assert(C[63:32] === 32'd8) $display("Op 3 Block 3 Check"); else $display("Op 3 Block 3 Fail");
		assert(C[95:64] === 32'd8) $display("Op 3 Block 3 Check"); else $display("Op 3 Block 3 Fail");
		assert(C[127:96] === 32'd8) $display("Op 3 Block 3 Check"); else $display("Op 3 Block 3 Fail");
		
		#10;
		
		Sel = 3'd4;
		
		#10;
		
		assert(C[31:0] === 32'd20) $display("Op 4 Block 4 Check"); else $display("Op 4 Block 4 Fail");
		assert(C[63:32] === 32'd20) $display("Op 4 Block 4 Check"); else $display("Op 4 Block 4 Fail");
		assert(C[95:64] === 32'd20) $display("Op 4 Block 4 Check"); else $display("Op 4 Block 4 Fail");
		assert(C[127:96] === 32'd20) $display("Op 4 Block 4 Check"); else $display("Op 4 Block 4 Fail");
		
		#10;
		
		Sel = 3'd5;
		
		#10;
		
		assert(C[31:0] === 32'd5) $display("Op 5 Block 5 Check"); else $display("Op 5 Block 5 Fail");
		assert(C[63:32] === 32'd5) $display("Op 5 Block 5 Check"); else $display("Op 5 Block 5 Fail");
		assert(C[95:64] === 32'd5) $display("Op 5 Block 5 Check"); else $display("Op 5 Block 5 Fail");
		assert(C[127:96] === 32'd5) $display("Op 5 Block 5 Check"); else $display("Op 5 Block 5 Fail");
		
		#10;
		
		Sel = 3'd6;
		
		#10;
		
		assert(C[31:0] === 32'd0) $display("Op 6 Block 6 Check"); else $display("Op 6 Block 6 Fail");
		assert(C[63:32] === 32'd0) $display("Op 6 Block 6 Check"); else $display("Op 6 Block 6 Fail");
		assert(C[95:64] === 32'd0) $display("Op 6 Block 6 Check"); else $display("Op 6 Block 6 Fail");
		assert(C[127:96] === 32'd0) $display("Op 6 Block 6 Check"); else $display("Op 6 Block 6 Fail");
		
		#10;
		
		Sel = 3'd7;
		
		#10;
		
		assert(C[31:0] === 32'd2) $display("Op 7 Block 7 Check"); else $display("Op 7 Block 7 Fail");
		assert(C[63:32] === 32'd2) $display("Op 7 Block 7 Check"); else $display("Op 7 Block 7 Fail");
		assert(C[95:64] === 32'd2) $display("Op 7 Block 7 Check"); else $display("Op 7 Block 7 Fail");
		assert(C[127:96] === 32'd2) $display("Op 7 Block 7 Check"); else $display("Op 7 Block 7 Fail");
	
	end

endmodule 