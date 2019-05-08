module tb;	
	reg clk=0;
	reg[31:0] in;//,in2,in3,in4,in5,in6,in7,in8;
	wire[31:0] sorted; 
	//reg[31:0] count;
	reg reset=1;
	//insertionsort ins(clk,in,sorted,count,reset);
	//forins ff(clk,reset,in,sorted);//in1,in2,in3,in4,in5,in6,in7,in8);
	insertion ii(clk,reset,sorted,in);//in1,in2,in3,in4,in5,in6,in7,in8);
	//always begin
	//clk=1;
	//#100; clk=~(clk);
	//end
	initial begin
		//count=8;
		in <= 100;//64
		//$display(in);
		#1000
		//$display("o");
		//$display(in);
		#1000
		in <= 94;
		//$display(in);
		#1000
		#1000
		in <= 54;//36
		//$display(in);
		#1000
		#1000
		in <= 32;
		//$display(in);
		#1000
		#1000
		in <= 24;//18
		//$display(in);
		#1000
		#1000
		in <= 19;//
		//$display(in);
		#1000
		#1000
		in <= 14;//E
		//$display(in);
		#1000
		#1000
		in <= 2;//2
		//$display(in);
		#100000;
		#100000
		//$display(sorted);
		// $display(sorted[15:8]);
		// $display(sorted[23:16]);
		// $display(sorted[31:24]);
		// $display(sorted[39:32]);
		// $display(sorted[47:40]);
		// $display(sorted[55:48]);
		// $display(sorted[63:56]);
	 $finish;
	end
	always #1000 clk = ~clk;
	initial begin
		$dumpfile("instb.vcd");
		$dumpvars(0,tb);
	end
endmodule