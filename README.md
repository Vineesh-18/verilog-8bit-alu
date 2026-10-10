# 8-Bit Arithmetic Logic Unit (ALU) Using Verilog HDL

## Overview

This project implements an 8-bit Arithmetic Logic Unit (ALU) using Verilog HDL. It performs arithmetic and bitwise operations on two 8-bit input operands, A and B. A 3-bit opcode selects the operation to be performed.

The project uses separate Verilog modules for several operations and includes a testbench to apply input combinations and observe the ALU outputs.

## Features

- 8-bit input operands (A and B)
- 3-bit opcode for selecting operations
- Eight arithmetic and logical operations
- Zero, negative, and overflow status flags
- Modular design using separate Verilog modules
- Testbench with operation-specific and status-flag test cases

## Supported Operations

| Opcode | Operation | Description |
|---|---|---|
| `000` | ADD | Adds A and B |
| `001` | SUB | Subtracts B from A |
| `010` | AND | Performs bitwise AND on A and B |
| `011` | OR | Performs bitwise OR on A and B |
| `100` | NOT B | Inverts all bits of B |
| `101` | XOR | Performs bitwise XOR on A and B |
| `110` | Left Shift | Shifts A left by one bit |
| `111` | Right Shift | Shifts A right by one bit |

## Status Flags

The design provides three status outputs:

- `ZERO_FLAG` — Indicates whether the result is zero.
- `NEGATIVE_FLAG` — Indicates a negative result according to the implemented flag logic.
- `OVERFLOW_FLAG` — Indicates arithmetic overflow according to the implemented flag logic.

The testbench includes checks for a zero result, a negative subtraction result, and an addition overflow case.

## Project Structure

- `tb_alu_8bit.v` — Testbench that applies inputs, selects operations, displays results and flags, and generates a VCD waveform file.
- `and(1).v` — Implements bitwise AND.
- `or(1).v` — Implements bitwise OR.
- `sub(1).v` — Implements subtraction using the two's complement of B.
- `notb(1).v` — Implements bitwise NOT of B.
- `xor(1).v` — Implements bitwise XOR.
- `leftshift(1).v` — Implements a one-bit left shift of A.
- `rightshift(1).v` — Implements a one-bit right shift of A.

The main `ALU_8bit` module and any other required supporting modules should also be included in the repository.

## Tools Used

- Verilog HDL
- Icarus Verilog

## Testbench and Verification

The testbench applies input operands and opcodes to exercise the supported operations. It displays the resulting outputs and, for selected arithmetic cases, the status flags.

The test cases include:

- Addition of 15 and 10
- Subtraction of 10 from 15
- Bitwise AND, OR, NOT B, and XOR
- Left and right shift operations
- Zero-flag check using 5 − 5
- Negative-result check using 3 − 10
- Overflow-flag check using 127 + 1

The testbench also includes waveform dumping to the file `alu_waveform.vcd`.

## Concepts Demonstrated

- Combinational logic design
- Arithmetic and bitwise operations
- Opcode-based operation selection
- Modular Verilog design
- Two's complement subtraction
- Status-flag testing
- Testbench development and RTL simulation

