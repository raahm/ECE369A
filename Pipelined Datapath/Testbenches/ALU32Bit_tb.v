`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit_tb.v
// Description - Test the 'ALU32Bit.v' module.
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit_tb();
    
    reg [4:0] ALUControl_tb;
    reg [4:0] Shamt_tb;
    reg [31:0] A_tb, B_tb;
    reg bit21_tb, bit16_tb;
    reg Clk_tb;
    
    wire [31:0] ALUResult1_tb;
    wire Zero_tb, BranchSend_tb;
    
    //module ALU32Bit(ALUControl, A, B, ALUResult1, Zero, BranchSend, Shamt, bit21, bit16, Clk);
    ALU32Bit u0(ALUControl_tb, A_tb, B_tb, ALUResult1_tb, Zero_tb, BranchSend_tb, Shamt_tb, bit21_tb, bit16_tb, Clk_tb);
    
	initial begin
        Clk_tb <= 1'b0;
        forever #10 Clk_tb <= ~Clk_tb;
    end
    
    initial begin
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b00011;
//        bit21_tb <= 0;
//        Shamt_tb <= 0;
//        A_tb <= 2;
//        B_tb <= 26;
//        @(posedge Clk_tb);
//        @(posedge Clk_tb);
//        A_tb <= -12;
//        B_tb <= 2;
//        bit21_tb <= 0;
//        Shamt_tb <= 0;        
//        @(posedge Clk_tb);
//        @(posedge Clk_tb);
//        @(posedge Clk_tb);
//        @(posedge Clk_tb);
        
//        ALUControl_tb <= 5'b00011;
//        A_tb <= -12;
//        B_tb <= 2;
//        bit21_tb <= 0;
//        Shamt_tb <= 0;
//        @(posedge Clk_tb);
//        B_tb<= -2;
//        @(posedge Clk_tb);
//        A_tb <= 0;
//        @(posedge Clk_tb);
//        @(posedge Clk_tb);
//        B_tb <= 26;
//        A_tb <= 2;
//        @(posedge Clk_tb);
//        A_tb <= -12;
//        B_tb <= 2;        
//        @(posedge Clk_tb);
//        @(posedge Clk_tb);
//        @(posedge Clk_tb);
//        @(posedge Clk_tb);
        @(posedge Clk_tb);
        
        @(posedge Clk_tb);
        ALUControl_tb <= 5'b00000;
        bit21_tb <= 0;
        bit16_tb <= 0;
        Shamt_tb<= 0;
//        A_tb <= 32'b00001111000011110000111100001111;
//        B_tb <= 32'b11110000111100001111000011110000;
        A_tb <= 1;
        B_tb <= 2;
        @(posedge Clk_tb);
        ALUControl_tb <= 5'b00011;
        @(posedge Clk_tb);
//        @(posedge Clk_tb);
////        A_tb <= 32'b01010000010100000101000001010000;
////        B_tb <= 32'b10100000101000001010000010100000;
//        B_tb <= -1;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b00001;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b00010;
//        A_tb <= 7;
//        B_tb <= 3;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b00110;
//        A_tb <= 32'b01010101010101010101010101010101;
//        B_tb <= 32'b10101010101010101010101010101010;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b00111;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b01000;
//        B_tb <= 32'b10100101101001011010010110100101;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b01111;
//        A_tb <= 32'b00001111000011110000111100001111;
//        B_tb <= 32'b11110000111100001111000011110000;
//        @(posedge Clk_tb);
//        A_tb <= 32'b01010000010100000101000001010000;
//        B_tb <= 32'b10100000101000001010000010100000;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b00100;
//        B_tb <= 2;
//        Shamt_tb <= 5'b00001;
//        @(posedge Clk_tb);
//        Shamt_tb <= 5'b00000;
//        @(posedge Clk_tb);
//        Shamt_tb <= 5'b00010;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b10101;
//        A_tb <= 0;
//        @(posedge Clk_tb);
//        A_tb <= 1;
//        @(posedge Clk_tb);
//        B_tb <= 4;
//        A_tb <= 1;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b00101;
//        B_tb <= 32'b11110000000000001111000000000011;
//        bit21_tb <= 0;
//        @(posedge Clk_tb);
//        bit21_tb <= 1;
//        @(posedge Clk_tb);
//        Shamt_tb <= 5'b00101;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b10110;
//        A_tb <= 2;
//        Shamt_tb <= 5'b00000;
//        @(posedge Clk_tb);
//        Shamt_tb <= 5'b00001;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b11011;
//        Shamt_tb <= 5'b10000;
//        B_tb <= 32'b00000000000000001000000001111111;
//        @(posedge Clk_tb);
//        Shamt_tb <= 5'b00000;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b01110;
//        A_tb <= -2;
//        B_tb <= 1;
//        @(posedge Clk_tb);
//        A_tb <= -12;
//        B_tb <= -10;
//        @(posedge Clk_tb);
//        A_tb <= 1;
//        B_tb <= -12;
//        @(posedge Clk_tb);
//        A_tb <= -1;
//        B_tb <= 12;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b10001;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b11001;
//        @(posedge Clk_tb);
//        B_tb <= 0;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b11010;
//        @(posedge Clk_tb);
//        B_tb <= -2;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b01001;
//        @(posedge Clk_tb);
//        B_tb <= 0;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b10010;
//        @(posedge Clk_tb);
//        A_tb <= 2;
//        B_tb <= 3;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b10111;
//        Shamt_tb <= 2;
//        B_tb <= -8;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b11000;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b00011;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b01010;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b01011;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b01100;
//        A_tb <= 32'b00001111000011110000111100001111;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b01101;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b10000;
//        A_tb <= 32;
//        B_tb <= 100;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b10011;
//        A_tb <= -10;
//        B_tb <= -10;
//        @(posedge Clk_tb);
//        ALUControl_tb <= 5'b10100;
        
    end

endmodule