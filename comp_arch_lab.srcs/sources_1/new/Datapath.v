`timescale 1ns / 1ps
module Datapath(
    input [4:0] Read_Reg_Num_1,
    input [4:0] Read_Reg_Num_2,
    input [4:0] Write_Reg,
    input [3:0] ALUControl,
    input clk,
    input reset,
    input RegWrite,
    output reg ALUZero
    );
    
    wire [31:0] input_1, input_2;
    wire [31:0] ALUResult;
    
    Register_file ins_reg_fil ( Read_Reg_Num_1, Read_Reg_Num_2, Write_Reg, ALUResult, input_1, input_2, RegWrite, clk, reset);
    alu ins_alu (input_1, input_2, ALUControl, ALUZero, ALUResult);
    
endmodule
