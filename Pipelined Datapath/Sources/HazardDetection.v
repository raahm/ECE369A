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


module HazardDetection(Clk, Reset, Branch, Stall, PCStall, Flush);

    input Clk, Reset;
    input Branch;
    output reg Stall, PCStall, Flush;
    
    always @(posedge Clk) begin
//        if(Reset == 1) begin
//            Stall <= 1;
//        end
//        else begin
//            Stall <= 0;
//        end
        Stall <= 0;
        PCStall <= 0;
        if(Branch == 1) begin
            Flush <= 1;
        end
        else begin
            Flush <= 0;
        end
    end

endmodule
