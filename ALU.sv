module ALU #(parameter bus = 4) (input logic [bus-1:0]a,b,input logic [3:0] ALUFUN,output logic [bus-1:0] s,output logic [3:0] CNVZ);

	logic Co,No,Vo,Zo;
	
	assign CNVZ[3] = Co;
	assign CNVZ[2] = No;
	assign CNVZ[1] = Vo;
	assign CNVZ[0] = Zo;
	
	//Flags
	
	logic isShiftArith;
	logic isFunctArith;
	logic isFunctLogic;
	logic isFunctShift;
	
	logic isShiftLeft;
	logic[1:0] selLogic;
	
	assign isShiftArith = ALUFUN[1];
	assign isFunctShift = ~ ALUFUN[3] & ~ ALUFUN[2];
	assign isFunctArith = ALUFUN[3];
	assign isFunctLogic = ~ALUFUN[3] & ALUFUN[2];
	assign isShiftLeft = ALUFUN[0];
	assign selLogic = ALUFUN[1:0];
		
	
	//selectors	
	logic [bus-1:0] shiftout, logicout ;
	
	//logic
	logic [bus-1:0] andout,orout,xorout, notout;
	
	Andr #(bus) _and(a,b,andout);
	Orr #(bus) _or(a,b,orout);
	Eor #(bus) _eor(a,b,xorout);
	Not #(bus) _not(a, notout);
	Muxr4 #(bus) _mux4(orout, andout, xorout, notout, selLogic, logicout);
	
	//shifts
	
	logic [bus-1:0] slout, srout;
	
	ShiftLeft _shiftL(a, b, isShiftArith, slout);
	ShiftRight _shiftR(a, b, isShiftArith, srout);
	Muxr #(bus) _mux2(slout, srout, isShiftLeft, shiftout);
	
	//arithmetic
	
	logic [bus-1:0] addout, c2out;
	logic isSubstraction;
	logic [bus-1:0] isSubtractionExt;
	logic cout;
	
	assign isSubstraction = ALUFUN[3] & ALUFUN[0];
	SignExtension #(bus,1) _ext (isSubstraction, isSubtractionExt);
	
	Eor #(bus) _c2 (b, isSubstractionExt, c2out);
	
	Adder #(bus) _adder(a, c2out, isSubstraction, addout,cout);
		
		
	//flags	
	assign Co = cout & isFunctArith;
	assign Zo = ~| s;
	assign No = s[bus-1] & isFunctArith;
	assign Vo = isFunctArith & ~(a[bus-1] ^ b[bus-1]) & (a[bus-1] ^ s[bus-1]) & ~ isSubstraction;
	
	
	//output
	
	logic [1:0] selout;
	assign selout = ALUFUN [3:2];
	Muxr4 #(bus) _muxOutput (shiftout, logicout, addout, addout, selout, s);
	
	
	

endmodule
