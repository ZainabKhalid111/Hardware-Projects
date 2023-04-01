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

//Structural Model : 4 Bit Ripple Carry Adder
module ripple_adder_4bit(Cout,Sum,A,B,Cin);
 output [3:0] Sum;
 output Cout;
 input [3:0] A,B;
 input Cin;
wire c1,c2,c3; 
 //full_adder fa(S,Cout,A,B,Cin);
 full_adder FA1(Sum[0],c1,A[0],B[0],Cin),
    FA2(Sum[1],c2,A[1],B[1],c1),
    FA3(Sum[2],c3,A[2],B[2],c2),
    FA4(Sum[3],Cout,A[3],B[3],c3);
endmodule

//Test Bench : 4 Bit Ripple Carry Adder
module test_ripple_adder_4bit();
 // Inputs
 reg [3:0] A;
 reg [3:0] B;
 reg Cin;
 // Outputs
 wire [3:0] Sum;
 wire Cout;
 // Instantiate the Unit Under Test (UUT)
 ripple_adder_4bit rpa(.Sum(Sum), .Cout(Cout), .A(A), .B(B),.Cin(Cin));
 initial 
 	begin
 	
 	$monitor("A=%d		 B=%d	Cin=%d	Sum=%d		Cout=%d",A,B,Cin,Sum,Cout); 
	A=4'b0000;B=4'b0000;Cin=1'b0; 
	#10 
	A=4'b0010;B=4'b0010;Cin=1'b0; 
	#10
	A=4'b0010;B=4'b0100;Cin=1'b0; 
	#10
	A=4'b0110;B=4'b1010; Cin=1'b0; 
	#10
	A=4'b1111;B=4'b1111;Cin=1'b0;
	 end
endmodule
