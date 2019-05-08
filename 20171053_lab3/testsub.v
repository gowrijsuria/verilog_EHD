`include "32sub.v"
module test;
	reg[31:0] a,b;
	wire[31:0] diff;
	wire carry1;
	sub32 s(a,b,diff,carry1,1'b1);
	initial begin
		a <= 32'b111;
		b <= 32'b11;
		#100
		$display(diff);

	#3
		//a <= 32'b11111000000000001111111111111111;
		//b <= 32'b11100000000000010000000000000000;
		a <= 32'b11100;
		b <= 32'b10100;
		#10
		$display("%d",diff);
	#3
		a <= 32'b00000000000000000000000000001010;
		b <= 32'b00000000000000000000000000000101;
		#10
		$display(diff);
	#3	
	$finish; 		
	end
	initial begin
		$dumpfile("32s.vcd");
		$dumpvars(0,test);
	end
	//initial begin
	//$display(diff[3]);
	//end
endmodule