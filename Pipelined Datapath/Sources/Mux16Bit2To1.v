`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Simple mux designed to take in two 16-bit values and output one 16-bit value.
// Takes in a 1-bit selector signal. 
//////////////////////////////////////////////////////////////////////////////////


module Mux16Bit2To1(out, inA, inB, sel);

    input [15:0] inA, inB;
    input sel;
    
    output [15:0] out;
    
    assign out = (sel == 0) ? inA : inB; 

endmodule
