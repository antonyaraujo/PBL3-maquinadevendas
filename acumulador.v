/* Modulo de acumulacao de moedas inseridas, responsavel por acumular as moedas inseridas pelo usuario
	Criado por: Antony Araujo e Ozenilson Alisson 
	Data: 18 jun 2021*/

module acumulador(moedas, clk, reset, total);
   input wire clk, reset;
	input [1:0] moedas;    
   output reg [3:0] total;

	//definicao de paramentros de 0 a 8 (0000 a 1000 em binario)
	localparam [3:0] c_0 = 0, c_25 = 1, c_50 = 2, c_75 = 3, c_1 = 4, c_125 = 5, c_150 = 6, c_175 =  7, c_2 = 8;
    
	reg [3:0] state_reg, state_next;  
 
	always @(posedge clk, posedge reset) begin
		if (reset) begin
			state_reg <= c_0;
		end
		else begin
			state_reg <= state_next;
		end
	end 

	//logica de troca de estados e de atribuicao de valores a saida
	always @(moedas[1], moedas[0], state_reg) begin     	 	
		state_next = state_reg;
		case(state_reg)
			c_0: begin
				total = c_0;
				if(moedas == 2'b01)
					state_next = 4'b0001;
				else if (moedas == 2'b10)
					state_next = 4'b0010;
				else if (moedas == 2'b11)	
					state_next = 4'b0100;
				else
					state_next = state_reg;
			end
			c_25: begin
				total = c_25;
				if(moedas == 2'b01)
					state_next = 4'b0010;
				else if (moedas == 2'b10)
					state_next = 4'b0011;
				else if (moedas == 2'b11)	
					state_next = 4'b0101;
				else
					state_next = state_reg;
			end
			c_50: begin
				total = c_50;
				if(moedas == 2'b01)
					state_next = 4'b0011;
				else if (moedas == 2'b10)
					state_next = 4'b0100;
				else if (moedas == 2'b11)	
					state_next = 4'b0110;
				else
					state_next = state_reg;
			end
			c_75: begin
				total = c_75;
				if(moedas == 2'b01)
					state_next = 4'b0100;
				else if (moedas == 2'b10)
					state_next = 4'b0101;
				else if (moedas == 2'b11)	
					state_next = 4'b0111;
				else
					state_next = state_reg;
			end
			c_1: begin
				total = c_1;
				if(moedas == 2'b01)
					state_next = 4'b0101;
				else if (moedas == 2'b10)
					state_next = 4'b0110;
				else if (moedas == 2'b11)	
					state_next = 4'b1000;
				else
					state_next = state_reg;
			end
			c_125: begin
				total = c_125;
				if(moedas == 2'b01)
					state_next = 4'b0110;
				else if (moedas == 2'b10)
					state_next = 4'b0111;
				else if (moedas == 2'b11)	
					state_next = 4'b0000;
				else
					state_next = state_reg;
			end
			c_150: begin
				total = c_150;
				if(moedas == 2'b01)
					state_next = 4'b0111;
				else if (moedas == 2'b10)
					state_next = 4'b1000;
				else if (moedas == 2'b11)	
					state_next = 4'b0000;
				else
					state_next = state_reg;
			end
			c_175: begin
				total = c_175;
				if(moedas == 2'b01)
					state_next = 4'b1000;
				else if (moedas == 2'b10)
					state_next = 4'b0000;
				else if (moedas == 2'b11)	
					state_next = 4'b0000;
				else
					state_next = state_reg;
			end
			c_2: begin
				total = c_2;
				if(moedas == 2'b01)
					state_next = 4'b0000;
				else if (moedas == 2'b10)
					state_next = 4'b0000;
				else if (moedas == 2'b11)	
					state_next = 4'b0000;
				else
					state_next = state_reg;
			end
		 endcase
	end 

endmodule 