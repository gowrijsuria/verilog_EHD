`include "4bit.v"
module sub32(A,B,diff,carry,c_in);
	input[31:0] A,B;
	input c_in;
	output[31:0] diff;
	output carry;
	wire c1,c2,c3,c4,c5,c6,c7;

	//always @(*)
	//	$display("sub a=%b b=%b",A,B);

	sub s1(A[3:0],B[3:0],1'b1,diff[3:0],c1);
	sub s2(A[7:4],B[7:4],c1,diff[7:4],c2);
	sub s3(A[11:8],B[11:8],c2,diff[11:8],c3);
	sub s4(A[15:12],B[15:12],c3,diff[15:12],c4);
	sub s5(A[19:16],B[19:16],c4,diff[19:16],c5);
	sub s6(A[23:20],B[23:20],c5,diff[23:20],c6);
	sub s7(A[27:24],B[27:24],c6,diff[27:24],c7);
	sub s8(A[31:28],B[31:28],c7,diff[31:28],carry);
	//$display(diff);
endmodule