`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2016 11:26:49 AM
// Design Name: 
// Module Name: Mux64Bit2To1
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


module Mux64Bit2To1(out, inA, inB, sel);

    output reg [63:0] out;
    
    input [63:0] inA;
    input [63:0] inB;
    input sel;

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
