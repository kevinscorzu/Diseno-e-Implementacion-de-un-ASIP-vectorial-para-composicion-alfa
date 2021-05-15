module DataMemory (input logic clk, we, vf,
						 input logic [127:0] addr, wd,
						 output logic [127:0] rd,
						 output logic [31:0] GPIO,
						 output logic GPIOEnR, GPIOEnG, GPIOEnB);
	
	// synthesis translate_off
				
	logic [7:0] RAM1R[9999:0];
	logic [7:0] RAM2R[9999:0];
	logic [7:0] RAM3R[9999:0];
	logic [7:0] RAM4R[9999:0];
	logic [7:0] RAM1G[9999:0];
	logic [7:0] RAM2G[9999:0];
	logic [7:0] RAM3G[9999:0];
	logic [7:0] RAM4G[9999:0];
	logic [7:0] RAM1B[9999:0];
	logic [7:0] RAM2B[9999:0];
	logic [7:0] RAM3B[9999:0];
	logic [7:0] RAM4B[9999:0];
	logic [31:0] RAMD[999:0];	
	
	always_ff @(negedge clk)
		begin
			if (addr >= 'd0 && addr <= 'd9999)
				begin
					if (we && !vf)
						RAM1R[addr] <= wd[7:0];
					else if (we && vf)
						begin
							RAM1R[addr] <= wd[7:0];
							RAM1R[addr + 'd1] <= wd[39:32];
							RAM1R[addr + 'd2] <= wd[71:64];
							RAM1R[addr + 'd3] <= wd[103:96];
						end
					rd <= {24'b0, RAM1R[addr + 'd3], 24'b0, RAM1R[addr + 'd2], 24'b0, RAM1R[addr + 'd1], 24'b0, RAM1R[addr]};
				end
	
			else if (addr >= 'd10000 && addr <= 'd19999)
				begin
					if (we && !vf)
						RAM2R[addr - 'd10000] <= wd[7:0];
					else if (we && vf)
						begin
							RAM2R[addr - 'd10000] <= wd[7:0];
							RAM2R[addr + 'd1 - 'd10000] <= wd[39:32];
							RAM2R[addr + 'd2 - 'd10000] <= wd[71:64];
							RAM2R[addr + 'd3 - 'd10000] <= wd[103:96];
						end
					rd <= {24'b0, RAM2R[addr + 'd3 - 'd10000], 24'b0, RAM2R[addr + 'd2 - 'd10000], 24'b0, RAM2R[addr + 'd1 - 'd10000], 24'b0, RAM2R[addr - 'd10000]};
				end
				
			else if (addr >= 'd20000 && addr <= 'd29999)
				begin
					if (we && !vf)
						RAM3R[addr - 'd20000] <= wd[7:0];
					else if (we && vf)
						begin
							RAM3R[addr - 'd20000] <= wd[7:0];
							RAM3R[addr + 'd1 - 'd20000] <= wd[39:32];
							RAM3R[addr + 'd2 - 'd20000] <= wd[71:64];
							RAM3R[addr + 'd3 - 'd20000] <= wd[103:96];
						end
					rd <= {24'b0, RAM3R[addr + 'd3 - 'd20000], 24'b0, RAM3R[addr + 'd2 - 'd20000], 24'b0, RAM3R[addr + 'd1 - 'd20000], 24'b0, RAM3R[addr - 'd20000]};
				end
					
			else if (addr >= 'd30000 && addr <= 'd39999)
				begin
					if (we && !vf)
						RAM4R[addr - 'd30000] <= wd[7:0];
					else if (we && vf)
						begin
							RAM4R[addr - 'd30000] <= wd[7:0];
							RAM4R[addr + 'd1 - 'd30000] <= wd[39:32];
							RAM4R[addr + 'd2 - 'd30000] <= wd[71:64];
							RAM4R[addr + 'd3 - 'd30000] <= wd[103:96];
						end
					rd <= {24'b0, RAM4R[addr + 'd3 - 'd30000], 24'b0, RAM4R[addr + 'd2 - 'd30000], 24'b0, RAM4R[addr + 'd1 - 'd30000], 24'b0, RAM4R[addr - 'd30000]};
				end
					
			else if (addr >= 'd40000 && addr <= 'd49999)
				begin
					if (we && !vf)
						RAM1G[addr - 'd40000] <= wd[7:0];
					else if (we && vf)
						begin
							RAM1G[addr - 'd40000] <= wd[7:0];
							RAM1G[addr + 'd1 - 'd40000] <= wd[39:32];
							RAM1G[addr + 'd2 - 'd40000] <= wd[71:64];
							RAM1G[addr + 'd3 - 'd40000] <= wd[103:96];
						end
					rd <= {24'b0, RAM1G[addr + 'd3 - 'd40000], 24'b0, RAM1G[addr + 'd2 - 'd40000], 24'b0, RAM1G[addr + 'd1 - 'd40000], 24'b0, RAM1G[addr - 'd40000]};
				end
					
			else if (addr >= 'd50000 && addr <= 'd59999)
				begin
					if (we && !vf)
						RAM2G[addr - 'd50000] <= wd[7:0];
					else if (we && vf)
						begin
							RAM2G[addr - 'd50000] <= wd[7:0];
							RAM2G[addr + 'd1 - 'd50000] <= wd[39:32];
							RAM2G[addr + 'd2 - 'd50000] <= wd[71:64];
							RAM2G[addr + 'd3 - 'd50000] <= wd[103:96];
						end
					rd <= {24'b0, RAM2G[addr + 'd3 - 'd50000], 24'b0, RAM2G[addr + 'd2 - 'd50000], 24'b0, RAM2G[addr + 'd1 - 'd50000], 24'b0, RAM2G[addr - 'd50000]};
				end
				
			else if (addr >= 'd60000 && addr <= 'd69999)
				begin
					if (we && !vf)
						RAM3G[addr - 'd60000] <= wd[7:0];
					else if (we && vf)
						begin
							RAM3G[addr - 'd60000] <= wd[7:0];
							RAM3G[addr + 'd1 - 'd60000] <= wd[39:32];
							RAM3G[addr + 'd2 - 'd60000] <= wd[71:64];
							RAM3G[addr + 'd3 - 'd60000] <= wd[103:96];
						end
					rd <= {24'b0, RAM3G[addr + 'd3 - 'd60000], 24'b0, RAM3G[addr + 'd2 - 'd60000], 24'b0, RAM3G[addr + 'd1 - 'd60000], 24'b0, RAM3G[addr - 'd60000]};
				end
				
			else if (addr >= 'd70000 && addr <= 'd79999)
				begin
					if (we && !vf)
						RAM4G[addr - 'd70000] <= wd[7:0];
					else if (we && vf)
						begin
							RAM4G[addr - 'd70000] <= wd[7:0];
							RAM4G[addr + 'd1 - 'd70000] <= wd[39:32];
							RAM4G[addr + 'd2 - 'd70000] <= wd[71:64];
							RAM4G[addr + 'd3 - 'd70000] <= wd[103:96];
						end
					rd <= {24'b0, RAM4G[addr + 'd3 - 'd70000], 24'b0, RAM4G[addr + 'd2 - 'd70000], 24'b0, RAM4G[addr + 'd1 - 'd70000], 24'b0, RAM4G[addr - 'd70000]};
				end
				
			else if (addr >= 'd80000 && addr <= 'd89999)
				begin
					if (we && !vf)
						RAM1B[addr - 'd80000] <= wd[7:0];
					else if (we && vf)
						begin
							RAM1B[addr - 'd80000] <= wd[7:0];
							RAM1B[addr + 'd1 - 'd80000] <= wd[39:32];
							RAM1B[addr + 'd2 - 'd80000] <= wd[71:64];
							RAM1B[addr + 'd3 - 'd80000] <= wd[103:96];
						end
					rd <= {24'b0, RAM1B[addr + 'd3 - 'd80000], 24'b0, RAM1B[addr + 'd2 - 'd80000], 24'b0, RAM1B[addr + 'd1 - 'd80000], 24'b0, RAM1B[addr - 'd80000]};
				end
					
			else if (addr >= 'd90000 && addr <= 'd99999)
				begin
					if (we && !vf)
						RAM2B[addr - 'd90000] <= wd[7:0];
					else if (we && vf)
						begin
							RAM2B[addr - 'd90000] <= wd[7:0];
							RAM2B[addr + 'd1 - 'd90000] <= wd[39:32];
							RAM2B[addr + 'd2 - 'd90000] <= wd[71:64];
							RAM2B[addr + 'd3 - 'd90000] <= wd[103:96];
						end
					rd <= {24'b0, RAM2B[addr + 'd3 - 'd90000], 24'b0, RAM2B[addr + 'd2 - 'd90000], 24'b0, RAM2B[addr + 'd1 - 'd90000], 24'b0, RAM2B[addr - 'd90000]};
				end
			
			else if (addr >= 'd100000 && addr <= 'd109999)
				begin
					if (we && !vf)
						RAM3B[addr - 'd100000] <= wd[7:0];
					else if (we && vf)
						begin
							RAM3B[addr - 'd100000] <= wd[7:0];
							RAM3B[addr + 'd1 - 'd100000] <= wd[39:32];
							RAM3B[addr + 'd2 - 'd100000] <= wd[71:64];
							RAM3B[addr + 'd3 - 'd100000] <= wd[103:96];
						end
					rd <= {24'b0, RAM3B[addr + 'd3 - 'd100000], 24'b0, RAM3B[addr + 'd2 - 'd100000], 24'b0, RAM3B[addr + 'd1 - 'd100000], 24'b0, RAM3B[addr - 'd100000]};
				end
					
			else if (addr >= 'd110000 && addr <= 'd119999)
				begin
					if (we && !vf)
						RAM4B[addr - 'd110000] <= wd[7:0];
					else if (we && vf)
						begin
							RAM4B[addr - 'd110000] <= wd[7:0];
							RAM4B[addr + 'd1 - 'd110000] <= wd[39:32];
							RAM4B[addr + 'd2 - 'd110000] <= wd[71:64];
							RAM4B[addr + 'd3 - 'd110000] <= wd[103:96];
						end
					rd <= {24'b0, RAM4B[addr + 'd3 - 'd110000], 24'b0, RAM4B[addr + 'd2 - 'd110000], 24'b0, RAM4B[addr + 'd1 - 'd110000], 24'b0, RAM4B[addr - 'd110000]};
				end
					
			else if (addr >= 'd120000 && addr <= 'd120999)
				begin
					if (we && !vf)
						RAMD[addr - 'd120000] <= wd[31:0];
					else if (we && vf)
						begin
							RAMD[addr - 'd120000] <= wd[31:0];
							RAMD[addr + 'd1 - 'd120000] <= wd[63:32];
							RAMD[addr + 'd2 - 'd120000] <= wd[95:64];
							RAMD[addr + 'd3 - 'd120000] <= wd[127:96];
						end
					rd <= {RAMD[addr + 'd3 - 'd120000], RAMD[addr + 'd2 - 'd120000], RAMD[addr + 'd1 - 'd120000], RAMD[addr - 'd120000]};
				end
				
			else
				rd <= 128'b0;			
		end
			
	// synthesis translate_on
		
	always_comb
		begin
			if (addr >= 'd0 && addr <= 'd39999 && we == 1'b1 && vf == 1'b0)
				begin
					GPIO = {24'b0, wd[7:0]};
					GPIOEnR = we;
					GPIOEnG = 1'b0;
					GPIOEnB = 1'b0;
				end
			else if (addr >= 'd40000 && addr <= 'd79999 && we == 1'b1 && vf == 1'b0)
				begin
					GPIO = {24'b0, wd[7:0]};
					GPIOEnR = 1'b0;
					GPIOEnG = we;
					GPIOEnB = 1'b0;
				end
			else if (addr >= 'd80000 && addr <= 'd119999 && we == 1'b1 && vf == 1'b0)
				begin
					GPIO = {24'b0, wd[7:0]};
					GPIOEnR = 1'b0;
					GPIOEnG = 1'b0;
					GPIOEnB = we;
				end
			else if (addr >= 'd0 && addr <= 'd39999 && we == 1'b1 && vf == 1'b1)
				begin
					GPIO = {wd[103:96], wd[71:64], wd[39:32], wd[7:0]};
					GPIOEnR = we;
					GPIOEnG = 1'b0;
					GPIOEnB = 1'b0;
				end
			else if (addr >= 'd40000 && addr <= 'd79999 && we == 1'b1 && vf == 1'b1)
				begin
					GPIO = {wd[103:96], wd[71:64], wd[39:32], wd[7:0]};
					GPIOEnR = 1'b0;
					GPIOEnG = we;
					GPIOEnB = 1'b0;
				end
			else if (addr >= 'd80000 && addr <= 'd119999 && we == 1'b1 && vf == 1'b1)
				begin
					GPIO = {wd[103:96], wd[71:64], wd[39:32], wd[7:0]};
					GPIOEnR = 1'b0;
					GPIOEnG = 1'b0;
					GPIOEnB = we;
				end
			else
				begin
					GPIO = 32'b0;
					GPIOEnR = 1'b0;
					GPIOEnG = 1'b0;
					GPIOEnB = 1'b0;
				end
		end
		
		
endmodule 