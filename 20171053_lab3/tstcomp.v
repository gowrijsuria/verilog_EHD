`include "32comp.v"
module test;
	reg[31:0] a,b;
	reg altbin = 0;
	reg agtbin = 0; 
	wire alessb,agreatb,aequalb;
	comp32 c(a,b,alessb,agreatb,aequalb);
	initial begin
		a <= 32'b00000000000000000000000000000000;
		b <= 32'b10000000000000000000000000000000;
	#3
		a <= 32'b10000000000000000000000000000000;
		b <= 32'b10000000000000000000000000000000;
	#3
		a <= 32'b10000000000000000000000000000000;
		b <= 32'b00000000000000000000000000000001;
	#3	
	$finish;				
	end
	initial begin
		$dumpfile("comp.vcd");
		$dumpvars(0,test);
	end
endmodule