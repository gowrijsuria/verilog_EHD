module jkff(j,k,clk,rst,q);
	input j,k,rst,clk;
	output q;
	reg q;
	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			// reset
			q <= 1'b0;
		end
		else begin
			q <= (j&(!q))|((!k)&q);
		end
	end
endmodule
