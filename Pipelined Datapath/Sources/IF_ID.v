`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2016 12:42:37 PM
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(addIn, instructionIn, addOut, instructionOut, Clk);

    input [31:0] addIn, instructionIn;
    input Clk;
    output reg [31:0] addOut, instructionOut;
    
    reg [31:0] addReg, instructionReg;
    
    always@(negedge Clk) begin
        addOut <= addReg;
        instructionOut <= instructionReg;
    end
    
    always@(posedge Clk) begin
        addReg <= addIn;
        instructionReg <= instructionIn;
    end

endmodule
