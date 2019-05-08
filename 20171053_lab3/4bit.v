module sub(A,B,c_1,diff,carry);
	input[3:0] A,B;
	output[3:0] diff;
	input c_1;
	output carry;
	wire c1,c2,c3,c4,c5;
	fulladder f1(A[0],B[0],c_1,c2,diff[0]);
	fulladder f2(A[1],B[1],c2,c3,diff[1]);
	fulladder f3(A[2],B[2],c3,c4,diff[2]);
	fulladder f4(A[3],B[3],c4,carry,diff[3]);
endmodule

module fulladder(A,B,c_in,carry,sum);
	input A,B,c_in;
	assign b_in = B^(1'b1);
	output sum,carry;
	assign sum = A^b_in^c_in;
	assign carry = (c_in&(A^b_in))|(A&b_in);
endmodule