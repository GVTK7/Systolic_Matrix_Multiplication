module main #(parameter N=2,S=4,M=5)  (clk,rst,sn,A1,A2,sel1,B1,B2,sel2,Data);
input clk,rst,sn;

input sel1;                 //sel line for the muxes of A
input [N*2*S*S-1:0]A1;        //Data of 1st half rows of A          
input [N*2*S*S-1:0]A2;        //Data of 2st half rows of A

input sel2;                 //sel line for the muxes of B
input [N*2*S*S-1:0]B1;        //Data of 1st half columns of B
input [N*2*S*S-1:0]B2;        //Data of 2st half columns of B

output [M*S*S-1:0]Data;

//A memory inputting Hardware
wire [S*N-1:0]A11,A22;
Memory #( N,S) mry_A(clk,rst,sel1,A1,A2,A11,A22);

wire [S*N-1:0]Aa;
muxes_module #( N,S)mux_mdl_A(A11,A22,sel1,Aa);
wire [S*N-1:0]A;
Delay_module #( N,S) dly_mdlA(clk,rst,Aa,A);


////B memory inputting Hardware

wire [S*N-1:0]B11,B22;
Memory #( N,S) mry_B(clk,rst,sel2,B1,B2,B11,B22);

wire [S*N-1:0]Bb;
muxes_module #( N,S)mux_mdl_B(B11,B22,sel2,Bb);
wire [S*N-1:0]B;
Delay_module #( N,S) dly_mdlB(clk,rst,Bb,B);

wire [S*N-1:0]Aout,Bout;
matrix_mul_systolic  #( N,M,S)   mtrx_mul_main( clk,rst,sn, A,B,Aout,Bout,Data);

endmodule


