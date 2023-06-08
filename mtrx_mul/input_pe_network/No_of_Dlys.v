module No_of_Dlys #(parameter N=18,S=3)(clk,rst, D, Q, Qbar);
input clk,rst;
input [N-1:0]D;
output [N-1:0] Q;
output [N-1:0]Qbar; 


wire [S*N-1:0]Qq;
wire [S*N-1:0]qbar;
genvar i;
generate 
    for(i=0;i<S;i=i+1)
    if(i==0)
     DFlipFlop  #(N)Dfpl_mdle   (clk,rst,                   D,       Qq[N-1:0],      qbar[N-1:0]);
     else
     DFlipFlop  #(N)Dfpl_mdle1  (clk,rst,       Qq[i*N-1:i*N-N],    Qq[N+i*N-1:i*N], qbar[N+i*N-1:i*N]);
endgenerate
assign Q=Qq[S*N-1:S*N-N];
endmodule


