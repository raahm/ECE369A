`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - DataMemory_tb.v
// Description - Test the 'DataMemory.v' module.
////////////////////////////////////////////////////////////////////////////////

module DataMemory_tb(); 

    reg     [31:0]  Address;
    reg     [31:0]  WriteData;
    reg             Clk;
    reg             MemWrite;
    reg             MemRead;
    
    reg [1:0] StoreMode;

    wire [31:0] ReadData;
    
    //module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData, StoreMode);

    DataMemory u0(
        .Address(Address), 
        .WriteData(WriteData), 
        .Clk(Clk), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead), 
        .ReadData(ReadData),
        .StoreMode(StoreMode)
    ); 

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	
        @(posedge Clk);
        MemWrite <= 0;
        MemRead <= 0;
        Address <= 1000;
        WriteData <= 4000;
        StoreMode <= 2'b00;
        @(negedge Clk);
        @(posedge Clk);
        @(posedge Clk);
        MemWrite <= 1;
        @(posedge Clk);
        MemWrite <= 0;
        @(negedge Clk);
        MemWrite <= 1;
        WriteData <= 5000;
        @(posedge Clk);
        MemWrite <= 0;
        @(posedge Clk);
        MemRead <= 1;
        @(posedge Clk);
        Address <= 3;
        @(posedge Clk);
        MemWrite <= 1;
        WriteData <= 128;
        StoreMode <= 2'b01;
        @(posedge Clk);
        MemWrite <= 0;
        @(posedge Clk);
//        Address <= 1;
//        @(posedge Clk);
//        Address <= 1;
//        @(posedge Clk);
//        Address <= 2;
//        @(posedge Clk);
//        Address <= 3;
//        @(posedge Clk);
//        WriteData <= 32'b11111111000000001111111101010101;
//        @(posedge Clk);
        
	
	end

endmodule

