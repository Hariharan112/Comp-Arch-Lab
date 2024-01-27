module magnitude_comparator (
    input [2:0] A,
    input [2:0] B,
    output A_greater_than_B,
    output A_less_than_B,
    output A_equal_to_B
);

wire A_greater_than_B_wire, A_less_than_B_wire;
wire [2:0] A_xor_B;

assign A_greater_than_B = A_greater_than_B_wire;
assign A_less_than_B = A_less_than_B_wire;
assign A_equal_to_B = ~(A_greater_than_B_wire | A_less_than_B_wire);

assign A_xor_B = A ^ B; // Bit-wise XOR operation

// Generate outputs for A > B
assign A_greater_than_B_wire = (A[2] & ~B[2]) | ((A[2] ^ B[2]) & A_xor_B[2]);
assign A_greater_than_B_wire = A_greater_than_B_wire | ((A[1] & ~B[1] & ~A_greater_than_B_wire) | ((A[1] ^ B[1]) & A_xor_B[1] & ~A_greater_than_B_wire));
assign A_greater_than_B_wire = A_greater_than_B_wire | ((A[0] & ~B[0] & ~A_greater_than_B_wire) | ((A[0] ^ B[0]) & A_xor_B[0] & ~A_greater_than_B_wire));

// Generate outputs for A < B
assign A_less_than_B_wire = (~A[2] & B[2]) | ((A[2] ^ B[2]) & A_xor_B[2]);
assign A_less_than_B_wire = A_less_than_B_wire | ((~A[1] & B[1] & ~A_less_than_B_wire) | ((A[1] ^ B[1]) & A_xor_B[1] & ~A_less_than_B_wire));
assign A_less_than_B_wire = A_less_than_B_wire | ((~A[0] & B[0] & ~A_less_than_B_wire) | ((A[0] ^ B[0]) & A_xor_B[0] & ~A_less_than_B_wire));

endmodule
