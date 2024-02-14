module hw2(clk,clr,i1,i2,i3,i4,A,a,b,c,d,e,f,g);
input clk,clr;
input [3:0] i1,i2,i3,i4;
output [3:0] A;
output a,b,c,d,e,f,g;
wire [1:0] S;
wire [3:0] O;

twobit_counter hw2_twobit_counter(S,clk,clr);
twotofour_decoder hw2_twotofour_decoder(A,S);
sevensegment_decoder hw2_sevensegment_decoder(O,a,b,c,d,e,f,g);
sixteentofour_mux hw2_sixteentofour_mux(S,O,i1,i2,i3,i4);




endmodule 
























module test_hw2;
reg clk,clr;
reg [3:0] i1,i2,i3,i4;
wire [3:0] A;
wire a,b,c,d,e,f,g;
hw2 test_hw2(clk,clr,i1,i2,i3,i4,A,a,b,c,d,e,f,g);
initial
$monitor($time,"clk=%b,clr=%b,i1=%b,i2=%b,i3=%b,i4=%b,A=%b,a=%b,b=%b,c=%b,d=%b,e=%b,f=%b,g=%b",clk,clr,i1,i2,i3,i4,A,a,b,c,d,e,f,g);
initial
begin
clk=0;i1=4;i2=5;i3=6;i4=7;
#50 clr=1;
#100 clr=0;
#80 clr=1;
#200 clr=0;
#1000 $finish;
end
always #50 clk = ~clk;
endmodule 