/* Modulo do controlador principal, maquina de estados responsavel controlar em qual estado a maquina de vendas esta
	Criado por: Antony Araujo e Ozenilson Alisson 
	Data: 18 jun 2021*/

module controlador_principal(
	input wire clk,
	input produto_existe, valor_correto, tempo,
	input [1:0] habilitador,
	output reg [1:0] estado); 

	localparam [1:0] q0 = 0, q1 = 1, q2 = 2, q3 = 3;
    
   reg[1:0] estado_reg, estado_prox;
	
	always @ (posedge clk) begin
		estado_reg <= estado_prox;
	end 

	//logica de troca de estados do circuito
	always @ (habilitador, produto_existe, valor_correto, tempo, estado_reg) begin 
		estado_prox = estado_reg;
		case (estado_reg)
			q0 : begin
				if (habilitador == 2) estado_prox = q1;
			end			
			q1 : begin
				if (produto_existe == 1) estado_prox = q2;
				
				else estado_prox = q0; 
			end
			
			q2 : begin
				if (valor_correto == 1) estado_prox = q3; 
				
				else estado_prox = q0;	
			end
			
			q3 : begin
				if (tempo == 1) estado_prox = q0;
			end
		endcase
	end 
	
	//a saida do circuito e o estado atual
	always @(estado_reg, habilitador, produto_existe, valor_correto) begin
		case (estado_reg)  
			q0 : begin
           estado = q0;
			end
			q1 : begin
           estado = q1;
			end
			q2 : begin
				estado = q2;
			end
			q3 : begin
				estado = q3;
			end
		endcase
	end 
	
endmodule