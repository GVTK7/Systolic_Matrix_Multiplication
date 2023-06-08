module tb_pe();
parameter N=8;
parameter M=18;
reg [N-1:0]A,B;
reg clk,rst,sn;
wire[M-1:0] data;
wire [N-1:0] A1,B1;
pe #(N,M) tb_pe_instance(A,B,clk,rst,sn,data,A1,B1);

initial begin
clk=1;
sn=0;
#40 rst=1;
#30 rst=0; A=8'd5;B=8'd3;
//#20 A=8'd1;B=8'd0;
//#20 A=8'd0;B=8'd0;



end


always #10 clk=~clk;
endmodule