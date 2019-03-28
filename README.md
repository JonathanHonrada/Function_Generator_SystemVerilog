# Function_Generator_SystemVerilog
#### Creators: Jonathan Honrada and Rocio Sanchez
-----
## Summary
The purpose of this project is to implement a function generator using the Fourier series, creating 4 different preset wave-types like sine, triangle, square and sawtooth waves. This comes from the idea that any arbitrary periodic waveform can be by a summation of scaled sine and cosine functions. This digital periodic waveform is then converted from a digital signal to an analog signal using a Pulse Width Modulation (PWM) driver and RC low pass filter. Below you can see the Fourier Series equation used to get the coefficients and frequency using scaled sine and cosine waves. 

![Fourier Series](https://i.imgur.com/vigmnXx.png)

Users can pass input parameters to scale individual harmonics of sines and cosines up to the 8th harmonic through the OTTER MCU (based on RV32I instruction set) to create custom waveforms. This control method is programmed with a RISC-V assembly interrupt service routine. 


## Equipment Required
* Basys 3 Board
* Low Pass RC Filter (fC ~ 40 Hz)
    * 1 0.1uF Capacitor
    * 5 10kΩ Resistors
* Jumper Wires
* Oscilloscope
* Breadboard 

## Circuit Architecture
In this project, we will be using the modules from the OTTER MCU in addition with the external hardware of the function generator coded in SystemVerilog to control the signal generation. Please view the elaborated design of the function generator modules in the Vivado design suite to develop a better understanding of how this project works. **_NOTE:_** The verilog files for the OTTER MCU have not been provided.

![Black Box Diagram](https://i.imgur.com/3aEOZ9p.png)

### The Clock Divider
This clock divider is used to generate the clock that goes into the sine/cosine generator. It takes the Basys3’s 100MHz clock as an input as well as a maxcount input which is used to slow down the clock. The output clock initially stays low until the internal counter inside of the clock divider hits this maxcount value upon which the counter resets and the output clock value is flipped (ie from logic level low to high). For this implementation, we set the maxcount to 20000 which results in an output clock frequency 5000 Hz. But keep in mind that this clock is then used to step through the cosine and sine generator which has 255 values per cycle. This results in final value of ~20 Hz for the fundamental frequency (1st harmonic) of this fourier series implementation. 

### Cosine and Sine LUT/Generator
The first major module in the function generator hardware is the **eight_bit_cos_LUT** module. This module takes a clk input from the clock divider, a 3-bit frequency multiplier input (harmonic number) and two outputs, one for a digital sine wave and a digital cosine wave. These digital values are generated using a look-up table for each respective wave with 255 values and a resolution of 8-bits. New 8-bit values for both the sine and cosine waves are generated at each clock tick, and the frequency multiplier input determines how quickly the look up table is stepped through. In this implementation, there are eight lookup table generators, allowing us to reach the eight harmonic in our our Fourier series calculations.

### Controller Module and Scaling Module
The **Func_Gen_Controller** module controls the output waveform via scaling. These scaling values are stored in registers, with different sets of values depending on which wave type the user wishes to generate. This wave type is a 3-bit input controlled by the top button which cycles through the following waveforms: sine, sawtooth, square, triangle, and custom. Every individual harmonic of each digitally-generated sine and cosine waves has a specific scalar value that they will be multiplied by, and these values have been calculated using formulas that can be found on the Wolfram Alpha website. This controller module also has an input for custom waveforms designed specifically to receive values that are inputted from the switches and sent through the OTTER. The bitmapping of these values can be seen in the source code.

The **Scaler_new module receives** the 8-bit scaling values from the controller value and multiplies each sine and cosine wave their respective values. There are eight of these modules in this design, one for each harmonic. The 8-bit scaling value is multiplied with the 8-bit sine value to generate a 16-bit scaled value.

### Addition and the PWM Generator
After all the digital sine and cosine values have been scaled, they are added together. This final 16-bit value is then taken as an input to the PWM generator. This PWM generator converts this digital periodic waveform into a PWM signal which is then outputted from the Basys3 board (pin JC1). This output can be set to a different port my modifying the constraints if so desired.

### Low-Pass RC Filter
This filter is used to convert the PWM signal from the Basys3 into an analog periodic waveform. Referring to the figure below, the PWM input is sent to the VIN port and the output waveform is measured with an oscilloscope from the VOUT  port. The ground used is the ground pin found on the Basys3. The low pass RC filter we used utilized 5 10kΩ arranged to create an equivalent resistance of 35kΩ (2 in parallel in series with 3). The capacitor used was a 0.1uF capacitor. Either an electrolytic or ceramic capacitor will work, but be mindful of the polarity. This arrangement results in a cutoff frequency of 45 Hz, which we determined experimentally by varying resistance and finding which setup would produce the best looking output waveforms.

![RC Low Pass](https://i.imgur.com/EvG6OUe.png)

## Physical Setup for Measurement
The PWM output signal has been wired to the PMOD port pin JC1 in the constraints file for this implementation. This pin assignment is aribtrary and can be changed to a different pin if so desired. In the figures below, this is the header where that the red wire is plugged into. The orange wire is the connected to the ground of this circuit. It can be seen that this ground wire is tied to the RC filter ground (just after the capacitor) as well as the scope probe ground. The red wire carries the PWM signal to the breadboard on the right, and the output is measured from the black wire coming from the board (right after the resistive network and before the capacitor). 

![Physical Set Up 1](https://i.imgur.com/bQWsLIm.png)

![Physical Set Up 2](https://i.imgur.com/cqpkFIC.png)

We have also provided screenshots of some of our various output waveforms measured on the osiclloscope. There is a lot of noise which could be due to switching noise from the filter or something on the digital side of the circuit.

![Oscope 1](https://i.imgur.com/pU77jih.png)

![Oscope 2](https://i.imgur.com/IPjqNpO.png)

![Oscope3](https://i.imgur.com/wFI8SAz.png)

## References
1. https://www.compadre.org/advlabs/bfy/files/BFYHandout.pdf
      * PWM Driver Verilog Code
      * PWM Conversion Time Information


2. https://www.instructables.com/id/FPGA-Semi-Arbitrary-Function-Generator/
      * Our Project Based on Their VHDL Design 


3. https://daycounter.com/Calculators/Sine-Generator-Calculator.phtml
      * Look Up Table Generator for Sine and Cosine Functions


4. http://mathworld.wolfram.com/FourierSeries.html
      * Fourier Series Coefficients Derivations
