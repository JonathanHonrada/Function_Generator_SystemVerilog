`timescale 1ns / 1ps
//hi mom//
module Scaler_new(
 input [7:0] sinu_in,
 input [7:0] sinu_in2,
 input [7:0] Amplitude,
 input [7:0] Amplitude_sin,
 output [15:0] sinu_out,
 output [15:0] sinu_out2
);

assign sinu_out = (sinu_in*Amplitude);
assign sinu_out2 = (sinu_in2*Amplitude_sin);


endmodule
