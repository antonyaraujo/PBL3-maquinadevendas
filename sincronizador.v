module sincronizador(tecla1, tecla2, tecla3, tecla4, codigoProduto, clk, cent25, cent50, real1);
	input tecla1, tecla2, tecla3, tecla4, clk, cent50, cent25, real1;
	output [3:0] codigoProduto;
	
	reg espera;
	initial espera = 1;
	reg digito;
	initial digito = 0;
	
	always @ (tecla1 or tecla2 or tecla3 or tecla4) begin
		espera = 0;
		digito = digito + 1;
		if (digito == 1) begin
		// Vai ser preciso algo que zere o registrador digito
		// Ha um problema no tamanho do registrador digito
			if(tecla1) begin
				codigoProduto[0] = 0;
				codigoProduto[1] = 0;
			end
			if(tecla2) begin
				codigoProduto[0] = 0;
				codigoProduto[1] = 1;
			end
			if(tecla3) begin
				codigoProduto[0] = 1;
				codigoProduto[1] = 0;
			end
			if(tecla4) begin
				codigoProduto[0] = 1;
				codigoProduto[1] = 1;
			end
		end else if (digito == 2) begin
			if(tecla1) begin
				codigoProduto[0] = 0;
				codigoProduto[1] = 0;
			end
			if(tecla2) begin
				codigoProduto[0] = 0;
				codigoProduto[1] = 1;
			end
			if(tecla3) begin
				codigoProduto[0] = 1;
				codigoProduto[1] = 0;
			end
			if(tecla4) begin
				codigoProduto[0] = 1;
				codigoProduto[1] = 1;
			end
		end
		
	end
		
endmodule 