module multiplexador(clk, displays);		
	input clk;
	output reg [3:0] displays;
	
	reg [2:0] contador;
	initial contador = 0;	
	always @ (posedge clk) begin
		case (contador)
			3'b000 : begin
				displays[0] = 1'b1;
				displays[1] = 0;
				displays[2] = 0;
				displays[3] = 0;
			end 
			3'b001 : begin
				displays[0] = 0;
				displays[1] = 1'b1;
				displays[2] = 0;
				displays[3] = 0;
			end 
			3'b010 : begin
				displays[0] = 0;
				displays[1] = 0;
				displays[2] = 1'b1;
				displays[3] = 0;
			end 
			3'b011 : begin
				displays[0] = 0;
				displays[1] = 0;
				displays[2] = 0;
				displays[3] = 1'b1;
				contador = 0;
			end 			
			default: begin
				displays[0] = 0;
				displays[1] = 0;
				displays[2] = 0;
				displays[3] = 0;
			end 
		endcase
		contador = contador + 1;
	end
	
endmodule 