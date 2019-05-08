module forins(clk,reset,in,sorted);
	input clk;
	input reset;
	input[31:0] in;
	output reg[31:0] sorted;
	input[31:0] count;//considering count to be a 32 bit number
	reg done=0;
	reg[100:0] in_index=0;
	reg[100:0] out_index=0;
	reg[31:0] sorting[100:0];
	reg[31:0] i,j;
	reg[31:0] key;
	reg valid_in=0;
	integer fl;
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
		if(reset==1 && valid_in==0) 
		begin
			if(in_index<count)
			begin
				sorting[in_index]=in;
				$display(sorting[in_index]);
				in_index=in_index+1;
			end
			else begin
				valid_in=1;
				//$display("pp");
			end
		end
		else if(reset==1 && valid_in==1 && done==0)
		begin
			i=1;
			if(i<count)
			begin
				key = sorting[i];
				j=i-1;
				fl=1;
				
				//j>=0&&sorting[j]>key
				//begin
				//	sorting[j+1]=sorting[j];
				//	j=j-1;
				//end
				if(fl==2)
				begin
					sorting[j+1]=key;
					i=i+1;

				end
			end
			else begin
				done=1;
			end
			//done=1;
		end
		else if(fl==1&&done==0)
		begin
			if(j>=0&&sorting[j]>key)
			begin
				sorting[j+1]=sorting[j];
				j=j-1;
			end
			else begin
				fl=2;
			end
		end
		else if(reset==1 && done==1)
		begin
			if(out_index<count)
			begin
				//$display("oo");
				sorted = sorting[out_index];
				$display(sorted);
				out_index=out_index+1;
			end
			else begin
				//valid_in=0;
				done=0;
			end
		end
	end
endmodule