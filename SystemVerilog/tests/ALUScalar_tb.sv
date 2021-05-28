module ALUScalar_tb();

	logic[31:0] A, B, C;
	logic[2:0] Sel;
	logic[3:0] Flags;

	ALUScalar #(32) DUT(A, B, Sel, C, Flags);
	
	initial begin
	
		A = 32'd10;
		B = 32'd2;
		Sel = 3'd0;
		
		#10;
		
		assert(C === 32'd0) $display("Op 0 Check"); else $display("Op 0 Fail");
		
		#10;
		
		Sel = 3'd1;
		
		#10;
		
		assert(C === 32'd10) $display("Op 1 Check"); else $display("Op 1 Fail");
		
		#10;
		
		Sel = 3'd2;
		
		#10;
		
		assert(C === 32'd12) $display("Op 2 Check"); else $display("Op 2 Fail");
		
		#10;
		
		Sel = 3'd3;
		
		#10;
		
		assert(C === 32'd8) $display("Op 3 Check"); else $display("Op 3 Fail");
		
		#10;
		
		Sel = 3'd4;
		
		#10;
		
		assert(C === 32'd20) $display("Op 4 Check"); else $display("Op 4 Fail");
		
		#10;
		
		Sel = 3'd5;
		
		#10;
		
		assert(C === 32'd5) $display("Op 5 Check"); else $display("Op 5 Fail");
		
		#10;
		
		Sel = 3'd6;
		
		#10;
		
		assert(C === 32'd0) $display("Op 6 Check"); else $display("Op 6 Fail");
		
		#10;
		
		Sel = 3'd7;
		
		#10;
		
		assert(C === 32'd2) $display("Op 7 Check"); else $display("Op 7 Fail");
	
	end

endmodule 