`include "halfadder.v"
module test;
	reg a,b;
	wire sum,carry;
	halfadder h(a,b,sum,carry);
	initial begin
		a <= 0;
		b <= 0;
	#5
		a <= 0;
		b <= 1;
	#10 
		a <= 1;
		b <= 0;
	#15
		a <= 1;
		b <= 1;
	#20
		$display(sum,carry);					
	end

	initial begin
		$dumpfile("testh.vcd");
		$dumpvars(0,test);
	end
endmodule