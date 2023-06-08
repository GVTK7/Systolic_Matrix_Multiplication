// Signed Multiplier 
// Parallel Multiplier 
// A size is N and B size is M
// ---- Written by Bhanu Prakash Reddy ---

module Array_MUL_Sign #(parameter N=32,M=11)(A,B,sn,out);
    input [N-1:0]A;
    input [M-1:0]B;
    input sn;
    output [M+N-1:0]out;
 


   wire [N-1:0]a;
   wire [M-1:0]b;
   assign a=sn?(A[N-1]?(~(A-1)):A)		:A       ;
   assign b=sn?(B[M-1]?(~(B-1)):B)		:B       ;

   wire [M+N-1:0]Y;
Array_MUL_USign #(N,M)  unsign_forsign(a,b,Y);
assign out=sn?	(A[N-1]^B[M-1] ?~{1'b0,Y[M+N-2:0]}+1 :Y	)		:Y;

endmodule