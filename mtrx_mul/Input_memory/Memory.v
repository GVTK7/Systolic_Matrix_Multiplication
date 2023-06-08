module Memory #(parameter N=8,A=64,L2=81) (clk,rst,sel,in,out);
parameter S=L2*N;
input clk,rst;
input sel;
input [A*S-1:0]in;
output [A*N-1:0]out;

genvar i;
generate
for(i=0;i<A;i=i+1)begin
RingShiftRegister #(S,N)mery_rngsft_reg2(clk,rst,sel,     in[(A-i)*S-1:(A-i-1)*S],   out[(A-i)*N-1:(A-i-1)*N]);
end
endgenerate

endmodule
