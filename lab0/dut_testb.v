`include "dut.v"
module test;
	reg a,b,c,d;
	wire outp;
	answer ot(a,b,c,d,outp);
	
	initial begin
		a <= 0;
		b <= 1;
		c <= 0;
		d <= 1;
		#5  a <= 1;
			b <= 1;
			c <= 0;
			d <= 1;
		#9 a <= 0;
		b <= 1;
		c <= 1;
		d <= 1;	
		#18
		$display(outp);
	end
	initial begin
		$dumpfile("testb.vcd");
		$dumpvars(0,test);
	end
endmodule