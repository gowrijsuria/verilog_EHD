`include "bubble_fsm2.v"
module bubble_sort_tb();
reg clk;
reg reset=1;
reg [31:0]in_data;
reg [31:0]n;
wire [31:0]out_data;
bubble_sort_FSM DUT(.clk(clk),.reset(reset),.in_data(in_data),.out_data(out_data),.n(n));
/*initial begin
reset=0;
repeat(1)
#1 reset=~(reset);
end*/
initial begin
clk=1;
repeat(1000)
#5 clk=~(clk);
end
initial begin
/*n=10; in_data=9999; #10;
in_data=2; #10;
in_data=2350; #10;
in_data=3598; #10;
in_data=5346; #10;
in_data=7891; #10;
in_data=3456; #10;
in_data=1234; #10;
in_data=2345; #10;
in_data=4576; #25;

n=10; in_data=11; #10;
in_data=12; #10;
in_data=13; #10;
in_data=14; #10;
in_data=15; #10;
in_data=1; #10;
in_data=2; #10;
in_data=3; #10;
in_data=4; #10;
in_data=5; #10;*/

n=5; in_data=11; #10;
in_data=12; #10;
in_data=13; #10;
in_data=14; #10;
in_data=15; #10;

end
initial begin
$dumpfile("bubble_sort_tb.vcd");
$dumpvars(0,bubble_sort_tb);
end
endmodule
