`timescale 1ns / 1ps


module clk_divider(
    input clk,
    input [31:0]max,
    output logic sclk = 0
    );
logic [31:0] count = 0;
always@(posedge clk)
    begin
        if (count < max)
            begin
            sclk <= sclk;
            count <= count + 1;
            end
        else if (count == max)
            begin
            sclk <= ~sclk;
            count <= 0;
            end
    end
endmodule
