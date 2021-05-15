module frwrdUnit_tb();
logic [127:0]R2res1,R3res1;
logic [3:0]R2_2,R3_2;
logic [1:0]ExtndSel1;
logic VF1;
logic VF2;
logic [3:0]DestR_3;
logic [127:0]Res;
logic VF3;
logic [3:0]DestR_4;
logic [127:0]Res1;
logic [127:0]R2res2,R3res2;


ForwardUnit frun(R2res1,R3res1,R2_2,R3_2,ExtndSel1,
							VF1,
							VF2,DestR_3,Res,
							VF3,DestR_4,Res1,
							R2res2,R3res2);
	initial begin
	
	//forward none
	VF1=1'b0;
	VF2=1'b0;
	VF3=1'b0;
	R2res1=127'h10;
	R3res1=127'h64;
	R2_2=4'h5;
	R3_2=4'h6;
	ExtndSel1=2'b11;
	DestR_3=4'h5;
	Res=127'h15;
	DestR_4=4'h6;
	Res1=127'h16;
	#2
	assert( R2res2=== 127'h10 && R3res2=== 127'h64) $display("No Forward check");
	else $display("No Forward fail");
	#2
	//forward R2
	VF1=1'b0;
	VF2=1'b0;
	VF3=1'b0;
	R2_2=4'h5;
	R2res1=127'h10;
	R3_2=4'h6;
	R3res1=127'h64;
	ExtndSel1=2'b01;
	DestR_3=4'h5;
	Res=127'h15;
	DestR_4=4'h6;
	Res1=127'h16;
	#2
	assert( R2res2=== 127'h15 && R3res2=== 127'h64) $display("R2 Forward check");
	else $display("R2 Forward fail");
	#2
	//forward R3
	VF1=1'b0;
	VF2=1'b0;
	VF3=1'b0;
	R2_2=4'h5;
	R2res1=127'h10;
	R3_2=4'h6;
	R3res1=127'h64;
	ExtndSel1=2'b00;
	DestR_3=4'h5;
	Res=127'h15;
	DestR_4=4'h6;
	Res1=127'h16;
	#2
	assert( R2res2=== 127'h15 && R3res2=== 127'h16) $display("R2 & R3 Forward check");
	else $display("R2 & R3 Forward fail");
	#2
	//dont forward R2
	VF1=1'b0;
	VF2=1'b0;
	VF3=1'b0;
	R2_2=4'h5;
	R2res1=127'h10;
	R3_2=4'h6;
	R3res1=127'h64;
	ExtndSel1=2'b00;
	DestR_3=4'h8;
	Res=127'h15;
	DestR_4=4'h6;
	Res1=127'h16;
	#2
	assert( R2res2=== 127'h10 && R3res2=== 127'h16) $display("R3 !R2 Forward check");
	else $display("R3 !R2 Forward fail");
	#2
	//dont forward R3
	VF1=1'b0;
	VF2=1'b0;
	VF3=1'b0;
	R2_2=4'h5;
	R2res1=127'h10;
	R3_2=4'h6;
	R3res1=127'h64;
	ExtndSel1=2'b00;
	DestR_3=4'h8;
	Res=127'h15;
	DestR_4=4'h0;
	Res1=127'h16;
	#2
	assert( R2res2=== 127'h10 && R3res2=== 127'h64) $display("!R3 !R2 Forward check");
	else $display("!R3 !R2 Forward fail");
	#2
	//dont forward R3
	VF1=1'b0;
	VF2=1'b0;
	VF3=1'b0;
	R2_2=4'h5;
	R2res1=127'h10;
	R3_2=4'h6;
	R3res1=127'h64;
	ExtndSel1=2'b00;
	DestR_3=4'h8;
	Res=127'h15;
	DestR_4=4'h0;
	Res1=127'h16;
	#2
	assert( R2res2=== 127'h10 && R3res2=== 127'h64) $display("!R3 !R2 Forward check");
	else $display("!R3 !R2 Forward fail");
	#2
	//dont forward R3
	VF1=1'b0;
	VF2=1'b0;
	VF3=1'b0;
	R2_2=4'h5;
	R2res1=127'h10;
	R3_2=4'h6;
	R3res1=127'h64;
	ExtndSel1=2'b00;
	DestR_3=4'h8;
	Res=127'h15;
	DestR_4=4'h0;
	Res1=127'h16;
	#2
	assert( R2res2=== 127'h10 && R3res2=== 127'h64) $display("!R3 !R2 Forward check");
	else $display("!R3 !R2 Forward fail");
	
	
	
	
	#2
	//forward V2
	VF1=1'b0;
	VF2=1'b0;
	VF3=1'b0;
	R2_2=4'h5;
	R2res1=127'h10;
	R3_2=4'h6;
	R3res1=127'h64;
	ExtndSel1=2'b00;
	DestR_3=4'h8;
	Res=127'h15;
	DestR_4=4'h0;
	Res1=127'h16;
	#2
	assert( R2res2=== 127'h10 && R3res2=== 127'h64) $display("!R3 !R2 Forward check");
	else $display("!R3 !R2 Forward fail");
	#2
	//forward V3
	VF1=1'b0;
	VF2=1'b0;
	VF3=1'b0;
	R2_2=4'h5;
	R2res1=127'h10;
	R3_2=4'h6;
	R3res1=127'h64;
	ExtndSel1=2'b00;
	DestR_3=4'h8;
	Res=127'h15;
	DestR_4=4'h0;
	Res1=127'h16;
	#2
	assert( R2res2=== 127'h10 && R3res2=== 127'h64) $display("!R3 !R2 Forward check");
	else $display("!R3 !R2 Forward fail");
	end
endmodule