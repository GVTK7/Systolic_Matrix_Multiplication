// N size of input data
//M size of the output 
// S-PE network length
// F-PE network height


module row#(parameter N=8,M=18,S=8)   (clk,rst,sn,
                                                A,
                                                B0,
                                                Data,
                                                Aa,
                                                B1);
 //Input output declaration                                               
input clk,rst,sn;
input wire [N-1:0]A; 
input wire [S*N-1:0]B0;

output wire [S*M-1:0]Data;
output [N-1:0]Aa;
output wire [S*N-1:0]B1;

//Intermediate wire declaration
wire [S*N-1:0]A1;

genvar i;
generate 
for(i=0;i<S;i=i+1)begin
if(i==0)
pe #( N,M) pe_main_mul  (A,    B0[S*N-1:(S-1)*N],clk,rst,sn,   Data[S*M-1:(S-1)*M],    A1[S*N-1:(S-1)*N],      B1[S*N-1:(S-1)*N]);
else 
pe #( N,M) pe_main_mul (A1[(S-i+1)*N-1:(S-i)*N],B0[(S-i)*N-1:(S-i-1)*N],clk,rst,sn,Data[(S-i)*M-1:(S-i-1)*M],A1[(S-i)*N-1:(S-i-1)*N],    B1[(S-i)*N-1:(S-i-1)*N]);
end
endgenerate

assign Aa=A1[N-1:0];
/*
pe #( N,M) pe_main_mul  (A,    B0[N-1:0],clk,rst,sn,    Data[M-1:0],    A1[0],      B1[N-1:0]);
pe #( N,M) pe_main_mul2 (A1[0],B0[2*N-1:N],clk,rst,sn,  Data[2*M-1:M],  A1[1],    B1[2*N-1:N]);
pe #( N,M) pe_main_mul3 (A1[1],B0[3*N-1:2*N],clk,rst,sn,Data[3*M-1:2*M],A1[2],  B1[3*N-1:2*N]);
pe #( N,M) pe_main_mul4 (A1[2],B0[4*N-1:3*N],clk,rst,sn,Data[4*M-1:3*M],A1[3],  B1[4*N-1:3*N]);*/

endmodule

















/*
genvar i;
generate 
for(i=0;i<S;i=i+1)begin
if(i==0)
pe #( N,M) pe_main_mul (A,B[0],clk,rst,sn,Data[0],A1[i],B1[i]);
else 
pe #( N,M) pe_main_mul (A1[i-1],B[i],clk,rst,sn,Data[i],A1[i],B1[i]);
end
endgenerate
*/






















/*
module row#(parameter N=8,M=18,S=4,lnS=2)   (clk,rst,A,B,Data,B1);
input clk,rst;
input wire [N-1:0]A; 
input wire [N-1:0]B[0:S-1];
output wire [M-1:0]Data[0:S-1];
output wire [N-1:0]B1[0:S-1];
wire [N-1:0]A1[0:S-1];



genvar i;
generate 
for(i=0;i<S;i=i+1)begin
if(i==0)
pe #( N,M) pe_main_mul (A[0],B[0],clk,rst,Data[0],A1[0],B1[0]);
else 
pe #( N,M) pe_main_mul (A1[i-1],B[i],clk,rst,Data[i],A1[i],B1[i]);
end
endgenerate


endmodule
*/