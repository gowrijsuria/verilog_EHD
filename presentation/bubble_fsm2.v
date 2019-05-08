module bubble_sort_FSM(clk,reset,in_data,out_data,n);
input clk;
input reset;
input [31:0]in_data;
output reg [31:0]out_data;
input [31:0]n;
reg sorted=0;
integer i,j,k,p,q;
reg in_valid=0;
reg stage1=0;
reg stage2=0;
reg stage3=0;
reg created=0;
reg [31:0]array[100000:0];
reg [31:0]array2[100000:0];
reg [100000:0]input_index=0;
reg [100000:0]input_index2=0;
reg [100000:0]outer_loop=0;
reg [100000:0]output_index=0;
always @(posedge clk)
begin
  if(reset==0)
  begin
   input_index<='d0;
   input_index2<='d0;
   output_index<='d0;
   outer_loop<='d0;
   sorted<=0;
   stage1<=0;
   stage2<=0;
   stage3<=0;
   for(i=0;i<n;i=i+1)
   begin
     array[i]<='d0;
     array2[i]<='d0;
   end
  end
  if(reset==1 && stage1==0)
  begin
    input_index<=input_index+1'b1;
    if(input_index<n)
    begin
      array[input_index]<=in_data;
    end
    else
    begin
       stage1<=1;
    end
  end
  if(reset==1 && stage1==1 && stage2==0)
  begin
    for(i=0;i<n;i=i+1)
    begin
      array2[i]<=array[i];
    end
      stage1<=0;
      stage2<=1;
      input_index2<=input_index;
      input_index<=0;
  end
  if(reset==1 && stage2==1 && sorted==0)
  begin
    if(outer_loop<input_index2-1)
      outer_loop<=outer_loop+1;
    else
      sorted<=1;
  end
  if(reset==1 && stage2==1 && sorted==0)
  begin
     if(outer_loop[0:0]==1)
     begin
      for(j=1;j<n-1;j=j+2)
      begin
       if(array2[j]<array2[j+1])
       begin
        array2[j]<=array2[j+1];
        array2[j+1]<=array2[j];
       end
     end
    end
    else
    begin
       for(k=0;k<n-1;k=k+2)
        begin
         if(array2[k]<array2[k+1])
         begin
          array2[k]<=array2[k+1];
          array2[k+1]<=array2[k];
         end
        end
    end
  end

  if(reset==1 && sorted==1)
  begin
    output_index<=output_index+1'b1;
      if(output_index<n)
      begin
       out_data<=array2[output_index];
      end
      else
      begin
       sorted<=0;
       stage2<=0;
       outer_loop<=0;
       output_index<=0;
      end
  end
end
endmodule
