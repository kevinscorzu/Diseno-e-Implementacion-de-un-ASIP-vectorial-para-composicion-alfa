module Extender_tb();

	logic[26:0] inmeIn;
	logic[1:0] Sel;
	logic[31:0] inmeOut;

	Extender DUT(inmeIn, Sel, inmeOut);

	initial begin
	
		inmeIn = 27'd0;
		inmeIn[8] = 1'd1;
		Sel = 2'd1;
		
		#10;
		
		assert(inmeOut === 32'd1) $display("Extender Check"); else $display("Extender Fail");
		
		#10;
		
		inmeIn = 27'd0;
		inmeIn[4] = 1'd1;
		Sel = 2'd2;
		
		#10;
		
		assert(inmeOut === 32'd1) $display("Extender Check"); else $display("Extender Fail");
		
		#10;
		
		inmeIn = 27'd0;
		inmeIn[0] = 1'd1;
		Sel = 2'd3;
		
		#10;
		
		assert(inmeOut === 32'd1) $display("Extender Check"); else $display("Extender Fail");
	
	end

endmodule 