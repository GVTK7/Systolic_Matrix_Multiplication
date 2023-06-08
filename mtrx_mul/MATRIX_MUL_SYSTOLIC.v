//N-input data size
//M=output data size
//L=matrix order of the filter
//X=no of filters
//Y=toatl image data length




module MATRIX_MUL_SYSTOLIC #(parameter N=8,M=5,X=64,Y=8568,L2=81)  (clk,rst,on,sn,img,fltr,Data);

parameter S=L2*N;

input clk,rst,on,sn;           
input [Y*S-1:0]img;
input [X*S-1:0]fltr;
output [X*Y*M-1:0]Data;



//module convolution #(parameter N=2,M=5,S=8,F=6)  (clk,rst,sn,A,Y,Data);


////X memory inputting Hardware
wire [X*N-1:0]fltr_out;
Memory #( N,X,L2) memry_dataX(clk,rst,on,fltr,fltr_out);

wire [X*N-1:0]fltr_data;
Delay_module #( N,X) dly_mdlX(clk,rst,fltr_out,fltr_data);


////Y memory inputting Hardware
wire [Y*N-1:0]img_out;
Memory #( N,Y,L2) memry_dataY(clk,rst,on,img,img_out);

wire [Y*N-1:0]img_data;
Delay_module #( N,Y) dly_mdlY(clk,rst,img_out,img_data);




wire [Y*N-1:0]Yout;
wire [X*N-1:0]Xout;
Pe_network  #( N,M,X,Y)   Pe_network_instance( clk,rst,sn,fltr_data,img_data,Xout,Yout,Data);

endmodule


