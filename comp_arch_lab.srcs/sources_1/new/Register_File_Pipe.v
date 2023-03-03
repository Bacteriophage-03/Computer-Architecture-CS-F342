`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2023 08:51:58 PM
// Design Name: 
// Module Name: Register_File_Pipe
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


module Register_File_Pipe(
    input [3:0] Read_Reg,
    input [3:0] Write_Reg,
    input [7:0] Write_Data,
    output [7:0] Data,
    input reset
    );
    
    reg [7:0] Memory [15:0];
    
    assign Data = Memory[Read_Reg];
    always @(*)Memory[Write_Reg] = Write_Data;
    
    always @(*) begin
    if(reset == 1'b0) begin
         Memory[8] = 8'd6;
         Memory[2] = 8'd9;
         Memory[3] = 8'd4;
         end
    end  
    
    
endmodule
