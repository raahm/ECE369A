`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2016 10:59:59 AM
// Design Name: 
// Module Name: Forwarding
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


module Forwarding(EX_rs, EX_rt, MEM_rd, WB_rd, MEM_rt, mux1sel, mux2sel);

    input [4:0] EX_rs, EX_rt, MEM_rd, WB_rd, MEM_rt;
    output mux1sel, mux2sel;
    
    assign mux1sel = (EX_rs == MEM_rd || EX_rs == WB_rd || MEM_rt == EX_rs) ? 1:0;
    assign mux2sel = (EX_rt == MEM_rd || EX_rt == WB_rd || MEM_rt == EX_rt) ? 1:0;

endmodule
