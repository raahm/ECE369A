`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2016 07:06:22 AM
// Design Name: 
// Module Name: AND
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


module AND(A,B,ANDOut);

    input A, B;
    output reg ANDOut;
    
    always @(A,B) begin
        ANDOut <= A && B;
    end

endmodule
