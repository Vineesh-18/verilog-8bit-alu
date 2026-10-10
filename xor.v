module XOR(
    input [7:0]A,
    input [7:0]B,
    output [7:0]XOR_OUT
);

    assign XOR_OUT = A ^ B;
endmodule