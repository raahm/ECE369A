`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Design to implement a rudimentary datapath to allow for completion of R- 
// and I-Type instructions.
//
// NOTE: this does not implement "top" portion of datapath, i.e. branch adder,
// as this current version does not need to implement branch-type instructions.
// This will be updated in future versions. 
// 
//////////////////////////////////////////////////////////////////////////////////


module Datapath(Reset, Clk, ALUResult1);

    input Reset, Clk;
    output wire [31:0] ALUResult1;
    
    wire [31:0] Instruction, ReadData1, ReadData2, SignExtended, ReadDataMem;
    
    wire [4:0] MUX1Out;
    wire [31:0] MUX2Out, stallA, stallB; 
//    wire [31:0] MUX3Out;
//    wire [31:0] NORMUXOut;
    
    wire Zero;
    
    //temporary until the controller is implemented
    wire RegDst, RegWrite, ALUSrc, MemWrite, MemRead, Branch;
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
    
    //module InstructionFetchUnit(Instruction, Reset, Clk);
    InstructionFetchUnit IFU(Instruction, Reset, Clk);
    
    //module Mux5Bit2to1(out, inA, inB, sel);
    Mux5Bit2to1 MUX1(MUX1Out, Instruction[20:16], Instruction[15:11], RegDst);
    
    //module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, ReadData1, ReadData2);
    RegisterFile RF(Instruction[25:21], Instruction[20:16], MUX1Out, ALUResult1, RegWrite, Clk, ReadData1, ReadData2);
    
    //module SignExtension(in, out);
    SignExtension SignExtend(Instruction[15:0], SignExtended);
    
    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 MUX2(MUX2Out, ReadData2, SignExtended, ALUSrc);
    
    //module StallBlock(Clk,inA,inB,outA,outB);
    //StallBlock Stall(Clk, ReadData1, MUX2Out, stallA, stallB);
    
    //module ALU32Bit(ALUControl, A, B, ALUResult1, ALUResult2, Zero, Shamt);
    ALU32Bit ALU(ALUControl, ReadData1, MUX2Out, ALUResult1, Zero, Instruction[10:6], Instruction[21], Clk);
    
    //Mux32Bit2To1 NORMUX(NORMUXOut, ALUResult1, ~ALUResult1, NORMUXSel);
    
    //module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData);
    //DataMemory DM(ALUResult1, ReadData2, Clk, MemWrite, MemRead, ReadDataMem);
    
    //Mux32Bit2To1 MUX3(MUX3Out, ALUResult1, ReadDataMem, MemToReg);

endmodule
