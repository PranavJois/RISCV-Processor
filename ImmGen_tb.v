//with ImmSrc ( input to select the correct immediate format.)

`timescale 1ns / 1ps

module ImmGen_tb;

    // Inputs
    reg [31:0] instr;
    reg [2:0] ImmSrc;

    // Output
    wire [31:0] imm_out;

    // Instantiate the ImmGen module
    ImmGen uut (
        .instr(instr),
        .ImmSrc(ImmSrc),
        .imm_out(imm_out)
    );

    // Task to print results
    task print_result;
        input [31:0] instr;
        input [2:0] ImmSrc;
        input [31:0] expected;
        begin
            $display("Instr: %b, ImmSrc: %b, ImmOut: %h, Expected: %h %s", 
                     instr, ImmSrc, imm_out, expected, 
                     (imm_out == expected) ? "✔️" : "❌");
        end
    endtask

    initial begin
        $dumpfile("ImmGen_tb.vcd");
        $dumpvars(0, ImmGen_tb);

        // I-type (ADDI with imm = 0x00F)
        instr = 32'b000000000111_00000_000_00001_0010011; // ADDI x1, x0, 0x00F
        ImmSrc = 3'b000;
        #10 print_result(instr, ImmSrc, 32'h0000000F);

        // S-type (SW with imm = 0x0A)
        instr = 32'b0000000_00101_00010_010_00101_0100011; // SW x5, 0x0A(x2)
        ImmSrc = 3'b001;
        #10 print_result(instr, ImmSrc, 32'h0000000A);

        // B-type (BEQ with imm = 0x0008)
        instr = 32'b0000000_00001_00010_000_00010_1100011; // BEQ x1, x2, 0x0008
        ImmSrc = 3'b010;
        #10 print_result(instr, ImmSrc, 32'h00000008);

        // U-type (LUI with imm = 0x12345000)
        instr = 32'b00010010001101000101_00000_0110111; // LUI x0, 0x12345
        ImmSrc = 3'b011;
        #10 print_result(instr, ImmSrc, 32'h12345000);

        // J-type (JAL with imm = 0x00000FA)
        instr = 32'b00000000001111111111_00000_1101111; // JAL x0, 0xFA
        ImmSrc = 3'b100;
        #10 print_result(instr, ImmSrc, 32'h000000FA);

        $display("Testbench completed.");
        $finish;
    end

endmodule
