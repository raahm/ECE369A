`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////
//
// Created by: Jacob Toman-Ibarra, Mubarak Hassan
// Percent effort: 50/50
//
// Top module for display of our datapath on the board.
//
//////////////////////////////////////////////////////////////

module BoardDisplay();
	
	input Clk, Reset;
	output reg [7:0] en_out;
	output [6:0] out7;
	
	wire [31:0] PCResult, WriteData;
	
	// Note: may need separate clock divider. Not quite sure.

	//
	// Main datapath file; deals with all of the CPU operations.
	// Write data in this case is the write data for the 
	// register file.
	//
	
	//module Datapath(Reset, Clk, PCResult, JalMUXOut);
	Datapath DATA(Reset, Clk, PCResult, WriteData);
	
	//
	// Module used to display the values of PCResult and WriteData
	// to the FPGA board. This file was provided by the course 
	// instructors.
	//
	
	//module Two4DigitDisplay(Clk, NumberA, NumberB, out7, en_out);
	Two4DigitDisplay(Clk, PCResult, WriteData, out7, en_out);
	
	
	
endmodule