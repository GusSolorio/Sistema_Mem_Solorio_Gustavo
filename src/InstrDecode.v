// Coder:     Gustavo Alejandro Solorio Ramos
// Date:            30 Noviembre 2021
// Name:            InstrDecode.v

module InstrDecode #(
//======================================================= 
//Parameter declarations
//=======================================================
	parameter MEMORY_DEPTH = 32
)
(
//=======================================================
//  INPUT/OUTPUT declarations
//=======================================================
input [(MEMORY_DEPTH-1):0] Addr_i,
output reg Sel
);
//=======================================================
//  Behavoral Code
//=======================================================
always @ (Addr_i) begin 
	if (Addr_i >= 32'h100_000) //RAM starts here, to be modified
		Sel = 1;
	else 
		Sel = 0;
end 
endmodule 