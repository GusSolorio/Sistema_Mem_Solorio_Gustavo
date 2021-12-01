// Coder:           Gustavo Alejandro Solorio Ramos
// Date:            30 Noviembre 2021
// Name:            Mux2to1.v
// Description:     Two to one multiplexer
module mux2to1
(
//=======================================================
//  INPUT/OUTPUT declarations
//=======================================================
output Data_out,
input Data_in_0, Data_in_1, Sel
);
//=======================================================
//  Assignments
//=======================================================
assign Data_out=(Sel) ? Data_in_1:Data_in_0;
endmodule 