module shift_tb();


	logic [3:0] a,b,s;
	logic sel;
	ShiftRight #(4) _sr(a,b,sel,s);
	
	initial begin
	
	a = 3;
	b = 1;
	
	sel = 0;
	#10
	
	sel = 1;
	#10;
	
	end


endmodule

