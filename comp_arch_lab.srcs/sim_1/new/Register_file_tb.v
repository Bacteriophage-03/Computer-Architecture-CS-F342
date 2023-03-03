`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2023 02:49:15 AM
// Design Name: 
// Module Name: Register_file_tb
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


module Register_file_tb(

    );
    
    reg RegWrite, clk, reset;
    reg [31:0] Write_Data;
    reg [4:0] Write_Reg_Num, Read_Reg_Num_1, Read_Reg_Num_2;
    wire [31:0] Read_Data_1, Read_Data_2;
    
    Register_file ins5 (Read_Reg_Num_1, Read_Reg_Num_2, Write_Reg_Num, Write_Data, Read_Data_1, Read_Data_2, RegWrite, clk, reset);
    
    initial begin
    RegWrite = 0; #15;
    RegWrite = 1; Write_Data = 20; Write_Reg_Num = 0; #10;
    RegWrite = 1; Write_Data = 30; Write_Reg_Num = 1; #10;
    RegWrite = 1; Write_Data = 30; Write_Reg_Num = 1; #10;
    end
    
    initial begin
    clk = 0;
    repeat (8)
    #10 clk = ~clk; #10 $finish;
    end
    
    initial begin
    #10 Read_Reg_Num_1 = 0; Read_Reg_Num_2=0;
    #15 Read_Reg_Num_1 = 0; Read_Reg_Num_2 = 1;
    #10 Read_Reg_Num_1 = 1; Read_Reg_Num_2 = 2;
    end
    
    initial begin
    reset = 0; #5;
    reset = 1;
    end
    
    
endmodule
