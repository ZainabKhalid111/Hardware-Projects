`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:26:18 04/16/2022 
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
module task2(
    input I0,
    input I1,
    input sel,
    output out
    );

assign out=sel?I0:I1;
endmodule
