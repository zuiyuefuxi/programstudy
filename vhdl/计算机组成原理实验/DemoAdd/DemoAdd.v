module DemoAdd(a,b,co,ci,sum);

output[3:0] sum;
input[3:0] a,b;
output co;
input ci;

reg co;
reg[3:0] sum;

always@(*)
begin
  {co,sum}= a + b + ci;
end

endmodule