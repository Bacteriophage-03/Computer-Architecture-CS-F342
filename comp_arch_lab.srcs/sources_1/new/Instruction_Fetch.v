`timescale 1ns / 1ps
module Instruction_Fetch(
    input clk,
    input reset,
    output [31:0] Instruction_Code
    );
    
    reg [31:0] PC;
   
    Instruction_Memory ins2 (PC, reset, Instruction_Code);//Instantiating Instruction Memory
    
    always @(posedge clk, negedge reset) begin
        
        if(reset == 0) PC <= 0;
        else PC <= PC + 4;
    end

endmodule

