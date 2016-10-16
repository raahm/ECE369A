`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit_tb.v
// Description - Test the 'ALU32Bit.v' module.
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit_tb(); 

	reg [3:0] ALUControl;   // control bits for ALU operation
	reg [31:0] A, B;	        // inputs

	wire [31:0] ALUResult1, ALUResult2;	// answer
	wire Zero;	        // Zero=1 if ALUResult == 0

    ALU32Bit u0(
        .ALUControl(ALUControl), 
        .A(A), 
        .B(B), 
        .ALUResult1(ALUResult1),
        .ALUResult2(ALUResult2), 
        .Zero(Zero)
    );
    
    //ALU control codes
    //  0000 does add
    //  0001  does sub
    //  0010 does mod
    //  0011 does mul
    //  0100 does shift left
    //  0101 does shift right
    //  0110 does OR
    //  0111 does AND
    //  1000 does XOR    

	initial begin
	   
	   #10;
	   ALUControl <= 4'b0000;
	   A <= 2;
	   B <= 2;
	   #10;
	   A <= 3;
	   #10;
	   ALUControl <= 4'b0001;
	   #10;
	   A <= 2;
	   #10;
	   A <= 3;
	   #10;
	   ALUControl <= 4'b0010;
	   #10;
	   A <= 4;
	   #10;
	   ALUControl <= 4'b0011;
	   #10;
	   B <= 16;
	   #10;
	   ALUControl <= 4'b0100;
	   #10;
	   B <= 4;
	   #10;
	   ALUControl <= 4'b0011;
	   A <= 64;
	   #10;
	   ALUControl <= 4'b0101;
	   #10;
	   B <= 1;
	   #10;
	   ALUControl <= 4'b0110;
	   A <= 32'b00000000000000000000000000000000;
	   B <= 32'b11110000111100001111000011110000;
	   #10;
	   A <= 32'b00001111000011110000111100001111;
	   #10;
	   ALUControl <= 4'b0111;
	   #10;
	   A <= 32'b10101010101010101010101010101010;
	   #10;
	   ALUControl <= 4'b1000;
	   	   
	end

endmodule

