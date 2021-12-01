// Coder:     Gustavo Alejandro Solorio Ramos
// Date:            30 Noviembre 2021
// Name:            Data_Memory_TB.v

`timescale 10ns / 1ps

module Data_Memory_TB;
//======================================================= 
//Parameter declarations
//=======================================================
parameter MEMORY_DEPTH = 32;
parameter DATA_WIDTH = 32;
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg clk_tb = 0;
reg we_tb =0;
reg [(MEMORY_DEPTH-1):0] Address_i_tb;
reg [(DATA_WIDTH-1):0] data_tb;
wire [(DATA_WIDTH-1):0] Instruction_o_tb;
//=======================================================
//  Instantiate modules
//=======================================================
single_port_ram
#
(
	.ADDR_WIDTH(MEMORY_DEPTH),
	.DATA_WIDTH(DATA_WIDTH)
)
DUT
(
	.addr(Address_i_tb),
	.q(Instruction_o_tb),
	.data(data_tb),
	.we(we_tb),
	.clk(clk_tb)
);
//=======================================================
//  Clock
//=======================================================
initial
	begin
		forever #2 clk_tb = !clk_tb;
	end
//=======================================================
//  RAM testing
//=======================================================
initial
	begin
		#0  we_tb = 1;
		#0  Address_i_tb = 1;
		#0  data_tb = 32'hFFFFFFFF;
		#5  Address_i_tb = 4;
		#5 data_tb = 32'h12345678;
		#10 Address_i_tb = 8;
		#10 data_tb = 32'h98761234;
		#15 Address_i_tb = 16;
		#15 data_tb = 32'hA0A0A0A0;
		#20 Address_i_tb = 20;
		#20 data_tb = 32'hABCDEF12;
		#25 Address_i_tb = 24;
		#25 data_tb = 32'h00000000;
		$finish();
	end
endmodule 