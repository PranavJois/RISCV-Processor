`timescale 1ns / 1ps

`timescale 1ns / 1ps
module ALU_Decoder_tb;

    reg opb5, funct7b5;
    reg [2:0] funct3;
    reg [1:0] ALUOp;

    wire [3:0] ALUControl;

    ALU_Decoder alu_decoder(
        .opb5(opb5), 
        .funct3(funct3), 
        .funct7b5(funct7b5), 
        .ALUOp(ALUOp), 
        .ALUControl(ALUControl)
    );

    initial begin
        // Initialize signals
        opb5 = 0;
        funct3 = 3'b000;
        funct7b5 = 0;
        ALUOp = 2'b00;
        #5; // Small delay for stability

        // Test case 1: Load/Store (Addition)
        opb5 = 1;
        funct3 = 3'b000;
        funct7b5 = 1;
        ALUOp = 2'b00;
        #20;

        // Test case 2: SLT instruction (set less than)
        opb5 = 0;
        funct3 = 3'b010;
        funct7b5 = 0;
        ALUOp = 2'b10;
        #20;

        // Test case 3: SLL instruction (shift left logical)
        opb5 = 1;
        funct3 = 3'b001;
        funct7b5 = 0;
        ALUOp = 2'b11;
        #20;

        // Test case 4: AND instruction
        opb5 = 0;
        funct3 = 3'b111;
        funct7b5 = 0;
        ALUOp = 2'b10;
        #20;

        // Test case 5: SUB instruction (R-type subtraction)
        opb5 = 1;
        funct3 = 3'b000;
        funct7b5 = 1;
        ALUOp = 2'b10;
        #20;

        // Test case 6: OR instruction
        opb5 = 0;
        funct3 = 3'b110;
        funct7b5 = 0;
        ALUOp = 2'b10;
        #20;

        $finish;
    end

    initial begin
        $monitor("At time %t: ALUOp=%b, opb5=%b, funct3=%b, funct7b5=%b, ALUControl=%b", 
                 $time, ALUOp, opb5, funct3, funct7b5, ALUControl);
    end

endmodule



(not needed -code):-

module ALU_Decoder_tb;

    reg opb5, funct7b5;
    reg [2:0] funct3;
    reg [1:0] ALUOp;

    wire [3:0] ALUControl;

    ALU_Decoder alu_decoder(
        .opb5(opb5), 
        .funct3(funct3), 
        .funct7b5(funct7b5), 
        .ALUOp(ALUOp), 
        .ALUControl(ALUControl)
    );

    initial begin

        opb5 = 1;
        funct3 = 3'b000;
        funct7b5 = 1;
        ALUOp = 2'b00;
        #20;

        opb5 = 0;
        funct3 = 3'b010;
        funct7b5 = 0;
        ALUOp = 2'b10;
        #20;

        opb5 = 1;
        funct3 = 3'b001;
        funct7b5 = 0;
        ALUOp = 2'b11;
        #20;


        $finish;
    end

    initial begin
        $monitor("At time %t, ALUControl = %b", $time, ALUControl);
    end

endmodule
