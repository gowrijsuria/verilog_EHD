`include "state.v"
module test;
	reg in;
	reg rst;
	wire out;
	//rst = 0;
	state s(in,out,rst);
	initial begin
	  rst=0; 
	  repeat(1)
	  #2 rst=~(rst);
	end   
	initial begin
		in <= 1'b0;
	#1
		in <= 1'b1;
	#2
		in <= 1'b0;
	#1
		in <= 1'b1;
	#3
		in <= 1'b0;
	#1
		in <= 1'b1;
	#5
		in <= 1'b0;
	#2
		in <= 1'b1;
	#1
		in <= 1'b0;
	#1
		in <= 1'b1;
	#1
		in <= 1'b0;
	#1
		in <= 1'b1;
	#1
		in <= 1'b0;
	#1
		in <= 1'b1;
	#1
		in <= 1'b0;
	#1
		in <= 1'b1;
	#1
		in <= 1'b0;
	#1
		in <= 1'b1;
	#1
		in <= 1'b0;
	#1
		in <= 1'b1;																	
	end
	initial begin
		$dumpfile("statedump.vcd");
		$dumpvars(0,test);
	end
endmodule