module Delay_module #(parameter N=2,S=4)(clk,rst,D,Q);
input clk,rst;
input [S*N-1:0]D;
output [S*N-1:0]Q;

wire [N-1:0]Qbar;
assign Q[S*N-1:S*N-N]=D[S*N-1:S*N-N];
genvar i;
generate 
    for(i=1;i<S;i=i+1)
     //Dfpl  #(N,i) Dflpflp_dlymdle(clk,rst, D[N+i*N-1:i*N], Q[N+i*N-1:i*N], Qbar);
    No_of_Dlys  #(N,i) Numberof_dlymdle(clk,rst, D[(S*N-i*N)-1:(S*N-i*N)-N], Q[(S*N-i*N)-1:(S*N-i*N)-N], Qbar);
endgenerate

endmodule





