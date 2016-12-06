`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////
//
// Created by: Jacob Toman-Ibarra, Mubarak Hassan
// Percent effort: 50/50
//
// Top module for display of our datapath on the board.
//
//////////////////////////////////////////////////////////////

module BoardDisplay(Clk, Reset, ResetClk, en_out, out7);
	
	input Clk, Reset, ResetClk;
	output wire [7:0] en_out;
	output wire [6:0] out7;
	
	wire [31:0] PCResult, WriteData;
	wire ClkOut;
	
	//
	// One second clock divider to be used by the datapath;
	// will allow values to be readable on the seven-segment
	// display.
	//
	
	//module ClkDiv(Reset, Clk, ClkOut);
	ClkDiv DATAClk(ResetClk, Clk, ClkOut);

	//
	// Main datapath file; deals with all of the CPU operations.
	// Write data in this case is the write data for the 
	// register file.
	//
	
	//module Datapath(Reset, Clk, PCResult, JalMUXOut);
	Datapath DATA(Reset, ClkOut, PCResult, WriteData);
	
	//
	// Module used to display the values of PCResult and WriteData
	// to the FPGA board. This file was provided by the course 
	// instructors.
	//
	
	//module Two4DigitDisplay(Clk, NumberA, NumberB, out7, en_out);
	Two4DigitDisplay DigitDisplay(Clk, PCResult[7:0], WriteData[7:0], out7, en_out);
	
	
	
endmodule