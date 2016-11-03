`timescale 1ns/1ns

module ALUControl(	ALUOp,
					Funct,
					ALUControlOutput);
	input [5:0] ALUOp;			//comes from Datapath Control module/unit
	input [5:0] Funct;			//comes from the last 5 bits of Intruction field
	output reg [4:0] ALUControlOutput;	//goes to ALU module
	
	always@(*) begin
	   ALUControlOutput <= 0;
		case (ALUOp)
			
			6'b000_000: begin
							case(Funct)
									//add
									6'b100_000: ALUControlOutput <= 5'b00000;
									
									//addu
									6'b100_001: ALUControlOutput <= 5'b00000;
									
									//sub
									6'b100_010: ALUControlOutput <= 5'b00001;
									
									//mult
									6'b011_000: ALUControlOutput <= 5'b00011;
									
									//multu
									6'b011_001: ALUControlOutput <= 5'b10000;
									
									//mfhi
									6'b010_000: ALUControlOutput <= 5'b01010;
									
									//mflo
									6'b010_010: ALUControlOutput <= 5'b01011;
									
									//AND									
									6'b100_100: ALUControlOutput <= 5'b00111;
									
									//OR
									6'b100_101: ALUControlOutput <= 5'b00110;
									
									//NOR
									6'b100_111: ALUControlOutput <= 5'b01111;
									
									//XOR
									6'b100_110: ALUControlOutput <= 5'b01000;
									
									//shift left by sa
									6'b000_000: ALUControlOutput <= 5'b00100;
									
									//shift left by rs
									6'b000_100: ALUControlOutput <= 5'b10101;

									//slt
									6'b101_010: ALUControlOutput <= 5'b01001;
									
									//movn
									6'b001_011: ALUControlOutput <= 5'b11001;
									
									//movz
									6'b001_010: ALUControlOutput <=  5'b11010;
									
									//srlv
									6'b000_110: ALUControlOutput <= 5'b10110;
									
									//srl/rotr
									6'b000_010: ALUControlOutput <= 5'b00101;
									
									//sra
									6'b000_011: ALUControlOutput <= 5'b10111;
									
									//srav
									6'b000_111: ALUControlOutput <= 5'b11000;
									
									//sltu
									6'b101_011: ALUControlOutput <= 5'b10010;									
						     endcase
						end			
			
			//addi
			6'b001_000: ALUControlOutput <= 5'b00000;
			
			//addiu
			6'b001_001:	ALUControlOutput <= 5'b00000;
			
			//slti
			6'b001_010: ALUControlOutput <= 5'b01001;
			
			//sltiu
			6'b001_011: ALUControlOutput <= 5'b10010;
			
			//andi
			6'b001_100: ALUControlOutput <= 5'b00111;
			
			//ORi
			6'b001_101: ALUControlOutput <= 5'b00110;
			
			//xori
			6'b001_110: ALUControlOutput <= 5'b01000;
			
			6'b011_100: case(Funct)
							
							//mul
							6'b000_010: ALUControlOutput <= 5'b01110;
							
							//madd
							6'b000_000: ALUControlOutput <= 5'b10011;
							
							//msub
							6'b000_100: ALUControlOutput <= 5'b10100;
						endcase
			
			//seh/seb
			6'b011_111: ALUControlOutput <= 5'b11011;
		endcase	
	end	
endmodule
