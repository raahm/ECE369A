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
        @(posedge Clk_tb);
            bit21_tb <= 0;
            bit16_tb <= 0;
            A_tb <= 3;
            B_tb <= 1;
            Shamt_tb <= 0;
            ALUControl_tb <=  5'b00001;
        @(posedge Clk_tb);
            A_tb <= 15;
            B_tb <= 4;
        @(posedge Clk_tb);
            B_tb <= 10;
        @(posedge Clk_tb);
            B_tb <= -10;
            
        
    end

endmodule