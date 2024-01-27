module HalfAdd_Test;

reg a,b;

wire s,c;

HalfAdd ha1(a,b,s,c);

initial begin
    $dumpfile("HalfAdd_output.vcd"); 
    $dumpvars(0,HalfAdd_Test);

    a=0;
    b=0;

    #10;  // Wait 10ns

    // Add more stimulus
    a=0;
    b=1;

    #10;  // Wait 10s

    a=1;
    b=0;

    #10;  // Wait 10s

    a=1;
    b=1;

    #10;  // Wait 10s

    $finish;
end

endmodule