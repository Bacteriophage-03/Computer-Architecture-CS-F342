`timescale 1ns / 1ps
module Instruction_Memory_tb(

    );
    
    reg [31:0] count;
    reg res;
    wire [31:0] code;
    
    Instruction_Memory ins2 ( count, res, code);
    
    initial begin
        res = 1'd0; #20;
        res = 1'd1;
        count = 32'd0; #20;
        count = 32'd4; #20;
        count = 32'd8; #20;
        count = 32'd12; #20;
        count = 32'd16;
     end
endmodule
