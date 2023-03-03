`timescale 1ns / 1ps
module Instruction_Memory(
    input [31:0] PC,
    input reset,
    output [31:0] Instruction_Code
    );
    reg [7:0] Mem [36:0]; //byte addressable memory 37 locations
    //For normal memory read we use the following statement
    assign Instruction_Code = {Mem[PC], Mem[PC+1], Mem[PC+2], Mem[PC+3]};
    //reads instruction code specified by PC // Big Endian 
    //handling reset condition
    always @(reset) 
    begin 
    
        if(reset == 0) //if reset is equal to logic 0
        //Initialize the memory with 4 instructions
        begin
            Mem[0] = 8'hFC; Mem[1] = 8'h20; Mem[2] = 8'h00; Mem[3] = 8'h08;
            //li R1, 8
            
            Mem[4] = 8'h00; Mem[5] = 8'h01; Mem[6] = 8'h18; Mem[7] = 8'h20;
            //add R0, R1, R3
            
            Mem[8] = 8'h03; Mem[9] = 8'hE7; Mem[10] = 8'h30; Mem[11] = 8'h22;
            //sub R31, R7, R6
            
            Mem[12] = 8'h03; Mem[13] = 8'hC4; Mem[14] = 8'h01; Mem[15] = 8'h02;
            //srl R30, R4, 4
            
            Mem[16] = 8'h00; Mem[17] = 8'h26; Mem[18] = 8'h20; Mem[19] = 8'h24;
            // and R1, R6, R4
       end     
   end 
    
endmodule
