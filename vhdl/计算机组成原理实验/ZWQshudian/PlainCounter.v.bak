module PlainCounter(clk,qL,qH,cout,cout1);
input clk;
output cout,cout1;
output reg[3:0] qL,qH;
assign cout1 = (qL == 0);
assign cout = cout1 & (qH == 1);
always@(posedge clk)
  if(qL < 9)
    qL <= qL + 1;
  else
    qL <= 0;
always@(negedge cout1 )
  if(qH <1)
    qH <= qH + 1;
  else 
    qH <= 0;
endmodule 
   