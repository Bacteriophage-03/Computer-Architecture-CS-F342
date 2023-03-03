`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2023 02:01:39 PM
// Design Name: 
// Module Name: Instruction_Fetch_tb
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


module Instruction_Fetch_tb(

    );
    
    reg c;
    reg res;
    wire [31:0] Instruction_Code;
    
    
    Instruction_Fetch ins4 ( c, res, Instruction_Code); 
    
    initial begin
        res = 0; #10;
        res = 1;
    end
    
    initial begin
        c = 0; #5;
        forever begin
            c = !c; #5;
        end
    end
endmodule
