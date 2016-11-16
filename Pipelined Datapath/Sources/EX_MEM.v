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


module EX_MEM(addResultIn, ZeroIn, BranchSendIn, BranchIn, MemReadIn, MemWriteIn, RegWriteIn, MemToRegIn, Mux1In, ShiftedIn, PCAddResultIn, JalMuxSelIn, StoreModeIn, ALUResultIn, ReadData2In, AddResultOut, ZeroOut, BranchSendOut, BranchOut, MemReadOut, MemWriteOut, RegWriteOut, MemToRegOut, Mux1Out, ShiftedOut, PCAddResultOut, JalMuxSelOut, StoreModeOut, ALUResultOut, ReadData2Out, Clk);

    input [31:0] addResultIn, ALUResultIn, ReadData2In;
    input Clk, ZeroIn, BranchSendIn, BranchIn, MemReadIn, MemWriteIn, RegWriteIn, JalMuxSelIn;
    input [1:0] MemToRegIn, StoreModeIn;
    input [4:0] Mux1In;
    input [31:0] ShiftedIn, PCAddResultIn;
    
    output reg [31:0] AddResultOut, ALUResultOut, ReadData2Out;
    output reg ZeroOut, BranchSendOut, BranchOut, MemReadOut, MemWriteOut, RegWriteOut, JalMuxSelOut;
    output reg [1:0] MemToRegOut, StoreModeOut;
    output reg [4:0] Mux1Out;
    output reg [31:0] ShiftedOut, PCAddResultOut;
    
    reg [31:0] addResultReg, ALUResultReg, ReadData2Reg;
    reg ZeroReg, BranchSendReg, BranchReg, MemReadReg, MemWriteReg, RegWriteReg, JalMuxSelReg;
    reg [1:0] MemToRegReg, StoreModeReg;
    reg [1:0] Mux1Reg;
    reg [31:0] ShiftedReg, PCAddResultReg;
    
    always @(negedge Clk) begin
        AddResultOut <= addResultReg;
        ALUResultOut <= ALUResultReg;
        ReadData2Out <= ReadData2Reg;
        ZeroOut <= ZeroReg;
        BranchSendOut <= BranchSendReg;
        BranchOut <= BranchReg;
        MemReadOut <= MemReadReg;
        MemWriteOut <= MemWriteReg;
        RegWriteOut <= RegWriteReg;
        MemToRegOut <= MemToRegReg;
        Mux1Out <= Mux1Reg;
        ShiftedOut <= ShiftedReg;
        PCAddResultOut <= PCAddResultReg;
        JalMuxSelOut <= JalMuxSelReg;
        StoreModeOut <= StoreModeReg;
    end
    
    always @(posedge Clk) begin
        addResultReg <= addResultIn;
        ALUResultReg <= ALUResultIn;
        ReadData2Reg <= ReadData2In;
        ZeroReg <= ZeroIn;
        BranchSendReg <= BranchSendIn;
        BranchReg <= BranchIn;
        MemReadReg <= MemReadIn;
        MemWriteReg <= MemWriteIn;
        RegWriteReg <= RegWriteIn;
        MemToRegReg <= MemToRegIn;
        Mux1Reg <= Mux1In;
        ShiftedReg <= ShiftedIn;
        PCAddResultReg <= PCAddResultIn;
        JalMuxSelReg <= JalMuxSelIn;
        StoreModeReg <= StoreModeIn;
    end

endmodule
