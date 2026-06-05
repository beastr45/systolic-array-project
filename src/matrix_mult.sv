`timescale 1ns / 1ps

module matrix_mult #(parameter N = 8)(
input logic clk,
input logic rst_n,
input logic [N-1:0] matA [1:0][1:0],
input logic [N-1:0] matB [1:0][1:0],
output logic [2*N-1:0] mat_out [1:0][1:0],
output logic [2*N-1:0] mat_out_e_1,
output logic [2*N-1:0] mat_out_e_2,
output logic [2*N-1:0] mat_out_e_3,
output logic [2*N-1:0] mat_out_e_4
);

array_mult#(.N(N)) output_1(
.clk(clk),
.rst_n(rst_n),
.arrA(matA[0][0]),
.arrB(matB[0][0]),
.arrC(matA[0][1]),
.arrD(matB[1][0]),
.sum(mat_out_e_1)
);
array_mult#(.N(N)) output_2(
.clk(clk),
.rst_n(rst_n),
.arrA(matA[0][0]),
.arrB(matB[0][1]),
.arrC(matA[0][1]),
.arrD(matB[1][1]),
.sum(mat_out_e_2)
);
array_mult#(.N(N)) output_3(
.clk(clk),
.rst_n(rst_n),
.arrA(matA[1][0]),
.arrB(matB[0][0]),
.arrC(matA[1][1]),
.arrD(matB[1][0]),
.sum(mat_out_e_3)
);
array_mult#(.N(N)) output_4(
.clk(clk),
.rst_n(rst_n),
.arrA(matA[1][0]),
.arrB(matB[0][1]),
.arrC(matA[1][1]),
.arrD(matB[1][1]),
.sum(mat_out_e_4)
);
assign mat_out[0][0] = mat_out_e_1;
assign mat_out[0][1] = mat_out_e_2;
assign mat_out[1][0] = mat_out_e_3;
assign mat_out[1][1] = mat_out_e_4;
endmodule
