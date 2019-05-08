//`include "comp_8.v"
module insertion(clk,reset,sorted,in);//,in2,in3,in4,in5,in6,in7,in8);
	input clk;
	input reset;
	input[31:0] in;//,in2,in3,in4,in5,in6,in7,in8;
	output reg[31:0] sorted;
	integer count=8;//considering count to be a 32 bit number
	reg done=0;
	reg[31:0] in_index=0;
	reg[31:0] out_index=0;
	reg[31:0] sorting[100:0];
	//reg[4:0] i;//
	//reg[4:0] j;//iterating through 32 numbers 
	integer i;
	integer j;
	reg[31:0] key;
	reg valid_in=0;
	reg[1:0] state=0;
	//comp8 c(sorting[j],key,l,g,eq);

	always @(negedge reset) begin
		if (reset==0) begin
			done=0;
			in_index=0;
			out_index=0;
		end
	end
	always @(posedge clk) begin
		/*if (reset==0) begin
			//state=0;
			done=0;
			in_index=0;
			out_index=0;
		end*/
		if(state==0 ) 
		begin
			i=0;
			j=0;
			//sorting[0]=in1;
			//sorting[1]=in2;
			if(in_index<count)
			begin
				sorting[in_index]=in;
				//$display(sorting[in_index]);
				in_index=in_index+1;
			end
			else begin
				state=1;
			end
			
		end
		else if(state==1)
		begin
			i=i+1;
			key = sorting[i];//assigning a value to a temporary register
			//
			if(i<count)
			begin
				state=2;
				//goes to the inner loop (state =2)where comparisons are made 
				j=i-1;
			end
			else 
			begin
				state=3;
				//sorting has been completed 	
			end
		end
		else if(state==2) 
		begin
			if(sorting[j]>key)
			begin
				sorting[j+1] = sorting[j];
				//swapping
				sorting[j]=key;
				//$display(key);
			end
			if(j==0)
			begin
					//to go to the outer loop when comparisons till the 1st element is done
					state=1;
			end
			else begin
					
					state=2;
					//decreasing the index to compare with the other elements 
					j=j-1;
					
			end
			
		end
		else if(state==3) 
		begin
			if(out_index<count)//writing sorted data into output array
			begin
				sorted=sorting[out_index];
				out_index=out_index+1;
			end
			else begin
				state=0;
				done=1;
			end
		end
	end
endmodule