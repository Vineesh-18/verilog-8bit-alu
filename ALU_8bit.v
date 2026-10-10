module ALU_8bit(
    input  [7:0] A, B,
    input  [2:0] opcode,
    output reg [7:0] result,
    output reg ZERO_FLAG,
    output reg NEGATIVE_FLAG,
    output reg OVERFLOW_FLAG
);

    parameter ADD        = 3'b000;
    parameter SUB        = 3'b001;
    parameter AND_OP     = 3'b010;
    parameter OR_OP      = 3'b011;
    parameter NOT_OP     = 3'b100;
    parameter XOR_OP     = 3'b101;
    parameter LSHIFT_OP  = 3'b110;
    parameter RSHIFT_OP  = 3'b111;

    wire [7:0] add_out, sub_out, and_out, or_out, xor_out, not_out, lshift_out, rshift_out;

    ADDER      u_adder    (.A(A), .B(B), .SUM(add_out));
    SUBTRACTOR u_sub      (.A(A), .B(B), .DIFF(sub_out));
    AND        u_and      (.A(A), .B(B), .AND_OUT(and_out));
    OR         u_or       (.A(A), .B(B), .OR_OUT(or_out));
    XOR        u_xor      (.A(A), .B(B), .XOR_OUT(xor_out));
    NOT_B      u_not      (.B(B), .NOT_B_OUT(not_out));
    LEFTSHIFT  u_lshift   (.A(A), .LEFTSHIFT_OUT(lshift_out));
    RIGHTSHIFT u_rshift   (.A(A), .RIGHTSHIFT_OUT(rshift_out));

    always @(*) begin
        case (opcode)
            ADD       : result = add_out;
            SUB       : result = sub_out;
            AND_OP    : result = and_out;
            OR_OP     : result = or_out;
            NOT_OP    : result = not_out;
            XOR_OP    : result = xor_out;
            LSHIFT_OP : result = lshift_out;
            RSHIFT_OP : result = rshift_out;
            default   : result = 8'b0000_0000;
        endcase

        ZERO_FLAG = (result == 8'b0000_0000);

        NEGATIVE_FLAG = result[7];

        case (opcode)
            ADD     : OVERFLOW_FLAG = (~A[7] & ~B[7] &  result[7]) |
                                       ( A[7] &  B[7] & ~result[7]);
            SUB     : OVERFLOW_FLAG = ( A[7] ^  B[7]) & (A[7] ^ result[7]);
            default : OVERFLOW_FLAG = 1'b0;
        endcase
    end

endmodule