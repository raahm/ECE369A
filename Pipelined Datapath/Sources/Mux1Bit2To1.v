`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2016 02:19:32 PM
// Design Name: 
// Module Name: Mux1Bit2To1
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


module Mux1Bit2To1(out, inA, inB, sel);

    input inA, inB, sel;
    output out;
    
    assign out = (sel == 1) ? inA:inB;

endmodule
