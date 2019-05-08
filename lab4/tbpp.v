`include "mult_4bit.v"
module test;
	reg[3:0] A,B;
	reg start;
	reg reset;
	reg clk=0;
	wire done;
	wire[7:0] product;
	pipeline pp(A,B,start,reset,product,clk,done);
	initial begin
		A = 4'b1000;
		B = 4'b0100;
		start = 1;
		reset = 1;
		//$display(start,done);
		//$display(a1,b1);
		//$display(a,b);
		//k = a[0]&b[0];
		//$display(g);
		//$display(product);
	#900
			$display(product);
		A = 4'b0011;
		B = 4'b0001;
		start = 0;
		reset = 1;
	#200
			$display(product);
	//$display(start,done);	
		A = 4'b1111;
		B = 4'b1111;
		start = 1;
		reset = 1;
	#200
			$display(product);
	//$display(start,done);
		A = 4'b0011;
		B = 4'b0011;
		reset = 0;
		start = 1;
	#400
	     		$display(product);
	$finish;	
	end
	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0,test);
	end
	always #1 clk = ~(clk);
endmodule