`include "jkff.v"
module test;
	reg j,k;
	reg rst;
	reg clk = 0;
	wire q;
	jkff jk(j,k,clk,rst,q);
	initial begin
		j <= 1'b0;
		k <= 1'b1;
		rst <= 1'b0;
	#5	j <= 1'b0;
		k <= 1'b1;
		rst <= 1'b1;
	#5  j <= 1'b1;
		k <= 1'b0;
		rst <= 1'b1;	
	#5  j <= 1'b1;
		k <= 1'b1;
		rst <= 1'b1;
	$finish;
	end
	
	initial begin
		$dumpfile("testbjk.vcd");
		$dumpvars(0,test);
	end
	always #1 clk=~clk;
endmodule