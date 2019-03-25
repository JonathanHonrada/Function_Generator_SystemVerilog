`timescale 1ns / 1ps

/////////////////////////////////////////////////////////////////////
// Function Generator Project - Jonathan Honrada and Rocio Sanchez //
/////////////////////////////////////////////////////////////////////

module Func_Gen_Top_Module( // sin &cos
     input clk, // 100 MHZ
     input [31:0] input_bus_0,
     input [31:0] input_bus_1,
     input [31:0] input_bus_2,
     input [31:0] input_bus_3,
     input [2:0] wave_type,
     output pwm
     //  input [3:0] freq_multiplier,// sin &cos //scaler 
     //input sinu_in
    );
    
    wire reset = 0;
    wire [31:0] input_bus [3:0];
    assign input_bus[0] = input_bus_0;
    assign input_bus[1] = input_bus_1;
    assign input_bus[2] = input_bus_2;
    assign input_bus[3] = input_bus_3;
    wire sclk;
    wire [7:0] sin_data[7:0];
    wire [7:0] cos_data[7:0];
    
    wire [7:0] amplitude[7:0];
    wire [7:0] amplitude_sin[7:0];
    wire [15:0] scaled_cos [7:0];
    wire [15:0] scaled_sin [7:0];
        
        
clk_divider cos_clk(
    .clk(clk),
    .max(10000),
    .sclk(sclk)
);    

Func_Gen_Controller Controller(
    .wave_type(wave_type),
    .clk(clk),
    .input_bus(input_bus),
    .amplitude(amplitude[7:0]),
    .amplitude_sin(amplitude_sin[7:0])
);    

////////////////////////////////////////////
//                                        //
//           COSINE GENERATORS            //
//                                        //
////////////////////////////////////////////    
eight_bit_cos_LUT cos1(
    .sin_data(sin_data[0]),
    .clk(sclk),
    .freq_mul(1),
    .cos_out(cos_data[0])
);
eight_bit_cos_LUT cos2(
    .sin_data(sin_data[1]),
    .clk(sclk),
    .freq_mul(2),
    .cos_out(cos_data[1])
);
eight_bit_cos_LUT cos3(
    .sin_data(sin_data[2]),
    .clk(sclk),
    .freq_mul(3),
    .cos_out(cos_data[2])
);
eight_bit_cos_LUT cos4(
    .sin_data(sin_data[3]),
    .clk(sclk),
    .freq_mul(4),
    .cos_out(cos_data[3])
);
eight_bit_cos_LUT cos5(
    .sin_data(sin_data[4]),
    .clk(sclk),
    .freq_mul(5),
    .cos_out(cos_data[4])
);
eight_bit_cos_LUT cos6(
    .sin_data(sin_data[5]),
    .clk(sclk),
    .freq_mul(6),
    .cos_out(cos_data[5])
);
eight_bit_cos_LUT cos7(
    .sin_data(sin_data[6]),
    .clk(sclk),
    .freq_mul(7),
    .cos_out(cos_data[6])
);
eight_bit_cos_LUT cos8(
    .sin_data(sin_data[7]),
    .clk(sclk),
    .freq_mul(8),
    .cos_out(cos_data[7])
);
  
////////////////////////////////////////////
//                                        //
//             COSINE SCALERS             //
//                                        //
////////////////////////////////////////////
Scaler_new scaler_1( 
    .sinu_in2(sin_data[0]),
    .sinu_in(cos_data[0]),
    .Amplitude_sin(amplitude_sin[0]),
    .Amplitude(amplitude[0]),
    .sinu_out2(scaled_sin[0]),
    .sinu_out(scaled_cos[0])
);
Scaler_new scaler_2( 
    .sinu_in2(sin_data[1]),
    .sinu_in(cos_data[1]),
    .Amplitude_sin(amplitude_sin[1]),
    .Amplitude(amplitude[1]),
    .sinu_out2(scaled_sin[1]),
    .sinu_out(scaled_cos[1])
);
Scaler_new scaler_3( 
    .sinu_in2(sin_data[2]),
    .sinu_in(cos_data[2]),
    .Amplitude_sin(amplitude_sin[2]),
    .Amplitude(amplitude[2]),
    .sinu_out2(scaled_sin[2]),
    .sinu_out(scaled_cos[2])
);
Scaler_new scaler_4( 
    .sinu_in2(sin_data[3]),
    .sinu_in(cos_data[3]),
    .Amplitude_sin(amplitude_sin[3]),
    .Amplitude(amplitude[3]),
    .sinu_out2(scaled_sin[3]),
    .sinu_out(scaled_cos[3])
);
Scaler_new scaler_5( 
    .sinu_in2(sin_data[4]),
    .sinu_in(cos_data[4]),
    .Amplitude_sin(amplitude_sin[4]),
    .Amplitude(amplitude[4]),
    .sinu_out2(scaled_sin[4]),
    .sinu_out(scaled_cos[4])
);
Scaler_new scaler_6( 
    .sinu_in2(sin_data[5]),
    .sinu_in(cos_data[5]),
    .Amplitude_sin(amplitude_sin[5]),
    .Amplitude(amplitude[5]),
    .sinu_out2(scaled_sin[5]),
    .sinu_out(scaled_cos[5])
);
Scaler_new scaler_7( 
    .sinu_in2(sin_data[6]),
    .sinu_in(cos_data[6]),
    .Amplitude_sin(amplitude_sin[6]),
    .Amplitude(amplitude[6]),
    .sinu_out2(scaled_sin[6]),
    .sinu_out(scaled_cos[6])
);
Scaler_new scaler_8( 
    .sinu_in2(sin_data[7]),
    .sinu_in(cos_data[7]),
    .Amplitude(amplitude[7]),
    .Amplitude_sin(amplitude_sin[7]),
    .sinu_out2(scaled_sin[7]),
    .sinu_out(scaled_cos[7])
);


////////////
wire [15:0] final_sum;
assign final_sum = (scaled_cos[0] + scaled_cos[1]) + (scaled_cos[2] + scaled_cos[3]) + (scaled_cos[4] + scaled_cos[5]) + (scaled_cos[6] + scaled_cos[7]) + (scaled_sin[0] + scaled_sin[1]) + (scaled_sin[2] + scaled_sin[3]) + (scaled_sin[4] + scaled_sin[5]) + (scaled_sin[6] + scaled_sin[7]);

                    
PWM_generator PWM(
    .clk(clk),
    .sinu_sum(final_sum),
    .pwm(pwm)
);

/*
       ____     ________
     /     \   | hello  |
    |  ' '  | <  there  |
     \  V  /   |________|
        |    
    |___|____|
        |
        |
       /\
     /   \
  _/      \_
 */
endmodule
