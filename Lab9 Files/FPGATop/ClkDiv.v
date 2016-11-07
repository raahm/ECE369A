`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Simple one-second clock divider to be used for demonstration purposes.
// 
//////////////////////////////////////////////////////////////////////////////////


module ClkDiv(Reset, Clk, ClkOut);

    input Reset, Clk;
    output reg ClkOut;
    
    //sets the cycle time for the board; this will create a one second cycle.
    //up for one half second, down for one half second.
    parameter second = 500000000;
    
    reg [25:0] DivCnt;
    reg ClkInt;
    
    //requires a reset signal to initialize values; from then on, will operate
    //freely until reset signal again pressed.
    always @(posedge Clk) begin
        if(Reset == 1) begin
            ClkOut <= 0;
            ClkInt <= 0;
            DivCnt <= 0;
        end
        else begin
            if(DivCnt == second) begin
                ClkOut <= ~ClkInt;
                ClkInt <= ~ClkInt;
                DivCnt <= 0;
            end
            else begin
                ClkOut <= ClkOut;
                ClkInt <= ClkInt;
                DivCnt <= DivCnt + 1;
            end
        end
    end

endmodule
