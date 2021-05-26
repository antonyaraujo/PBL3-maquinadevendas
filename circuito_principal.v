module circuito_principal(cent25, cent50, real1, acumuladorr, clk, codigoBCD);
	input clk, codigoBCD;
	//output [6:0] segmentos;
	//output [3:0] displays;
	input cent25, cent50, real1;
	output [3:0] acumuladorr;
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
	
	acumulador acum(
		.centavos_25(cent25),
		.centavos_50(cent50),
		.real_1(real1),
		.clk(clk),
		.acumulador(acumuladorr)
	);
	
endmodule 


