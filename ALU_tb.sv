module ALU_tb ();

	logic [3:0] a,b,s;
	logic [3:0] CNVZ,ALUFUN;
	
	ALU #(4) _alu(a,b,ALUFUN,s,CNVZ);
	
	initial begin
	
	
		a = 4'b0001;
		b = 4'b0000;
	
		//SLR: logic shift right
		ALUFUN = 4'b0000;
		#10
		//SLL: logic shift left
		ALUFUN = 4'b0001;
		#10
		//SAR: arithmetic shift right
		ALUFUN = 4'b0010;
		#10
		//SAL: aritmetic shift left
		ALUFUN = 4'b0011;
		#10
		//OR: logical or
		ALUFUN = 4'b0100;
		#10
		//AND: logical and
		ALUFUN = 4'b0101;
		#10
		//XOR: logical xor
		ALUFUN = 4'b0110;
		#10
		//NOT: logical not
		ALUFUN = 4'b0111;
		#10
		//ADDER: addition function
		ALUFUN = 4'b1000;
		#10
		//ADDER-C2: substraction function
		ALUFUN = 4'b1001;
		#10;
		
	end

endmodule
