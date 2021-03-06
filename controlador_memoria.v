/* Modulo do controlador de memoria, responsavel por verificar a existencia e o preco dos produtos
	Criado por: Antony Araujo e Ozenilson Alisson 
	Data: 18 jun 2021*/

module controlador_memoria(codigo_produto, valor_preco, produto_existe);
	input[3:0]codigo_produto; //codigo do produto na maquina
	output reg[3:0] valor_preco; // preco do produto
	output reg produto_existe; //se o produto existe ou nao
	
	always @ (codigo_produto) begin
	
		case(codigo_produto)
			4'b0000: begin
				valor_preco = 4'b0100; //refrigerante R$1,00
				produto_existe = 1'b1;
			end
			4'b0100: begin
				valor_preco = 4'b1000; //salgadinhos R$2,00
				produto_existe = 1'b1;
			end
			4'b0101: begin 
				valor_preco = 4'b0010; //amendoim R$0,50
				produto_existe = 1'b1;
			end
			4'b1000: begin
				valor_preco = 4'b0010; //agua R$0,50
				produto_existe = 1;
			end
			4'b1001: begin 
				valor_preco = 4'b0101; //suco R$1,00
				produto_existe = 1'b1;
			end
			4'b1010: begin
				valor_preco = 4'b0111; //agua de coco R$1,75
				produto_existe = 1'b1;
			end
			4'b1011: begin
				valor_preco = 4'b0110; //cafe R$1,50
				produto_existe = 1'b1;
			end
			4'b1100: begin
				valor_preco =  4'b0100; //sanduiche simples R$1,00
				produto_existe = 1'b1;
			end
			4'b1101: begin
				valor_preco = 4'b0111; //sanduiche natural R$1,75
				produto_existe = 1'b1;
			end
			default: produto_existe = 1'b0;
		endcase
			
	end
	
endmodule 