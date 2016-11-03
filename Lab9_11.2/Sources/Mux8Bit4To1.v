`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2016 04:52:05 PM
// Design Name: 
// Module Name: Mux8Bit4To1
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


module Mux8Bit4To1(out, inA, inB, inC, inD, sel);

    input [7:0] inA, inB, inC, inD;
    input [1:0] sel;
    
    output reg [7:0] out;
    
    //simple mux which outputs a four bit signal based on a two bit select signal
    always @(*) begin
        case(sel)
            2'b00 : out <= inA;
            2'b01 : out <= inB;
            2'b10 : out <= inC;
            2'b11 : out <= inD;
        endcase
    end

endmodule
