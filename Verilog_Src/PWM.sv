`timescale 1ns / 1ps

module PWM_generator(
    input clk,  
    input [15:0] sinu_sum, 
    output logic pwm = 0
);     
logic [15:0] count = 0;    
always_ff@(posedge clk)
begin
    count <= count + 1;
    if(count <= sinu_sum)
        pwm <= 1;
    else
        pwm <= 0;    
end

endmodule

