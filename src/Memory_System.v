// Coder:           Gustavo Alejandro Solorio Ramos
// Date:            30 Noviembre 2021
// Name:            Memory_System.v

module Memory_System
#(
//======================================================= 
//Parameter declarations
//=======================================================
	parameter MEMORY_DEPTH = 64,
	parameter DATA_WIDTH = 32
)
(
//=======================================================
//  INPUT/OUTPUT declarations
//=======================================================
	input Write_Enable_i, clk,
	input [(DATA_WIDTH-1):0] Write_Data_i,
	input [(MEMORY_DEPTH-1):0] Address_i,
	output [(DATA_WIDTH-1):0] Instruction_o
);

//=======================================================
//  REG/WIRE declarations
//=======================================================
	wire [(DATA_WIDTH-1):0] Qrom, Qram, SelMem;
//=======================================================
//  Instantiate modules
//=======================================================
single_port_rom #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(MEMORY_DEPTH)) ProgramMemory (.addr(Address_i), .clk(clk), .q(Qrom));
single_port_ram #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(MEMORY_DEPTH)) DataMemory (.data(Write_Data_i), .addr(Address_i), .we(Write_Enable_i),.clk(clk),.q(Qram));
InstrDecode #(.MEMORY_DEPTH(MEMORY_DEPTH)) InstrOrDataSel (.Addr_i(Address_i), .Sel(SelMem));
mux2to1 Ram_Rom (.Data_in_0(Qrom), .Data_in_1(Qram), .Sel(SelMem), .Data_out(Instruction_o));
endmodule	