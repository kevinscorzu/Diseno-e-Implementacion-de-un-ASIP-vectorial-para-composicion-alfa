module processor_tb();
	logic clk, rst, swInicio, swInR0, swInR25, swInR75, swInR100, swInG0, swInG25, swInG75, swInG100, swInB0, swInB25, swInB75, swInB100, swTD0, swTD25, swTD75, swTD100, swH, swV, swD, swP, GPIOEnR, GPIOEnG, GPIOEnB, GPIOEn;
	logic [127:0] GPIO;
	processors proce(clk, rst, swInicio, swInR0, swInR25, swInR75, swInR100, swInG0, swInG25, swInG75, swInG100, swInB0, swInB25, swInB75, swInB100, swTD0, swTD25, swTD75, swTD100, swH, swV, swD, swP, GPIO, GPIOEnR, GPIOEnG, GPIOEnB, GPIOEn);
	initial begin
		clk = 1'b1;
		rst = 1'b1;
		swInicio = 1'b0;
		swInR0 = 1'b0;
		swInR25 = 1'b0;
		swInR75 = 1'b0;
		swInR100 = 1'b1;
		swInG0 = 1'b0;
		swInG25 = 1'b0;
		swInG75 = 1'b0;
		swInG100 = 1'b1;
		swInB0 = 1'b0;
		swInB25 = 1'b0;
		swInB75 = 1'b0;
		swInB100 = 1'b1;
		swTD0 = 1'b0;
		swTD25 = 1'b0;
		swTD75 = 1'b1;
		swTD100 = 1'b0;
		swH = 1'b0;
		swV = 1'b0;
		swD = 1'b1;
		swP = 1'b0;
		
		#1
		rst = 1'b0;
		swInicio = 1'b1;
		
	end
	always begin
		#1
		clk = ~clk;
	end
	
	// synthesis translate_off
	
	int r, g, b, i, en, wr1, wr2, wr3, wr4, wg1, wg2, wg3, wg4, wb1, wb2, wb3, wb4;
	initial begin
		r = $fopen("outputR.txt", "w");
		g = $fopen("outputG.txt", "w");
		b = $fopen("outputB.txt", "w");
		i = 'd0;
		en = 'd0;
		wr1 = 8'd0;
		wr2 = 8'd0;
		wr3 = 8'd0;
		wr4 = 8'd0;
		wg1 = 8'd0;
		wg2 = 8'd0;
		wg3 = 8'd0;
		wg4 = 8'd0;
		wb1 = 8'd0;
		wb2 = 8'd0;
		wb3 = 8'd0;
		wb4 = 8'd0;
		#5;
		
		while (i < 'd30000)
			begin
				@(negedge clk);
					begin
						if (GPIOEn == 'd1)
							begin
								en = 'd1;
							end
						else if (GPIOEnR == 'd1 && en == 'd1)
							begin
								wr1 = GPIO[7:0];
								wr2 = GPIO[39:32];
								wr3 = GPIO[71:64];
								wr4 = GPIO[103:96];
			
								if (GPIO[31:0] > 'd255)
									wr1 = 8'd255;
									
								if (GPIO[63:32] > 'd255)
									wr2 = 8'd255;
									
								if (GPIO[95:64] > 'd255)
									wr3 = 8'd255;
									
								if (GPIO[127:96] > 'd255)
									wr4 = 8'd255;
								
								$fwrite(r, "%h\n", wr1);
								$fwrite(r, "%h\n", wr2);
								$fwrite(r, "%h\n", wr3);
								$fwrite(r, "%h\n", wr4);
								i = i + 1;
								
							end
						else if (GPIOEnG == 'd1 && en == 'd1)
							begin
								wg1= GPIO[7:0];
								wg2 = GPIO[39:32];
								wg3 = GPIO[71:64];
								wg4 = GPIO[103:96];
			
								if (GPIO[31:0] > 'd255)
									wg1 = 8'd255;
									
								if (GPIO[63:32] > 'd255)
									wg2 = 8'd255;
									
								if (GPIO[95:64] > 'd255)
									wg3 = 8'd255;
									
								if (GPIO[127:96] > 'd255)
									wg4 = 8'd255;
								
								$fwrite(g, "%h\n", wg1);
								$fwrite(g, "%h\n", wg2);
								$fwrite(g, "%h\n", wg3);
								$fwrite(g, "%h\n", wg4);
								i = i + 1;
								
							end
						else if (GPIOEnB == 'd1 && en == 'd1)
							begin
								wb1= GPIO[7:0];
								wb2 = GPIO[39:32];
								wb3 = GPIO[71:64];
								wb4 = GPIO[103:96];
			
								if (GPIO[31:0] > 'd255)
									wb1 = 8'd255;
									
								if (GPIO[63:32] > 'd255)
									wb2 = 8'd255;
									
								if (GPIO[95:64] > 'd255)
									wb3 = 8'd255;
									
								if (GPIO[127:96] > 'd255)
									wb4 = 8'd255;
								
								$fwrite(b, "%h\n", wb1);
								$fwrite(b, "%h\n", wb2);
								$fwrite(b, "%h\n", wb3);
								$fwrite(b, "%h\n", wb4);
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