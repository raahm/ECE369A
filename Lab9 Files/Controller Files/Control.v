`timescale 1ns/1ns

module Control(	CtrlInput,
				RegDst,
				ALUSrc,
				MemtoReg,
				RegWrite,
				MemRead,
				MemWrite,
				Branch, 
				Jump,
				ALUOp);
				
	input [5:0] CtrlInput;
	output reg [1:0] MemtoReg, Jump;
	output reg RegDst, Branch, MemRead, MemWrite, ALUSrc, RegWrite;
	output reg [5:0] ALUOp;
	
	always@(*) begin
	   RegDst <= 0;
	   ALUSrc <= 0;
	   MemtoReg <= 0;
	   RegWrite <= 0;
	   MemRead <= 0;
	   MemWrite <= 0;
	   Branch <= 0;
	   Jump <= 0;
	   ALUOp <= 0;
		case (CtrlInput)
//			6'b000000: begin
//							RegDst <= 1'b1;
//							ALUSrc <= 1'b0;
//							MemtoReg <= 2'b00;
//							RegWrite <= 1'b1;
//							MemRead <= 1'b0;
//							MemWrite <= 1'b0;
//							Branch <= 1'b0;
//							Jump <= 2'b00;
//							ALUOp <= 6'b000_000;
//						end
			
			
			6'b000001: begin
							RegWrite <= 1'b0;
							MemRead <= 1'b0;
							MemWrite <= 1'b0;
							Branch <= 1'b1;
							Jump <= 2'b00;
							ALUOp <= 6'b000_001;
						end
						
			
			6'b000010: begin
							RegWrite <= 1'b0;
							MemRead <= 1'b0;
							MemWrite <= 1'b0;
							Branch <= 1'b1;
							Jump <= 2'b01;
							ALUOp <= 6'b000_010;
						end
			
			6'b000011: begin
							RegDst <= 1'b1;
							MemtoReg <= 2'b10;
							RegWrite <= 1'b1;
							MemRead <= 1'b0;
							MemWrite <= 1'b0;
							Jump <= 2'b01;
							ALUOp <= 6'b000_011;
						end
			
			6'b000100: begin
							ALUSrc <= 1'b0;
							RegWrite <= 1'b0;
							MemRead <= 1'b0;
							MemWrite <= 1'b0;
							Branch <= 1'b1;
							Jump <= 2'b00;
							ALUOp <= 6'b000_100;
						end	

			6'b000101: begin
							ALUSrc <= 1'b0;
							RegWrite <= 1'b0;
							MemRead <= 1'b0;
							MemWrite <= 1'b0;
							Branch <= 1'b1;
							Jump <= 2'b00;
							ALUOp <= 6'b000_101;
						end						

			6'b000110: begin
							RegWrite <= 1'b0;
							MemRead <= 1'b0;
							MemWrite <= 1'b0;
							Branch <= 1'b1;
							Jump <= 2'b00;
							ALUOp <= 6'b000_110;
						end

			6'b000111: begin
							RegWrite <= 1'b0;
							MemRead <= 1'b0;
							MemWrite <= 1'b0;
							Branch <= 1'b1;
							Jump <= 2'b00;
							ALUOp <= 6'b000_111;
						end
						
			6'b001000: begin
							RegDst <= 1'b0;
							ALUSrc <= 1'b1;
							MemtoReg <= 2'b00;
							RegWrite <= 1'b1;
							MemRead <= 1'b0;
							MemWrite <= 1'b0;
							Branch <= 1'b0;
							Jump <= 2'b00;
							ALUOp <= 6'b001_000;
						end

			6'b001001: begin
							RegDst <= 1'b0;
							ALUSrc <= 1'b1;
							MemtoReg <= 2'b00;
							RegWrite <= 1'b1;
							MemRead <= 1'b0;
							MemWrite <= 1'b0;
							Branch <= 1'b0;
							Jump <= 2'b00;
							ALUOp <= 6'b001_001;
						end						

			6'b001010: begin
							RegDst <= 1'b0;
							ALUSrc <= 1'b1;
							MemtoReg <= 2'b00;
							RegWrite <= 1'b1;
							MemRead <= 1'b0;
							MemWrite <= 1'b0;
							Branch <= 1'b0;
							Jump <= 2'b00;
							ALUOp <= 6'b001_010;
						end				

			6'b001011: begin
							RegDst <= 1'b0;
							ALUSrc <= 1'b1;
							MemtoReg <= 2'b00;
							RegWrite <= 1'b1;
							MemRead <= 1'b0;
							MemWrite <= 1'b0;
							Branch <= 1'b0;
							Jump <= 2'b00;
							ALUOp <= 6'b001_011;
						end			

			6'b001100: begin
							RegDst <= 1'b0;
							ALUSrc <= 1'b1;
							MemtoReg <= 2'b00;
							RegWrite <= 1'b1;
							MemRead <= 1'b0;
							MemWrite <= 1'b0;
							Branch <= 1'b0;
							Jump <= 2'b00;
							ALUOp <= 6'b001_100;
						end				

			6'b001101: begin
							RegDst <= 1'b0;
							ALUSrc <= 1'b1;
							MemtoReg <= 2'b00;
							RegWrite <= 1'b1;
							MemRead <= 1'b0;
							MemWrite <= 1'b0;
							Branch <= 1'b0;
							Jump <= 2'b00;
							ALUOp <= 6'b001_101;
						end			

			6'b001110: begin
							RegDst <= 1'b0;
							ALUSrc <= 1'b1;
							MemtoReg <= 2'b00;
							RegWrite <= 1'b1;
							MemRead <= 1'b0;
							MemWrite <= 1'b0;
							Branch <= 1'b0;
							Jump <= 2'b00;
							ALUOp <= 6'b001_110;
						end	

			6'b001111: begin
							RegDst <= 1'b0;
							ALUSrc <= 1'b1;
							MemtoReg <= 2'b00;
							RegWrite <= 1'b1;
							MemRead <= 1'b0;
							MemWrite <= 1'b0;
							Branch <= 1'b0;
							Jump <= 2'b00;
							ALUOp <= 6'b001_111;
						end		

			6'b011100: begin
							RegDst <= 1'b0;
							ALUSrc <= 1'b0;
							MemtoReg <= 2'b00;
							RegWrite <= 1'b0;
							MemRead <= 1'b0;
							MemWrite <= 1'b0;
							Branch <= 1'b0;
							Jump <= 2'b00;
							ALUOp <= 6'b011_100;
						end	

			6'b000000: begin
							RegDst <= 1'b1;
							ALUSrc <= 1'b0;
							MemtoReg <= 2'b00;
							RegWrite <= 1'b1;
							MemRead <= 1'b0;
							MemWrite <= 1'b0;
							Branch <= 1'b0;
							Jump <= 2'b00;
							ALUOp <= 6'b000_000;
						end

			6'b011111: begin
							RegDst <= 1'b1;
							ALUSrc <= 1'b0;
							MemtoReg <= 2'b00;
							RegWrite <= 1'b1;
							MemRead <= 1'b0;
							MemWrite <= 1'b0;
							Branch <= 1'b0;
							Jump <= 2'b00;
							ALUOp <= 6'b011_111;
						end		

			6'b100000: begin
							RegDst <= 1'b0;
							ALUSrc <= 1'b1;
							MemtoReg <= 2'b01;
							RegWrite <= 1'b1;
							MemRead <= 1'b1;
							MemWrite <= 1'b0;
							Branch <= 1'b0;
							Jump <= 2'b00;
							ALUOp <= 6'b100_000;
						end	

			6'b100001: begin
							RegDst <= 1'b0;
							ALUSrc <= 1'b1;
							MemtoReg <= 2'b01;
							RegWrite <= 1'b1;
							MemRead <= 1'b1;
							MemWrite <= 1'b0;
							Branch <= 1'b0;
							Jump <= 2'b00;
							ALUOp <= 6'b100_001;
						end	

			6'b100011: begin
							RegDst <= 1'b0;
							ALUSrc <= 1'b1;
							MemtoReg <= 2'b01;
							RegWrite <= 1'b1;
							MemRead <= 1'b1;
							MemWrite <= 1'b0;
							Branch <= 1'b0;
							Jump <= 2'b00;
							ALUOp <= 6'b100_011;
						end	

			6'b101000: begin
							ALUSrc <= 1'b1;
							RegWrite <= 1'b0;
							MemRead <= 1'b0;
							MemWrite <= 1'b1;
							Branch <= 1'b0;
							Jump <= 2'b00;
							ALUOp <= 6'b101_000;
						end

			6'b101001: begin
							ALUSrc <= 1'b1;
							RegWrite <= 1'b0;
							MemRead <= 1'b0;
							MemWrite <= 1'b1;
							Branch <= 1'b0;
							Jump <= 2'b00;
							ALUOp <= 6'b101_001;
						end
						
			6'b101011: begin
							ALUSrc <= 1'b1;
							RegWrite <= 1'b0;
							MemRead <= 1'b0;
							MemWrite <= 1'b1;
							Branch <= 1'b0;
							Jump <= 2'b00;
							ALUOp <= 6'b101_011;
						end						
		endcase
	
	end
			
endmodule