module SelectRegisterFile_tb();

	logic wreg, vf, enreg, envec;

	SelectRegisterFile DUT(wreg, vf, enreg, envec);

	initial begin
	
		wreg = 1'd1;
		vf = 1'd1;
		
		#10;
		
		assert(envec === 1'd1) $display("Vec Reg Enable Check"); else $display("Vec Reg Enable Fail");
		assert(enreg === 1'd0) $display("Sca Reg Disable Check"); else $display("Vec Reg Disable Fail");
	
		#10;
		
		vf = 1'd0;
		
		#10;
		
		assert(envec === 1'd0) $display("Vec Reg Disable Check"); else $display("Vec Reg Disable Fail");
		assert(enreg === 1'd1) $display("Sca Reg Enable Check"); else $display("Vec Reg Enable Fail");
	
	end
	
endmodule 