`timescale 1ns / 1ps
module Datapath_tb(
    );
    reg clk, Reg_Write, reset;
    reg [4:0] Reg_Num_1, Reg_Num_2, Write_Reg;
    reg [3:0] ALUControl;
    wire [31:0] ALUResult;
    wire [31:0] A, B;
    wire Zero;
    
    Register_file ins1 (Reg_Num_1, Reg_Num_2, Write_Reg, ALUResult, A, B, Reg_Write, clk, reset);
    alu ins2 (A, B, ALUControl, Zero, ALUResult);
    
    initial begin
    clk = 0;
    repeat (16)
    #10 clk = ~clk; #10 $finish;
    end
      
    initial begin
    Reg_Write = 0; #15; Reg_Write = 1;
    Reg_Num_1 = 7; Reg_Num_2 = 6; Write_Reg = 31; ALUControl = 4'b0010; #20;
    Reg_Num_1 = 4; Reg_Num_2 = 4; Write_Reg = 30; ALUControl = 4'b0100; #20;
    Reg_Num_1 = 3; Reg_Num_2 = 7; Write_Reg = 29; ALUControl = 4'b0000; #20;
    Reg_Num_1 = 4; Reg_Num_2 = 7; Write_Reg = 28; ALUControl = 4'b1000; #20;
    Reg_Num_1 = 31; Reg_Num_2 = 30; Write_Reg = 27; ALUControl = 4'b0001; #20;
    end
    
    initial begin
    reset = 0; #5;
    reset = 1;
    end
       
endmodule
