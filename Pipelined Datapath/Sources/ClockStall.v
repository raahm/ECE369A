`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2016 09:53:55 PM
// Design Name: 
// Module Name: ClockStall
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


module ClockStall(Clk, ClkOut);

    input Clk;
    output reg ClkOut;
    
    reg [5:0] DivCnt;
    reg ClkInt;
    
    initial begin
        DivCnt <= 0;
    end
    
    always@(posedge Clk) begin
        if(DivCnt == 4) begin
            ClkOut <= 1;
            DivCnt <= 0;
        end
        else begin
            DivCnt <= DivCnt + 1;
            ClkOut <= 0;
        end
    end

endmodule
