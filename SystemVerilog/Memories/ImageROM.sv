module ImageROM (input logic clk,
					  input logic we,
					  input logic [127:0] addr, wd,
					  output logic [127:0] rd);
	
	logic [7:0] ROM1R[9999:0];	
	logic [7:0] ROM2R[9999:0];
	logic [7:0] ROM3R[9999:0];
	logic [7:0] ROM4R[9999:0];
	logic [7:0] ROM1G[9999:0];
	logic [7:0] ROM2G[9999:0];
	logic [7:0] ROM3G[9999:0];
	logic [7:0] ROM4G[9999:0];
	logic [7:0] ROM1B[9999:0];
	logic [7:0] ROM2B[9999:0];
	logic [7:0] ROM3B[9999:0];
	logic [7:0] ROM4B[9999:0];
	
	initial
		begin
			$readmemh("image1R.txt", ROM1R);
			$readmemh("image2R.txt", ROM2R);
			$readmemh("image3R.txt", ROM3R);
			$readmemh("image4R.txt", ROM4R);
			$readmemh("image1G.txt", ROM1G);
			$readmemh("image2G.txt", ROM2G);
			$readmemh("image3G.txt", ROM3G);
			$readmemh("image4G.txt", ROM4G);
			$readmemh("image1B.txt", ROM1B);
			$readmemh("image2B.txt", ROM2B);
			$readmemh("image3B.txt", ROM3B);
			$readmemh("image4B.txt", ROM4B);
		end
		
	always_ff @(negedge clk)
		begin
			if (addr >= 'd0 && addr <= 'd9999)
				rd <= {24'b0, ROM1R[addr + 'd3], 24'b0, ROM1R[addr + 'd2], 24'b0, ROM1R[addr + 'd1], 24'b0, ROM1R[addr]};	
			else if (addr >= 'd10000 && addr <= 'd19999)
				rd <= {24'b0, ROM2R[addr + 'd3 - 'd10000], 24'b0, ROM2R[addr + 'd2 - 'd10000], 24'b0, ROM2R[addr + 'd1 - 'd10000], 24'b0, ROM2R[addr - 'd10000]};				
			else if (addr >= 'd20000 && addr <= 'd29999)
				rd <= {24'b0, ROM3R[addr + 'd3 - 'd20000], 24'b0, ROM3R[addr + 'd2 - 'd20000], 24'b0, ROM3R[addr + 'd1 - 'd20000], 24'b0, ROM3R[addr - 'd20000]};
			else if (addr >= 'd30000 && addr <= 'd39999)
				rd <= {24'b0, ROM4R[addr + 'd3 - 'd30000], 24'b0, ROM4R[addr + 'd2 - 'd30000], 24'b0, ROM4R[addr + 'd1 - 'd30000], 24'b0, ROM4R[addr - 'd30000]};
			else if (addr >= 'd40000 && addr <= 'd49999)
				rd <= {24'b0, ROM1G[addr + 'd3 - 'd40000], 24'b0, ROM1G[addr + 'd2 - 'd40000], 24'b0, ROM1G[addr + 'd1 - 'd40000], 24'b0, ROM1G[addr - 'd40000]};
			else if (addr >= 'd50000 && addr <= 'd59999)
				rd <= {24'b0, ROM2G[addr + 'd3 - 'd50000], 24'b0, ROM2G[addr + 'd2 - 'd50000], 24'b0, ROM2G[addr + 'd1 - 'd50000], 24'b0, ROM2G[addr - 'd50000]};
			else if (addr >= 'd60000 && addr <= 'd69999)
				rd <= {24'b0, ROM3G[addr + 'd3 - 'd60000], 24'b0, ROM3G[addr + 'd2 - 'd60000], 24'b0, ROM3G[addr + 'd1 - 'd60000], 24'b0, ROM3G[addr - 'd60000]};
			else if (addr >= 'd70000 && addr <= 'd79999)
				rd <= {24'b0, ROM4G[addr + 'd3 - 'd70000], 24'b0, ROM4G[addr + 'd2 - 'd70000], 24'b0, ROM4G[addr + 'd1 - 'd70000], 24'b0, ROM4G[addr - 'd70000]};
			else if (addr >= 'd80000 && addr <= 'd89999)
				rd <= {24'b0, ROM1B[addr + 'd3 - 'd80000], 24'b0, ROM1B[addr + 'd2 - 'd80000], 24'b0, ROM1B[addr + 'd1 - 'd80000], 24'b0, ROM1B[addr - 'd80000]};
			else if (addr >= 'd90000 && addr <= 'd99999)
				rd <= {24'b0, ROM2B[addr + 'd3 - 'd90000], 24'b0, ROM2B[addr + 'd2 - 'd90000], 24'b0, ROM2B[addr + 'd1 - 'd90000], 24'b0, ROM2B[addr - 'd90000]};
			else if (addr >= 'd100000 && addr <= 'd109999)
				rd <= {24'b0, ROM3B[addr + 'd3 - 'd100000], 24'b0, ROM3B[addr + 'd2 - 'd100000], 24'b0, ROM3B[addr + 'd1 - 'd100000], 24'b0, ROM3B[addr - 'd100000]};
			else if (addr >= 'd110000 && addr <= 'd119999)
				rd <= {24'b0, ROM4B[addr + 'd3 - 'd110000], 24'b0, ROM4B[addr + 'd2 - 'd110000], 24'b0, ROM4B[addr + 'd1 - 'd110000], 24'b0, ROM4B[addr - 'd110000]};
			else
				rd <= 128'b0;
		end
	
//	always_comb
//		begin
//			if (addr >= 'd0 && addr <= 'd9999)
//				rd = {24'b0, ROM1R[addr + 'd3], 24'b0, ROM1R[addr + 'd2], 24'b0, ROM1R[addr + 'd1], 24'b0, ROM1R[addr]};	
//			else if (addr >= 'd10000 && addr <= 'd19999)
//				rd = {24'b0, ROM2R[addr + 'd3 - 'd10000], 24'b0, ROM2R[addr + 'd2 - 'd10000], 24'b0, ROM2R[addr + 'd1 - 'd10000], 24'b0, ROM2R[addr - 'd10000]};				
//			else if (addr >= 'd20000 && addr <= 'd29999)
//				rd = {24'b0, ROM3R[addr + 'd3 - 'd20000], 24'b0, ROM3R[addr + 'd2 - 'd20000], 24'b0, ROM3R[addr + 'd1 - 'd20000], 24'b0, ROM3R[addr - 'd20000]};
//			else if (addr >= 'd30000 && addr <= 'd39999)
//				rd = {24'b0, ROM4R[addr + 'd3 - 'd30000], 24'b0, ROM4R[addr + 'd2 - 'd30000], 24'b0, ROM4R[addr + 'd1 - 'd30000], 24'b0, ROM4R[addr - 'd30000]};
//			else if (addr >= 'd40000 && addr <= 'd49999)
//				rd = {24'b0, ROM1G[addr + 'd3 - 'd40000], 24'b0, ROM1G[addr + 'd2 - 'd40000], 24'b0, ROM1G[addr + 'd1 - 'd40000], 24'b0, ROM1G[addr - 'd40000]};
//			else if (addr >= 'd50000 && addr <= 'd59999)
//				rd = {24'b0, ROM2G[addr + 'd3 - 'd50000], 24'b0, ROM2G[addr + 'd2 - 'd50000], 24'b0, ROM2G[addr + 'd1 - 'd50000], 24'b0, ROM2G[addr - 'd50000]};
//			else if (addr >= 'd60000 && addr <= 'd69999)
//				rd = {24'b0, ROM3G[addr + 'd3 - 'd60000], 24'b0, ROM3G[addr + 'd2 - 'd60000], 24'b0, ROM3G[addr + 'd1 - 'd60000], 24'b0, ROM3G[addr - 'd60000]};
//			else if (addr >= 'd70000 && addr <= 'd79999)
//				rd = {24'b0, ROM4G[addr + 'd3 - 'd70000], 24'b0, ROM4G[addr + 'd2 - 'd70000], 24'b0, ROM4G[addr + 'd1 - 'd70000], 24'b0, ROM4G[addr - 'd70000]};
//			else if (addr >= 'd80000 && addr <= 'd89999)
//				rd = {24'b0, ROM1B[addr + 'd3 - 'd80000], 24'b0, ROM1B[addr + 'd2 - 'd80000], 24'b0, ROM1B[addr + 'd1 - 'd80000], 24'b0, ROM1B[addr - 'd80000]};
//			else if (addr >= 'd90000 && addr <= 'd99999)
//				rd = {24'b0, ROM2B[addr + 'd3 - 'd90000], 24'b0, ROM2B[addr + 'd2 - 'd90000], 24'b0, ROM2B[addr + 'd1 - 'd90000], 24'b0, ROM2B[addr - 'd90000]};
//			else if (addr >= 'd100000 && addr <= 'd109999)
//				rd = {24'b0, ROM3B[addr + 'd3 - 'd100000], 24'b0, ROM3B[addr + 'd2 - 'd100000], 24'b0, ROM3B[addr + 'd1 - 'd100000], 24'b0, ROM3B[addr - 'd100000]};
//			else if (addr >= 'd110000 && addr <= 'd119999)
//				rd = {24'b0, ROM4B[addr + 'd3 - 'd110000], 24'b0, ROM4B[addr + 'd2 - 'd110000], 24'b0, ROM4B[addr + 'd1 - 'd110000], 24'b0, ROM4B[addr - 'd110000]};
//			else
//				rd = 128'b0;
//		end
		

	
endmodule 