// Unsigned Multiplier 
// Parallel Multiplier 
// A size is N and B size is M
// ---- Written by Dr. Vikram ---

module Array_MUL_USign #(parameter N=32,M=11)(A,B,Y);
    input [N-1:0]A;
    input [M-1:0]B;
    output [M+N-1:0]Y;
    
   
    // Declare partial products terms, Total partial products are M
	wire [N-1:0]P[0:M-1]; // Bits-size of each partial product is N-bits
	wire [N-1:0]S[0:M-1]; // 

// Generate partial products 

genvar i;
generate

    for(i=0;i<M;i=i+1)
    begin:partial_products_gen
    	assign P[i] = B[i] ? A : {(N){1'B0}};
    end
endgenerate

// Add partial products 
    assign {S[0], Y[0]} = {1'b0, P[0]}; 



generate 
genvar j; 
	for(j = 0; j < M-1; j = j + 1)
	begin: Add_partial_products
		assign {S[j+1], Y[j+1]} = P[j+1] + S[j]; 
	end
endgenerate
    
assign Y[N+M-1:M] = S[M-1];
endmodule