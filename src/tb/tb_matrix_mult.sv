`timescale 1ns / 1ps
module tb_matrix_mult;
parameter int N = 8;
logic clk;
logic rst_n;
logic [N-1:0] matA [1:0][1:0];
logic [N-1:0] matB [1:0][1:0];
logic [2*N-1:0] mat_out [1:0][1:0];
logic [2*N-1:0] mat_out_e_1;
logic [2*N-1:0] mat_out_e_2;
logic [2*N-1:0] mat_out_e_3;
logic [2*N-1:0] mat_out_e_4;

matrix_mult #(.N(N)) dut(
.clk(clk),
.rst_n(rst_n),
.matA(matA),
.matB(matB),
.mat_out(mat_out),
.mat_out_e_1(mat_out_e_1),
.mat_out_e_2(mat_out_e_2),
.mat_out_e_3(mat_out_e_3),
.mat_out_e_4(mat_out_e_4)
);
always #5 clk = ~clk;
initial begin
    $dumpfile("tb_matrix_mult.vcd");
    $dumpvars(0, tb_matrix_mult);// send to gtkwave for analysis
    clk = 0;
    rst_n = 0;

    matA[0][0] = 8'd1;
    matA[0][1] = 8'd2;
    matA[1][0] = 8'd3;
    matA[1][1] = 8'd4;

    matB[0][0] = 8'd5;
    matB[0][1] = 8'd6;
    matB[1][0] = 8'd7;
    matB[1][1] = 8'd8;

    repeat(2) @(posedge clk);
    rst_n = 1;

    repeat(N+3) @(posedge clk);

    $finish;
end
endmodule
