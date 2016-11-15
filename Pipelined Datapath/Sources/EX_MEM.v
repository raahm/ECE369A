`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2016 12:43:26 PM
// Design Name: 
// Module Name: EX_MEM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module EX_MEM(addResultIn, ZeroIn, BranchSendIn, ALUResultIn, ReadData2In, AddResultOut, ZeroOut,BranchSendOut, ALUResultOut, ReadData2Out, Clk);

    input [31:0] addResultIn, ALUResultIn, ReadData2In;
    input Clk, ZeroIn, BranchSendIn;
    
    output reg [31:0] AddResultOut, ALUResultOut, ReadData2Out;
    output reg ZeroOut, BranchSendOut;
    
    reg [31:0] addResultReg, ALUResultReg, ReadData2Reg;
    reg ZeroReg, BranchSendReg;
    
    always @(negedge Clk) begin
        AddResultOut <= addResultReg;
        ALUResultOut <= ALUResultReg;
        ReadData2Out <= ReadData2Reg;
        ZeroOut <= ZeroReg;
        BranchSendOut <= BranchSendReg;
    end
    
    always @(posedge Clk) begin
        addResultReg <= addResultIn;
        ALUResultReg <= ALUResultIn;
        ReadData2Reg <= ReadData2In;
        ZeroReg <= ZeroIn;
        BranchSendReg <= BranchSendIn;
    end

endmodule
