

module DFlipFlop  #(parameter M=18) (clk,rst, D, Q, Qbar);

input clk,rst; 
input [M-1:0]D; // input to the D FlipFlop
output reg[M-1:0] Q;
output [M-1:0]Qbar; 


always@(posedge clk)
begin
if(rst==1)
Q=0;
else 
Q = D; // Assigning Q value to D
 

end
assign Qbar = ~Q; 

endmodule


/*

module DFlipFlop  #(parameter M=18) (clk,rst, D, Q, Qbar);

input clk,rst; 
input [M-1:0]D; // input to the D FlipFlop
output reg[M-1:0] Q;
output [M-1:0]Qbar; 
reg [M-1:0]data

always@(posedge clk)
begin
if(rst==1)
Q<=0;
else 
data<= D;
Q<=data;                 // Assigning Q value to D 
end


assign Qbar = ~Q; 

endmodule

*/