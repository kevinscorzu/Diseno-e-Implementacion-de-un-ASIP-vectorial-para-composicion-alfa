module frwrdUnit_tb();
logic[31:0]R2res3,R3res3;
logic[3:0]R2_2,R3_2;
logic [1:0]ExtndSel1;
logic immF;
logic [3:0]DestR_3;
logic  [31:0]Res;
logic [3:0]DestR_4;
logic[31:0]Res1;
logic[31:0]R2res4,R3res4;

ForwardUnitALU  fwrdU(R2res3,R3res3,R2_2,R3_2,ExtndSel1,immF,
											DestR_3,Res,
											DestR_4,Res1,
											R2res4,R3res4);
	initial begin
	immF=1'b0;
	R2res3=32'h10;
	R3res3=32'h564;
	R2_2=4'h5;
	R3_2=4'h6;
	ExtndSel1=2'b00;
	DestR_3=4'h5;
	Res=32'h15;
	DestR_4=4'h5;
	Res1=32'h16;
	#2
	assert( R2res4=== 32'h15) $display("Forward R2 check"); else $display("Forward R2  fail");
	#2
	immF=1'b0;
	R2res3=32'h10;
	R3res3=32'h564;
	R2_2=4'h5;
	R3_2=4'h6;
	ExtndSel1=2'b00;
	DestR_3=4'h4;
	Res=32'h15;
	DestR_4=4'h5;
	Res1=32'h16;
	#2
	assert( R2res4=== 32'h16) $display("Forward R2 check"); else $display("Forward R2  fail");
	#2
	immF=1'b0;
	R2res3=32'h10;
	R3res3=32'h11;
	R2_2=4'h5;
	R3_2=4'h6;
	ExtndSel1=2'b00;
	DestR_3=4'h6;
	Res=32'h15;
	DestR_4=4'h6;
	Res1=32'h16;
	#2
	assert( R3res4=== 32'h15) $display("Forward R3 check"); else $display("Forward R3  fail");
	#2
	immF=1'b1;
	R2res3=32'h10;
	R3res3=32'h11;
	R2_2=4'h5;
	R3_2=4'h6;
	ExtndSel1=2'b10;
	DestR_3=4'h6;
	Res=32'h15;
	DestR_4=4'h6;
	Res1=32'h16;
	#2
	assert( R3res4=== 32'h11) $display("Imm fail check"); else $display("Imm fail fail");
	end
endmodule