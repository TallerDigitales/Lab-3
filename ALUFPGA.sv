module ALUFPGA(input logic [2:0] a, b, input logic [3:0] ALUFUN, output logic [6:0] out, output logic [3:0] CNVZ);
	
	logic [2:0] outAlu;
	ALU #(3) alu (a, b, ALUFUN, outAlu, CVNZ);
	
	
	sevenSegments({1'b0, outAlu[2:0]}, out);
	
	
endmodule
