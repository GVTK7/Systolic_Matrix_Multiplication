// enable==1 ,then the sifting starts @posedge clk triggering


module RingShiftRegister #(parameter S=8,N=2)( input wire clk,
  input rst,
  input enable,
  input [S-1:0]in,
  output reg [N-1:0] shift_out);



  reg [S-1:0] register;
  //reg [S*N-1:0] regst;




  always @(posedge clk ) begin
    if ((rst==1)|(enable==0)) begin
      register = in;
      shift_out={(N){1'b0}};
    end
    if((rst==0)*(enable==1))begin
      shift_out=register [N-1:0];
 //     regst=register>>1;
      register = register>>N;
    end
  end


endmodule
