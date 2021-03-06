/* Modulo de verificacao do valor inserido, responsavel por verificar se o valor inserido foi 
	ou nao igual ao do produto desejado
	Criado por: Antony Araujo e Ozenilson Alisson 
	Data: 18 jun 2021*/

module vericador_valor(total, valor,  valor_correto);
	input[3:0]total, valor; // valor total acumulado e valor do produto
	output reg valor_correto;
	
	always @ (valor) begin //se o valor for igual valor_correto recebe nivel logico alto, senao ele recebera nivel baixo
		if(valor == total) begin 
			valor_correto = 1;
		end else begin
			valor_correto = 0;
		end
	end
	
endmodule 
	