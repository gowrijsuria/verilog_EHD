module fori(clk,reset,in,sorted);//,in1,in2,in3,in4,in5,in6,in7,in8);
	input clk;
	input reset;
	input[31:0] in;//1,in2,in3,in4,in5,in6,in7,in8;
	output reg[31:0] sorted;
	integer count=8;//considering count to be a 32 bit number
	reg done=0;
	reg[100:0] in_index=0;
	reg[100:0] out_index=0;
	reg[255:0] sorting;
	integer i,j;
	reg[31:0] key;
	reg valid_in;
	reg[1:0] state=0;

	always @(negedge reset) begin
		if (reset==0) begin
			done=0;
			in_index=0;
			out_index=0;
			state =0;
			valid_in=0;
		end
	end

	always @(posedge clk) begin
		if(state==0 && reset==1) 
		begin
			
			if(in_index<count)
			begin
				sorting[in_index] = in;
				//

				$display(sorting[in_index]);
				in_index = in_index + 1;
			end
			else 
			begin
				//$display("l");
				valid_in=1;
				state=1;
			end
		end
		else if(state==1 && reset ==1 && valid_in == 1)
		begin
			
			i=i+1;
			key = sorting[i];
			if(i<count)
			begin
				j=i-1;
				state=2;
			end
			else
			begin
				state=3;
				done=1;
			end
		end
		else if(state==2 && reset == 1 && valid_in ==1)
		begin
			if(sorting[j]>key )//&& j>=0)
			begin
				sorting[j+1]=sorting[j];
				sorting[j]=key;
				//j=j-1;
			end
			if(j==0)
			begin
				state=2;
				//sorting[j+1]=key;	
			end
			else begin
				state=3;
				j=j-1;
			end
		end
		else if(state==3 && reset==1 && valid_in == 1)
		begin
			if(out_index<count)
			begin
				//state=0;
				sorted = sorting[out_index];
				//$display(sorting[out_index]);
				out_index=out_index+1;		
			end
			else begin
				state=0;
			end
		end
	end
endmodule	