module OR(
    input [7:0]A,
    input [7:0]B,
    output [7:0]OR_OUT
);

    assign OR_OUT = A | B;
endmodule