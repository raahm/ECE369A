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

    wire [31:0] ReadData;

    DataMemory u0(
        .Address(Address), 
        .WriteData(WriteData), 
        .Clk(Clk), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead), 
        .ReadData(ReadData)
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
        MemRead <= 1;
        @(posedge Clk);
        Address <= 1001;
        @(posedge Clk);
        @(posedge Clk);
        @(posedge Clk);
        
	
	end

endmodule

