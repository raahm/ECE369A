`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2016 02:08:44 PM
// Design Name: 
// Module Name: PipeDatapath_tb
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


module PipeDatapath_tb();
    reg Reset_tb, Clk_tb;
    wire [31:0] PCResult_tb, JalMUXOut_tb;
    //module Datapath(Reset, Clk, PCResult, JalMUXOut);
    Datapath u0(Reset_tb, Clk_tb, PCResult_tb, JalMUXOut_tb);
    
    initial begin
        Clk_tb <= 1;
        forever #10 Clk_tb <= ~Clk_tb;
    end
    
    initial begin
        @(posedge Clk_tb);
            Reset_tb <= 1;
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
            Reset_tb <= 0;
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
    end
    
endmodule
