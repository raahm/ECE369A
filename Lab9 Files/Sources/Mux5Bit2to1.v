`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2016 11:06:45 PM
// Design Name: 
// Module Name: Mux5Bit2to1
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


module Mux5Bit2to1(out, inA, inB, sel);
    input [4:0] inA, inB;
    input sel;
    output reg [4:0] out;
    
    //simple mux; 0 chooses inA, 1 chooses inB.
    always @(inA, inB, sel) begin
        if(sel == 0) begin
            out <= inA;
        end
        else begin
            out <= inB;
        end
    end
    
endmodule
