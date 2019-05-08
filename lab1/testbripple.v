`include "ripple.v"
module test;
	reg [3:0] a,b;
	reg c_in;
	wire [3:0] sum;
	wire carry;
	ripple r(a,b,c_in,carry,sum);
	initial begin
		a <= 4'b0;
		b <= 4'b0;
		c_in <= 4'b0;
	#10
		a <= 4'b1000;
		b <= 4'b0001;
		c_in <= 4'b0;
	#10
		a <= 4'b1001;
		b <= 4'b1001;
		c_in <= 4'b0;
	#10	
		a <= 4'b1111;
		b <= 4'b0011;
		c_in <= 4'b0;
	#10	
		a <= 4'b1011;
		b <= 4'b1001;
		c_in <= 4'b1;
	#10		
	$finish;			
	end
	initial begin
		$dumpfile("testr.vcd");
		$dumpvars(0,test);
	end
endmodule