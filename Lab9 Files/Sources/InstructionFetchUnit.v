`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members: Mubarak Hassan, Jacob Toman-Ibarra
// Overall percent effort of each team meber: 
// 40/60
// ECE369 - Computer Architecture
// Laboratory 3 (PostLab)
// Module - InstructionFetchUnit.v
// Description - Fetches the instruction from the instruction Memory based on 
//               the program counter (PC) value.
// INPUTS:-
// Reset: 1-Bit input signal. 
// Clk: Input clock signal.
//
// OUTPUTS:-
// Instruction: 32-Bit output instruction from the instruction Memory. 
//              Decimal value diplayed on the LCD usng the wrapper given in Lab 2
//
// FUNCTIONALITY:-
// Please connect up the following implemented modules to create this
// 'InstructionFetchUnit':-
//   (a) ProgramCounter.v
//   (b) PCAdder.v
//   (c) InstructionMemory.v
// Connect the modules together in a testbench so that the instruction Memory
// outputs the contents of the next instruction indicated by the Memory location
// in the PC at every clock cycle. Please initialize the instruction Memory with
// some preliminary values for debugging purposes.
//
// @@ The 'Reset' input control signal is connected to the program counter (PC) 
// register which initializes the unit to output the first instruction in 
// instruction Memory.
// @@ The 'Instruction' output port holds the output value from the instruction
// Memory module.
// @@ The 'Clk' input signal is connected to the program counter (PC) register 
// which generates a continuous clock pulse into the module.
////////////////////////////////////////////////////////////////////////////////

module InstructionFetchUnit(Instruction, Reset, Shifted, BranchSel, Clk);

    input Reset, Clk, BranchSel;
    input [31:0] Shifted;
    output [31:0] Instruction;
    
    wire [31:0] PCResult, PCAddResult;
    wire [31:0] AddResult, MUXOut;
    
    //module ProgramCounter(Address, PCResult, Reset, Clk);
    ProgramCounter PC(MUXOut, PCResult, Reset, Clk);
    
    //module PCAdder(PCResult, PCAddResult);
    PCAdder PCAdd(PCResult, PCAddResult);
    
    //module InstructionMemory(Address, Instruction);
    InstructionMemory IM(PCResult, Instruction);
    
    //module ADD(A,B,Out);
    ADD BranchAdd(Shifted, PCAddResult, AddResult);
    
    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 ADDMux(MUXOut, PCAddResult, AddResult, BranchSel);

endmodule

