// N size of input data
//M size of the output 




module pe #(parameter N=8,M=18) (A,B, clk,rst,sn,data,A1,B1);

input [N-1:0]A,B;
input clk,rst,sn;
output /*reg*/ [M-1:0]data;
output  [N-1:0] A1,B1;

//Multiplication
wire [2*N-1:0]out;
Array_MUL_Sign #(N,N) mul_pe(A,B,sn,out);



wire [M-1:0]add_in1,add_in2;
wire [M-1:0]add_sum;

//Data Flipflop
wire [M-1:0]QbarD;
DFlipFlop  #(M) data_flipflop(clk,rst, add_sum, add_in2, QbarD);

//Adition
assign add_in1={{(M-N-N){sn}},out};

//Add_Sub_Nbit #(M)  add_pe({(sn){add_in1[M-2]},add_in1},add_in2}, 0, add_sum);
Add_Sub_Nbit #(M)  add_pe(add_in1,add_in2, 1'b0, add_sum);



//A flipflop
wire [N-1:0]QbarA;
DFlipFlop  #(N) A_flipflop(clk,rst,A,A1,QbarA);

//B flipflop
wire [N-1:0]QbarB;
DFlipFlop  #(N) B_flipflop(clk,rst,B,B1, QbarB);
assign data=add_in2;

endmodule




















/*
always@(posedge clk)begin
if(rst==1)
data=0;
else 
data=add_in2;
end
*/