module ShiftLeft #(parameter bus = 32)
	(input logic [bus-1:0] a, b, input logic isArith, output logic [bus-1:0] s);
	
	// FIX: arithShift must be a logic singned variable
	logic signed [bus-1:0] arithShift;
	logic [bus-1:0] logicShift;
	
	assign arithShift = $signed(a) <<< b;
	assign logicShift = $signed(a) << b;
	
	assign s = isArith? arithShift : logicShift;
	
endmodule

