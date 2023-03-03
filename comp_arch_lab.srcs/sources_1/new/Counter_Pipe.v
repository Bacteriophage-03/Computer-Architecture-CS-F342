`timescale 1ns / 1ps

module Counter_Pipe(
    input clk,
    input reset,
    output [7:0] Instruction_Code
    );
    
    reg [1:0] PC;
    
    Instruction_Memory_Pipe pp1 (PC, reset, Instruction_Code);
    always @(posedge clk, negedge reset)
    begin
        if(reset == 1'b0) PC <= 2'b0;
        else PC <= PC + 1;
    end
    
endmodule
