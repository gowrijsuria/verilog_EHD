`include "4bit.v"
module test4;
	reg[3:0] a,b;
	wire b_out;
	wire[3:0] diff;
	sub s(a,b,1'b1,diff,carry);
	initial begin
		a=5;
		b=5;
	#10
		$display(diff);
	#10
		a=10;
		b=3;
    #3
    	$display(diff);	
    #10
    $finish;
end
initial begin
	$dumpfile("sub4.vcd");
	$dumpvars(0,test4);
	
end
endmodule
