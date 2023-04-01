`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:34:34 04/22/2022 
// Design Name: 
// Module Name:    task2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FullAdderr(Sum, Cout, X, Y, Cin);
input X, Y, Cin;
output Sum, Cout;
//Behavoural Code
assign {Cout,Sum}=X+Y+Cin;
endmodule

module RippleCAdder (Cout, S, X, Y);
output Cout;
output [3:0] S;
input [3:0] X, Y;
wire [2:0] C; //Intermediate/Internal Carries
// FA1 (Sum, Cout, X, Y, Cin); //FA1's Interface (I/O Pins)
FullAdderr fulla0 (S[0], C[0], X[0], Y[0], 1'b0);
FullAdderr fulla1 (S[1], C[1], X[1], Y[1], C[0]);
FullAdderr fulla2 (S[2], C[2], X[2], Y[2], C[1]);
FullAdderr fulla3 (S[3], Cout, X[3], Y[3], C[2]);
endmodule

module DECODER7_out(out,dp,en,Cout,X,Y);

output Cout;
wire [3:0] S;
input [3:0] X, Y;
RippleCAdder rc(Cout,S,X,Y);
output [6:0] out;
output dp;
input en;

assign dp=en;
    assign out =
  (S==0)?(7'b1000000):
    (S==1)?(7'b1111001):
    (S==2)?(7'b0100100):
    (S==3)?(7'b0110000):
    (S==4)?(7'b0011001):
    (S==5)?(7'b0010010):
    (S==6)?(7'b0000010):
    (S==7)?(7'b1111000):
	 (S==8)?(7'b0000000):
	 (S==9)?(7'b0011000):(7'b1111111);
       
endmodule
