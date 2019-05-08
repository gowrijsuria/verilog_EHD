`include "newgcd.v"
module test;
	reg[31:0] a,b,diff1;
	wire[31:0] gcd;
	reg clk=0;
	//inputx i(a,b);
	gcd g(a,b,clk,gcd);
	//assign gcd = out;
	initial begin
		a <= 32'b100;
		b <= 32'b100;
		//$display(a);
		#10
		$display(gcd);
		a <=32'b101;
		b <=32'b100;
		#1000
		//$display("2 ");
		$display(gcd);
		#50
		a <=32'b100;
		b <=32'b100;
		#344
		$display(gcd);	
		$finish;
	end
	always #1 clk=~clk;
	initial begin
		$dumpfile("gcdt.vcd");
		$dumpvars(0,test);
	end
endmodule