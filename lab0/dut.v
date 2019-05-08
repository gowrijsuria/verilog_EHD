`include "mux2x1.v"
module answer(A,B,C,D,Y);
	input A,B,C,D;
	output A_D,BC;
	output Y;
	mux2_1 mux1(A,D,A,A_D);
	mux2_1 mux2(C,1'b0,B,BC);
	mux2_1 mux3(BC,1'b0,A_D,Y);
endmodule