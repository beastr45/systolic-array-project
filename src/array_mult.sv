`timescale 1ns / 1ps

module array_mult#(parameter N = 8)(
input logic                 clk,
input logic                 rst_n,
input logic     [N-1:0]     arrA,
input logic     [N-1:0]     arrB,
input logic     [N-1:0]     arrC,
input logic     [N-1:0]     arrD,
output logic    [2*N-1:0]   sum
);
logic [2*(N)-1:0]     arr_out_1;
logic [2*(N)-1:0]     arr_out_2;
logic [$clog2(N+1)-1:0] n;

always_ff @(posedge clk)begin
    if(!rst_n)begin
            n <= '0;
            arr_out_1 <= '0;
            arr_out_2 <= '0;
            sum <= 0;
        end else if (n < N) begin
            arr_out_1 <= arr_out_1 + ((({{N{1'b0}},arrA}) << n) * arrB[n]);
            arr_out_2 <= arr_out_2 + ((({{N{1'b0}},arrC}) << n) * arrD[n]);
            n <= n + 1'b1;
        end else begin
            sum <= arr_out_1 + arr_out_2;
        end
    end

endmodule
