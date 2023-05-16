module tb_mul_88;

  // Parameters
  parameter N = 2;
  parameter M = 6;
  parameter S = 4;

  // Inputs
  reg clk;
  reg rst;
  reg sn;
  reg s1,s2;
  reg [2*S*S*N-1:0] A1, A2;
  reg [2*S*S*N-1:0] B1, B2;

  // Outputs
  wire [N-1:0] a1, a2, a3, a4, a5, a6, a7, a8;
  wire [N-1:0] b1, b2, b3, b4, b5, b6, b7, b8;
  wire [M-1:0] d1, d2, d3, d4, d5, d6, d7, d8,
                d9, d10, d11, d12, d13, d14, d15, d16;
                /*d17, d18, d19, d20, d21, d22, d23, d24,
                d25, d26, d27, d28, d29, d30, d31, d32,
                d33, d34, d35, d36, d37, d38, d39, d40,
                d41, d42, d43, d44, d45, d46, d47, d48,
                d49, d50, d51, d52, d53, d54, d55, d56,
                d57, d58, d59, d60, d61, d62, d63, d64;*/

  // Instantiate the module under test
  main #(.N(N), .S(S), .M(M))
    dut (
      .clk(clk),
      .rst(rst),
      .sn(sn),
      .A1(A1),
      .B1(B1),
      .A2(A2),
      .B2(B2),
      .sel1(s1),
      .sel2(s2),
      .Data({d1, d2, d3, d4, d5, d6, d7, d8,
             d9, d10, d11, d12, d13, d14, d15, d16})
    );

  // Reset initialization
  initial begin
    clk = 1;
    rst = 1;
    sn = 0;
    A1 = 64'b1010101010101010101010101010101010101010101010101010101010101010;
    B1 = 64'b1010101010101010101010101010101010101010101010101010101010101010;
    A2 = 64'b0101010101010101010101010101010101010101010101010101010101010101;
    B2 = 64'b0101010101010101010101010101010101010101010101010101010101010101;
    #30
    #400
    s1 = 1'b0;
    s2 = 1'b0;
	rst = 0;

    /*
    #400  rst=1;
    s1 = 1'b0;
    s2 = 1'b1;
    #20 rst=0;

    #400  rst=1;
    s1 = 1'b1;
    s2 = 1'b0;
    #20 rst=0;

    #400  rst=1;
    s1 = 1'b1;
    s2 = 1'b0;
    #20 rst=0;

    */
  end

  // Clock generation
  always #10 clk = ~clk;


endmodule
