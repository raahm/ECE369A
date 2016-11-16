`timescale 1ns/1ps

module ID_EX (  ALUSrcIn,
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
				Instruction50Out);

    
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
	
//	input Stall;
	input CLK;
	
	always@(negedge CLK) begin
		//read
//		M_out <= M_reg;
//		EX_out <= EX_reg;
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
	end
	
	always@(posedge CLK) begin
		//write
		//if(Stall == 0) begin
//			M_reg <= M_in;
//			EX_reg <= EX_in;
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
		//end
	end
	
endmodule