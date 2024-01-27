module testbench;

  // Parameters
  parameter WIDTH = 3;

  // Signals
  reg [WIDTH-1:0] A, B;
  wire A_greater_than_B, A_less_than_B, A_equal_to_B;

  // Instantiate the magnitude comparator module
  magnitude_comparator dut (
    .A(A),
    .B(B),
    .A_greater_than_B(A_greater_than_B),
    .A_less_than_B(A_less_than_B),
    .A_equal_to_B(A_equal_to_B)
  );

  // Testbench stimulus
  initial begin
    $dumpfile("testbench_output.vcd");
    $dumpvars(0, testbench);
    // Iterate through all possible 3-bit numbers
    repeat(2**WIDTH) begin
      A = $random;
      B = $random;

      // Display input values
      $display("Input: A = %b, B = %b", A, B);

      // Apply inputs and wait for the outputs to stabilize
      #10;

      // Display output values after a delay
      $display("Output: A > B: %b, A < B: %b, A = B: %b",
                  A_greater_than_B, A_less_than_B, A_equal_to_B);
    end

    // End simulation
    $finish;
  end

endmodule
