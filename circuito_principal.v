module circuito_principal(codigoBCD, clk, segmentos, displays);
	input clk, codigoBCD;
	output [6:0] segmentos;
	output [3:0] displays;
	
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