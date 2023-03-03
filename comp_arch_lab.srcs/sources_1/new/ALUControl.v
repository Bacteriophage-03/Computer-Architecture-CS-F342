`timescale 1ns / 1ps

module ALUControl(
    output reg [3:0] ALUop,
    output reg ALUShift,
    output reg InstrType,
    output RegWrite,
    input [5:0] funct,
    input op
    );
    
    // WE GENERATE A TOTAL OF 4 CONTROL SIGNALS
    
    // This block generates ALU control lines
    always @(*) begin
    case (funct) 
        
        6'b100000: ALUop = 4'b0010;  //ADD
        6'b100010: ALUop = 4'b0100;  //SUB
        6'b100100: ALUop = 4'b0000;  //AND
        6'b100101: ALUop = 4'b0001; //OR
        6'b000000: ALUop = 4'b0011; //shift left logical 
        6'b000010: ALUop = 4'b0111; //shift right logical 
        
   endcase
   end
   
   always @(*) begin
   ALUShift = (funct == 6'b000000) || (funct == 6'b000010); //For choosing the shamt field as second operand in ALU
   InstrType = op; //For differentiating between R and I type instruction
   end
   
   assign RegWrite = 1'b1; //This will remain 1 for both R-type or I-Type instructions
   
endmodule
