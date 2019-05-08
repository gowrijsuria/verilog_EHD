//`include "comp_8.v"
module insertionsort(clk,in,sorted,count,reset);
	input[31:0] count;
	input reset;
	output reg[31:0] sorted;//output array 
	input clk;
	reg done=0;
	//reg n=8;
	reg[31:0] key;
	reg valid_in=0;
	//reg[4:0] i;//
	//reg[4:0] j;//iterating through 32 numbers 
	reg[100:0] i,j;
	reg[1:0] state=0;
	//input[63:0] in;
	input[31:0] in;
	reg[10:0] in_index=0;
	reg[10:0] out_index=0;
	//reg[7:0] n[0:31];//8 bit 32 numbers
	//reg[31:0] inarray[100000:0];
	reg[31:0] sorting[100:0];
	//comp8 c(sorting[j],key,l,g,eq);
	
	
	always @(posedge clk) 
	begin
		if(reset==0)
		begin
			state=0;
			done=0;
			in_index=0;
			out_index=0;
		end
		else if(reset == 1 && valid_in == 0)
		begin
			//copying input into array 
			
			if(in_index<count)
			begin
				sorting[in_index] = in;
				$display(sorting[in_index]);
				in_index = in_index + 1;

				//ls
			//$display(in_index);
			end
			else 
			begin
				$display("l");
				valid_in=1;
				state=0;
			end
		end
		else if(state==0 && valid_in==1) 
		begin
			//inputting into registers
			if(done==0)
			begin
				i=1;
				state=1;
			end	
			else
			begin
				if(out_index<count)		
				begin
					$display("p");
					sorted = sorting[out_index];
					$display(sorting[out_index]);
					out_index=out_index+1;		
				end	
				else 
				begin
					done=0;
					valid_in=0;
				end
			end	
		end
		else if(state==1 && valid_in==1)
		begin
			if(i<count)
			begin
				key=sorting[i];
				//key[7:0] <= sorting[((i*8)+7):(i*8)];
				j=i-1;
				state=2;
			end 
			else 
			begin
				done=1;
				state=0;	
			end
		end
		else if(state==2&&valid_in==1)
		begin
			if(j>=0 && sorting[j]>key)
			begin
				sorting[j+1]=sorting[j];
				//sorting[(((j+1)*8)+7):((j+1)*8)] <= sorting[((j*8)+7):(8*j)];
				j=j-1;
			end
			else 
			begin
				state=1;
				i=i+1;
				sorting[j+1]=key;
				//sorting[(((j+1)*8)+7):((j+1)*8)] <= key;
			end
		end
	end
	//assign sorted[63:0] = sorting[63:0];
endmodule

