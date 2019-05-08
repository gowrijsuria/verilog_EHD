`include "fulladder.v"
module ripple(a,b,c_in,carry,sum);
	input[3:0] a,b;
	input c_in;
	output[3:0] sum;
	wire carr_1,carr_2,carr_3;
	output carry;
	fulladder f1(a[0],b[0],c_in,sum[0],carr_1);
	fulladder f2(a[1],b[1],carr_1,sum[1],carr_2);
	fulladder f3(a[2],b[2],carr_2,sum[2],carr_3);
	fulladder f4(a[3],b[3],carr_3,sum[3],carry);
endmodule
