`timescale 1ns / 1ps

module TopModule_tb;

    // Inputs
    reg [6:0] op;

    // Outputs
    wire ResultSrc, MemWrite, Branch, ALUSrc, RegWrite, Jump;
    wire [1:0] ImmSrc, ALUop;

    // Instantiate the Main Decoder module
    Main_Decoder uut (
        .op(op),
        .ResultSrc(ResultSrc),
        .MemWrite(MemWrite),
        .Branch(Branch),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .Jump(Jump),
        .ImmSrc(ImmSrc),
        .ALUop(ALUop)
    );

    // Test sequence
    initial begin
        // Apply test cases
        #5 op = 7'b0000011;  // lw
        #5 op = 7'b0100011;  // sw
        #5 op = 7'b0110011;  // R-type
        #5 op = 7'b0010011;  // I-type ALU
        #5 op = 7'b1100011;  // Branch (BEQ)
        #5 op = 7'b1101111;  // Jump (JAL)
        #5 op = 7'b0110111;  // LUI (U-type)
        #5 op = 7'b0010111;  // AUIPC
        #5 op = 7'b0000000;  // Default case (unknown opcode)

        #10 $finish; // End simulation
    end

endmodule