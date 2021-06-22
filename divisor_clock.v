/* Modulo do divisor de clock, responsavel por gerar uma nova frequencia a partir de um clock
	Criado por: Antony Araujo e Ozenilson Alisson 
	Data: 18 jun 2021*/

module divisor_clock(clk, saida_tempo, saida_multiplex);
	// Entradas
		input clk;
		
	// Saidas 
		output saida_tempo, saida_multiplex;
		
	// Registradores
	reg [25:0] contador;
	
	initial contador = 0;
	assign saida_tempo = contador[25]; // 0,7451Hz [25] -> bit 26
	
	assign saida_multiplex = contador[17]; //  190,73 Hz [17] -> bit 18
	
	always @ (posedge clk) begin
		contador <= contador + 1;
		if (contador == 26'h3FFFFFF) begin
			contador <= 26'h0;
		end		
	end
	
endmodule	