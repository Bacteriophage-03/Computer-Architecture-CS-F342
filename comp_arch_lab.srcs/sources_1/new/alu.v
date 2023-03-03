`timescale 1ns / 1ps
module alu(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUControl,
    output reg Zero,
    output reg [31:0] ALUResult
    );
    
    always @(*)
    begin
        case (ALUControl)
        4'b0000: ALUResult = A & B; 
        4'b0001: ALUResult = A | B;
        4'b0010: ALUResult = A + B;
        4'b0100: ALUResult = A - B;
        4'b0011: ALUResult =  A << B;
        4'b0111: ALUResult = A >> B;
        endcase
    end
    
    always @(*)
    begin
        if(ALUResult == 0) Zero = 1'b1;
        else Zero = 1'b0;
    end
    
endmodule
