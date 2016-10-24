`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: 4-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU behaviorally, so that it supports addition,  subtraction,
// AND, OR, and set on less than (SLT). The 'ALUResult' will output the 
// corresponding result of the operation based on the 32-Bit inputs, 'A', and 
// 'B'. The 'Zero' flag is high when 'ALUResult' is '0'. The 'ALUControl' signal 
// should determine the function of the ALU based on the table below:-
// Op   | 'ALUControl' value
// ==========================
// ADD  | 0010
// SUB  | 0110
// AND  | 0000
// OR   | 0001
// SLT  | 0111
//
// NOTE:-
// SLT (i.e., set on less than): ALUResult is '32'h000000001' if A < B.
// 
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit(ALUControl, A, B, ALUResult1, ALUResult2, Zero);

	input [3:0] ALUControl; // control bits for ALU operation
	input [31:0] A, B;	    // inputs

	output reg [31:0] ALUResult1, ALUResult2;	// answer
	output reg Zero;	    // Zero=1 if ALUResult == 0
	
	reg [63:0] mulResult; 
    
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
    
    //FIXME: if mul is used twice in a row, mulResult updates,
    //but ALUResult1 and ALUResult2 don't
    //works fine when mul used at different times
    always@(A,B) begin
        //mul Result is set first and always happens;
        //then, if the control is set to multiply,
        //the outputs are assigned with the proper parts
        mulResult <= A * B;
    end
    
    always@(ALUControl or A or B) begin
        
        case(ALUControl)
            4'b0000: ALUResult1 <= A + B;
            4'b0001 : ALUResult1 <= A - B;
            4'b0010 : ALUResult1 <= A % B;
            //note for branch instructions: zero flag might be high
            //at incorrect times because of ALUResult1's getting
            //left-most bits; should be okay if branch is set to zero
            4'b0011 : begin
                ALUResult1 <= mulResult[63:32];
                ALUResult2 <= mulResult[31:0];
            end
            4'b0100 : ALUResult1 <= A << B;
            4'b0101 : ALUResult1 <= A >> B;
            4'b0110 : ALUResult1 <= A | B; 
            4'b0111 : ALUResult1 <= A & B;
            4'b1000 : ALUResult1 <= A ^ B;
         endcase
         if (ALUResult1 == 0) begin
            Zero <= 1;
         end
         else begin
            Zero <= 0;
         end
    
    end
    
endmodule

