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
    
    //
    // Wires for the registers to allow for pipelining
    // Note: follow convention Pipe<variable>
    //
    
    // IF/ID Reg
    wire [31:0] PipeInstruction, PipePCAddResult;
    
    // ID/EX Reg
    wire [31:0] PipePCAddResultAgain, PipeReadData1, PipeReadData2, PipeSignExtended;
    wire [4:0] PipeShamt, PipeInstruction2016, PipeInstruction1511;
    wire PipeBit21, PipeJalMuxSel;
    wire [5:0] PipeInstruction50;
    wire PipeALUSrc, PipeBranch, PipeMemWrite, PipeMemRead, PipeRegWrite;
    wire [1:0] PipeRegDst, PipeMemToReg, PipeStoreMode;
    wire [5:0] PipeALUOp;
    
    // EX/MEM Reg
    wire [31:0] PipeALUResult, PipeAddResult, PipeReadData2Again, PipeShifted, PipePCAddResultAgain2, PipePCAddResultLast;
    wire PipeZero, PipeBranchSend, PipeJalMuxSelAgain;
    wire PipeBranchAgain, PipeMemWriteAgain, PipeMemReadAgain, PipeRegWriteAgain;
    wire [1:0] PipeMemToRegAgain, PipeStoreModeAgain, PipeJump;
    wire [4:0] PipeMUX1Out;
    
    // MEM/WB Reg
    wire [31:0] PipeReadDataMem, PipeALUResultAgain, PipeExtendedByte, PipeExtendedHalfword;
    wire PipeRegWriteLast, PipeJalMuxSelLast;
    wire [1:0] PipeMemToRegLast;
    wire [4:0] PipeMUX1OutLast;
    
    // wires for the open up IFU
    wire [31:0] PCAddResult;
    wire [31:0] AddResult, BranchMUXOut, Shifted, JumpMUXOut;
    
    // Stall signals
    wire IFIDStall;
    
    // For preventing PC from incrementing for Branch instructions
    // FIXME: may not be necessary
    wire [31:0] PCMUXOut;
    wire PCStall;
    
    // For flushing from the pipeline for branch instructions
    wire Flush;
    
    // for beginning logic
//    wire BeginningMuxOut, BeginningMuxSel;

    // for stalling pc
    wire StallClk;
    
    // for forwarding unit
    wire [4:0] Pipe_rs, Pipe_rt, Pipe_rd, Pipe_rsAgain, Pipe_rtAgain, Pipe_rdAgain, Pipe_rdLast;
    wire FU1Sel, FU2Sel;
    wire [31:0] FUMux1Out, FUMux2Out;
    
//    module Control(	CtrlInput,
//              FunctionCode,
//				RegDst,
//				ALUSrc,
//				MemtoReg,
//				RegWrite,
//				MemRead,
//				MemWrite,
//				Branch, 
//				Jump,
//				ALUOp);

    //module ClockStall(Clk, ClkOut);
    ClockStall ClkStl(Clk, StallClk);

    Control controller(PipeInstruction[31:26], PipeInstruction[5:0], RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, StoreMode, JalMuxSel);
    
//    module ALUControl(	ALUOp,
//                        Funct,
//                        ALUControlOutput);

    ALUControl ALUC(PipeALUOp, PipeInstruction50, ALUControl, Jump);
    
    //module HazardDetection(Clk, Reset, Branch, Stall, PCStall, Flush);
    HazardDetection HD(Clk, Reset, BranchOr, IFIDStall, PCStall, Flush);
    
    //module Forwarding(EX_rs, EX_rt, MEM_rd, WB_rd, MEM_rt, mux1sel, mux2sel);
    Forwarding FU(Pipe_rs, Pipe_rt, Pipe_rdAgain, Pipe_rdLast, Pipe_rtAgain, FU1Sel, FU2Sel);
    
    Mux32Bit2To1 FUMux1(FUMux1Out, PipeReadData1, PipeALUResult, FU1Sel);
    
    Mux32Bit2To1 FUMux2(FUMux2Out, MUX2Out, PipeALUResult, FU2Sel);
    
    //module InstructionFetchUnit(Instruction, Reset, SignExtended, BranchSel, JumpSel, Clk, PCResult, ALUResult;
    //InstructionFetchUnit IFU(Instruction, Reset, SignExtended, BranchOr, Jump, Clk, PCResult, PipeALUResult);
    
//    //module ProgramCounter(Address, PCResult, Reset, Clk);
    ProgramCounter PC(PCMUXOut, PCResult, Reset, Clk);
    
//    //module PCAdder(PCResult, PCAddResult);
    PCAdder PCAdd(PCResult, PCAddResult);
    
//    //module InstructionMemory(Address, Instruction);
    InstructionMemory IM(PCResult, Instruction);
    
    Mux32Bit2To1 PCMUX(PCMUXOut, JumpMUXOut, PCResult, PCStall);
    
//    //module ShiftLeft2(inputVal, shiftedVal);
    ShiftLeft2 SHL(PipeSignExtended, Shifted);
    
//    //module ADD(A,B,Out);
    ADD BranchAdd(Shifted, PipePCAddResultAgain, AddResult);
    
//    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 BranchMux(BranchMUXOut, PCAddResult, PipeAddResult, BranchOr);
    
//    //module Mux32Bit4To1(out, inA, inB, inC, inD, sel);
    Mux32Bit4To1 JumpMux(JumpMUXOut, BranchMUXOut, PipeShifted, PipeALUResult, 0, PipeJump);
    
    //module IF_ID(Stall, addIn, instructionIn, addOut, instructionOut, Clk);
    IF_ID IFID(Reset, IFIDStall, PCAddResult, Instruction, PipePCAddResult, PipeInstruction, Clk);
    
    //module Mux5Bit2to1(out, inA, inB, sel);
//    Mux5Bit2to1 MUX1(MUX1Out, Instruction[20:16], Instruction[15:11], RegDst);
    
    //module Mux5Bit4To1(out, inA, inB, inC, inD, sel);
    Mux5Bit4To1 MUX1(MUX1Out, PipeInstruction2016, PipeInstruction1511, 5'b11111, 5'b00000, PipeRegDst);
    
    //module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, ReadData1, ReadData2);
    RegisterFile RF(PipeInstruction[25:21], PipeInstruction[20:16], PipeMUX1OutLast, JalMUXOut, PipeRegWriteLast, Clk, ReadData1, ReadData2);
    
//module ID_EX (  ALUSrcIn,
//                    ALUOpIn,
//                    RegDstIn,
//                    BranchIn,
//                    MemWriteIn,
//                    MemReadIn,
//                    RegWriteIn,
//                    MemToRegIn,
//                    PC_Next_in,
//                    rs_decoded_in,
//                    rt_decoded_in,
//                    sign_extend_in,
//                    rd_instruction_in,
//                    rt_instruction_in,
//                    ShamtIn,
//                    bit21In,
//                    Instruction50In,
//                    JalMuxSelIn,
//                    //Stall,
//                    CLK,
//                    ALUSrcOut,
//                    ALUOpOut,
//                    RegDstOut,
//                    BranchOut,
//                    MemWriteOut,
//                    MemReadOut,
//                    RegWriteOut,
//                    MemToRegOut,
//                    PC_Next_out,
//                    rs_decoded_out,
//                    rt_decoded_out,
//                    sign_extend_out,
//                    rt_instruction_out,
//                    rd_instruction_out,
//                    ShamtOut,    
//                    bit21Out,
//                    Instruction50Out,
//                    JalMuxSelOut,
//                    Flush);


    ID_EX IDEX(Reset, ALUSrc, ALUOp, RegDst, Branch, MemWrite, MemRead, RegWrite, MemToReg, PipePCAddResult, ReadData1, ReadData2, SignExtended, PipeInstruction[15:11], PipeInstruction[20:16], PipeInstruction[10:6], PipeInstruction[21],
                PipeInstruction[5:0], JalMuxSel, StoreMode, PipeInstruction[25:21], PipeInstruction[20:16], PipeInstruction[15:11],Clk, PipeALUSrc, PipeALUOp,PipeRegDst, PipeBranch, PipeMemWrite, PipeMemRead, PipeRegWrite, PipeMemToReg, PipePCAddResultAgain, PipeReadData1, PipeReadData2, PipeSignExtended, PipeInstruction2016,
                PipeInstruction1511, PipeShamt, PipeBit21, PipeInstruction50, PipeJalMuxSel, PipeStoreMode,Pipe_rs, Pipe_rt, Pipe_rd, Flush); 
    
    //module SignExtension(in, out);
    SignExtension SignExtend1(PipeInstruction[15:0], SignExtended);
    
//    Mux1Bit2To1 BeginningMux(BeginningMuxOut, BranchOr, 0, BeginningMuxSel);
    
    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 MUX2(MUX2Out, PipeReadData2, PipeSignExtended, PipeALUSrc);
    
    //module ALU32Bit(ALUControl, A, B, ALUResult1, Zero, BranchSend, Shamt, bit21, bit16, Clk);
    ALU32Bit ALU(ALUControl, FUMux1Out, FUMux2Out, ALUResult1, Zero, BranchSend, PipeShamt, PipeBit21, PipeInstruction2016[0], Clk);
    
    //module EX_MEM(Reset, addResultIn, ZeroIn, BranchSendIn, BranchIn, MemReadIn, MemWriteIn, RegWriteIn, MemToRegIn, Mux1In, ShiftedIn, PCAddResultIn, JalMuxSelIn, JumpIn, StoreModeIn, ALUResultIn, ReadData2In, rd_in, rt_imm_in, AddResultOut, ZeroOut, BranchSendOut, BranchOut, MemReadOut, MemWriteOut, RegWriteOut, MemToRegOut, Mux1Out, ShiftedOut, PCAddResultOut, JalMuxSelOut, JumpOut, StoreModeOut, ALUResultOut, ReadData2Out, rd_out, rt_imm_out, Clk, Flush);
    EX_MEM EXMEM(Reset, AddResult, Zero, BranchSend, PipeBranch, PipeMemRead, PipeMemWrite, PipeRegWrite, PipeMemToReg, MUX1Out, Shifted, PipePCAddResultAgain, PipeJalMuxSel, Jump, PipeStoreMode, ALUResult1, PipeReadData2, Pipe_rd, Pipe_rt, PipeAddResult, PipeZero, PipeBranchSend, PipeBranchAgain, PipeMemReadAgain, PipeMemWriteAgain, PipeRegWriteAgain, PipeMemToRegAgain, PipeMUX1Out, PipeShifted, PipePCAddResultAgain2, PipeJalMuxSelAgain, PipeJump, PipeStoreModeAgain, PipeALUResult, PipeReadData2Again, Pipe_rdAgain, Pipe_rtAgain, Clk, Flush);
    
    //module AND(A,B,ANDOut);
    AND BranchAnd1(PipeBranchAgain, PipeZero, BranchSel1);
    
    //module AND(A,B,ANDOut);
    AND BranchAnd2(PipeBranchAgain, PipeBranchSend, BranchSel2);
    
    //module OR(A, B, OROut);
    OR OrBranch(BranchSel1, BranchSel2, BranchOr);
    
    //module StoreBH(Reduced, InSignal, OpSelect);
    //StoreBH SBH(Reduced, ReadData2, OpSelect);
    
    //module Mux32Bit2To1(out, inA, inB, sel);
    //Mux32Bit2To1 SBHMux(SBHMUXOut, ReadData2, Reduced, SBHMuxSel);
    
    //module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData, StoreMode);
    DataMemory DM(PipeALUResult, PipeReadData2Again, Clk, PipeMemWriteAgain, PipeMemReadAgain, ReadDataMem, PipeStoreModeAgain);
    
    //module MEM_WB(Reset, Stall, ReadDataMemIn, ALUResultIn, ExtendedByteIn, ExtendedHalfwordIn, RegWriteIn, MemToRegIn, Mux1In, PCAddResultIn, JalMuxSelIn, rd_in, ReadDataMemOut, ALUResultOut,ExtendedByteOut, ExtendedHalfwordOut, RegWriteOut, MemToRegOut, Mux1Out, PCAddResultOut, JalMuxSelOut, rd_out, Clk, Flush);
    MEM_WB MEMWB(Reset, IFIDStall, ReadDataMem, PipeALUResult, ExtendedByte, ExtendedHalfWord, PipeRegWriteAgain, PipeMemToRegAgain, PipeMUX1Out, PipePCAddResultAgain2, PipeJalMuxSelAgain, Pipe_rdAgain, PipeReadDataMem, PipeALUResultAgain, PipeExtendedByte, PipeExtendedHalfword, PipeRegWriteLast, PipeMemToRegLast, PipeMUX1OutLast, PipePCAddResultLast, PipeJalMuxSelLast, Pipe_rdLast, Clk, Flush);
    
    //module Mux8Bit4To1(out, inA, inB, inC, inD, sel);
    Mux8Bit4To1 ByteMux(ByteMuxOut, ReadDataMem[7:0], ReadDataMem[15:8], ReadDataMem[23:16], ReadDataMem[31:24], PipeALUResult[1:0]);
    
    //module Mux16Bit2To1(out, inA, inB, sel);
    Mux16Bit2To1 HalfwordMux(HalfwordMuxOut, ReadDataMem[31:16], ReadDataMem[15:0], PipeALUResult[0]);
    
    //module SignExtension(in, out);
    SignExtension SignExtend2(HalfwordMuxOut, ExtendedHalfWord);
    
    //module SignExtendByte(in, out);
    SignExtendByte ByteExtender(ByteMuxOut, ExtendedByte);
    
    //Mux32Bit2To1 MUX3(MUX3Out, ALUResult1, ReadDataMem, MemToReg);
    
    //module Mux32Bit4To1(out, inA, inB, inC, inD, sel);
    Mux32Bit4To1 MUX3(MUX3Out, PipeALUResultAgain, PipeReadDataMem, PipeExtendedByte, PipeExtendedHalfword, PipeMemToRegLast);
    
    //module ADD(A,B,Out);
//    ADD JalADD(PCResult, 32'h00000004, RAddr);
    
    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 JalMUX(JalMUXOut, MUX3Out, PipePCAddResultLast, PipeJalMuxSelLast);

endmodule
