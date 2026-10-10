module SUBTRACTOR(
  input [7:0]A,
    input [7:0]B,
    output [7:0]DIFF
);
wire [7:0]b;
    assign b = ~B + 1; // Two's complement of B
    assign DIFF = A + b;

endmodule