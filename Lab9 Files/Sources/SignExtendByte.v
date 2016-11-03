`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2016 08:43:20 AM
// Design Name: 
// Module Name: SignExtendByte
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


module SignExtendByte(in, out);

    input [7:0] in;
    output [31:0] out;
    
    assign out = {{24{in[7]}},in};
    
endmodule
