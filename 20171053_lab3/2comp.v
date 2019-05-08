module comp(A,B,alessb,agreatb,aequalb);
	input[1:0] A,B;
	input agtbin,altbin;
	output alessb,aequalb,agreatb;
	assign alessb = ((~A[0])&&(~A[1])&&B[0])||((~A[1])&&B[1])||((~A[0])&&B[1]&&B[0]);
	assign aequalb =(A[1]~^B[1])&&(A[0]~^B[0]);
	assign agreatb =((~B[0])&&(~B[1])&&A[0])||((~B[1]&&A[1]))||((~B[0]&&A[1]&&A[0]));
endmodule