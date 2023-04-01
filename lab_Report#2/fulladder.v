//Structural Model : Half Adder
module half_adder(output S,C,input A,B);
 xor(S,A,B);
 and(C,A,B);
endmodule

//Structural Model : Full Adder
module full_adder(S,Cout,A,B,Cin);
 input A,B,Cin;
 output S,Cout;
 wire s1,c1,c2;
 half_adder HA1(s1,c1,A,B);
 half_adder HA2(S,c2,s1,Cin);
 or o1(Cout,c1,c2);
endmodule

module test_FA(); //test bench to test FA (Full Adder)
	// Inputs are regs here
	reg A, B, Cin;	
	// Outputs are wires here
	wire S, Cout;
	// Instantiate the Unit/Design Under Test (U/DUT)
	// FA dut (S, Cout, A, B, Cin);  // Positional association
	full_adder  fa(.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));  // Explicit association

	initial begin
		// Initialize Inputs		
		A = 0; B = 0; Cin = 0;
		#10	
		Cin = 1;
		#10
		B = 1; 
		#10
		A = 1;
		#10
		A = 0;
		#10
		Cin = 0;		
	end
	
	initial begin
		$monitor("A=%b,B=%b,Cin=%b--->Sum=%b,Cout=%b  \n",A,B,Cin,S,Cout);		
	end
	      
endmodule
