module ShiftLeft #(parameter bus = 32)
	(input logic [bus-1:0] a, b, input logic isArith, output logic [bus-1:0] s);
	
	logic [bus-1:0] arithShift, logicShift;
	
	assign arithShift = a <<< b;
	assign logicShift = a << b;
	
	assign s = isArith? arithShift : logicShift;
	
endmodule

