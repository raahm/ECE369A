`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Simple mux which handles the transferring of data from four wires to one.
// Outputs a 5-bit signal, chosen from four 5-bit signals, dependent on
// one 2-bit selector signal.
// 
//////////////////////////////////////////////////////////////////////////////////


module Mux5Bit4To1(out, inA, inB, inC, inD, sel);

    input [4:0] inA, inB, inC, inD;
    input [1:0] sel;
    
    output reg [4:0] out;
    
    always @(*) begin
        case(sel)
            2'b00 : out <= inA;
            2'b01 : out <= inB;
            2'b10 : out <= inC;
            2'b11 : out <= inD; 
        endcase
    end

endmodule
