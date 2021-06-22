module display_segmentos(clk, estado, codigo_produto, total, segmentosA, segmentosB, segmentosC, segmentosD);
	input clk;
	input [1:0] estado;
	input [3:0] codigo_produto, total;
	output [7:0] segmentosA, segmentosB, segmentosC, segmentosD;

	reg [3:0] codigoA, codigoB, codigoC, codigoD;
	reg [1:0] estado_anterior;
	
	// Gerador de erros
	/*always @ (estado) begin
		if(estado_anterior == 1 && estado == 0) begin// PRODUTO NAO ENCONTRADO
			//Exibir erros, depois espera
			codigoA = 8;
			codigoB = 9;
			codigoC = 9;
			codigoD = 1;
		end
		else if(estado_anterior == 2 && estado == 0) begin// valor insuficiente
			codigoA = 8;
			codigoB = 9;
			codigoC = 9;
			codigoD = 2;	
		end
		estado_anterior = estado;
	end*/
	
	always @ (posedge clk) begin
		case (estado)
			0: begin	
		
				if(estado_anterior == 1 && estado == 0) begin// PRODUTO NAO ENCONTRADO
					//Exibir erros, depois espera
					codigoA = 8;
					codigoB = 9;
					codigoC = 9;
					codigoD = 1;
				end
				else if(estado_anterior == 2 && estado == 0) begin// valor insuficiente
					codigoA = 8;
					codigoB = 9;
					codigoC = 9;
					codigoD = 2;	
				end
				else begin
					codigoA = 8;
					codigoB = 5;
					codigoC = 10;
					codigoD = 8;
					estado_anterior = estado;
				end
			end
			1: begin
			// Exibe codigo
				codigoA = 0;
				codigoB = 0;
				codigoC = 0;
				codigoD = 0;
				codigoC[1] = codigo_produto[3];
				codigoC[0] = codigo_produto[2]; 
				codigoD[1] = codigo_produto[1];
				codigoD[0] = codigo_produto[0];
			end
			2: begin
			// Exibe valor total
				codigoB = 15;
				if(total[3] == 0 && total[2] == 0) 
					codigoA = 0;
				else if(total[3] == 0 && total[2] == 1)
					codigoA = 1;
				else if(total[3] == 1 && total[2] == 0)
					codigoA = 2;
				
				if(total[1] == 0 && total[0] == 0) begin
					codigoC = 0;
					codigoD = 0;
				end
				
				if(total[1] == 0 && total[0] == 1) begin
					codigoC = 2;
					codigoD = 5;					
				end
				
				if(total[1] == 1 && total[0] == 0) begin
					codigoC = 5;
					codigoD = 0;
				end
				
				if(total[1] == 1 && total[0] == 1) begin
					codigoC = 7;
					codigoD = 5;
				end
					
			end
			3: begin
			// Exibe confirmacao
			
			end
			
			default: begin
				codigoA = 11;
				codigoB = 11;
				codigoC = 11;
				codigoD = 11;
			end
		endcase
	end
	
	decodificador decodA(
		.codigo(codigoA),
		.clk(clk),
		.seg(segmentosA)
	);
	
	decodificador decodB(
		.codigo(codigoB),
		.clk(clk),
		.seg(segmentosB)
	);
	
	decodificador decodC(
		.codigo(codigoC),
		.clk(clk),
		.seg(segmentosC)
	);
	
	decodificador decodD(
		.codigo(codigoD),
		.clk(clk),
		.seg(segmentosD)
	);
	
endmodule 