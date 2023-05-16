module RingShiftRegister #(parameter N=2,S=8)( input wire clk,
  input rst,
  input enable,
  input [S*N-1:0]in,
  output reg [N-1:0] shift_out);



  reg [S*N-1:0] register;
  //reg [S*N-1:0] regst;




  always @(posedge clk ) begin
    if (rst==1) 
      register = in;
    if((rst==0)*(enable==1))begin
      shift_out=register [N-1:0];
 //     regst=register>>1;
      register = register>>1;
    end
  end


endmodule
