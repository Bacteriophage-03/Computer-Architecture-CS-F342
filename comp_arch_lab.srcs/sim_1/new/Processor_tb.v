`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 06:52:49 PM
// Design Name: 
// Module Name: Processor_tb
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


module Processor_tb(

    );
    
    reg clk, reset;
    
    Processor ins1 (clk, reset);
    
    initial begin
    clk = 0;
    repeat (16)
    #10 clk = ~clk; #10 $finish;
    end
    
    initial begin
    reset = 0; #5;
    reset = 1; #35;
    reset = 0; #5;
    reset = 1;
    end
    
endmodule
