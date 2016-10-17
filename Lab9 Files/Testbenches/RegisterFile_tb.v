`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - RegisterFile.v
// Description - Test the register_file
// Suggested test case - First write arbitrary values into 
// the saved and temporary registers (i.e., register 8 through 25). Then, 2-by-2, 
// read values from these registers.
////////////////////////////////////////////////////////////////////////////////


module RegisterFile_tb();

	reg [4:0] ReadRegister1;
	reg [4:0] ReadRegister2;
	reg	[4:0] WriteRegister;
	reg [31:0] WriteData;
	reg RegWrite;
	reg Clk;

	wire [31:0] ReadData1;
	wire [31:0] ReadData2;


	RegisterFile u0(
		.ReadRegister1(ReadRegister1), 
		.ReadRegister2(ReadRegister2), 
		.WriteRegister(WriteRegister), 
		.WriteData(WriteData), 
		.RegWrite(RegWrite), 
		.Clk(Clk), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2)
	);

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	    //starting out will all values set to zero
        @(posedge Clk)
        ReadRegister1 <= 5'b00000;
        ReadRegister2 <= 5'b10000;
        WriteRegister <= 5'b00000;
        WriteData <= 10000;
        RegWrite <= 0;
        @(posedge Clk)
        WriteRegister <= 5'b00000;
        RegWrite <= 1;
        @(posedge Clk)
        WriteData <= 15000;
        WriteRegister <= 5'b10001;
        RegWrite <= 0;
        @(posedge Clk)
        ReadRegister1 <= 5'b10001;
        WriteRegister <= 5'b11000;
        RegWrite <= 1;
        @(posedge Clk)
        ReadRegister2 <= 5'b11000;
        RegWrite <= 0;
	
	end

endmodule
