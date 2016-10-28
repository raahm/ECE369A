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

module ALU32Bit(ALUControl, A, B, ALUResult1, Zero, Shamt, bit21, Clk);

	input [4:0] ALUControl; // control bits for ALU operation
	input [31:0] A, B;	    // inputs
	input [4:0] Shamt;
	input bit21, Clk;
    
    //NOTE: ALUResult2 might not need to exist because of HI LO format;
    //currently unused
	output reg [31:0] ALUResult1;	// answer
	output reg Zero;	    // Zero=1 if ALUResult == 0
	
	reg [63:0] mulResult, mulResultSigned;
	reg [63:0] HiLoSend;
	
//	reg [31:0] HI=0, LO=0;
	reg [63:0] temp;
	reg en;
	
	reg [31:0] tempA, tempB;
	
	wire [63:0] muxOut, HiLoOut;
	
	//utilizes internal registers to handle Hi and Lo;
	//HiLoSend is a single 64-bit input which encompasses all the necessary
	//bits for HI and LO. The updated HILO values are continually muxed with output
	//from the ALU, using an enable signal as the selector. This avoids inferred latch
	//errors.
	
	//module HiLoRegisters(Clk, HiLo, HiLoNew);
	HiLoRegisters HILO(muxOut, HiLoOut);
	
	//module Mux64Bit2To1(out, inA, inB, sel);
	Mux64Bit2To1 MUXHILO(muxOut, HiLoOut, HiLoSend, en);
    
    //ALU control codes
    //  00000 does add
    //  00001 does sub
    //  00010 does mod
    //  00011 does mult (signed)
    //  00100 does shift left logical
    //  00101 does shift right logical, rotr
    //  00110 does OR
    //  00111 does AND
    //  01000 does XOR
    //  01001 does SLT
    //  01010 does mfhi
    //  01011 does mflo
    //  01100 does mthi
    //  01101 does mtlo
    //  01110 does mul (signed)
    //  01111 does NOR
    //  10000 does multu
    //  10001 does mulu
    //  10010 does sltu
    //  10011 does madd (signed)
    //  10100 does msub (signed)
    //  10101 does sllv
    //  10110 does srlv, rotrv
    //  10111 does sra
    //  11000 does srav
    //  11001 does movn
    //  11010 does movz
    //  11011 does seb, seh

    
    //FIXME: if mul is used twice in a row, mulResult updates,
    //but ALUResult1 and ALUResult2 don't
    //works fine when mul used at different times
    always@(A,B) begin
        //mul Result is set first and always happens;
        //then, if the control is set to multiply,
        //the outputs are assigned with the proper parts
        tempA = A;
        tempB = B;
        mulResult = A * B;
        //mulResultSigned <= $signed(A) * $signed(B);
        if(A[31] == 1)begin
            tempA = ~tempA;
        end
        if(B[31] == 1)begin
            tempB = ~tempB;
        end
        mulResultSigned = tempA * tempB;
//        if (~(A == 0 || B == 0) && (A[31] != B[31])) begin
//            mulResultSigned = (~mulResultSigned);
//        end
    end
    
    always@(ALUControl, A, B, Shamt, mulResult, mulResultSigned, bit21) begin
    //always @(posedge Clk) begin
        ALUResult1 <= 0;
        temp <= 0;
//        HI <= prevHiLo[63:32];
//        LO <= prevHiLo[31:0];
        HiLoSend <= 0;
        en <= 0;
        case(ALUControl)
            5'b00000 : ALUResult1 <= A + B;
            5'b00001 : ALUResult1 <= A - B;
            5'b00010 : ALUResult1 <= A % B;
            //note for branch instructions: zero flag might be high
            //at incorrect times because of ALUResult1's getting
            //left-most bits; should be okay if branch is set to zero
            //
            //NOTE: may no longer apply due to HI and LO format
            5'b00011 : begin
                HiLoSend <= mulResultSigned;
                en <= 1;
            end
            5'b00100 : ALUResult1 <= B << Shamt;
            
            //this instruction will handle srl and rotr, which have the same ALUOp code;
            //it works by checking bit 21 of the instruction code, which is 0 for srl and 1 for rotr
            5'b00101 : begin
                if(bit21 == 1'b0) begin
                    ALUResult1 <= B >> Shamt;
                end
                else begin
                    temp = {B, B};
                    temp = temp >> Shamt;
                    ALUResult1 <= temp[31:0];
                end
            end
			//Note: look at assignment type; currently left without '<' in order to test ALU's Zero flag
            5'b00110 : ALUResult1 = A | B; 
            5'b00111 : ALUResult1 <= A & B;
            5'b01000 : ALUResult1 <= A ^ B;
            5'b01001 : begin
                if ( $signed(A) < $signed(B) ) begin
                    ALUResult1 <= 1;
                end
                else begin
                    ALUResult1 <= 0;
                end
            end
            5'b01010 : ALUResult1 <= HiLoOut[63:32];
            5'b01011 : ALUResult1 <= HiLoOut[31:0];
            5'b01100 : begin
                HiLoSend[63:32] <= A;
                HiLoSend[31:0] <= HiLoOut[31:0];
                en <= 1;
            end
            5'b01101 : begin
                HiLoSend[31:0] <= A;
                HiLoSend[63:32] <= HiLoOut[63:32];
                en <= 1;
            end
            5'b01110 : ALUResult1 <= mulResultSigned[31:0];
            5'b01111 : ALUResult1 <= ~(A | B);
            5'b10000 : begin
                HiLoSend <= mulResult;
                en <= 1;
            end
            5'b10001 : ALUResult1 <= mulResult[31:0];
            5'b10010 : begin
                if ( A < B ) begin
                    ALUResult1 <= 1;
                end
                else begin
                    ALUResult1 <= 0;
                end
            end
            5'b10011 : begin
                temp = mulResultSigned + HiLoOut;
                HiLoSend <= temp;
                en <= 1;
            end
            5'b10100 : begin
                temp = HiLoOut - mulResultSigned;
                HiLoSend <= temp;
                en <= 1; 
            end
            5'b10101 : ALUResult1 <= B << A;
            
            //this instruction will handle srlv and rotrv, which have the same ALUControl codes;
            //it works by checking bit 0 of Shamt, which is low for srlv and high for rotrv
            5'b10110 : begin
                if(Shamt[0] == 1'b0) begin
                    ALUResult1 <= B >> A;
                end
                else begin
                    temp = {B, B};
                    temp = temp >> A;
                    ALUResult1 <= temp[31:0];
                end
            end
            5'b10111 : ALUResult1 <= $signed(B)>>>Shamt;
            5'b11000 : ALUResult1 <= $signed(B)>>>A;
            5'b11001 : begin
                if(B != 0) begin
                    ALUResult1 <= A;
                end
            end
            5'b11010 : begin
                if(B == 0) begin
                    ALUResult1 <= A;
                end
            end
            
            //handles seb and seh depending on Shamt value; seb for 10000 and seh for 11000
            5'b11011 : begin
                if (Shamt == 5'b10000) begin
                    ALUResult1 <= {{24{B[7]}}, B[7:0]};
                end
                else begin
                    ALUResult1 <= {{16{B[15]}}, B[15:0]};
                end
            end
            default: begin
                ALUResult1 <= 0;
            end
         endcase
         
		 //FIXME: Zero flag is setting with a delay, which is breaking jump instructions.
		 //may have something to do with '<=' v. '='
         if (ALUResult1 == 0) begin
            Zero = 1;
         end
         else begin
            Zero = 0;
         end
    
    end
    
endmodule

