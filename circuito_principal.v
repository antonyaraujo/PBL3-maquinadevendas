module circuito_principal(codigoBCD, clk, segmentos, displays);
	input clk, codigoBCD;
	output [6:0] segmentos;
	output [3:0] displays;
	reg espera;	
	initial espera = 0;

	always @ (codigoBCD) begin
		if (espera == 1) begin
		    espera = 0;
		end else begin
	            // operações caso a máquina tenha saído do estado de espera
		end
	end

	multiplexador displays_mux(
		.clk(clk),
		.displays(displays)
	);
	
	decodificador decod(
		.codigoBCD(codigoBCD),
		.clk(clk),
		.segmentos(segmentos)
	);
	
endmodule 


