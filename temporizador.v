module temporizador(clk, estado, tempoTeclado, tempoAcumulador, tempo);
	input clk;
	input [1:0] estado;
	output reg tempo, tempoTeclado, tempoAcumulador;
	
	reg [2:0] contador;
	initial tempo = 1;
	initial tempoTeclado = 1;
	initial tempoAcumulador = 1;
	
	always @(posedge clk) begin		
		if(estado == 0)
			contador = 0;
		else begin
			if(contador == 4)
				contador = 0;
			else			
				contador = contador + 1;
		end
	end
	
	always @ (contador) begin
		if (contador == 2) begin
			tempoTeclado = 0;
			tempoAcumulador = 1;
			tempo = 1;
			end
		else if (contador == 3) begin
			tempoAcumulador = 0;
			tempoTeclado = 1;
			tempo = 1;
			end
		else if (contador == 4) begin
			tempo = 0;				
			tempoTeclado = 1;
			tempoAcumulador = 1;			
			end
	end

endmodule 