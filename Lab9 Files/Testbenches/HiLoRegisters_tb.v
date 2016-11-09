`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2016 05:39:43 PM
// Design Name: 
// Module Name: HiLoRegisters_tb
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


module HiLoRegisters_tb();

    reg [63:0] HiLo_tb;
    wire [63:0] HiLoNew_tb;
    reg Clk_tb;
    
    //module HiLoRegisters(HiLo, HiLoNew, Clk);
    HiLoRegisters u0(HiLo_tb, HiLoNew_tb, Clk_tb);
    
    initial begin
        Clk_tb <= 1;
        forever #10 Clk_tb <= ~Clk_tb;
    end
    
    initial begin
        @(posedge Clk_tb);
            HiLo_tb <= 31;
        @(posedge Clk_tb);
            HiLo_tb <= -32;
        @(posedge Clk_tb);
    end

endmodule
