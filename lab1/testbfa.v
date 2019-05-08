`include "fulladder.v"
module testing;
	reg a,b,c;
	wire sum,carry;
	fulladder f(a,b,c,sum,carry);
	initial begin
		a <= 0;
		b <= 0;
		c <= 0;
	#5
		a <= 0;
		b <= 0;
		c <= 1;
	#5
		a <= 0;
		b <= 1;
		c <= 0;
	#5
		a <= 0;
		b <= 1;
		c <= 1;
	#5	
		a <= 1;
		b <= 0;
		c <= 0;
	#5	
		a <= 1;
		b <= 0;
		c <= 1;
	#5
		a <= 1;
		b <= 1;
		c <= 0;
	#5	
		a <= 1;
		b <= 1;
		c <= 1;
	#5	
		$display(sum,carry);
	end

	initial begin
		$dumpfile("testf.vcd");
		$dumpvars(0,testing);	
	end
endmodule 