`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Jacob Toman-Ibarra, Mubarak Hassan
// Percent effort: 50/50
//
// Date: 28 October 2016
// Fully designed and implemented datapath.
//
// Datapath executes one instruction per cycle and is capable of executing branch
// and memory instructions.
//
// Datapath takes in input Reset and Clk signals, and outputs the result of the
// ALU's operations in order to allow for proper simulation.
// 
//////////////////////////////////////////////////////////////////////////////////


module Datapath(Reset, Clk, ALUResult1);

    input Reset, Clk;
    output wire [31:0] ALUResult1;
    
    wire [31:0] Instruction, ReadData1, ReadData2, SignExtended, ReadDataMem, Shifted;
    
    wire [4:0] MUX1Out;
    wire [31:0] MUX2Out; 
    wire [31:0] MUX3Out;
//    wire [31:0] NORMUXOut;
    wire[31:0] SBHMUXOut;
    
    wire [31:0] Reduced;
    
    wire Zero;
    
    //temporary until the controller is implemented
    wire RegDst, RegWrite, ALUSrc, MemWrite, MemRead, Branch, BranchSel, OpSelect, SBHMuxSel;
    wire [1:0] Jump;
    wire [1:0] MemToReg;
    //reg NORMUXSel;
    wire [4:0] ALUControl;
    wire [5:0] ALUOp;
    
//    initial begin
//        RegWrite <= 1'b0;
//        RegDst <= 1'b0;
//        ALUSrc <= 1'b1;
//        MemWrite <= 1'b0;
//        MemRead <= 1'b0;
//        MemToReg <= 1'b0;
//        ALUControl <= 5'b00000;
//    end

//    module Control(	CtrlInput,
//				RegDst,
//				ALUSrc,
//				MemtoReg,
//				RegWrite,
//				MemRead,
//				MemWrite,
//				Branch, 
//				Jump,
//				ALUOp);

    Control controller(Instruction[31:26], RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUOp);
    
//    module ALUControl(	ALUOp,
//                        Funct,
//                        ALUControlOutput);

    ALUControl ALUC(ALUOp, Instruction[5:0], ALUControl);
    
    //module InstructionFetchUnit(Instruction, Reset, Shifted, BranchSel, Clk);
    InstructionFetchUnit IFU(Instruction, Reset, Shifted, BranchSel, Clk);
    
    //module Mux5Bit2to1(out, inA, inB, sel);
    Mux5Bit2to1 MUX1(MUX1Out, Instruction[20:16], Instruction[15:11], RegDst);
    
    //module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, ReadData1, ReadData2);
    RegisterFile RF(Instruction[25:21], Instruction[20:16], MUX1Out, MUX3Out, RegWrite, Clk, ReadData1, ReadData2);
    
    //module SignExtension(in, out);
    SignExtension SignExtend(Instruction[15:0], SignExtended);
    
    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 MUX2(MUX2Out, ReadData2, SignExtended, ALUSrc);
    
    //module ShiftLeft2(inputVal, shiftedVal);
    ShiftLeft2 SHL(SignExtended, Shifted);
    
    //module ALU32Bit(ALUControl, A, B, ALUResult1, ALUResult2, Zero, Shamt);
    ALU32Bit ALU(ALUControl, ReadData1, MUX2Out, ALUResult1, Zero, Instruction[10:6], Instruction[21], Clk);
    
    //module AND(A,B,ANDOut);
    AND BranchAnd(Branch, Zero, BranchSel);
    
    //module StoreBH(Reduced, InSignal, OpSelect);
    StoreBH SBH(Reduced, ReadData2, OpSelect);
    
    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 SBHMux(SBHMuxOut, ReadData2, Reduced, SBHMuxSel);
    
    //module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData);
    DataMemory DM(ALUResult1, ReadData2, Clk, MemWrite, MemRead, ReadDataMem);
    
    Mux32Bit2To1 MUX3(MUX3Out, ALUResult1, ReadDataMem, MemToReg);

endmodule
