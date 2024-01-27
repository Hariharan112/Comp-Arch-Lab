module testbench;
  reg [2:0] A, B;
  wire A_greater_than_B, A_less_than_B, A_equal_to_B;
  integer i,j;

  magnitude_comparator_DF dataflow (
    A, B, A_greater_than_B, A_less_than_B, A_equal_to_B
  );

  // Testbench 
  initial begin
    $dumpfile("testbench_output.vcd");
    $dumpvars(0, testbench);
    //Iterate through all possible 3-bit numbers
    for(i=0;i<8; i = i+1)begin
        {A[0],A[1],A[2]} = i;
        for(j=0;j<8; j = j+1)begin
            {B[0],B[1],B[2]} = j;
            #10;
        end
    end
    $finish;
  end

endmodule
