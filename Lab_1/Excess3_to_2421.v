
// Module for conversion of Excess3 to 2421 format
module ex3_to_2421(
    input wire [3:0] ex
    output wire [3:0] out

);

// LSB K-Map
out[0] = ~ex[0];

// 2nd bit K-Map
out[1] = ex[1] ^ ex[0] | ex[3] & ex[2] | ex[3] & ex[1];

// 3rd bit K-Map
out[2] = ex[2] & ex[1] | ex[3] & ~ex[1] | ex[3] & ~ex[2];

// MSB K-Map
out[3] = ex[3] & ex[2] | ex[3] & ex[1] & ex[0];

endmodule
