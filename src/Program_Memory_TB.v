// Modified by:     Gustavo Alejandro Solorio Ramos
// Date:            30 Noviembre 2021
// Name:            Program_Memory_TB.v

/******************************************************************
* Description
*	This is the verifaction environment ofr testeting the register file.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	12/06/2015
******************************************************************/
`timescale 10ns / 1ps

module Program_Memory_TB;
//======================================================= 
//Parameter declarations
//=======================================================
parameter MEMORY_DEPTH = 32;
parameter DATA_WIDTH = 32;
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg clk_tb = 0;
reg [(DATA_WIDTH-1):0] Address_i_tb;
wire [(DATA_WIDTH-1):0] Instruction_o_tb;


//=======================================================
//  Instantiate modules
//=======================================================
single_port_rom
#
(
	.ADDR_WIDTH(MEMORY_DEPTH),
	.DATA_WIDTH(DATA_WIDTH)
)
DUT
(
	.addr(Address_i_tb),
	.q(Instruction_o_tb)
);
//=======================================================
//  Clock
//=======================================================
initial
	begin
		forever #10 clk_tb = !clk_tb;
	end
//=======================================================
//  ROM testing
//=======================================================
initial
	begin
		#0 Address_i_tb = 0;
		#50 Address_i_tb = 1;
		#50 Address_i_tb = 2;
		#50 Address_i_tb = 3;
		#50 Address_i_tb = 4;
		#50 Address_i_tb = 5;
		#50 Address_i_tb = 6;
		#50 Address_i_tb = 7;
		#50 Address_i_tb = 8;
		$finish();
	end
endmodule 