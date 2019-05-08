`include "fulladder.v"
//`include "hadder.v"
module pipeline(A,B,start,reset,product,clk,done);
	input[3:0] A,B;
	reg[3:0] n,m;
	input clk,start,reset;
	//output g,a1,b1;
	reg state = 0;
	output[7:0] product;
	output done;
	reg d=0;
	reg st;
	reg[7:0] prod;
	wire p4,p5,p6,p7;
	wire s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10;
	wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,carry;
	wire q0,q1,q2,q3;
	reg and1,and2,and3,and4,and5,and6,and7,and8,and9,and10,and11,and12,and13,and14,and15,and16;
	half h1(and2,and3,s1,c1);
	fa f1(and4,and5,and3,s2,c2);
	fa f2(and8,and9,and10,s3,c3);
	fa f3(and11,and12,and13,s4,c4);
	half h4(and14,and15,s5,c5);
	half h5(c1,s2,s6,c6);
	fa f4(c2,s3,and7,s7,c7);
	half h6(c3,s4,s8,c8);
	half h7(c4,s5,s9,c9);
	half h8(c5,and16,s10,c10); 
	
	half h9(c6,s7,p3,q0);
	fa f5(c7,s8,q0,p4,q1);
	fa f6(c8,s9,q1,p5,q2);
	fa f7(q2,c9,s10,p6,q3);
	half h10(q3,c10,p7,carry);
always @(start==0)
begin
		d=0;
end	
assign done = d;
always @(posedge clk or negedge reset) begin
		if (!reset) begin
			// reset
			prod[7:0]=8'b0;
			d = 1;
			//reset=1;
		end
		else begin
		if(state==0 && start==1) begin	
			m = A;
			n = B; 
			and1 = m[0]&n[0];
			and2 = m[1]&n[0];
			and3 = m[0]&n[1];
			and4 = m[2]&n[0];
			and5 = m[1]&n[1];
			and6 = m[0]&n[2];
			and7 = m[3]&n[0];
			and8 = m[2]&n[1];
			and9 = m[1]&n[2];
			and10 = m[0]&n[3];
			and11 = m[3]&n[1];
			and12 = m[2]&n[2];
			and13 = m[1]&n[3];
			and14 = m[3]&n[2];
			and15 = m[2]&n[3];
			and16 = m[3]&n[3];
			//s0 = and1;
			//a1 = m[0];
			//b1 = n[0];
			//g = m[0]&n[0];
			//$displab(s0);
			prod[0] = and1;
			state = 1;
		end
		if(state==1 && start==1) begin
			prod[1] = s1;
			prod[2] = s6;
			prod[3] = p3;
			prod[4] = p4;
			prod[5] = p5;
			prod[6] = p6;
			prod[7] = p7;
			state = 0;
			d = 1;	
		end
		end

	end
	//assign start = st;
	assign product = prod;
	assign done = d;	
endmodule 