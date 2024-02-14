module hw4(out,in,clr,clk);
input in,clr,clk;
output out;
reg out;
reg [1:0] state,next_state;
parameter s0=2'd0,s1=2'd1,s2=2'd2,s3=2'd3;

always@(posedge clk)
begin
	if(clr) state<=s0;
	else state<=next_state;
end

always@(state or in)
begin
case(state)
	s0:begin
		case(in)
			0:begin next_state<=s1;end
			1:begin next_state<=s0;end
		endcase
	   end
	s1:begin
		case(in)
			0:begin next_state<=s1;end
			1:begin next_state<=s2;end
		endcase
	   end
	s2:begin
		case(in)
			0:begin next_state<=s1;end
			1:begin next_state<=s3;end
		endcase
	   end
	s3:begin
		case(in)
			0:begin next_state<=s1;end
			1:begin next_state<=s0;end
		endcase
	   end
endcase
end

always@(state or in)
begin
if((state==s3)&&(in==1'b0))
	out=1;
else
	out=0;
end
endmodule 













module test_hw4;
wire out;
reg in,clr,clk;
hw4 test_hw4(out,in,clr,clk);

initial
$monitor($time,"in=%b,out=%b,clk=%b",in,out,clk);
initial
	clk=1;
always
begin
	#5 clk=~clk;
end

initial
begin
clr=1;
#10 clr=0;
end

initial
begin
in=0;
#10 in=0;
#10 in=1;
#10 in=0;
#10 in=1;
#10 in=1;
#10 in=0;
#10 in=1;
#10 in=0;
#10 in=1;
#10 in=1;
#10 in=0;
#10 in=1;
#10 in=1;
#10 in=0;
#10 in=1;
#10 in=0;
#10 $finish;
end
endmodule 