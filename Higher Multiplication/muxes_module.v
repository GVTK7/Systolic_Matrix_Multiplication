module muxes_module #(parameter N=2,S=4)(X,Y,sel,A);
input [S*N-1:0]X,Y;
input sel;
output [S*N-1:0]A;

genvar i;
generate 
    for(i=0;i<S;i=i+1)
    MUX_2in_Nbit #( N ) mux_in_muxmodules(X[(S*N-i*N)-1:(S*N-i*N)-N],Y[(S*N-i*N)-1:(S*N-i*N)-N],sel,A[(S*N-i*N)-1:(S*N-i*N)-N]);
endgenerate

endmodule