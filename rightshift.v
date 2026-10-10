module RIGHTSHIFT(
    input [7:0]A,
    output [7:0]RIGHTSHIFT_OUT
);
    
    assign RIGHTSHIFT_OUT = A >> 1;
endmodule