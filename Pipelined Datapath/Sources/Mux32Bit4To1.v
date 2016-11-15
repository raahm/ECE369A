`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2016 12:19:39 PM
// Design Name: 
// Module Name: Mux32Bit4To1
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


module Mux32Bit4To1(out, inA, inB, inC, inD, sel);

    input [31:0] inA, inB, inC, inD;
    input [1:0] sel;
    
    output reg [31:0] out;
    
    //four bit mux
    always @(*) begin
        case(sel)
            2'b00 : out <= inA;
            2'b01 : out <= inB;
            2'b10 : out <= inC;
            2'b11 : out <= inD;
        endcase
    end

endmodule
