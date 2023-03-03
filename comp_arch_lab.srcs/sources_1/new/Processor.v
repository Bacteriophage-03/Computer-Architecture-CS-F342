`timescale 1ns / 1ps
module Processor(
    input clk,
    input reset
    );
    
    wire [31:0] Instruction_Code;    
    Instruction_Fetch proc0 (clk, reset, Instruction_Code);
    wire [5:0] opcode;
    wire [4:0] rdst;
    wire [4:0] rsrc1, rsrc2, shamt;
    wire [5:0] funct;
    wire [20:0] constant;
    wire [31:0] write_data;
    wire [31:0] read_src1, read_src2;
    wire RegWrite;
    wire Zero;
    wire ALUShift, InstrType;
    wire [3:0] ALUOp;
    wire [31:0] Result;
    
    // THIS IS THE INSTRUCTION DECODE UNIT
    assign opcode = Instruction_Code[31:26];
    assign rdst = Instruction_Code[25:21];
    assign rsrc1 = Instruction_Code[20:16];
    assign rsrc2 = Instruction_Code[15:11];
    assign shamt = Instruction_Code[10:6];
    assign funct = Instruction_Code[5:0];
    assign constant = Instruction_Code[20:0]; //SPLIT THE INSTRUCTION CODE FOR R-TYPE and I-TYPE OPERATIONS
  
   ALUControl proc1 (ALUOp, ALUShift, InstrType, RegWrite, funct, opcode[5]);
   Register_file proc2 (rsrc1, rsrc2, rdst, write_data, read_src1, read_src2, RegWrite, clk, reset); 
   wire [31:0] input_A, input_B; //INPUTS TO ALU 
   assign input_A = read_src1;
   assign input_B = (ALUShift)? ( { {27{shamt[4]}}, shamt } ):(read_src2);  //MUX FUNCTIONALITY FOR ALU's SECOND OPERAND
   //This mux checks if the function corresponds to shift operation, and replaces the second ALU line with the shift amount
   alu proc3 (input_A, input_B, ALUOp, Zero, Result);
   assign write_data = (InstrType)?( { {11{constant[20]}}, constant } ):(Result); //MUX FUNCTIONALITY FOR WRITING INTO THE REGISTORS
   //This mux will store the data into the registor or store the ALU result into the registor
         
endmodule
