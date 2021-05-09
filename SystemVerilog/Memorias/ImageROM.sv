module ImageROM (input logic [31:0] addr,
					  output logic [31:0] rd);
	
	logic [7:0] ROM1[9999:0];
	logic [7:0] ROM2[9999:0];
	logic [7:0] ROM3[9999:0];
	logic [7:0] ROM4[9999:0];
	logic [7:0] ROM5[9999:0];
	logic [7:0] ROM6[9999:0];
	logic [7:0] ROM7[9999:0];
	logic [7:0] ROM8[9999:0];
	logic [7:0] ROM9[9999:0];
	logic [7:0] ROM10[9999:0];
	logic [7:0] ROM11[9999:0];
	logic [7:0] ROM12[9999:0];
	logic [7:0] ROM13[9999:0];
	logic [7:0] ROM14[9999:0];
	logic [7:0] ROM15[9999:0];
	logic [7:0] ROM16[2099:0];
	
	initial
		begin
		$readmemh("image1.txt", ROM1);
		$readmemh("image2.txt", ROM2);
		$readmemh("image3.txt", ROM3);
		$readmemh("image4.txt", ROM4);
		$readmemh("image5.txt", ROM5);
		$readmemh("image6.txt", ROM6);
		$readmemh("image7.txt", ROM7);
		$readmemh("image8.txt", ROM8);
		$readmemh("image9.txt", ROM9);
		$readmemh("image10.txt", ROM10);
		$readmemh("image11.txt", ROM11);
		$readmemh("image12.txt", ROM12);
		$readmemh("image13.txt", ROM13);
		$readmemh("image14.txt", ROM14);
		$readmemh("image15.txt", ROM15);
		$readmemh("image16.txt", ROM16);
		end
		
		
	always_comb
		begin
			if (addr >= 'd0 && addr <= 'd9999)
				rd = {24'b0, ROM1[addr]};
			else if (addr >= 'd10000 && addr <= 'd19999)
				rd = {24'b0, ROM2[addr - 'd10000]};
			else if (addr >= 'd20000 && addr <= 'd29999)
				rd = {24'b0, ROM3[addr - 'd20000]};
			else if (addr >= 'd30000 && addr <= 'd39999)
				rd = {24'b0, ROM4[addr - 'd30000]};
			else if (addr >= 'd40000 && addr <= 'd49999)
				rd = {24'b0, ROM5[addr - 'd40000]};
			else if (addr >= 'd50000 && addr <= 'd59999)
				rd = {24'b0, ROM6[addr - 'd50000]};
			else if (addr >= 'd60000 && addr <= 'd69999)
				rd = {24'b0, ROM7[addr - 'd60000]};
			else if (addr >= 'd70000 && addr <= 'd79999)
				rd = {24'b0, ROM8[addr - 'd70000]};
			else if (addr >= 'd80000 && addr <= 'd89999)
				rd = {24'b0, ROM9[addr - 'd80000]};
			else if (addr >= 'd90000 && addr <= 'd99999)
				rd = {24'b0, ROM10[addr - 'd90000]};
			else if (addr >= 'd100000 && addr <= 'd109999)
				rd = {24'b0, ROM11[addr - 'd100000]};
			else if (addr >= 'd110000 && addr <= 'd119999)
				rd = {24'b0, ROM12[addr - 'd110000]};
			else if (addr >= 'd120000 && addr <= 'd129999)
				rd = {24'b0, ROM13[addr - 'd120000]};
			else if (addr >= 'd130000 && addr <= 'd139999)
				rd = {24'b0, ROM14[addr - 'd130000]};
			else if (addr >= 'd140000 && addr <= 'd149999)
				rd = {24'b0, ROM15[addr - 'd140000]};
			else if (addr >= 'd150000 && addr <= 'd152099)
				rd = {24'b0, ROM16[addr - 'd150000]};
			else
				rd = 32'b0;
		end
		

	
endmodule 