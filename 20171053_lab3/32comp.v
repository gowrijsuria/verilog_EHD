`include "2comp.v"
module comp32(A,B,alessb,agreatb,aequalb);
	input[31:0] A,B;
	output alessb,aequalb,agreatb;
	//4 bit comp
	comp c1(A[3:2],B[3:2],altb_1,agtb_1,aeqb_1);
	comp c11(A[1:0],B[1:0],altb_11,agtb_11,aeqb_11);
	assign eq1 = aeqb_1 & aeqb_11;
	assign lt1 = altb_1 | (aeqb_1 & altb_11);
	assign gt1 = agtb_1 | (aeqb_1 & agtb_11);

	comp c2(A[7:6],B[7:6],altb_2,agtb_2,aeqb_2);
	comp c21(A[5:4],B[5:4],altb_21,agtb_21,aeqb_21);
	assign eq2 = aeqb_2 & aeqb_21;
	assign lt2 = altb_2 | (aeqb_2 & altb_21);
	assign gt2 = agtb_2 | (aeqb_2 & agtb_21);

	comp c3(A[11:10],B[11:10],altb_3,agtb_3,aeqb_3);
	comp c31(A[9:8],B[9:8],altb_31,agtb_31,aeqb_31);
	assign eq3 = aeqb_3 & aeqb_31;
	assign lt3 = altb_3 | (aeqb_3 & altb_31);
	assign gt3 = agtb_3 | (aeqb_3 & agtb_31);

	comp c4(A[15:14],B[15:14],altb_4,agtb_4,aeqb_4);
	comp c41(A[13:12],B[13:12],altb_41,agtb_41,aeqb_41);
	assign eq4 = aeqb_4 & aeqb_41;
	assign lt4 = altb_4 | (aeqb_4 & altb_41);
	assign gt4 = agtb_4 | (aeqb_4 & agtb_41);

	comp c5(A[19:18],B[19:18],altb_5,agtb_5,aeqb_5);
	comp c51(A[17:16],B[17:16],altb_51,agtb_51,aeqb_51);
	assign eq5 = aeqb_5 & aeqb_51;
	assign lt5 = altb_5 | (aeqb_5 & altb_51);
	assign gt5 = agtb_5 | (aeqb_5 & agtb_51);

	comp c6(A[23:22],B[23:22],altb_6,agtb_6,aeqb_6);
	comp c61(A[21:20],B[21:20],altb_61,agtb_61,aeqb_61);
	assign eq6 = aeqb_6 & aeqb_61;
	assign lt6 = altb_6 | (aeqb_6 & altb_61);
	assign gt6 = agtb_6 | (aeqb_6 & agtb_61);

	comp c7(A[27:26],B[27:26],altb_7,agtb_7,aeqb_7);
	comp c71(A[25:24],B[25:24],altb_71,agtb_71,aeqb_71);
	assign eq7 = aeqb_7 & aeqb_71;
	assign lt7 = altb_7 | (aeqb_7 & altb_71);
	assign gt7 = agtb_7 | (aeqb_7 & agtb_71);

	comp c8(A[31:30],B[31:30],altb_8,agtb_8,aeqb_8);
	comp c81(A[29:28],B[29:28],altb_81,agtb_81,aeqb_81);
	assign eq8 = aeqb_8 & aeqb_81;
	assign lt8 = altb_8 | (aeqb_8 & altb_81);
	assign gt8 = agtb_8 | (aeqb_8 & agtb_81);
	
	//8 bit comp
	assign eq18 = eq1 & eq2;
	assign lt18 = lt2 | (eq2 & lt1);
	assign gt18 = gt2 | (eq2 & gt1);

	assign eq28 = eq3 & eq4;
	assign lt28 = lt4 | (eq4 & lt3);
	assign gt28 = gt4 | (eq4 & gt3);

	assign eq38 = eq5 & eq6;
	assign lt38 = lt6 | (eq6 & lt5);
	assign gt38 = gt6 | (eq6 & gt5);

	assign eq48 = eq7 & eq8;
	assign lt48 = lt8 | (eq8 & lt7);
	assign gt48 = gt8 | (eq8 & gt7);

	//16 bit comp
	assign eq116 = eq18 & eq28;
	assign lt116 = lt28 | (eq28 & lt18);
	assign gt116 = gt28 | (eq28 & gt18);

	assign eq216 = eq38 & eq48;
	assign lt216 = lt48 | (eq48 & lt38);
	assign gt216 = gt48 | (eq48 & gt38);

	//32 bit comp
	assign aequalb = eq116 & eq216;
	assign alessb = lt216 | (eq216 & lt116);
	assign agreatb = gt216 | (eq216 & gt116);		
endmodule