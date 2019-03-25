`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2019 12:23:39 PM
// Design Name: 
// Module Name: FSM_Func_Gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Func_Gen_Controller(
    input [2:0]wave_type,
    input clk,
    input [31:0] input_bus [3:0],
    output logic[7:0] amplitude [7:0],
    output logic [7:0] amplitude_sin [7:0]
);
//amplitude scaler is a 16 -bit num

parameter [2:0] sine = 4'b000, square = 4'b001, saw = 4'b010, triangle = 4'b011, custom = 4'b100; 
reg [31:0] amp_cos[1:0], amp_sin[1:0];

initial
    begin
    amp_cos[0]=0;
    amp_cos[1]=0;
    amp_sin[0]=0;
    amp_sin[1]=0;
    end


always@(posedge clk)
begin
    amp_cos[0] <= input_bus [0];
    amp_cos[1] <= input_bus [1];
    amp_sin[0] <= input_bus [2];
    amp_sin[1] <= input_bus [3];

end

always_comb
if (wave_type == sine)
    begin
    amplitude[0] = 150;
    amplitude[1] = 0;
    amplitude[2] = 0;
    amplitude[3] = 0;
    amplitude[4] = 0;
    amplitude[5] = 0;
    amplitude[6] = 0;;
    amplitude[7] = 0;
    amplitude_sin[0] = 0;
    amplitude_sin[1] = 0;
    amplitude_sin[2] = 0;
    amplitude_sin[3] = 0;
    amplitude_sin[4] = 0;
    amplitude_sin[5] = 0;
    amplitude_sin[6] = 0;
    amplitude_sin[7] = 0;
    end
else if(wave_type == square)
    begin
    amplitude[0] = 0;
    amplitude[1] = 0;
    amplitude[2] = 0;
    amplitude[3] = 0;
    amplitude[4] = 0;
    amplitude[5] = 0;
    amplitude[6] = 0;
    amplitude[7] = 0;
    amplitude_sin[0] = 90;
    amplitude_sin[1] = 40;
    amplitude_sin[2] = 23;
    amplitude_sin[3] = 13;
    amplitude_sin[4] = 7;
    amplitude_sin[5] = 3;
    amplitude_sin[6] = 1;
    amplitude_sin[7] = 0;
    end
else if(wave_type == saw)
    begin
    amplitude[0] = 0;
    amplitude[1] = 0;
    amplitude[2] = 0;
    amplitude[3] = 0;
    amplitude[4] = 0;
    amplitude[5] = 0;
    amplitude[6] = 0;
    amplitude[7] = 0;
    amplitude_sin[0] = 30;
    amplitude_sin[1] = 0;
    amplitude_sin[2] = 9;
    amplitude_sin[3] = 0;
    amplitude_sin[4] = 5;
    amplitude_sin[5] = 0;
    amplitude_sin[6] = 1;
    amplitude_sin[7] = 0;
    end
else if(wave_type == triangle)
    begin
    amplitude[0] = 51;
    amplitude[1] = 0;
    amplitude[2] = 6;
    amplitude[3] = 0;
    amplitude[4] = 2;
    amplitude[5] = 0;
    amplitude[6] = 1;
    amplitude[7] = 0;
    amplitude_sin[0] = 0;
    amplitude_sin[1] = 0;
    amplitude_sin[2] = 0;
    amplitude_sin[3] = 0;
    amplitude_sin[4] = 0;
    amplitude_sin[5] = 0;
    amplitude_sin[6] = 0;
    amplitude_sin[7] = 0;
    end
    else if(wave_type == custom)
    begin
    amplitude[0] = amp_cos[0][31:24];
    amplitude[1] = amp_cos[0][23:16];
    amplitude[2] = amp_cos[0][15:8];
    amplitude[3] = amp_cos[0][7:0];
    amplitude[4] = amp_cos[1][31:24];
    amplitude[5] = amp_cos[1][23:16];
    amplitude[6] = amp_cos[1][15:8]; 
    amplitude[7] = amp_cos[1][7:0];  
    amplitude_sin[0] = amp_sin[0][31:24];
    amplitude_sin[1] = amp_sin[0][23:16];
    amplitude_sin[2] = amp_sin[0][15:8]; 
    amplitude_sin[3] = amp_sin[0][7:0];  
    amplitude_sin[4] = amp_sin[1][31:24];
    amplitude_sin[5] = amp_sin[1][23:16];
    amplitude_sin[6] = amp_sin[1][15:8]; 
    amplitude_sin[7] = amp_sin[1][7:0];  
    end
else
    begin
    amplitude[0] = 150;
    amplitude[1] = 0;
    amplitude[2] = 0;
    amplitude[3] = 0;
    amplitude[4] = 0;
    amplitude[5] = 0;
    amplitude[6] = 0;
    amplitude[7] = 0;
    amplitude_sin[0] = 0;
    amplitude_sin[1] = 0;
    amplitude_sin[2] = 0;
    amplitude_sin[3] = 0;
    amplitude_sin[4] = 0;
    amplitude_sin[5] = 0;
    amplitude_sin[6] = 0;
    amplitude_sin[7] = 0;
    end


endmodule
