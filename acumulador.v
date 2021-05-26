module acumulador(centavos_25, centavos_50, real_1, clk, acumulador);
	input centavos_25, centavos_50, real_1, clk;
	output reg [3:0] acumulador;
		
	initial acumulador = 4'b0000; 					
	
	always @ (posedge clk) begin
		if (centavos_25)
			acumulador <= acumulador + 4'b0001; // 4'b0001
		else if (centavos_50) 
			acumulador <= acumulador + 4'b0010; // 4'b0010
		else if (real_1)
			acumulador <= acumulador + 4'b0100;	// 4'b0100
	end
			
endmodule 
	