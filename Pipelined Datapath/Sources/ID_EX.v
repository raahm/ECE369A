`timescale 1ns/1ps

module ID_EX (  Reset,
                ALUSrcIn,
                ALUOpIn,
                RegDstIn,
                BranchIn,
                MemWriteIn,
                MemReadIn,
                RegWriteIn,
                MemToRegIn,
				PC_Next_in,
				rs_decoded_in,
				rt_decoded_in,
				sign_extend_in,
				rd_instruction_in,
				rt_instruction_in,
				ShamtIn,
				bit21In,
				Instruction50In,
				JalMuxSelIn,
				StoreModeIn,
				//Stall,
				CLK,
                ALUSrcOut,
                ALUOpOut,
                RegDstOut,
                BranchOut,
                MemWriteOut,
                MemReadOut,
                RegWriteOut,
                MemToRegOut,
				PC_Next_out,
				rs_decoded_out,
				rt_decoded_out,
				sign_extend_out,
				rt_instruction_out,
				rd_instruction_out,
				ShamtOut,	
				bit21Out,
				Instruction50Out,
				JalMuxSelOut,
				StoreModeOut);

    
    //
    // EX control portion
    //
    input ALUSrcIn;
    reg ALUSrcReg;
    output reg ALUSrcOut;
    
    input [5:0] ALUOpIn;
    reg [5:0] ALUOpReg;
    output reg [5:0] ALUOpOut;
    
    input [1:0] RegDstIn;
    reg [1:0] RegDstReg;
    output reg [1:0]RegDstOut;
    
    //
    // MEM control portion
    //
    input BranchIn;
    reg BranchReg;
    output reg BranchOut;
    
    input MemWriteIn;
    reg MemWriteReg;
    output reg MemWriteOut;
    
    input MemReadIn;
    reg MemReadReg;
    output reg MemReadOut;
    
    //
    // WB control portion
    //
	input RegWriteIn;
	reg RegWriteReg;
	output reg RegWriteOut;
	
	input [1:0] MemToRegIn;
	reg [1:0] MemToRegReg;
	output reg [1:0] MemToRegOut;
	
	input [31:0] PC_Next_in;
	reg [31:0] PC_Next_reg;
	output reg [31:0] PC_Next_out;
	
	input [31:0] rs_decoded_in;
	reg [31:0] rs_decoded_reg;
	output reg [31:0] rs_decoded_out;
	
	input [31:0] rt_decoded_in;
	reg [31:0] rt_decoded_reg;
	output reg [31:0] rt_decoded_out;
	
	input [31:0] sign_extend_in;
	reg [31:0] sign_extend_reg;
	output reg [31:0] sign_extend_out;
	
	input [4:0] rt_instruction_in;
	reg [4:0] rt_instruction_reg;
	output reg [4:0] rt_instruction_out;
	
	input [4:0] rd_instruction_in;
	reg [4:0] rd_instruction_reg;
	output reg [4:0] rd_instruction_out;
	
	input [4:0] ShamtIn;
	reg [4:0] ShamtReg;
	output reg [4:0] ShamtOut;
	
	input bit21In;
	reg bit21Reg;
	output reg bit21Out;
	
	input [5:0] Instruction50In;
	reg [5:0] Instruction50Reg;
	output reg [5:0] Instruction50Out;
	
	input JalMuxSelIn;
	reg JalMuxSelReg;
	output reg JalMuxSelOut; 
	
	input [1:0] StoreModeIn;
	reg [1:0] StoreModeReg;
	output reg [1:0] StoreModeOut;
	
//	input Stall;
	input CLK, Reset;
	
	always@(posedge CLK) begin
		//read
//		M_out <= M_reg;
//		EX_out <= EX_reg;
        if(Reset == 0) begin
            ALUSrcOut <= ALUSrcReg;
            ALUOpOut <= ALUOpReg;
            RegDstOut <= RegDstReg;
            BranchOut <= BranchReg;
            MemWriteOut <= MemWriteReg;
            MemReadOut <= MemReadReg;
            RegWriteOut <= RegWriteReg;
            MemToRegOut <= MemToRegReg;
            PC_Next_out <= PC_Next_reg;
            rs_decoded_out <= rs_decoded_reg;
            rt_decoded_out <= rt_decoded_reg;
            sign_extend_out <= sign_extend_reg;
            rt_instruction_out <= rt_instruction_reg;
            rd_instruction_out <= rd_instruction_reg;
            ShamtOut <= ShamtReg;
            bit21Out <= bit21Reg;
            Instruction50Out <= Instruction50Reg;
            JalMuxSelOut <= JalMuxSelReg;
            StoreModeOut <= StoreModeReg;
		end
		else begin
            ALUSrcOut <= 0;
            ALUOpOut <= 0;
            RegDstOut <= 0;
            BranchOut <= 0;
            MemWriteOut <= 0;
            MemReadOut <= 0;
            RegWriteOut <= 0;
            MemToRegOut <= 0;
            PC_Next_out <= 0;
            rs_decoded_out <= 0;
            rt_decoded_out <= 0;
            sign_extend_out <= 0;
            rt_instruction_out <= 0;
            rd_instruction_out <= 0;
            ShamtOut <= 0;
            bit21Out <= 0;
            Instruction50Out <= 0;
            JalMuxSelOut <= 0;
            StoreModeOut <= 0;
		end
	end
    
	always@(negedge CLK) begin
		//write
		//if(Stall == 0) begin
//			M_reg <= M_in;
//			EX_reg <= EX_in;
        if(Reset == 0) begin
            ALUSrcReg <= ALUSrcIn;
            ALUOpReg <= ALUOpIn;
            RegDstReg <= RegDstIn;
            BranchReg <= BranchIn;
            MemWriteReg <= MemWriteIn;
            MemReadReg <= MemReadIn;
            RegWriteReg <= RegWriteIn;
            MemToRegReg <= MemToRegIn;
			PC_Next_reg <= PC_Next_in;
			rs_decoded_reg <= rs_decoded_in;
			rt_decoded_reg <= rt_decoded_in;
			sign_extend_reg <= sign_extend_in;
			rt_instruction_reg <= rt_instruction_in;
			rd_instruction_reg <= rd_instruction_in;
			ShamtReg <= ShamtIn;
			bit21Reg <= bit21In;
			Instruction50Reg <= Instruction50In;
			JalMuxSelReg <= JalMuxSelIn;
			StoreModeReg <= StoreModeIn;
		end
		else begin
		    ALUSrcReg <= 0;
            ALUOpReg <= 0;
            RegDstReg <= 0;
            BranchReg <= 0;
            MemWriteReg <= 0;
            MemReadReg <= 0;
            RegWriteReg <= 0;
            MemToRegReg <= 0;
            PC_Next_reg <= 0;
            rs_decoded_reg <= 0;
            rt_decoded_reg <= 0;
            sign_extend_reg <= 0;
            rt_instruction_reg <= 0;
            rd_instruction_reg <= 0;
            ShamtReg <= 0;
            bit21Reg <= 0;
            Instruction50Reg <= 0;
            JalMuxSelReg <= 0;
            StoreModeReg <= 0;  
		end
	end
	
endmodule