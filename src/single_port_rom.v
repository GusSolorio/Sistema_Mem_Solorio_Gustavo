// Coder:           Gustavo Alejandro Solorio Ramos
// Date:            30 Noviembre 2021
// Name:            single_port_rom.v
// Description:     Quartus Prime Verilog Template


module single_port_rom
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=32)
(
	input clk, 
	input [(ADDR_WIDTH-1):0] addr,
	output reg [(DATA_WIDTH-1):0] q
);

	reg [DATA_WIDTH-1:0] rom [ADDR_WIDTH-1:0];

	initial
	begin
		$readmemh("C:/Users/DellG7/Documents/GitHub/Sistema_Mem_Solorio_Gustavo/source/text.dat", rom);
	end

	//always @ (posedge clk)
	always @ (addr)
	begin
		q = rom[addr];
	end

endmodule 