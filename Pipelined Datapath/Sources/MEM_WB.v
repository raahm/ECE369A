`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2016 12:43:26 PM
// Design Name: 
// Module Name: EX_MEM
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


module MEM_WB(ReadDataMemIn, ALUResultIn, ExtendedByteIn, ExtendedHalfwordIn, ReadDataMemOut, ALUResultOut,ExtendedByteOut, ExtendedHalfwordOut, Clk);

    input [31:0] ReadDataMemIn, ALUResultIn, ExtendedByteIn, ExtendedHalfwordIn;
    input Clk;
    
    output reg [31:0] ReadDataMemOut, ALUResultOut, ExtendedByteOut, ExtendedHalfwordOut;
    
    reg [31:0] ReadDataMemReg, ALUResultReg, ExtendedByteReg, ExtendedHalfwordReg;
    
    always @(negedge Clk) begin
        ReadDataMemOut <= ReadDataMemReg;
        ALUResultOut <= ALUResultReg;
        ExtendedByteOut <= ExtendedByteReg;
        ExtendedHalfwordOut <= ExtendedHalfwordReg;
    end
    
    always @(posedge Clk) begin
        ReadDataMemReg <= ReadDataMemIn;
        ALUResultReg <= ALUResultIn;
        ExtendedByteReg <= ExtendedByteIn;
        ExtendedHalfwordReg <= ExtendedHalfwordIn;
    end

endmodule
