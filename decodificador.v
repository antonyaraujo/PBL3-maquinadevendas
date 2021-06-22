module decodificador(codigo, seg, clk);
	input [3:0] codigo;
  	input clk;
	output reg [7:0] seg;
	  
  initial seg = 8'b00000000;
  always @ (posedge clk) begin
    	case(codigo)          //abcdefg dp
    			4'b0000: seg = 8'b01111100; // 0 
				4'b0001: seg = 8'b00001100; // 1
				4'b0010: seg = 8'b10110110; // 2
				4'b0011: seg = 8'b10011110; // 3
				4'b0100: seg = 8'b01100110; // 4
				4'b0101: seg = 8'b11011010; // 5 ou s
				4'b0111: seg = 8'b00001110; // 7
				4'b1000: seg = 8'b11110010; // E
				4'b1001: seg = 8'b01100110; // r
				4'b1010: seg = 8'b11001110; // p
				4'b1111: seg = 8'b00000001; // dp
				default: seg = 8'b00000000;
    	endcase
	end
endmodule 