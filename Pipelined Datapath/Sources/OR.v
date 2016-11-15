`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2016 01:39:47 PM
// Design Name: 
// Module Name: OR
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


module OR(A, B, OROut);
    
    input A, B;
    output OROut;
    
    assign OROut = (A == 1 || B == 1) ? 1 : 0;
    
endmodule
