// N size of input data
//M size of the output 
// X-PE network length
// Y-PE network height


module Pe_network   #(parameter N=8,M=10,X=6,Y=24)   (input clk,rst,sn,
                                                        input [X*N-1:0]A0,
                                                        input [Y*N-1:0]B0,
                                                        output [X*N-1:0]A11,
                                                        output [Y*N-1:0]B11,                  
                                                        output [Y*X*M-1:0]D);                                   



wire [Y*X*N-1:0]B1;

genvar i;
generate 
for(i=0;i<X;i=i+1)begin
if(i==0)
row#(N,M,Y)  row_instance_in_44_mul  (clk,rst,sn,   A0[X*N-1:X*N-N],{B0[Y*N-1:0]}, {D[Y*X*M-1:Y*X*M-Y*M]},A11[X*N-1:X*N-N], {B1[Y*X*N-1:Y*X*N-Y*N]});
else
row#(N,M,Y)  row_instance_in_44_mul  (clk,rst,sn,   A0[(X*N-i*N)-1:(X*N-i*N)-N],{B1[(Y*X*N-(i-1)*Y*N)-1:(Y*X*N-(i-1)*Y*N)-Y*N]},{D[(Y*X*M-i*Y*M)-1:(Y*X*M-i*Y*M)-Y*M]}, A11[(X*N-i*N)-1:(X*N-i*N)-N],{B1[(Y*X*N-i*Y*N)-1:(Y*X*N-i*Y*N)-Y*N]});

end
endgenerate

assign B11=B1[X*N-1:0];

endmodule

