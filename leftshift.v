module LEFTSHIFT(
    input [7:0]A,
    output [7:0]LEFTSHIFT_OUT
);
    
    assign LEFTSHIFT_OUT = A << 1;
endmodule