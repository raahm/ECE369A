`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2016 09:53:56 PM
// Design Name: 
// Module Name: BoardDisplay_tb
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


module BoardDisplay_tb();
    reg Clk_tb, Reset_tb;
    
    wire [7:0] en_out_tb;
    wire [6:0] out7_tb;
    
    //module BoardDisplay(Clk, Reset, en_out, out7);
    BoardDisplay u0(Clk_tb, Reset_tb, en_out_tb, out7_tb);
    
    initial begin
        Clk_tb <= 1;
        forever #10 Clk_tb <= ~Clk_tb;
    end
    
    initial begin
        @(posedge Clk_tb);
            Reset_tb <= 1;
        @(posedge Clk_tb);
        @(posedge Clk_tb);
            Reset_tb <= 0;
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
    end

endmodule
