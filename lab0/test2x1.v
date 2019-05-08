`include "mux2x1.v"
module testing;
	reg r1,r2,r3;
	wire op;
	mux2_1 m(r1,r2,r3,op);

	initial begin
		r1 <= 1;
		r2 <= 1;
		r3 <= 0;
	#5	
		r1 <= 0;
		r2 <= 1;
		r3 <= 0;
	#9	
		r1 <= 0;
		r2 <= 0;
		r3 <= 0;
	#18	
		r1 <= 1;
		r2 <= 1;
		r3 <= 1;
	#20	
		r1 <= 1;
		r2 <= 1;
		r3 <= 0;
	#25	
		r1 <= 0;
		r2 <= 0;
		r3 <= 1;
	#30	
		r1 <= 1;
		r2 <= 0;
		r3 <= 0;
	#35
		$display(op);	
	end

	initial begin	
		$dumpfile("test2x1.vcd");
		$dumpvars(0,testing);
	end	
endmodule