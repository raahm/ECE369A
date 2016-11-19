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

module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData, StoreMode); 

    input [31:0] Address; 	// Input Address 
    input [31:0] WriteData; // Data that needs to be written into the address 
    input Clk;
    input MemWrite; 		// Control signal for Memory write 
    input MemRead; 			// Control signal for Memory read 
    
    input [1:0] StoreMode;  // Control signal to determine write mode; 0 for word, 1 byte, 2 halfword

    output reg[31:0] ReadData; // Contents of Memory location at Address
    
    reg [31:0] Memory[1023:0];
    
    //integer Counter;
    
    //loop to initialize the values in the data Memory
    initial begin
        Memory[0] = 32'd100;
        Memory[1] = 32'd200;
        Memory[2] = 32'd300;
        Memory[3] = 32'd400;
        Memory[4] = 32'd500;
        Memory[5] = 32'd600;
        Memory[6] = 32'd700;
        Memory[7] = 32'd800;
        Memory[8] = 32'd900;
        Memory[9] = 32'd1000;
        Memory[10] = 32'd1100;
        Memory[11] = 32'd1200;

    end
    
    always @(MemRead, Address) begin
        ReadData <= 0;
        if (MemRead == 1) begin
            ReadData <= Memory[Address>>2];
        end
    end
    always @(posedge Clk) begin
//        if (MemWrite == 1) begin
//            Memory[Address>>2] <= WriteData;
//        end
        //if (MemWrite == 1) begin
            case(StoreMode)
                //word mode
                2'b00 : begin
                    if (MemWrite == 1) begin
                        Memory[Address>>2] <= WriteData;
                    end
                end
                //byte mode
                2'b01 : begin
                    //indexes desired bytes using last two digits of address
                    case(Address[1:0])
                        2'b11 : begin
                            if (MemWrite == 1) begin
                                Memory[Address>>2][31:24] <= WriteData[31:24];
                            end
                        end
                        2'b10 : begin
                            if (MemWrite == 1) begin
                                Memory[Address>>2][23:16] <= WriteData[23:16];
                            end
                         end
                        2'b01 : begin
                            if (MemWrite == 1) begin
                                Memory[Address>>2][15:8] <= WriteData[15:8];
                            end
                        end
                        2'b00 : begin
                            if (MemWrite == 1) begin
                                Memory[Address>>2][7:0] <= WriteData[7:0];
                            end
                        end
                    endcase
                end
                //halfword mode
                2'b10 : begin
                    //indexes desired halfwords using last digit of address
                    case(Address[0])
                        1'b0 : begin
                            if (MemWrite == 1) begin
                                Memory[Address>>2][31:16] <= WriteData[31:16];
                            end
                        end
                        1'b1 : begin
                            if (MemWrite == 1) begin
                                Memory[Address>>2][15:0] <= WriteData[15:0];
                            end
                        end
                    endcase
                end
				//
				// Note: default case here has to be empty. I don't know why.
				// When this case was not empty, synthesis would fail without errors or warnings,
				// and elaboration would crash Vivado to the desktop.
				//
				// Leave this default case alone.
				//
                default : begin
                end
            endcase
        
    end

endmodule
