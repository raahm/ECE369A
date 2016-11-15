`timescale 1ns/1ns

module ALUControl(	ALUOp,
					Funct,
					ALUControlOutput,
					JumpMux);
	input [5:0] ALUOp;			//comes from Datapath Control module/unit
	input [5:0] Funct;			//comes from the last 5 bits of Intruction field
	output reg [4:0] ALUControlOutput;	//goes to ALU module
	output reg [1:0] JumpMux;	//select signal for jump mux
	
	always@(*) begin
	   ALUControlOutput <= 0;
	   JumpMux <= 0;
		case (ALUOp)
			
			6'b000_000: begin
							case(Funct)
									
									//sll
									6'b000_000: begin
													ALUControlOutput <= 5'b00100;
													JumpMux <= 2'b00;
												end
									
									//srl, rotr
									6'b000_010: begin
													ALUControlOutput <= 5'b00101;
													JumpMux <= 2'b00;
												end
									
									//sra
									6'b000_011: begin
													ALUControlOutput <= 5'b10111;
													JumpMux <= 2'b00;
												end
									
									//sllv
									6'b000_100: begin
													ALUControlOutput <= 5'b10101;
													JumpMux <= 2'b00;
												end
									
									//srlv, rotrv
									6'b000_110: begin
													ALUControlOutput <= 5'b10110;
													JumpMux <= 2'b00;
												end
									
									//srav
									6'b000_111: begin
													ALUControlOutput <= 5'b11000;
													JumpMux <= 2'b00;
												end
																		//jr
									6'b001_000: JumpMux <= 2'b10;
									
									//Confirm movz and movn Functionality
									//movz
									6'b001_010: begin
													ALUControlOutput <=  5'b11010;
													JumpMux <= 2'b00;
												end
									
									//movn
									6'b001_011: begin
													ALUControlOutput <= 5'b11001;
													JumpMux <= 2'b00;
												end
									
									//mfhi
									6'b010_000: begin
													ALUControlOutput <= 5'b01010;
													JumpMux <= 2'b00;
												end
												
									//mthi
									6'b010_001: begin
													ALUControlOutput <= 5'b01100;
													JumpMux <= 2'b00;
												end
									
									//mflo
									6'b010_010: begin
													ALUControlOutput <= 5'b01011;
													JumpMux <= 2'b00;
												end
									
									//mtlo
									6'b010_011: begin
													ALUControlOutput <= 5'b01101;
													JumpMux <= 2'b00;
												end
									
									//mult
									6'b011_000: begin
													ALUControlOutput <= 5'b00011;
													JumpMux <= 2'b00;
												end
											
									//multu
									6'b011_001: begin
													ALUControlOutput <= 5'b10001;
													JumpMux <= 2'b00;
												end
											
									//add
									6'b100_000: begin
													ALUControlOutput <= 5'b00000;
													JumpMux <= 2'b00;
												end
									
									//addu
									6'b100_001: begin
													ALUControlOutput <= 5'b00000;
													JumpMux <= 2'b00;
												end
									
									//sub
									6'b100_010: begin
													ALUControlOutput <= 5'b00001;
													JumpMux <= 2'b00;
												end
									
									//AND									
									6'b100_100: begin
													ALUControlOutput <= 5'b00111;
													JumpMux <= 2'b00;
												end
									
									//OR
									6'b100_101: begin
													ALUControlOutput <= 5'b00110;
													JumpMux <= 2'b00;
												end
									
									//XOR
									6'b100_110: begin
													ALUControlOutput <= 5'b01000;
													JumpMux <= 2'b00;
												end
									
									//NOR
									6'b100_111: begin
													ALUControlOutput <= 5'b01111;
													JumpMux <= 2'b00;
												end
									
									//slt
									6'b101_010: begin
													ALUControlOutput <= 5'b01001;
													JumpMux <= 2'b00;
												end
									
									//sltu
									6'b101_011: begin
													ALUControlOutput <= 5'b10010;									
													JumpMux <= 2'b00;
												end
									default : begin
									end
						    endcase
						end			
			
			//bgez, bltz
			6'b000_001: begin
							ALUControlOutput <= 5'b11100;
							JumpMux <= 2'b00;
						end
			
			//j
			6'b000_010: JumpMux <= 2'b01;
			
			//jal
			6'b000_011: JumpMux <= 2'b01;
			
			//beq
			6'b000_100: begin
							ALUControlOutput <= 5'b00001;
							JumpMux <= 2'b00;
						end
						
			//bne
			6'b000_101: begin
							ALUControlOutput <= 5'b11111;
							JumpMux <= 2'b00;
						end
			
			//blez
			6'b000_110: begin
							ALUControlOutput <= 5'b11101;
							JumpMux <= 2'b00;
						end
			
			//bgtz
			6'b000_111: begin
							ALUControlOutput <= 5'b11110;
							JumpMux <= 2'b00;
						end
			
			//addi
			6'b001_000: begin
							ALUControlOutput <= 5'b00000;
							JumpMux <= 2'b00;
						end
			
			//addiu
			6'b001_001:	begin
							ALUControlOutput <= 5'b00000;
							JumpMux <= 2'b00;
						end
			
			//slti
			6'b001_010: begin
							ALUControlOutput <= 5'b01001;
							JumpMux <= 2'b00;
						end
			
			//sltiu
			6'b001_011: begin
							ALUControlOutput <= 5'b10010;
							JumpMux <= 2'b00;
						end
			
			//andi
			6'b001_100: begin
							ALUControlOutput <= 5'b00111;
							JumpMux <= 2'b00;
						end
						
			//ORi
			6'b001_101: begin
							ALUControlOutput <= 5'b00110;
							JumpMux <= 2'b00;
						end
			
			//xori
			6'b001_110: begin
							ALUControlOutput <= 5'b01000;
							JumpMux <= 2'b00;
						end
			
			//lui
			
			//madd, mul, msub
			6'b011_100: begin
							case(Funct)
								
								//madd
								6'b000_000: begin
												ALUControlOutput <= 5'b10011;
												JumpMux <= 2'b00;
											end
								
								//mul
								6'b000_010: begin
												ALUControlOutput <= 5'b01110;
												JumpMux <= 2'b00;
											end
								
								//msub
								6'b000_100: begin
												ALUControlOutput <= 5'b10100;
												JumpMux <= 2'b00;
											end
								default : begin
								end			
							endcase
						end

			//seh, seb
			6'b011_111: begin
							ALUControlOutput <= 5'b11011;
							JumpMux <= 00;
						end
			
			//lb
			
			//lh
			
			//lw
			6'b100_011: begin
							ALUControlOutput <= 5'b00000;
							JumpMux <= 00;
						end
			
			//sb
			
			//sh
			
			//sw
			6'b101_011: begin
							ALUControlOutput <= 5'b00000;
							JumpMux <= 00;
						end

			
            default : begin
            end
		endcase	
	end	
endmodule
