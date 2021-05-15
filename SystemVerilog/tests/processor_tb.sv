module processor_tb();
	logic clk, rst, swInicio, swInR0, swInR25, swInR75, swInR100, swInG0, swInG25, swInG75, swInG100, swInB0, swInB25, swInB75, swInB100, swTD0, swTD25, swTD75, swTD100, swH, swV, swD, swP, GPIOEnR, GPIOEnG, GPIOEnB, GPIOEn;
	logic [31:0] GPIO;
	processors proce(clk, rst, swInicio, swInR0, swInR25, swInR75, swInR100, swInG0, swInG25, swInG75, swInG100, swInB0, swInB25, swInB75, swInB100, swTD0, swTD25, swTD75, swTD100, swH, swV, swD, swP, GPIO, GPIOEnR, GPIOEnG, GPIOEnB, GPIOEn);
	initial begin
		clk = 1'b1;
		rst = 1'b0;
		swInicio = 1'b0;
		swInR0 = 1'b0;
		swInR25 = 1'b1;
		swInR75 = 1'b0;
		swInR100 = 1'b0;
		swInG0 = 1'b0;
		swInG25 = 1'b1;
		swInG75 = 1'b0;
		swInG100 = 1'b0;
		swInB0 = 1'b0;
		swInB25 = 1'b0;
		swInB75 = 1'b1;
		swInB100 = 1'b0;
		swTD0 = 1'b0;
		swTD25 = 1'b0;
		swTD75 = 1'b1;
		swTD100 = 1'b0;
		swH = 1'b0;
		swV = 1'b0;
		swD = 1'b1;
		swP = 1'b0;
		
		#1
		rst = 1'b1;
		
		#1
		rst = 1'b0;
		swInicio = 1'b1;
		
	end
	always begin
		#1
		clk = ~clk;
	end
	
	// synthesis translate_off
	
	int r, g, b, i, en;
	initial begin
		r = $fopen("outputR.txt", "w");
		g = $fopen("outputG.txt", "w");
		b = $fopen("outputB.txt", "w");
		i = 'd0;
		en = 'd0;
		#5;
		
		while (i < 'd40000)
			begin
				@(negedge clk);
					begin
						if (GPIOEn == 'd1)
							begin
								en = 'd1;
							end
						if (GPIOEnR == 'd1 && en == 'd1)
							begin
								$fwrite(r, "%h\n", GPIO[7:0]);
								$fwrite(r, "%h\n", GPIO[15:8]);
								$fwrite(r, "%h\n", GPIO[23:16]);
								$fwrite(r, "%h\n", GPIO[31:24]);
							end
						if (GPIOEnG == 'd1 && en == 'd1)
							begin
								$fwrite(g, "%h\n", GPIO[7:0]);
								$fwrite(g, "%h\n", GPIO[15:8]);
								$fwrite(g, "%h\n", GPIO[23:16]);
								$fwrite(g, "%h\n", GPIO[31:24]);
							end
						if (GPIOEnB == 'd1 && en == 'd1)
							begin
								$fwrite(b, "%h\n", GPIO[7:0]);
								$fwrite(b, "%h\n", GPIO[15:8]);
								$fwrite(b, "%h\n", GPIO[23:16]);
								$fwrite(b, "%h\n", GPIO[31:24]);
								i = i + 1;
							end
					end
			end
	
		$fclose(r);
		$fclose(g);
		$fclose(b);
		$finish;
			
	end
	
	// synthesis translate_on
	
endmodule 