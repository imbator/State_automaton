module state_automaton(input x, rst, CLOCK_50, output y);
parameter [1:0] reset = 0;
reg [1:0] currentState;
parameter state1 = 1, state11 = 2, state110 = 3, state1100 = 4, state11001 = 5, state110011 = 6, state1100110 = 7;

initial begin
	currentState = reset;
end


assign y = (currentState == state1100110);

always@(posedge CLOCK_50) begin
	if (rst)
		currentState = reset;
	else case(currentState)
	reset:
		begin
			if (x == 1'b1) currentState = state1;
			else currentState = reset;
		end
	state1:
		begin
			if (x == 1'b1) currentState = state11;
			else currentState = reset;
		end
	state11:
		begin
			if (x == 1'b0) currentState = state110;
			else currentState = state1;
		end
	state110:
		begin
			if (x == 1'b0) currentState = state1100;
			else currentState = state1;
		end
	state1100:
		begin
			if (x == 1'b1) currentState = state11001;
			else currentState = reset;
		end
	state11001:
		begin
			if (x == 1'b1) currentState = state110011;
			else currentState = reset;
		end
	state110011:
		begin
			if (x == 1'b0) currentState = state1100110;
			else currentState = state1;
		end
	state1100110:
		begin
			if (x == 1'b1) currentState = 1;
			else currentState = reset;
		end
	default currentState = reset;
	endcase
end

endmodule	
	
	
	
