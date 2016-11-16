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
    wire [31:0] PipePCAddResultAgain, PipeReadData1, PipeReadData2, PipeSignExtended, PipeInstruction2016, PipeInstruction1511;
    wire [4:0] PipeShamt;
    wire PipeBit21;
    wire [5:0] PipeInstruction50;
    
    // EX/MEM Reg
    wire [31:0] PipeALUResult, PipeAddResult, PipeReadData2Again;
    wire PipeZero, PipeBranchSend;
    
    // MEM/WB Reg
    wire [31:0] PipeReadDataMem, PipeALUResultAgain;
    wire PipeALUSrc, PipeBranch, PipeMemWrite, PipeMemRead, PipeRegWrite;
    wire [1:0] PipeRegDst, PipeMemToReg;
    wire [5:0] PipeALUOp;
    
    // wires for the open up IFU
    wire [31:0] PCAddResult;
    wire [31:0] AddResult, BranchMUXOut, Shifted, JumpMUXOut;
    
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

    Control controller(PipeInstruction[31:26], PipeInstruction[5:0], RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, StoreMode, JalMuxSel);
    
//    module ALUControl(	ALUOp,
//                        Funct,
//                        ALUControlOutput);

    ALUControl ALUC(PipeALUOp, PipeInstruction50, ALUControl, Jump);
    
    //module InstructionFetchUnit(Instruction, Reset, SignExtended, BranchSel, JumpSel, Clk, PCResult, ALUResult;
    //InstructionFetchUnit IFU(Instruction, Reset, SignExtended, BranchOr, Jump, Clk, PCResult, PipeALUResult);
    
//    //module ProgramCounter(Address, PCResult, Reset, Clk);
    ProgramCounter PC(JumpMUXOut, PCResult, Reset, Clk);
    
//    //module PCAdder(PCResult, PCAddResult);
    PCAdder PCAdd(PCResult, PCAddResult);
    
//    //module InstructionMemory(Address, Instruction);
    InstructionMemory913 IM(PCResult, Instruction);
    
//    //module ShiftLeft2(inputVal, shiftedVal);
    ShiftLeft2 SHL(SignExtended, Shifted);
    
//    //module ADD(A,B,Out);
    ADD BranchAdd(Shifted, PipePCAddResultAgain, AddResult);
    
//    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 BranchMux(BranchMUXOut, PipePCAddResult, AddResult, BranchOr);
    
//    //module Mux32Bit4To1(out, inA, inB, inC, inD, sel);
    Mux32Bit4To1 JumpMux(JumpMUXOut, BranchMUXOut, Shifted, PipeALUResult, 0, Jump);
    
    //module IF_ID(addIn, instructionIn, addOut, instructionOut, Clk);
    IF_ID IFID(PCAddResult, Instruction, PipePCAddResult, PipeInstruction, Clk);
    
    //module Mux5Bit2to1(out, inA, inB, sel);
//    Mux5Bit2to1 MUX1(MUX1Out, Instruction[20:16], Instruction[15:11], RegDst);
    
    //module Mux5Bit4To1(out, inA, inB, inC, inD, sel);
    Mux5Bit4To1 MUX1(MUX1Out, PipeInstruction[20:16], PipeInstruction[15:11], 5'b11111, 5'b00000, RegDst);
    
    //module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, ReadData1, ReadData2);
    RegisterFile RF(PipeInstruction[25:21], PipeInstruction[20:16], MUX1Out, JalMUXOut, RegWrite, Clk, ReadData1, ReadData2);
    
//    module ID_EX (  ALUSrcIn,
//                        ALUOpIn,
//                        RegDstIn,
//                        BranchIn,
//                        MemWriteIn,
//                        MemReadIn,
//                        RegWriteIn,
//                        MemToRegIn,
//                        PC_Next_in,
//                        rs_decoded_in,
//                        rt_decoded_in,
//                        sign_extend_in,
//                        rd_instruction_in,
//                        rt_instruction_in,
//                        bit21In,
//                        //Stall,
//                        CLK,
//                        ALUSrcOut,
//                        ALUOpOut,
//                        RegDstOut,
//                        BranchOut,
//                        MemWriteOut,
//                        MemReadOut,
//                        RegWriteOut,
//                        MemToRegOut,
//                        PC_Next_out,
//                        rs_decoded_out,
//                        rt_decoded_out,
//                        sign_extend_out,
//                        rt_instruction_out,
//                        rd_instruction_out
//                        bit21Out    );


    ID_EX IDEX(ALUSrc, ALUOp, RegDst, Branch, MemWrite, MemRead, RegWrite, MemToReg, PipePCAddResult, ReadData1, ReadData2, SignExtended, PipeInstruction[20:16], PipeInstruction[15:11], PipeInstruction[10:6], PipeInstruction[21],
                PipeInstruction[5:0], Clk, PipeALUSrc, PipeALUOp,PipeRegDst, PipeBranch, PipeMemWrite, PipeMemRead, PipeRegWrite, PipeMemToReg, PipePCAddResultAgain, PipeReadData1, PipeReadData2, PipeSignExtended, PipeInstruction2016,
                PipeInstruction1511, PipeShamt, PipeBit21, PipeInstruction50); 
    
    //module SignExtension(in, out);
    SignExtension SignExtend1(PipeInstruction[15:0], SignExtended);
    
    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 MUX2(MUX2Out, PipeReadData2, PipeSignExtended, PipeALUSrc);
    
    //module ALU32Bit(ALUControl, A, B, ALUResult1, Zero, BranchSend, Shamt, bit21, bit16, Clk);
    ALU32Bit ALU(ALUControl, PipeReadData1, MUX2Out, ALUResult1, Zero, BranchSend, PipeShamt, PipeBit21, PipeInstruction2016[0], Clk);
    
    //module EX_MEM(addResultIn, ZeroIn, BranchSendIn, ALUResultIn, ReadData2In, AddResultOut, ZeroOut,BranchSendOut, ALUResultOut, ReadData2Out, Clk);
    EX_MEM EXMEM(AddResult, Zero, BranchSend, ALUResult1, PipeReadData2, PipeAddResult, PipeZero, PipeBranchSend, PipeALUResult, PipeReadData2Again, Clk);
    
    //module AND(A,B,ANDOut);
    AND BranchAnd1(PipeBranch, PipeZero, BranchSel1);
    
    //module AND(A,B,ANDOut);
    AND BranchAnd2(PipeBranch, PipeBranchSend, BranchSel2);
    
    //module OR(A, B, OROut);
    OR OrBranch(BranchSel1, BranchSel2, BranchOr);
    
    //module StoreBH(Reduced, InSignal, OpSelect);
    //StoreBH SBH(Reduced, ReadData2, OpSelect);
    
    //module Mux32Bit2To1(out, inA, inB, sel);
    //Mux32Bit2To1 SBHMux(SBHMUXOut, ReadData2, Reduced, SBHMuxSel);
    
    //module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData, StoreMode);
    DataMemory DM(PipeALUResult, PipeReadData2Again, Clk, MemWrite, MemRead, ReadDataMem, StoreMode);
    
    //module MEM_WB(ReadDataMemIn, ALUResultIn, ReadDataMemOut, ALUResultOut, Clk);
    MEM_WB MEMWB(ReadDataMem, PipeALUResult, PipeReadDataMem, PipeALUResultAgain, Clk);
    
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
    Mux32Bit4To1 MUX3(MUX3Out, PipeALUResultAgain, PipeReadDataMem, ExtendedByte, ExtendedHalfWord, MemToReg);
    
    //module ADD(A,B,Out);
    ADD JalADD(PCResult, 32'h00000004, RAddr);
    
    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 JalMUX(JalMUXOut, MUX3Out, RAddr, JalMuxSel);

endmodule
