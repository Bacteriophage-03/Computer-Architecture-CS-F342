`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2023 07:53:57 PM
// Design Name: 
// Module Name: Instruction_Fetch_Pipe
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module Instruction_Memory_Pipe(
    input [1:0] Read_Address,
    input reset,
    output [7:0] Instruction_Code
    );
    
    reg [7:0] Mem [2:0];
   assign Instruction_Code = Mem[Read_Address];
   
   always @(reset)
   begin
    if(reset == 1'b0) begin
     Mem[0] = 8'h38; 
     Mem[1] = 8'h82; 
     Mem[2] = 8'h23;
    end
    end
    
endmodule

