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


module MEM_WB(ReadDataMemIn, ALUResultIn, ExtendedByteIn, ExtendedHalfwordIn, RegWriteIn, MemToRegIn, Mux1In, ReadDataMemOut, ALUResultOut,ExtendedByteOut, ExtendedHalfwordOut, RegWriteOut, MemToRegOut, Mux1Out, Clk);

    input [31:0] ReadDataMemIn, ALUResultIn, ExtendedByteIn, ExtendedHalfwordIn;
    input Clk, RegWriteIn;
    input [1:0] MemToRegIn;
    input [4:0] Mux1In;
    
    output reg [31:0] ReadDataMemOut, ALUResultOut, ExtendedByteOut, ExtendedHalfwordOut;
    output reg RegWriteOut;
    output reg [1:0] MemToRegOut;
    output reg [4:0] Mux1Out;
    
    reg [31:0] ReadDataMemReg, ALUResultReg, ExtendedByteReg, ExtendedHalfwordReg;
    reg RegWriteReg;
    reg [1:0] MemToRegReg;
    reg [4:0] Mux1Reg;
    
    always @(negedge Clk) begin
        ReadDataMemOut <= ReadDataMemReg;
        ALUResultOut <= ALUResultReg;
        ExtendedByteOut <= ExtendedByteReg;
        ExtendedHalfwordOut <= ExtendedHalfwordReg;
        RegWriteOut <= RegWriteReg;
        MemToRegOut <= MemToRegReg;
        Mux1Out <= Mux1Reg;
    end
    
    always @(posedge Clk) begin
        ReadDataMemReg <= ReadDataMemIn;
        ALUResultReg <= ALUResultIn;
        ExtendedByteReg <= ExtendedByteIn;
        ExtendedHalfwordReg <= ExtendedHalfwordIn;
        RegWriteReg <= RegWriteIn;
        MemToRegReg <= MemToRegIn;
        Mux1Reg <= Mux1In;
    end

endmodule
