`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:53:26 05/19/2022 
// Design Name: 
// Module Name:    bcdcounter 
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

module bcd_counter(
    input clk,
    input rst,
    output [6:0]seg,
	 output[2:0] en
    );
	
	reg [3:0]u,t,h;

	seven_segment s1(count,clk,rst,en,u,t,h);
	clk_divider c1(clk,clk1,rst);
	
	always@ (posedge clk1)
		begin
			if (rst)
				begin
					u=0;
					t=0;
					h=0;
				end
			else 
				begin 
					u=u+1'b1;
					if(u==10)
						begin
							u=0;
							t=t+1'b1;
						end
					if(t==10)
						begin
							t=0;
							h=h+1'b1;	
						end
					if(h==10)
						h=0;
						
				end
		end
endmodule


module seven_segment(
	 input clk,
	 input rst,
    input [3:0] in,
	 input [3:0]u,t,h,
    output reg [6:0] out,
	 output reg[2:0]en
    );
	         
	assign out=(in==0)?7'b1000000:
				  (in==1)?7'b1111001:
				  (in==2)?7'b0100100:
				  (in==3)?7'b0110000:
				  (in==4)?7'b0011001:
				  (in==5)?7'b0010010:
				  (in==6)?7'b0000010:
				  (in==7)?7'b1111000:
				  (in==8)?7'b0000000:
				  (in==9)?7'b0010000:7'b1111111;
	
	always@(posedge clk)
			  
	if(rst)
		begin
			en=3'b110;
			out=0;
		end
	else if(en==3'b110)
		begin
			en=3'b101;
			out=t;
		end
	else if(en==3'b101)
		begin
			en=3'b011;
			out=h;
		end
		else if(en==3'b011)
			begin
				en=3'b110;
				out=u;	
			end
endmodule


