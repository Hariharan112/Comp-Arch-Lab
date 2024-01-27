// Module for conversion of Excess3 to 2421 format
module ex3_to_2421(
    input wire [3:0] ex,
    output wire [3:0] out
);

// LSB K-Map
assign out[0] = ~ex[0];

// 2nd bit K-Map
assign out[1] = (ex[1] ^ ex[0]) || (ex[3] & ex[2]) || (ex[3] & ex[1]);

// 3rd bit K-Map
assign out[2] = ex[2] & ex[1] & ex[0] || ex[3] & ~ex[1] || ex[3] & ~ex[2];

// MSB K-Map
assign out[3] = ex[3] & ex[2] || ex[3] & ex[1] & ex[0];

endmodule


module testbench;
    reg [3:0] ex;
    wire [3:0] out;
    integer i;
    
    ex3_to_2421 ex3_to_2421_test(ex, out);

    //Testbench 
    initial begin
        $dumpfile("testbench_output.vcd");
        $dumpvars(0, testbench);
        //Iterate through all possible 4-bit numbers
        for(i=3;i<16; i = i+1)begin
            ex = i;
            #10;
        end
        $finish;
    end
endmodule