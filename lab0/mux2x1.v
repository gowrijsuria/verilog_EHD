module mux2_1(select,in1,in2,out);
	input in1,in2,select;
	output out;
	assign out = (select) ? in1 : in2;
endmodule

