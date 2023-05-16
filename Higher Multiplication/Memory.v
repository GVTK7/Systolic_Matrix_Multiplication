module Memory #(parameter N=2,S=4) (clk,rst,sel,in1,in2,A1,A2);
input clk,rst;
input sel;
input [2*N*S*S-1:0]in1,in2;
output [S*N-1:0]A1,A2;

genvar i;
generate
for(i=0;i<S;i=i+1)begin
RingShiftRegister #( N,S)mery_rngsft_reg(clk,rst,~sel,      in1[(2*N*S*S-i*2*N*S)-1:(2*N*S*S-i*2*N*S)-2*N*S],   A1[(S*N-i*N)-1:(S*N-i*N)-N]);
RingShiftRegister #( N,S)mery_rngsft_reg2(clk,rst,sel,      in2[(2*N*S*S-i*2*N*S)-1:(2*N*S*S-i*2*N*S)-2*N*S],   A2[(S*N-i*N)-1:(S*N-i*N)-N]);
end
endgenerate

endmodule
