/* Modulo que gera o codigo digitado pelo usuario
	Criado por: Antony Araujo e Ozenilson Alisson 
	Data: 18 jun 2021*/

module gerador_codificador(tecla, digito, estado, codigo);
	input [3:0] tecla;
	input [1:0] digito, estado;	
	output reg [3:0] codigo;		

	
	always @ (digito) begin	
		if(estado == 0 & tecla != 0) begin
			case (digito) 
				1: begin						
					if(tecla[0] == 1) begin
						codigo[3] <= 0;
						codigo[2] <= 0;
					end
					else if(tecla[1] == 1) begin
						codigo[3] <= 0;
						codigo[2] <= 1;
					end
					else if(tecla[2] == 1) begin
						codigo[3] <= 1;
						codigo[2] <= 0;
					end
					else if(tecla[3] == 1) begin
						codigo[3] <= 1;
						codigo[2] <= 1;
					end
				end
				2: begin					
					if(tecla[0] == 1) begin
						codigo[1] <= 0;
						codigo[0] <= 0;
					end
					else if(tecla[1] == 1) begin
						codigo[1] <= 0;
						codigo[0] <= 1;
					end
					else if(tecla[2] == 1) begin
						codigo[1] <= 1;
						codigo[0] <= 0;
					end
					else if(tecla[3] == 1) begin
						codigo[1] <= 1;
						codigo[0] <= 1;
					end
				end
			endcase
		end
	end

endmodule 
