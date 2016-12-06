`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// Laboratory  1
// Module - InstructionMemory.v
// Description - 32-Bit wide instruction Memory.
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
// hard-coded into the instruction Memory, so there is no need to write to the 
// InstructionMemory.  The contents of the InstructionMemory is the machine 
// language program to be run on your MIPS processor.
//
//
//we will store the machine code for a code written in C later. for now initialize 
//each entry to be its index * 4 (Memory[i] = i * 4;)
//all you need to do is give an address as input and read the contents of the 
//address on your output port. 
// 
//Using a 32bit address you will index into the Memory, output the contents of that specific 
//address. for data Memory we are using 1K word of storage space. for the instruction Memory 
//you may assume smaller size for practical purpose. you can use 128 words as the size and 
//hardcode the values.  in this case you need 7 bits to index into the Memory. 
//
//be careful with the least two significant bits of the 32bit address. those help us index 
//into one of the 4 bytes in a word. therefore you will need to use bit [8-2] of the input address. 


////////////////////////////////////////////////////////////////////////////////

module InstructionMemory913(Address, Instruction); 

    input [31:0] Address;        // Input Address 

    output reg [31:0] Instruction;    // Instruction at Memory location Address
    
    reg [31:0] memory[0:127];
    //integer Counter;
	
	
	
    
    initial begin
        memory[0]<=32'b00000000000000001000000000100000; // ->	main:	add	$s0, $zero, $zero
        memory[1]<=32'b00000000000000001000100000100000; // ->        add    $s1, $zero, $zero
        memory[2]<=32'b00100000000010000000000000000001; // ->        addi    $t0, $zero, 1
        memory[3]<=32'b00100000000010010000000000000010; // ->        addi    $t1, $zero, 2
        memory[4]<=32'b00100000000010110000000000000011; // ->        addi    $t3, $zero, 3
        memory[5]<=32'b00100000000011000000000000000100; // ->        addi    $t4, $zero, 4
        memory[6]<=32'b00100000000011010000000000000101; // ->        addi    $t5, $zero, 5
        memory[7]<=32'b00100000000011100000000000000110; // ->        addi    $t6, $zero, 6
        memory[8]<=32'b00100010001100010000000000000001; // ->    start:    addi    $s1, $s1, 1
        memory[9]<=32'b00100000000100100000000000000110; // ->        addi    $s2, $zero, 6
        memory[10]<=32'b00100000000100110000000000000110; // ->        addi    $s3, $zero, 6
        memory[11]<=32'b00100000000101000000000000000111; // ->        addi    $s4, $zero, 7
        memory[12]<=32'b00100000000101010000000000001000; // ->        addi    $s5, $zero, 8
        memory[13]<=32'b00100000000101100000000000001001; // ->        addi    $s6, $zero, 9
        memory[14]<=32'b00100000000101110000000000001001; // ->        addi    $s7, $zero, 9
        memory[15]<=32'b00010010000000001111111111111010; // ->        beq    $s0, $zero, start
        memory[16]<=32'b00100000000100000000000000001010; // ->        addi    $s0, $zero, 10
        memory[17]<=32'b00100000000100010000000000001010; // ->        addi    $s1, $zero, 10
        memory[18]<=32'b00100000000100100000000000001010; // ->        addi    $s2, $zero, 10
        memory[20]<=32'b00100000000100110000000000001010; // ->        addi    $s3, $zero, 10
        memory[21]<=32'b00100000000100110000000000001010; // ->        addi    $s3, $zero, 10
        memory[22]<=32'b00100000000100110000000000001010; // ->        addi    $s3, $zero, 10
        memory[23]<=32'b00100000000100110000000000001010; // ->        addi    $s3, $zero, 10

    end
    
    always@(Address) begin
        Instruction <= memory[Address>>2];
    end

endmodule
