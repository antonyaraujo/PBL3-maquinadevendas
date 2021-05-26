module controlador_principal(tempo);
	input
	output 
	
	reg [2:0] estados;
	initial estados = 3'b010;
	
	always @ (tempo) begin
		case (estados) 
			3'b010: begin
				//  Recebe entradas (B);
				// Operaçoes
				finalizado = 1;
				if(tempo == 0 and finalizado) 
					estados = estados + 1;
			end
			3'b011: begin
				//  Verifica entradas (C)
				// Operaçoes	
				// Caso ocorra algum erro nas entradas esp = 1;
				finalizado = 1;				
				if(tempo == 0 and finalizado) 
					estados = estados + 1;
			end
			3'b100: begin
				//  Processa Produto Solicitado (D);
				// Operaçoes
				finalizado = 1;
				if(tempo == 0 and finalizado) 
					estados = estados + 1;
			end
			3'b101: begin
				//  Finaliza a compra (E);
				// Operaçoes
				finalizado = 1;
				if(tempo == 0 and finalizado) begin
					estados = 3'b010;
					esp = 1;
				end
			end
		endcase
	end
	
endmodule 