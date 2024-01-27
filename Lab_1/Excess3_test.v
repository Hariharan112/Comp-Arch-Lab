module Excess3_2421_Test;

reg a,b,c,d;

wire w,x,y,z;

Excess3_to_2421 e3(a,b,c,d,w,x,y,z);

initial begin
    $dumpfile("Excess3_2421_output.vcd");
    $dumpvars(0,Excess3_2421_Test);

    a=0;
    b=0;
    c=0;
    d=0;

    #10;  // Wait 10ns

    a=0;
    b=0;
    c=0;
    d=1;
    