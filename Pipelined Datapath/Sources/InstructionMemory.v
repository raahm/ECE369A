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

module InstructionMemory(Address, Instruction); 

    input [31:0] Address;        // Input Address 

    output reg [31:0] Instruction;    // Instruction at Memory location Address
    
    reg [31:0] memory[0:127];
    //integer Counter;
    
    initial begin
        
        $readmemh ("Instruction_memory.txt", Memory);


//        memory[0]<=32'b00000000000000001000000000100000; // ->	main:	add	$s0, $zero, $zero
//        memory[1]<=32'b00000000000000001000100000100000; // ->		add	$s1, $zero, $zero
//        memory[2]<=32'b00100000000010000000000000000001; // ->		addi	$t0, $zero, 1
//        memory[3]<=32'b00100000000010010000000000000010; // ->		addi	$t1, $zero, 2
//        memory[4]<=32'b00100000000010110000000000000011; // ->		addi	$t3, $zero, 3
//        memory[5]<=32'b00100000000011000000000000000100; // ->		addi	$t4, $zero, 4
//        memory[6]<=32'b00100000000011010000000000000101; // ->		addi	$t5, $zero, 5
//        memory[7]<=32'b00100000000011100000000000000110; // ->		addi	$t6, $zero, 6
//        memory[8]<=32'b00100010001100010000000000000001; // ->	start:	addi	$s1, $s1, 1
//        memory[9]<=32'b00100000000100100000000000000110; // ->		addi	$s2, $zero, 6
//        memory[10]<=32'b00100000000100110000000000000110; // ->		addi	$s3, $zero, 6
//        memory[11]<=32'b00100000000101000000000000000111; // ->		addi	$s4, $zero, 7
//        memory[12]<=32'b00100000000101010000000000001000; // ->		addi	$s5, $zero, 8
//        memory[13]<=32'b00100000000101100000000000001001; // ->		addi	$s6, $zero, 9
//        memory[14]<=32'b00100000000101110000000000001001; // ->		addi	$s7, $zero, 9
//        memory[15]<=32'b00010010000000001111111111111010; // ->		beq	$s0, $zero, start
//        memory[16]<=32'b00100000000100000000000000001010; // ->		addi	$s0, $zero, 10
//        memory[17]<=32'b00100000000100010000000000001010; // ->		addi	$s1, $zero, 10
//        memory[18]<=32'b00100000000100100000000000001010; // ->		addi	$s2, $zero, 10
//        memory[19]<=32'b00100000000100110000000000001010; // ->		addi	$s3, $zero, 10






       
    end
    
//    initial begin
//        Memory[0] = 32'h34040000;	//	main:		ori	$a0, $zero, 0
//        Memory[1] = 32'h08000004;    //            j    start
//        Memory[2] = 32'h2004000a;    //            addi    $a0, $zero, 10
//        Memory[3] = 32'h2004000a;    //            addi    $a0, $zero, 10
//        Memory[4] = 32'h8c900004;    //    start:        lw    $s0, 4($a0)
//        Memory[5] = 32'h8c900008;    //            lw    $s0, 8($a0)
//        Memory[6] = 32'hac900000;    //            sw    $s0, 0($a0)
//        Memory[7] = 32'hac90000c;    //            sw    $s0, 12($a0)
//        Memory[8] = 32'h8c910000;    //            lw    $s1, 0($a0)
//        Memory[9] = 32'h8c92000c;    //            lw    $s2, 12($a0)
//        Memory[10] = 32'h12000003;    //            beq    $s0, $zero, branch1
//        Memory[11] = 32'h02008820;    //            add    $s1, $s0, $zero
//        Memory[12] = 32'h12110001;    //            beq    $s0, $s1, branch1
//        Memory[13] = 32'h08000037;    //            j    error
//        Memory[14] = 32'h2010ffff;    //    branch1:    addi    $s0, $zero, -1
//        Memory[15] = 32'h0601fff4;    //            bgez    $s0, start
//        Memory[16] = 32'h22100001;    //            addi    $s0, $s0, 1
//        Memory[17] = 32'h06010001;    //            bgez    $s0, branch2
//        Memory[18] = 32'h08000037;    //            j    error
//        Memory[19] = 32'h2010ffff;    //    branch2:    addi    $s0, $zero, -1
//        Memory[20] = 32'h1E000005;    //            bgtz    $s0, branch3
//        Memory[21] = 32'h20100001;    //            addi    $s0, $zero, 1
//        Memory[22] = 32'h20100001;    //            addi    $s0, $zero, 1
//        Memory[23] = 32'h20100001;    //            addi    $s0, $zero, 1
//        Memory[24] = 32'h1E000001;    //            bgtz    $s0, branch3
//        Memory[25] = 32'h08000037;    //            j    error
//        Memory[26] = 32'h06000003;    //    branch3:    bltz    $s0, branch4
//        Memory[27] = 32'h2010ffff;    //            addi    $s0, $zero, -1
//        Memory[28] = 32'h06000001;    //            bltz    $s0, branch4
//        Memory[29] = 32'h08000037;    //            j    error
//        Memory[30] = 32'h2011ffff;    //    branch4:    addi    $s1, $zero, -1
//        Memory[31] = 32'h16110002;    //            bne    $s0, $s1, branch5
//        Memory[32] = 32'h16000001;    //            bne    $s0, $zero, branch5
//        Memory[33] = 32'h08000037;    //            j    error
//        Memory[34] = 32'h20100080;    //    branch5:    addi    $s0, $zero, 128
//        Memory[35] = 32'ha0900000;    //            sb    $s0, 0($a0)
//        Memory[36] = 32'h80900000;    //            lb    $s0, 0($a0)
//        Memory[37] = 32'h1a000001;    //            blez    $s0, branch6
//        Memory[38] = 32'h08000037;    //            j    error
//        Memory[39] = 32'h2010ffff;    //    branch6:    addi    $s0, $zero, -1
//        Memory[40] = 32'ha4900000;    //            sh    $s0, 0($a0)
//        Memory[41] = 32'h20100000;    //            addi    $s0, $zero, 0
//        Memory[42] = 32'h84900000;    //            lh    $s0, 0($a0)
//        Memory[43] = 32'h1a000001;    //            blez    $s0, branch7
//        Memory[44] = 32'h08000037;    //            j    error
//        Memory[45] = 32'h2010ffff;    //    branch7:    addi    $s0, $zero, -1
//        Memory[46] = 32'h3c100001;    //            lui    $s0, 1
//        Memory[47] = 32'h06010001;    //            bgez    $s0, branch8
//        Memory[48] = 32'h08000037;    //            j    error
//        Memory[49] = 32'h08000033;    //    branch8:    j    jump1
//        Memory[50] = 32'h2210fffe;    //            addi    $s0, $s0, -2
//        Memory[51] = 32'h0c000035;    //    jump1:        jal    jal1
//        Memory[52] = 32'h08000004;    //            j    start
//        Memory[53] = 32'h03e00008;    //    jal1:        jr    $ra
//        Memory[54] = 32'h08000037;    //            j    error
//        Memory[55] = 32'h00000008;    //    error:        jr    $zero
//        Memory[56] = 32'h3402000a;    //            ori    $v0, $zero, 10
//        Memory[57] = 32'h00000000;    //            nop
        
        
        
//    end
    
    always@(Address) begin
        Instruction <= memory[Address>>2];
    end

endmodule
