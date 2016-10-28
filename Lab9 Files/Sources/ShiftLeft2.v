`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2016 11:57:51 PM
// Design Name: 
// Module Name: ShiftLeft2
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


module ShiftLeft2(inputVal, shiftedVal);

    input [31:0] inputVal;
    output reg [31:0] shiftedVal;
    
    always @(inputVal) begin
        shiftedVal <= inputVal << 2;
    end
    
endmodule
