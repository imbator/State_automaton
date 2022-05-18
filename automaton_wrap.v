module automaton_wrap(
	input [0:0] SW,
	input [3:0] KEY,
	output [9:0] LEDR,
	output [7:0] HEX3,
	output [7:0] HEX2,
	output [7:0] HEX1,
	output [7:0] HEX0,
	input CLOCK_50,
	output  [7:0] LEDG
	//output reg [2:0] currentState
);


state_automaton init_1 (SW[0], KEY[0], KEY[3], CLOCK_50, LEDG[7:0], LEDR[9:0], HEX3[7:0], HEX2[7:0], HEX1[7:0], HEX0[7:0]);

endmodule