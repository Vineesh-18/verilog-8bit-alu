`timescale 1ns/1ps
 
module tb_alu_8bit;
 
    reg [7:0] A;
    reg [7:0] B;
    reg [2:0] opcode;
 
    wire [7:0] result;
    wire ZERO_FLAG;
    wire NEGATIVE_FLAG;
    wire OVERFLOW_FLAG;
 
    ALU_8bit dut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result),
        .ZERO_FLAG(ZERO_FLAG),
        .NEGATIVE_FLAG(NEGATIVE_FLAG),
        .OVERFLOW_FLAG(OVERFLOW_FLAG)
    );

initial begin
    $dumpfile("alu_waveform.vcd");
    $dumpvars(0, tb_alu_8bit);
    end
 
    initial begin
        // test 1: ADD
        A = 8'd15;
        B = 8'd10;
        opcode = 3'b000;
        #10;
        $display("ADD:    A=%d , B=%d , result=%d , Z=%b , N=%b , OVF=%b", A, B, result, ZERO_FLAG, NEGATIVE_FLAG, OVERFLOW_FLAG);
 
        // test 2: SUB
        A = 8'd15;
        B = 8'd10;
        opcode = 3'b001;
        #10;
        $display("SUB:    A=%d , B=%d , result=%d , Z=%b , N=%b , OVF=%b", A, B, result, ZERO_FLAG, NEGATIVE_FLAG, OVERFLOW_FLAG);
 
        // test 3: AND
        A = 8'b11001100;
        B = 8'b10101010;
        opcode = 3'b010;
        #10;
        $display("AND:    A=%b , B=%b , result=%b", A, B, result);
 
        // test 4: OR 
        A = 8'b11001100;
        B = 8'b10101010;
        opcode = 3'b011;
        #10;
        $display("OR:     A=%b , B=%b , result=%b", A, B, result);
 
        // test 5: NOT_B
        A = 8'b11001100;
        B = 8'b10101010;
        opcode = 3'b100;
        #10;
        $display("NOT_B:  B=%b , result=%b", B, result);
 
        // test 6: XOR
        A = 8'b11001100;
        B = 8'b10101010;
        opcode = 3'b101;
        #10;
        $display("XOR:    A=%b , B=%b , result=%b", A, B, result);
 
        //  test 7: LEFT SHIFT
        A = 8'b00001111;
        opcode = 3'b110;
        #10;
        $display("LSHIFT: A=%b , result=%b", A, result);
 
        // test 8: RIGHT SHIFT
        A = 8'b11110000;
        opcode = 3'b111;
        #10;
        $display("RSHIFT: A=%b , result=%b", A, result);
 
        // test 9: ZERO flag check (5 - 5 = 0)
        A = 8'd5;
        B = 8'd5;
        opcode = 3'b001; // SUB
        #10;
        $display("SUB_ZERO: A=%d , B=%d , result=%d , Z=%b", A, B, result, ZERO_FLAG);
 
        // test 10: NEGATIVE flag check (3 - 10 = -7)
        A = 8'd3;
        B = 8'd10;
        opcode = 3'b001; // SUB
        #10;
        $display("SUB_NEG:  A=%d , B=%d , result=%b , N=%b", A, B, result, NEGATIVE_FLAG);
 
        // test 11: OVERFLOW flag
        A = 8'd127;
        B = 8'd1;
        opcode = 3'b000; // ADD
        #10;
        $display("ADD_OVF: A=%d , B=%d , result=%b , OVF=%b", A, B, result, OVERFLOW_FLAG);
 
        $finish;
    end
 
endmodule