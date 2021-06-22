/* Modulo de controle das teclas digitadas
	Criado por: Antony Araujo e Ozenilson Alisson 
	Data: 18 jun 2021*/

module controlador_teclado(tecla, tempo, estado, clk, digito);
	input [3:0] tecla;
	input [1:0] estado;
	input clk, tempo;	
   output reg [1:0] digito;

	localparam [1:0] espera = 0, digito1 = 1, digito2 = 2;
	
   reg [1:0] state_reg, state_next;		 	
	
	always @(posedge clk, posedge tempo) begin	
		if (tempo) begin
			state_reg <= espera;
		end
		else begin
			state_reg <= state_next;
		end		 
	end 	

	always @(tecla[3], tecla[2], tecla[1], tecla[0], state_reg) begin
		if(estado == 0) begin
			case (state_reg)
				// Estado de espera
				0: begin	
					digito = 1;				
					if(((tecla == 4'b1000) | (tecla == 4'b0100) | (tecla == 4'b0010) | (tecla == 4'b0001)) & (estado == 0)) begin
						state_next = 1;
					end
					else
						state_next = 0;					
				end
				
				// Estado onde uma tecla foi pressionada
				1: begin				
					digito = 2;
					if(((tecla == 4'b1000) | (tecla == 4'b0100) | (tecla == 4'b0010) | (tecla == 4'b0001)) & (estado == 0)) begin
						state_next = 2;
					end
					else
						state_next = 1;
				end
				
				// Estado onde duas teclas foram pressionadas
				2: begin		
					digito = 0;
					if(estado == 3) begin												
						state_next = 0;
					end
				end
			endcase			
		end
	end
		
endmodule 