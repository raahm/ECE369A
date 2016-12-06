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


module MEM_WB(Reset, Stall, ReadDataMemIn, ALUResultIn, ExtendedByteIn, ExtendedHalfwordIn, RegWriteIn, MemToRegIn, Mux1In, PCAddResultIn, JalMuxSelIn, rd_in, ReadDataMemOut, ALUResultOut,ExtendedByteOut, ExtendedHalfwordOut, RegWriteOut, MemToRegOut, Mux1Out, PCAddResultOut, JalMuxSelOut, rd_out, Clk, Flush);

    input [31:0] ReadDataMemIn, ALUResultIn, ExtendedByteIn, ExtendedHalfwordIn, PCAddResultIn;
    input Clk, RegWriteIn, JalMuxSelIn, Stall, Reset, Flush;
    input [4:0] rd_in;
    input [1:0] MemToRegIn;
    input [4:0] Mux1In;
    
    output reg [31:0] ReadDataMemOut, ALUResultOut, ExtendedByteOut, ExtendedHalfwordOut, PCAddResultOut;
    output reg RegWriteOut, JalMuxSelOut;
    output reg [4:0] rd_out;
    output reg [1:0] MemToRegOut;
    output reg [4:0] Mux1Out;
    
    reg [31:0] ReadDataMemReg, ALUResultReg, ExtendedByteReg, ExtendedHalfwordReg, PCAddResultReg;
    reg RegWriteReg, JalMuxSelReg;
    reg [4:0] rd_reg;
    reg [1:0] MemToRegReg;
    reg [4:0] Mux1Reg;
    
    always @(posedge Clk) begin
        if(Flush == 1) begin
            RegWriteOut <= 0;
            MemToRegOut <= 0;
            JalMuxSelOut <= 0;
            ReadDataMemOut <= ReadDataMemReg;
            ALUResultOut <= ALUResultReg;
            ExtendedByteOut <= ExtendedByteReg;
            ExtendedHalfwordOut <= ExtendedHalfwordReg;
            Mux1Out <= Mux1Reg;
            PCAddResultOut <= PCAddResultReg;
            rd_reg <= 0;
        end
        else if(Reset == 0) begin
            ReadDataMemOut <= ReadDataMemReg;
            ALUResultOut <= ALUResultReg;
            ExtendedByteOut <= ExtendedByteReg;
            ExtendedHalfwordOut <= ExtendedHalfwordReg;
            RegWriteOut <= RegWriteReg;
            MemToRegOut <= MemToRegReg;
            Mux1Out <= Mux1Reg;
            PCAddResultOut <= PCAddResultReg;
            JalMuxSelOut <= JalMuxSelReg;
            rd_out <= rd_reg;
        end
        else begin
            ReadDataMemOut <= 0;
            ALUResultOut <= 0;
            ExtendedByteOut <= 0;
            ExtendedHalfwordOut <= 0;
            RegWriteOut <= 0;
            MemToRegOut <= 0;
            Mux1Out <= 0;
            PCAddResultOut <= 0;
            JalMuxSelOut <= 0;
            rd_out <= 0;
        end
    end
    
    always @(negedge Clk) begin
        if(Reset == 1) begin
            ReadDataMemReg <= 0;
            ALUResultReg <= 0;
            ExtendedByteReg <= 0;
            ExtendedHalfwordReg <= 0;
            RegWriteReg <= 0;
            MemToRegReg <= 0;
            Mux1Reg <= 0;
            PCAddResultReg <= 0;
            JalMuxSelReg <= 0;
            rd_reg <= 0;
        end
        else begin
            if(Stall == 0) begin
                ReadDataMemReg <= ReadDataMemIn;
                ALUResultReg <= ALUResultIn;
                ExtendedByteReg <= ExtendedByteIn;
                ExtendedHalfwordReg <= ExtendedHalfwordIn;
                RegWriteReg <= RegWriteIn;
                MemToRegReg <= MemToRegIn;
                Mux1Reg <= Mux1In;
                PCAddResultReg <= PCAddResultIn;
                JalMuxSelReg <= JalMuxSelIn;
                rd_reg <= rd_in;
            end
        end
    end

endmodule
