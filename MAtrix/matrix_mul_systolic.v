module matrix_mul_systolic   #(parameter N=2,M=5,S=8)   (input clk,rst,sn,
                                                        input [S*N-1:0]A0,B0,
                                                        output [S*N-1:0]A11,B11,                  
                                                        output [S*S*M-1:0]D);






wire [S*N-1:0]A1;
wire [S*S*N-1:0]B1;


//input data assigning
//assign A[0]=A0[N-1:0];assign A[1]=A0[2*N-1:N];assign A[2]=A0[3*N-1:2*N];assign A[3]=A0[4*N-1:3*N];
//assign B[0]=B0[N-1:0];assign B[1]=B0[2*N-1:N];assign B[2]=B0[3*N-1:2*N];assign B[3]=B0[4*N-1:3*N];

genvar i;
generate 
for(i=0;i<S;i=i+1)begin
if(i==0)
row#(N,M,S)  row_instance_in_44_mul  (clk,rst,sn,   A0[S*N-1:S*N-N],{B0[S*N-1:0]}, {D[S*S*M-1:S*S*M-S*M]},A11[S*N-1:S*N-N], {B1[S*S*N-1:S*S*N-S*N]});
else
row#(N,M,S)  row_instance_in_44_mul  (clk,rst,sn,   A0[(S*N-i*N)-1:(S*N-i*N)-N],{B1[(S*S*N-(i-1)*S*N)-1:(S*S*N-(i-1)*S*N)-S*N]},{D[(S*S*M-i*S*M)-1:(S*S*M-i*S*M)-S*M]}, A11[(S*N-i*N)-1:(S*N-i*N)-N],{B1[(S*S*N-i*S*N)-1:(S*S*N-i*S*N)-S*N]});

end
endgenerate


/*
row#(N,M,S)  row_instance_in_44_mul1(clk,rst,sn,A[0], {B[3], B[2],  B[1],  B[0]},{D[S*M-1:0]},A1[0], {B1[3], B1[2], B1[1], B1[0]});
row#(N,M,S)  row_instance_in_44_mul2(clk,rst,sn,A[1],{B1[3],B1[2], B1[1], B1[0]}, {D[2*S*M-1:S*M]},A1[1], {B1[7], B1[6], B1[5], B1[4]});
row#(N,M,S)  row_instance_in_44_mul3(clk,rst,sn,A[2],{B1[7],B1[6], B1[5], B1[4]}, {D[3*S*M-1:2*S*M]},A1[2], {B1[11], B1[10],B1[9],B1[8]});
row#(N,M,S)  row_instance_in_44_mul4(clk,rst,sn,A[3],{B1[11],B1[10],B1[9],B1[8]},{D[4*S*M-1:3*S*M]},A1[3],{B1[15],B1[14],B1[13],B1[12]});
*/


//assign A11=A1;
assign B11=B1[S*N-1:0];
//outports assigning
//assign A11=A1[0];assign A12=A1[1];assign A13=A1[2];assign A14=A1[3];
//assign B11=B1[12];assign B12=B1[13];assign B13=B1[14];assign B14=B1[15];


endmodule

