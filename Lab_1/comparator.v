module magnitude_comparator_DF (
    input [2:0] A,
    input [2:0] B,
    output A_greater_than_B,
    output A_less_than_B,
    output A_equal_to_B
);

wire A_greater_than_B_wire, A_less_than_B_wire;
// Generate outputs for A > B
assign A_greater_than_B = (A[2] && ~B[2]) || (~(A[2] ^ B[2]) && (A[1] && ~B[1] || (~(A[1] ^ B[1]) && (A[0] && ~B[0]))));
assign A_less_than_B = (~A[2] && B[2]) || (~(A[2] ^ B[2]) && (~A[1] && B[1] || (~(A[1] ^ B[1]) && (~A[0] && B[0]))));
assign A_equal_to_B = ~(A[2] ^ B[2]) && ~(A[1] ^ B[1]) && ~(A[0] ^ B[0]);

endmodule

