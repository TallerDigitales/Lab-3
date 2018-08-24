module Not #(parameter bus = 32) (input logic [bus-1:0]a,output logic [bus-1:0] s);

	assign s = ~a;

endmodule
