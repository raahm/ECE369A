`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Jacob Toman-Ibarra, Mubarak Hassan
// Percent effort: 50/50
//
// Date: 3 November 2016
// Fully designed and implemented datapath.
//
// Datapath executes one instruction per cycle and is capable of executing branch
// and memory instructions.
//
// Datapath takes in input Reset and Clk signals, and outputs the result of the
// ALU's operations in order to allow for proper simulation.
// 
//////////////////////////////////////////////////////////////////////////////////


module Datapath(Reset, Clk, PCResult, JalMUXOut);

    input Reset, Clk;
    output wire [31:0] JalMUXOut;
    output [31:0] PCResult;
    
    wire [31:0] ALUResult1;
    
    wire [31:0] Instruction, ReadData1, ReadData2, SignExtended, ReadDataMem;
    //wire [31:0] Shifted;
    
    wire [4:0] MUX1Out;
    wire [31:0] MUX2Out; 
    wire [31:0] MUX3Out;
//    wire [31:0] NORMUXOut;
//    wire[31:0] SBHMUXOut;
    
//    wire [31:0] Reduced;
    
    wire Zero, BranchSend;
    
    wire [7:0] ByteMuxOut;
    wire [15:0] HalfwordMuxOut;
    
    wire [31:0] ExtendedHalfWord, ExtendedByte;
    wire [31:0] RAddr;
    
    //temporary until the controller is implemented
    wire RegWrite, ALUSrc, MemWrite, MemRead, Branch, BranchSel1, BranchSel2, BranchOr, OpSelect, JalMuxSel;
    wire [1:0] RegDst;
    wire [1:0] Jump;
    wire [1:0] MemToReg;
    wire [1:0] StoreMode;   //control signal for determining mode on Data Memory
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

    Control controller(Instruction[31:26], RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, StoreMode, JalMuxSel);
    
//    module ALUControl(	ALUOp,
//                        Funct,
//                        ALUControlOutput);

    ALUControl ALUC(ALUOp, Instruction[5:0], ALUControl, Jump);
    
    //module InstructionFetchUnit(Instruction, Reset, SignExtended, BranchSel, JumpSel, Clk, PCResult, ALUResult;
    InstructionFetchUnit IFU(Instruction, Reset, SignExtended, BranchOr, Jump, Clk, PCResult, ALUResult1);
    
    //module Mux5Bit2to1(out, inA, inB, sel);
//    Mux5Bit2to1 MUX1(MUX1Out, Instruction[20:16], Instruction[15:11], RegDst);
    
    //module Mux5Bit4To1(out, inA, inB, inC, inD, sel);
    Mux5Bit4To1 MUX1(MUX1Out, Instruction[20:16], Instruction[15:11], 5'b11111, 5'b00000, RegDst);
    
    //module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, ReadData1, ReadData2);
    RegisterFile RF(Instruction[25:21], Instruction[20:16], MUX1Out, JalMUXOut, RegWrite, Clk, ReadData1, ReadData2);
    
    //module SignExtension(in, out);
    SignExtension SignExtend1(Instruction[15:0], SignExtended);
    
    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 MUX2(MUX2Out, ReadData2, SignExtended, ALUSrc);
    
    //module ALU32Bit(ALUControl, A, B, ALUResult1, Zero, BranchSend, Shamt, bit21, bit16, Clk);
    ALU32Bit ALU(ALUControl, ReadData1, MUX2Out, ALUResult1, Zero, BranchSend, Instruction[10:6], Instruction[21], Instruction[16]);
    
    //module AND(A,B,ANDOut);
    AND BranchAnd1(Branch, Zero, BranchSel1);
    
    //module AND(A,B,ANDOut);
    AND BranchAnd2(Branch, BranchSend, BranchSel2);
    
    //module OR(A, B, OROut);
    OR OrBranch(BranchSel1, BranchSel2, BranchOr);
    
    //module StoreBH(Reduced, InSignal, OpSelect);
    //StoreBH SBH(Reduced, ReadData2, OpSelect);
    
    //module Mux32Bit2To1(out, inA, inB, sel);
    //Mux32Bit2To1 SBHMux(SBHMUXOut, ReadData2, Reduced, SBHMuxSel);
    
    //module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData, StoreMode);
    DataMemory DM(ALUResult1, ReadData2, Clk, MemWrite, MemRead, ReadDataMem, StoreMode);
    
    //module Mux8Bit4To1(out, inA, inB, inC, inD, sel);
    Mux8Bit4To1 ByteMux(ByteMuxOut, ReadDataMem[7:0], ReadDataMem[15:8], ReadDataMem[23:16], ReadDataMem[31:24], ALUResult1[1:0]);
    
    //module Mux16Bit2To1(out, inA, inB, sel);
    Mux16Bit2To1 HalfwordMux(HalfwordMuxOut, ReadDataMem[31:16], ReadDataMem[15:0], ALUResult1[0]);
    
    //module SignExtension(in, out);
    SignExtension SignExtend2(HalfwordMuxOut, ExtendedHalfWord);
    
    //module SignExtendByte(in, out);
    SignExtendByte ByteExtender(ByteMuxOut, ExtendedByte);
    
    //Mux32Bit2To1 MUX3(MUX3Out, ALUResult1, ReadDataMem, MemToReg);
    
    //module Mux32Bit4To1(out, inA, inB, inC, inD, sel);
    Mux32Bit4To1 MUX3(MUX3Out, ALUResult1, ReadDataMem, ExtendedByte, ExtendedHalfWord, MemToReg);
    
    //module ADD(A,B,Out);
    ADD JalADD(PCResult, 32'h00000004, RAddr);
    
    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 JalMUX(JalMUXOut, MUX3Out, RAddr, JalMuxSel);

endmodule
