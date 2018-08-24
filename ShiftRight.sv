module ShiftRight #(parameter bus = 32)
	(input logic [bus-1:0] a, b, input logic isArith, output logic [bus-1:0] s);

	if (isArith)
		assign s = a >>> b;
	else
		assign s = a >> b;
	
endmodule
