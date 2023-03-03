`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2023 09:28:05 PM
// Design Name: 
// Module Name: Processor_Pipe
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
module Processor_Pipe(
    input clk,
    input reset
    );
    reg [7:0] IF_ID;
    wire [7:0] Write_Data;
    wire [7:0] Instruction_Code;
    reg [11:0] ID_WB;
    wire [7:0] Data;
    
    Counter_Pipe pipe0 (clk, reset, Instruction_Code);
    Register_File_Pipe pipe1 ( IF_ID[3:0], ID_WB[11:8], Write_Data, Data, reset); 
    assign Write_Data = ID_WB[7:0];
    always @(posedge clk) begin
        IF_ID <= Instruction_Code;
        ID_WB <= { IF_ID[7:4], Data };
    end
endmodule
