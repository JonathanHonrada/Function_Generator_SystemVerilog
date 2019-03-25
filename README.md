# Function_Generator_SystemVerilog
##### Creators: Jonathan Honrada and Rocio Sanchez
---
##Summary
The purpose of this project is to implement a function generator by adding multiple sine
and cosine waves digitally using the Fourier series, creating 4 different preset wave-types like
sine, triangle, square and sawtooth waves. This digital periodic wave is then converted from a digital
signal to an analog signal using a Pulse Width Modulation (PWM) driver and RC low pass
filter. Users can pass input parameters (scaling individual harmonics of sines and cosines up to
the 8th harmonic) through the OTTER MCU to create custom waveforms. Below you can see the
Fourier Series equation used to get the coefficients and frequency using scaled sine and cosine waves.
![Fourier Series](https://i.imgur.com/vigmnXx.png)
