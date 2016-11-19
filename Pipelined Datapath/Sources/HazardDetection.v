`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2016 01:57:50 PM
// Design Name: 
// Module Name: HazardDetection
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


module HazardDetection(Clk, Reset, Stall);

    input Clk, Reset;
    output reg Stall;
    
    always @(posedge Clk) begin
//        if(Reset == 1) begin
//            Stall <= 1;
//        end
//        else begin
//            Stall <= 0;
//        end
        Stall <= 0;
    end

endmodule
