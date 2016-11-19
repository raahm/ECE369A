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


module IF_ID(Reset, Stall, addIn, instructionIn, addOut, instructionOut, Clk);

    input [31:0] addIn, instructionIn;
    input Clk, Stall, Reset;
    output reg [31:0] addOut, instructionOut;
    
    reg [31:0] addReg, instructionReg;
    
    always@(posedge Clk) begin
        if(Reset == 0) begin
            addOut <= addReg;
            instructionOut <= instructionReg;
        end
        else begin
            addOut <= 0;
            instructionOut <= 0;
        end
    end
    
    always@(negedge Clk) begin
        if(Reset == 1) begin
            addReg <= 0;
            instructionReg <= 0;
        end
        else begin
            if(Stall == 0) begin
                addReg <= addIn;
                instructionReg <= instructionIn;
            end
        end
    end

endmodule
