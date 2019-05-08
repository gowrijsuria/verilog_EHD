module state(in,out,rst);
	input in,rst;
	output out;
	reg[2:0] state;
	assign out = (state[2])&&(!state[1])&&(!state[0]);
	always @(posedge in or rst) begin
		if (!rst) begin
			state <= 3'b0;
		end
		else if (state != 3'b100) begin
			state <= state + 1'b1;
		end
		else begin
			state <= 3'b001;
		end
	end
endmodule