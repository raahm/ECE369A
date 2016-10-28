`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2016 11:49:38 AM
// Design Name: 
// Module Name: StoreBH
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


module StoreBH(Reduced, InSignal, OpSelect);

    input [31:0] InSignal;
    input OpSelect;
    
    output reg [31:0] Reduced;
    
    always @(InSignal, OpSelect) begin
        //based on OpSelect, will either do store byte or store half-word
        //OpSelect == 0 for store byte, OpSelect == 1 for store half-word
        if(OpSelect == 1'b0) begin
            Reduced <= {24'b000000000000000000000000, InSignal[7:0]};
        end
        else begin
            Reduced <= {16'b0000000000000000, InSignal[15:0]};
        end
    end

endmodule
