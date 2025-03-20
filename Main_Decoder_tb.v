`timescale 1ns / 1ps

module Main_Decoder_tb;
    reg [6:0] op;
    wire [1:0] ResultSrc;
    wire MemWrite, Branch, ALUSrc, RegWrite, Jump;
    wire [1:0] ImmSrc, ALUop;

    // Instantiate the Main_Decoder
    Main_Decoder main_decoder(
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

    initial begin
        // Test R-type instruction
        op = 7'b0110011; // R-type
        #10;

        // Test I-type ALU instruction
        op = 7'b0010011; // I-type ALU
        #10;

        // Test lw instruction
        op = 7'b0000011; // lw
        #10;

        // Test sw instruction
        op = 7'b0100011; // sw
        #10;

        // Test beq instruction
        op = 7'b1100011; // beq
        #10;

        // Test jal instruction
        op = 7'b1101111; // jal
        #10;

        // Test jalr instruction
        op = 7'b1100111; // jalr
        #10;

        // Test lui instruction
        op = 7'b0110111; // lui
        #10;

        // Test reset condition
        op = 7'b0000000; // Reset
        #10;

        // Test undefined opcode
        op = 7'b1111111; // Undefined
        #10;

        // End simulation
        $finish;
    end
endmodule