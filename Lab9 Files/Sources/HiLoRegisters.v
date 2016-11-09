`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2016 11:18:39 AM
// Design Name: 
// Module Name: HiLoRegisters
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


module HiLoRegisters(HiLoIn, HiLoOut, Clk, en);

    input Clk, en;
    input [63:0] HiLoIn;
    output reg [63:0] HiLoOut;
    
    reg [63:0] HiLoReg;
    
    //simple register that stores HiLo as one concatenated 64-bit value
    //this will be updated at each clock cycle; the old value will be muxed with
    //a new one to decide if HiLo should be updated. This will take place outside of
    //the module
//    assign HiLoNew = HiLo;
    always @(negedge Clk) begin
        HiLoOut <= HiLoReg;
    end
    always @(posedge Clk) begin
        if(en == 1) begin
            HiLoReg <= HiLoIn;
        end
    end

endmodule
