`timescale 1ns / 1ps
module Register_file(
    input [4:0] Read_Reg_Num_1,
    input [4:0] Read_Reg_Num_2,
    input [4:0] Write_Reg_Num,
    input [31:0] Write_Data,
    output [31:0] Read_Data_1,
    output [31:0] Read_Data_2,
    input RegWrite,
    input clk,
    input reset
    );
    
    reg [31:0] RegMemory [31:0];
    
    assign Read_Data_1 = RegMemory[Read_Reg_Num_1];
    assign Read_Data_2 = RegMemory[Read_Reg_Num_2];
    
    always @(posedge clk) begin
        if(RegWrite == 1'b1) RegMemory[Write_Reg_Num] = Write_Data;
    end

    always @(*) begin
    if(reset == 1'b0) begin
         RegMemory[7] = 32'd56;
         RegMemory[3] = 32'd16;
         RegMemory[4] = 32'd69;
         RegMemory[6] = 32'd10;
         end
    end  
endmodule
