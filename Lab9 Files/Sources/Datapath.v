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
    wire [31:0] MUX2Out; 
//    wire [31:0] MUX3Out;
//    wire [31:0] NORMUXOut;
    
    wire Zero;
    
    //temporary until the controller is implemented
    reg RegDst, RegWrite, ALUSrc, MemWrite, MemRead, MemToReg;
    //reg NORMUXSel;
    reg [4:0] ALUControl;
    
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
    
    //module ALU32Bit(ALUControl, A, B, ALUResult1, ALUResult2, Zero, Shamt);
    ALU32Bit ALU(ALUControl, ReadData1, MUX2Out, ALUResult1, Zero, Instruction[10:6]);
    
    //Mux32Bit2To1 NORMUX(NORMUXOut, ALUResult1, ~ALUResult1, NORMUXSel);
    
    //module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData);
    //DataMemory DM(ALUResult1, ReadData2, Clk, MemWrite, MemRead, ReadDataMem);
    
    //Mux32Bit2To1 MUX3(MUX3Out, ALUResult1, ReadDataMem, MemToReg);

endmodule
