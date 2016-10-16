`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// Laboratory  1
// Module - InstructionMemory.v
// Description - 32-Bit wide instruction memory.
//
// INPUT:-
// Address: 32-Bit address input port.
//
// OUTPUT:-
// Instruction: 32-Bit output port.
//
// FUNCTIONALITY:-
// Similar to the DataMemory, this module should also be byte-addressed
// (i.e., ignore bits 0 and 1 of 'Address'). All of the instructions will be 
// hard-coded into the instruction memory, so there is no need to write to the 
// InstructionMemory.  The contents of the InstructionMemory is the machine 
// language program to be run on your MIPS processor.
//
//
//we will store the machine code for a code written in C later. for now initialize 
//each entry to be its index * 4 (memory[i] = i * 4;)
//all you need to do is give an address as input and read the contents of the 
//address on your output port. 
// 
//Using a 32bit address you will index into the memory, output the contents of that specific 
//address. for data memory we are using 1K word of storage space. for the instruction memory 
//you may assume smaller size for practical purpose. you can use 128 words as the size and 
//hardcode the values.  in this case you need 7 bits to index into the memory. 
//
//be careful with the least two significant bits of the 32bit address. those help us index 
//into one of the 4 bytes in a word. therefore you will need to use bit [8-2] of the input address. 


////////////////////////////////////////////////////////////////////////////////

module InstructionMemory(Address, Instruction); 

    input [31:0] Address;        // Input Address 

    output reg [31:0] Instruction;    // Instruction at memory location Address
    
    reg [31:0] Memory[0:127];
    integer Counter;
    
    initial begin
        Memory[0] <= 32'b00100000000100000000000000000001;
        Memory[1] <= 32'b00100000000100010000000000000001;
        Memory[2] <= 32'b00000010000100011000000000100100;
        Memory[3] <= 32'b00000010000000001000000000100100;
        Memory[4] <= 32'b00000010001100001000000000100010;
        Memory[5] <= 32'b00000010000000001000000000100111;
        Memory[6] <= 32'b00000010000000001000000000100111;
        Memory[7] <= 32'b00000000000000001000000000100101;
        Memory[8] <= 32'b00000010001000001000000000100101;
        Memory[9] <= 32'b00000000000100001000000010000000;
        Memory[10] <= 32'b00000010001100001000000000000100;
        Memory[11] <= 32'b00000010000000001000000000101010;
        Memory[12] <= 32'b00000010000100011000000000101010;
        Memory[13] <= 32'b00000000000100011000000001000011;
        Memory[14] <= 32'b00000000000100011000000000000111;
        Memory[15] <= 32'b00000000000100011000000001000010;
        Memory[16] <= 32'b00000000000100011000000011000000;
        Memory[17] <= 32'b00000000000100001000000011000010;
        Memory[18] <= 32'b00000010001100001000000000000100;
        Memory[19] <= 32'b00000010001100001000000000000110;
        Memory[20] <= 32'b00000010000100011000000000100110;
        Memory[21] <= 32'b00000010000100011000000000100110;
        Memory[22] <= 32'b
        Memory[23] <= 32'b
        Memory[24] <= 32'b
        Memory[25] <= 32'b
        Memory[26] <= 32'b
        Memory[27] <= 32'b
        Memory[28] <= 32'b
        Memory[29] <= 32'b
        Memory[30] <= 32'b
        Memory[31] <= 32'b
        Memory[32] <= 32'b
        Memory[33] <= 32'b
        Memory[34] <= 32'b
        Memory[35] <= 32'b
        Memory[36] <= 32'b
        Memory[37] <= 32'b
        Memory[38] <= 32'b
        Memory[39] <= 32'b
        Memory[40] <= 32'b
        Memory[41] <= 32'b
        Memory[42] <= 32'b
        Memory[43] <= 32'b
        Memory[44] <= 32'b
        Memory[45] <= 32'b
        Memory[46] <= 32'b
        Memory[47] <= 32'b
        Memory[48] <= 32'b
        Memory[49] <= 32'b
        Memory[50] <= 32'b
        Memory[51] <= 32'b
        Memory[52] <= 32'b
        Memory[53] <= 32'b
        Memory[54] <= 32'b
        Memory[55] <= 32'b
        Memory[56] <= 32'b
        Memory[57] <= 32'b
        Memory[57] <= 32'b
        Memory[58] <= 32'b
        Memory[59] <= 32'b
        Memory[60] <= 32'b
        Memory[61] <= 32'b
        Memory[62] <= 32'b
        Memory[63] <= 32'b
        Memory[64] <= 32'b
        Memory[65] <= 32'b
        
        
        
    end
    
    always@(Address) begin
        Instruction <= Memory[Address>>2];
    end

endmodule
