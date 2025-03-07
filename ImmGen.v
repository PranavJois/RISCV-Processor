//with ImmSrc ( input to select the correct immediate format.)

module ImmGen (
    input  logic [31:0] instr,   // Instruction from IF stage
    input  logic [2:0] ImmSrc,   // Control signal to select immediate type
    output logic [31:0] imm_out  // Sign-extended immediate output
);
    always_comb begin
        case (ImmSrc)
            3'b000: // I-type (ADDI, LW, JALR)
                imm_out = {{20{instr[31]}}, instr[31:20]};

            3'b001: // S-type (SW)
                imm_out = {{20{instr[31]}}, instr[31:25], instr[11:7]};

            3'b010: // B-type (Branch instructions)
                imm_out = {{19{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};

            3'b011: // U-type (LUI, AUIPC)
                imm_out = {instr[31:12], 12'b0};

            3'b100: // J-type (JAL)
                imm_out = {{11{instr[31]}}, instr[31], instr[19:12], instr[20], instr[30:21], 1'b0};

            default: 
                imm_out = 32'b0;
        endcase
    end
endmodule
