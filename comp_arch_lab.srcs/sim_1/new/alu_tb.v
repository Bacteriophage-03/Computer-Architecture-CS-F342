`timescale 1ns / 1ps
module alu_tb(

    );
    
    reg [3:0] aluc;
    reg [31:0] a, b;
    wire [31:0] alur;
    wire z;
    
    alu ins1 ( a, b, aluc, z, alur ); 
    
    initial begin
    a = 32'd23; b = 32'd42; aluc = 4'b0000; #20; // Test case 1
    a = 32'd23; b = 32'd42; aluc = 4'b0001; #20; // Test case 2
    a = 32'd23; b = 32'd42; aluc = 4'b0010; #20; // Test case 3
    a = 32'd23; b = 32'd42; aluc = 4'b0100; #20; // Test case 4
    a = 32'd23; b = 32'd42; aluc = 4'b1000; #20; // Test case 5
    a = 32'd42; b = 32'd23; aluc = 4'b1000; #20; // Test case 6
    a = 32'd42; b = 32'd23; aluc = 4'b0100; #20; // Test case 7
   end
   
endmodule
