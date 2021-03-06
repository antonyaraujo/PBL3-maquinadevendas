module multiplexadorSegmentos(segmentosA, segmentosB, segmentosC, segmentosD, displays, segmentos);
	input [3:0] displays;
	input [7:0] segmentosA, segmentosB, segmentosC, segmentosD;
	output reg [7:0] segmentos;
	
	always @ (displays) begin
		case (displays)
			8: segmentos = segmentosA;
			4: segmentos = segmentosB;
			2: segmentos = segmentosC;
			1: segmentos = segmentosD;
			default: segmentos = 0;
		endcase
	end
endmodule 