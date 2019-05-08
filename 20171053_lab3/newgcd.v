`include "32comp.v"
`include "32sub.v"

module gcd(a,b,clk,gcd);
	input[31:0] a,b;
	reg[31:0] A;
	reg[31:0] B;
	output[31:0] gcd;
	reg[31:0] out;
	reg rst;
	input clk;
	wire[31:0] diff1,diff2;
	wire carry1,carry2,c_in1,c_in2;
	reg[1:0] state=0;
	
	sub32 ss(A,B,diff1,carry1,c_in1);
	sub32 sd(B,A,diff2,carry2,c_in2);
	comp32 c(A,B,alessb,agreatb,aequalb);

	always @(posedge clk) begin
	  if(state==0)
	  	begin
	  		A = a;
	  		B = b;
	  		//$display(a,b);
	  		//$display(A,B);
	  		state = 1;
	  		//$display(state);
	  	end
	  else if(state == 1)
	  begin
	  		if(aequalb == 1)
	  		begin
	  		//$display("eq",aequalb);
	  			out <= A;
	  			state = 0;
	  		end
	  		else if(alessb == 1 || A ==0) begin
	  			if(!A)
	  			begin
	  				out <= B;
	  				state = 0;	
	  			end
	  			else 
	  			begin
	  				B <= diff2;
	  				//$display("diff%b",diff2);
	  			end	
	  		end
	  		else if(agreatb == 1 || B ==0) begin
	  			if(!B)
	  			begin
	  				out <= A;
	  				state = 0;
	  			end	
	  			else
	  			begin
	  				//$display("hi");
	  			    A <= (diff1);
	  			end
	  		end
	  end	
    end
	assign gcd = out;
endmodule