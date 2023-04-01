
module ringcounter(
    input  clk,
    input  rst,
    output reg [7:0] count
	 //reg [7:0] count
    );
	 
clk_divider cd(clk,clk1,rst);
always @(posedge clk1)
begin
	if(rst)
		count<=8'b10000000;
	else
		begin
			count <= count << 1; //Shift Left (Fill with Zero)
			count[0] <= count[7];
			//Compare blocking assignment (=) VS non-blocking assignment (<=)
		end
end

endmodule

module clk_divider(clk,clk1,rst);
integer counter=0;
input clk,rst;
output reg clk1;
always@(posedge clk)
begin
	if(rst)
		begin
			counter=0;
			clk1=0;
		end
	else
		begin
			counter=counter+1;
			if(counter==1000000)
				begin
					clk1=~clk1;
					counter=0;
				end
		end
end
endmodule
