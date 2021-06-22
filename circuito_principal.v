module circuito_principal(tecla, moedas, clk, segmentos, displays, liberar, devolver_moedas);
	//Entradas
	input clk;
	input [1:0] moedas;
	input [3:0] tecla;

	//Saidas
	output [7:0] segmentos;
	output [3:0] displays;			
	output liberar;
	output reg devolver_moedas;
	
	
	//Fios
	wire[3:0] fio_total, fio_valor, fio_codigo_produto, fio_display;
	wire[1:0] fio_estado, fio_digito;
	wire fio_valor_correto, fio_produto_existe, fio_tempo_teclado, fio_tempo_acumulador, fio_tempo, fio_saida_tempo, fio_multiplex;
	reg [1:0] estado_anterior;
		
	assign liberar = (fio_estado[0] & fio_estado[1]);
	
	always @(fio_estado) begin
		if((estado_anterior == 2 | estado_anterior == 1) & fio_estado == 0) begin
			devolver_moedas = 1;
		end
		else begin
			devolver_moedas = 0;
			estado_anterior = fio_estado;
		end
	end
	
	temporizador tempos(
		.clk(clk),
		.estado(fio_estado), 
		.tempoTeclado(fio_tempo_teclado),
		.tempoAcumulador(fio_tempo_acumulador), 
		.tempo(fio_tempo));
	
	//divisor de frequencia
	divisor_clock(
		.clk(clk),
		.saida_tempo(fio_saida_tempo),  
		.saida_multiplex(fio_multiplex));
		
	//circuito acumulador
	acumulador ac(
		.moedas(moedas),
		.clk(clk),
		.reset(fio_multiplex),
		.total(fio_total));
	
	//circuito que indica a posicao do digito do teclado
	controlador_teclado teclas(
		.tecla(tecla), 
		.tempo(fio_multiplex),
		.estado(fio_estado), 
		.clk(clk),
		.digito(fio_digito));
	
	//circuito que gera o codigo do teclado
	gerador_codificador gerador(
		.tecla(tecla), 
		.digito(fio_digito), 
		.estado(fio_estado), 
		.codigo(fio_codigo_produto));
	
	//circuito que verifica se o codigo digitado pertence a algum produto
	controlador_memoria controle_mem(
		.codigo_produto(fio_codigo_produto), 
		.valor_preco(fio_valor), 
		.produto_existe(fio_produto_existe));
		
	//circuito que verifica o valor do produto
	vericador_valor verifica(
		.total(fio_total), 
		.valor(fio_valor),  
		.valor_correto(fio_valor_correto));
		
	
	//circuito que gera o estado da maquina
	controlador_principal controle(
		.clk(clk),
		.produto_existe(fio_produto_existe), 
		.valor_correto(fio_valor_correto), 
		.habilitador(fio_digito), 
		.tempo(fio_multiplex),
		.estado(fio_estado)); 
	
	
	//circutio que controla as saidas do display de 7 segmentos
	display_segmentos display(
		.clk(clk),
		.estado(fio_estado), 
		.codigo_produto(fio_codigo_produto), 
		.total(fio_total), 
		.segmentosA(segmentosA), 
		.segmentosB(segmentosB), 
		.segmentosC(segmentosC), 
		.segmentosD(segmentosD));
			
	//multiplexador do display
	multiplexador mux(
		.clk(clk),
		.displays(displays)
	);
	
	// multiplexador dos segmentos
	multiplexadorSegmentos muxSeg(
		.segmentosA(segmentosA), 
		.segmentosB(segmentosB), 
		.segmentosC(segmentosC), 
		.segmentosD(segmentosD),
		.displays(displays),
		.segmentos(segmentos)
	);
	

endmodule 