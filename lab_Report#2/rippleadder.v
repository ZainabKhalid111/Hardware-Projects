module SUM (S, A, B, Cin);
	output S;
	input A, B, Cin;
	// Behavioral Code
	assign S = A^B^Cin;
	
endmodule

module CARRY (Cout, A, B, Cin);
	output Cout;
	input A, B, Cin;
	// Behavioral Code
	assign Cout = (A&B) | (B&Cin) | (A&Cin);
endmodule

module FA1 (Sum, Cout, A, B, Cin);
	output Sum, Cout;
	input A, B, Cin;	
	// Structural Code
	SUM s1 (.S(Sum), .A(A), .B(B), .Cin(Cin));
	CARRY c1 (.Cout(Cout), .A(A), .B(B), .Cin(Cin));
endmodule

module RCA (Cout, S, A, B,Cin);
	output Cout;
	output [3:0] S;
	input [3:0] A, B;
	input Cin;
	wire [2:0] C;   //Intermediate/Internal Carries
	// FA1 ;   //FA1's Interface (I/O Pins)
	FA1 fa0 (S[0], C[0], A[0], B[0], Cin);
	FA1 fa1 (S[1], C[1], A[1], B[1], C[0]);
	FA1 fa2 (S[2], C[2], A[2], B[2], C[1]);
	FA1 fa3 (S[3], Cout, A[3], B[3], C[2]);
endmodule

module stim_RCA();	//test bench
reg [3:0]A,B;	//4 bits inputs 
reg Cin;
wire Cout;	//1 bits output
wire [3:0]S;	//4 bits outputs 
RCA r(Cout, S, A, B,Cin);
initial
	begin
	$monitor("A=%d		 B=%d	Cin=%d	Sum=%d		Cout=%d",A,B,Cin,S,Cout); 
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




