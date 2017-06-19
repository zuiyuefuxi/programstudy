module MAX4(a,b,sel,f);
input [3:0] a,b;
input sel;
output [3:0] f;
assign f = sel?a:b;
endmodule