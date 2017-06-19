module MAX2_4to1(a,b,sel,y);
input [3:0] a,b;
input sel;
output [3:0] y;
assign y = sel?a:b;
endmodule