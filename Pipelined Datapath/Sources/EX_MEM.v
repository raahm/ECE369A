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


module EX_MEM(Reset, addResultIn, ZeroIn, BranchSendIn, BranchIn, MemReadIn, MemWriteIn, RegWriteIn, MemToRegIn, Mux1In, ShiftedIn, PCAddResultIn, JalMuxSelIn, JumpIn, StoreModeIn, ALUResultIn, ReadData2In, AddResultOut, ZeroOut, BranchSendOut, BranchOut, MemReadOut, MemWriteOut, RegWriteOut, MemToRegOut, Mux1Out, ShiftedOut, PCAddResultOut, JalMuxSelOut, JumpOut, StoreModeOut, ALUResultOut, ReadData2Out, Clk);

    input [31:0] addResultIn, ALUResultIn, ReadData2In;
    input Clk, ZeroIn, BranchSendIn, BranchIn, MemReadIn, MemWriteIn, RegWriteIn, JalMuxSelIn, Reset;
    input [1:0] MemToRegIn, StoreModeIn, JumpIn;
    input [4:0] Mux1In;
    input [31:0] ShiftedIn, PCAddResultIn;
    
    output reg [31:0] AddResultOut, ALUResultOut, ReadData2Out;
    output reg ZeroOut, BranchSendOut, BranchOut, MemReadOut, MemWriteOut, RegWriteOut, JalMuxSelOut;
    output reg [1:0] MemToRegOut, StoreModeOut, JumpOut;
    output reg [4:0] Mux1Out;
    output reg [31:0] ShiftedOut, PCAddResultOut;
    
    reg [31:0] addResultReg, ALUResultReg, ReadData2Reg;
    reg ZeroReg, BranchSendReg, BranchReg, MemReadReg, MemWriteReg, RegWriteReg, JalMuxSelReg;
    reg [1:0] MemToRegReg, StoreModeReg, JumpReg;
    reg [4:0] Mux1Reg;
    reg [31:0] ShiftedReg, PCAddResultReg;
    
    always @(posedge Clk) begin
        if(Reset == 0) begin
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
            JumpOut <= JumpReg;
        end
        else begin
            AddResultOut <= 0;
            ALUResultOut <= 0;
            ReadData2Out <= 0;
            ZeroOut <= 0;
            BranchSendOut <= 0;
            BranchOut <= 0;
            MemReadOut <= 0;
            MemWriteOut <= 0;
            RegWriteOut <= 0;
            MemToRegOut <= 0;
            Mux1Out <= 0;
            ShiftedOut <= 0;
            PCAddResultOut <= 0;
            JalMuxSelOut <= 0;
            StoreModeOut <= 0;
            JumpOut <= 0;
        end
    end
    
    always @(negedge Clk) begin
        if(Reset == 0) begin
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
            JumpReg <= JumpIn;
        end
        else begin
            addResultReg <= 0;
            ALUResultReg <= 0;
            ReadData2Reg <= 0;
            ZeroReg <= 0;
            BranchSendReg <= 0;
            BranchReg <= 0;
            MemReadReg <= 0;
            MemWriteReg <= 0;
            RegWriteReg <= 0;
            MemToRegReg <= 0;
            Mux1Reg <= 0;
            ShiftedReg <= 0;
            PCAddResultReg <= 0;
            JalMuxSelReg <= 0;
            StoreModeReg <= 0;
            JumpReg <= 0;            
        end
    end

endmodule
