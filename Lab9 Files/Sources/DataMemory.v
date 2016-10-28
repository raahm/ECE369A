`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - data_memory.v
// Description - 32-Bit wide data Memory.
//
// INPUTS:-
// Address: 32-Bit address input port.
// WriteData: 32-Bit input port.
// Clk: 1-Bit Input clock signal.
// MemWrite: 1-Bit control signal for Memory write.
// MemRead: 1-Bit control signal for Memory read.
//
// OUTPUTS:-
// ReadData: 32-Bit registered output port.
//
// FUNCTIONALITY:-
// Design the above Memory similar to the 'RegisterFile' model in the previous 
// assignment.  Create a 1K Memory, for which we need 10 bits.  In order to 
// implement byte addressing, we will use bits Address[11:2] to index the 
// Memory location. The 'WriteData' value is written into the address 
// corresponding to Address[11:2] in the positive clock edge if 'MemWrite' 
// signal is 1. 'ReadData' is the value of Memory location Address[11:2] if 
// 'MemRead' is 1, otherwise, it is 0x00000000. The reading of Memory is not 
// clocked.
//
// you need to declare a 2d array. in this case we need an array of 1024 (1K)  
// 32-bit elements for the Memory.   
// for example,  to declare an array of 256 32-bit elements, declaration is: reg[31:0] Memory[0:255]
// if i continue with the same declaration, we need 8 bits to index to one of 256 elements. 
// however , address port for the data Memory is 32 bits. from those 32 bits, least significant 2 
// bits help us index to one of the 4 bytes within a single word. therefore we only need bits [9-2] 
// of the "Address" input to index any of the 256 words. 
////////////////////////////////////////////////////////////////////////////////

module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData); 

    input [31:0] Address; 	// Input Address 
    input [31:0] WriteData; // Data that needs to be written into the address 
    input Clk;
    input MemWrite; 		// Control signal for Memory write 
    input MemRead; 			// Control signal for Memory read 

    output reg[31:0] ReadData; // Contents of Memory location at Address
    
    reg [31:0] Memory[1023:0];
    
    integer Counter;
    
    //loop to initialize the values in the data Memory
    initial begin
        Memory[0] = 32'h0;
        Memory[1] = 32'h1;
        Memory[2] = 32'h2;
        Memory[3] = 32'h3;
        Memory[4] = 32'h4;
        Memory[5] = -32'h1;
    end
    
    always @(posedge Clk) begin
        if (MemRead == 1) begin
            ReadData <= Memory[Address];
        end
    end
    always @(negedge Clk) begin
        if (MemWrite == 1) begin
            Memory[Address] <= WriteData;
        end
    end

endmodule
